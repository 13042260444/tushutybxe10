package com.algorithm;

import cn.hutool.core.date.DateUtil;
import com.utils.FileUtil;
import org.jfree.chart.JFreeChart;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.xy.DefaultXYDataset;
import org.jfree.data.xy.XYDataset;
import org.springframework.util.ResourceUtils;
import weka.core.*;

import javax.imageio.ImageIO;
import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.*;

/**
 * 基础可视化类，处理常见的图表生成功能
 * 包括中文字体处理和文件输出
 */
public abstract class AlgorithmVisualization implements Algorithm {

    /**
     * 通用方法：将Map对象列表转换为WEKA Instances
     *
     * @param dataList     数据列表，每个元素为Map<String, Object>格式
     * @param featureNames 特征列名称列表
     * @param targetNames  目标列名称列表
     * @return WEKA Instances 对象
     */
    public static Instances createInstances(java.util.List<Map<String, Object>> dataList,
                                            java.util.List<String> featureNames,
                                            java.util.List<String> targetNames) {
        // 添加空值检查
        if (dataList == null || dataList.isEmpty()) {
            throw new IllegalArgumentException("数据列表不能为空");
        }

        if (featureNames == null || featureNames.isEmpty()) {
            throw new IllegalArgumentException("特征列名称列表不能为空");
        }

        // 合并特征列和目标列
        java.util.List<String> allAttrs = new ArrayList<>(featureNames);
        allAttrs.addAll(targetNames);

        FastVector attributes = new FastVector();
        Map<String, AttributeType> attributeTypes = new HashMap<>();

        // 为每个属性确定类型并创建Attribute
        for (String attr : allAttrs) {
            AttributeType type = getAttributeTypeFromData(dataList, attr);
            attributeTypes.put(attr, type);

            switch (type) {
                case NOMINAL:
                    // 对于名义型属性，收集唯一值
                    Set<Object> uniqueValues = collectUniqueValues(dataList, attr);
                    FastVector nominalValues = new FastVector();
                    if (uniqueValues != null) {
                        uniqueValues.stream()
                                .filter(Objects::nonNull)
                                .map(Object::toString)
                                .forEach(value -> nominalValues.addElement(value));
                    }
                    nominalValues.addElement("unknown");
                    attributes.addElement(new Attribute(attr, nominalValues));
                    break;
                case DATE:
                case NUMERIC:
                default:
                    attributes.addElement(new Attribute(attr));
                    break;
            }
        }

        // 创建 Instances 对象
        Instances dataset = new Instances("dataset", attributes, dataList.size());

        // 设置最后一个属性为类属性（目标列）
        if (!targetNames.isEmpty()) {
            // 假设目标列在最后
            int targetIndex = allAttrs.size() - 1;
            dataset.setClassIndex(targetIndex);
        } else {
            // 如果没有目标列，不设置类索引
            dataset.setClassIndex(-1);
        }

        // 填充数据
        for (Map<String, Object> data : dataList) {
            double[] instanceValue = new double[dataset.numAttributes()];
            int i = 0;

            for (String attr : allAttrs) {
                Attribute attribute = dataset.attribute(attr);
                Object value = data.get(attr);
                AttributeType attrType = attributeTypes.get(attr);

                if (value == null) {
                    instanceValue[i++] = Double.NaN;
                } else {
                    switch (attrType) {
                        case NOMINAL:
                            double nominalIndex = attribute.indexOfValue(value.toString());
                            if (nominalIndex == -1) {
                                nominalIndex = attribute.indexOfValue("unknown");
                                if (nominalIndex == -1) {
                                    nominalIndex = 0;
                                }
                            }
                            instanceValue[i++] = nominalIndex;
                            break;
                        case DATE:
                            long timestamp;
                            if (value instanceof Date) {
                                timestamp = ((Date) value).getTime();
                            } else {
                                timestamp = parseDateStringToTimestamp(value.toString());
                            }
                            instanceValue[i++] = timestamp;
                            break;
                        case NUMERIC:
                        default:
                            try {
                                if (value instanceof Number) {
                                    instanceValue[i++] = ((Number) value).doubleValue();
                                } else {
                                    instanceValue[i++] = Double.parseDouble(value.toString());
                                }
                            } catch (NumberFormatException e) {
                                instanceValue[i++] = Double.NaN;
                            }
                            break;
                    }
                }
            }
            Instance instance = new DenseInstance(1.0, instanceValue);
            dataset.add(instance);
        }

        return dataset;
    }

    /**
     * 根据数据确定属性类型
     *
     * @param dataList  数据列表
     * @param fieldName 字段名称
     * @return 属性类型
     */
    private static AttributeType getAttributeTypeFromData(java.util.List<Map<String, Object>> dataList, String fieldName) {
        // 收集非空值用于类型判断
        Object sampleValue = null;
        for (Map<String, Object> data : dataList) {
            Object value = data.get(fieldName);
            if (value != null) {
                sampleValue = value;
                break;
            }
        }

        if (sampleValue == null) {
            // 如果所有值都是null，返回默认类型
            return AttributeType.NOMINAL;
        }

        Class<?> valueType = sampleValue.getClass();

        // 根据字段类型判断 AttributeType
        if (valueType == String.class) {
            // 检查是否为日期字符串
            if (isParsableDate(sampleValue.toString())) {
                return AttributeType.DATE;
            }
            return AttributeType.NOMINAL;
        } else if (valueType == Date.class || valueType == java.sql.Date.class) {
            return AttributeType.DATE;
        } else if (Number.class.isAssignableFrom(valueType) ||
                valueType == int.class || valueType == double.class ||
                valueType == float.class || valueType == long.class) {
            return AttributeType.NUMERIC;
        } else {
            return AttributeType.NOMINAL; // 默认为名义型
        }
    }

    /**
     * 收集指定字段的所有唯一值
     *
     * @param dataList  数据列表
     * @param fieldName 字段名
     * @return 唯一值集合
     */
    private static Set<Object> collectUniqueValues(List<Map<String, Object>> dataList, String fieldName) {
        Set<Object> uniqueValues = new HashSet<>();
        for (Map<String, Object> data : dataList) {
            Object value = data.get(fieldName);
            if (value != null) {
                uniqueValues.add(value);
            }
        }
        return uniqueValues;
    }


    // 属性类型枚举
    private enum AttributeType {
        NOMINAL, NUMERIC, DATE
    }

    /**
     * 检查字符串是否可以解析为日期
     *
     * @param value 字符串值
     * @return 如果字符串可以解析为日期，则返回true，否则返回false
     */
    private static boolean isParsableDate(String value) {
        if (value == null || value.isEmpty()) {
            return false;
        }
        try {
            DateUtil.parse(value);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * 将字符串日期解析为时间戳
     *
     * @param value 字符串日期
     * @return 解析后的时间戳
     * @throws IllegalArgumentException 如果字符串日期无法解析，则抛出异常
     */
    private static long parseDateStringToTimestamp(String value) {
        try {
            Date date = DateUtil.parse(value);
            return date.getTime();
        } catch (Exception e) {
            throw new IllegalArgumentException("无法解析日期字符串: " + value, e);
        }
    }


    /**
     * 如果目录不存在则创建
     *
     * @param path 要创建的目录路径
     */
    protected void createDirectoryIfNotExists(String path) {
        File directory = new File(path);
        if (!directory.exists()) {
            directory.mkdirs();
        }
    }

    /**
     * 使用中文字体支持保存图表到文件
     *
     * @param chart    要保存的图表
     * @param filePath 要保存到的文件路径
     * @param width    图表宽度
     * @param height   图表高度
     * @throws IOException 如果保存过程中发生错误
     */
    protected void saveChartToFile(JFreeChart chart, String filePath, int width, int height) throws IOException {
        // 应用中文字体到图表元素
        applyChineseFontToChart(chart);

        // 创建文件
        File chartFile = new File(FileUtil.getClassPathStatic(),filePath);

        // 获取父目录
        String parentDir = chartFile.getParent();
        createDirectoryIfNotExists(parentDir);

        // 获取文件前缀（不包含时间戳和扩展名）
        String filePrefix = getFilePrefix(chartFile.getName());
        if (filePrefix != null) {
            // 清理同前缀的旧文件
            cleanupOldFiles(new File(parentDir), filePrefix);
        }

        // 保存为PNG
        ImageIO.write(chart.createBufferedImage(width, height), "png", chartFile);
    }

    /**
     * 获取文件前缀（不包含时间戳和扩展名）
     * 例如：Qiqihaerweatherforecast2_线性回归_1767494764076.png -> Qiqihaerweatherforecast2_线性回归_
     */
    private String getFilePrefix(String fileName) {
        // 查找最后一个下划线后的时间戳部分
        int lastUnderscoreIndex = fileName.lastIndexOf('_');
        if (lastUnderscoreIndex > 0) {
            String beforeTimestamp = fileName.substring(0, lastUnderscoreIndex + 1);
            String afterTimestamp = fileName.substring(lastUnderscoreIndex + 1);

            // 检查下划线后是否是时间戳（纯数字）和.png扩展名
            if (afterTimestamp.matches("\\d+\\.png")) {
                return beforeTimestamp;
            }
        }
        return null;
    }

    /**
     * 清理指定目录中具有相同前缀的旧文件
     */
    private void cleanupOldFiles(File directory, String filePrefix) {
        File[] files = directory.listFiles();
        if (files != null) {
            for (File file : files) {
                if (file.isFile() && file.getName().startsWith(filePrefix) && file.getName().endsWith(".png")) {
                    try {
                        if (file.delete()) {
                            System.out.println("已删除旧文件: " + file.getAbsolutePath());
                        } else {
                            System.err.println("删除旧文件失败: " + file.getAbsolutePath());
                        }
                    } catch (Exception e) {
                        System.err.println("删除文件时出错: " + file.getAbsolutePath() + ", 错误: " + e.getMessage());
                    }
                }
            }
        }
    }


    /**
     * 应用中文字体到图表元素
     *
     * @param chart 要应用字体的图表
     */
    protected void applyChineseFontToChart(JFreeChart chart) {
        ChineseFontUtil chineseFontUtil = new ChineseFontUtil();
        Font font = chineseFontUtil.getChineseFont(12);

        // 应用字体到标题
        if (chart.getTitle() != null) {
            chart.getTitle().setFont(font);
        }

        // 应用字体到图例
        if (chart.getLegend() != null) {
            chart.getLegend().setItemFont(font);
        }

        // 应用字体到绘图元素（取决于图表类型）
        org.jfree.chart.plot.Plot plot = chart.getPlot();
        if (plot != null) {

            // 对于XY图
            if (plot instanceof org.jfree.chart.plot.XYPlot) {
                org.jfree.chart.plot.XYPlot xyPlot = (org.jfree.chart.plot.XYPlot) plot;
                xyPlot.getDomainAxis().setLabelFont(font);
                xyPlot.getRangeAxis().setLabelFont(font);
                xyPlot.getDomainAxis().setTickLabelFont(font);
                xyPlot.getRangeAxis().setTickLabelFont(font);
            }
            // 对于分类图
            else if (plot instanceof org.jfree.chart.plot.CategoryPlot) {
                org.jfree.chart.plot.CategoryPlot categoryPlot = (org.jfree.chart.plot.CategoryPlot) plot;
                categoryPlot.getDomainAxis().setLabelFont(font);
                categoryPlot.getRangeAxis().setLabelFont(font);
                categoryPlot.getDomainAxis().setTickLabelFont(font);
                categoryPlot.getRangeAxis().setTickLabelFont(font);
            }
        }
    }

    /**
     * 从数据数组创建XY数据集
     *
     * @param seriesNames 系列名称
     * @param xValues     每个系列的X值
     * @param yValues     每个系列的Y值
     * @return XY数据集
     */
    protected XYDataset createXYDataset(String[] seriesNames, double[][] xValues, double[][] yValues) {
        DefaultXYDataset dataset = new DefaultXYDataset();

        for (int i = 0; i < seriesNames.length; i++) {
            if (xValues[i] != null && yValues[i] != null && xValues[i].length == yValues[i].length) {
                double[][] data = new double[2][xValues[i].length];
                data[0] = xValues[i]; // X值
                data[1] = yValues[i]; // Y值
                dataset.addSeries(seriesNames[i], data);
            }
        }

        return dataset;
    }

    /**
     * 从数据创建分类数据集
     *
     * @param rowKeys    行键
     * @param columnKeys 列键
     * @param data       数据值
     * @return 分类数据集
     */
    protected DefaultCategoryDataset createCategoryDataset(String[] rowKeys, String[] columnKeys, double[][] data) {
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();

        for (int row = 0; row < rowKeys.length; row++) {
            for (int col = 0; col < columnKeys.length; col++) {
                if (row < data.length && col < data[row].length) {
                    dataset.addValue(data[row][col], rowKeys[row], columnKeys[col]);
                }
            }
        }

        return dataset;
    }

    /**
     * 用于处理图表中中文字体的工具类，以避免字符编码问题
     */
    public class ChineseFontUtil {

        private Font defaultChineseFont = null;
        private boolean fontInitialized = false;

        {
            initializeChineseFont();
        }

        /**
         * 为图表使用初始化中文字体
         */
        private void initializeChineseFont() {
            if (fontInitialized) {
                return;
            }

            try {
                // Try to load system fonts first
                String[] fontNames = {"SimHei", "Microsoft YaHei", "PingFang SC", "SimSun", "KaiTi"};

                for (String fontName : fontNames) {
                    Font font = new Font(fontName, Font.PLAIN, 12);
                    if (!font.getName().equals("Dialog")) { // If the font is available
                        defaultChineseFont = font;
                        fontInitialized = true;
                        return;
                    }
                }

                // If system fonts are not available, try to load from resources
                // This would require embedding a font file in the resources
                defaultChineseFont = loadFontFromResource("/fonts/SimHei.ttf");
                if (defaultChineseFont != null) {
                    fontInitialized = true;
                    return;
                }

                // Fallback to default font if all else fails
                defaultChineseFont = new Font("SansSerif", Font.PLAIN, 12);
                fontInitialized = true;

            } catch (Exception e) {
                // If all font loading fails, use default font
                defaultChineseFont = new Font("SansSerif", Font.PLAIN, 12);
                fontInitialized = true;
            }
        }

        /**
         * 从资源文件加载字体
         *
         * @param resourcePath 资源中字体文件的路径
         * @return 加载的字体，如果加载失败则返回null
         */
        private Font loadFontFromResource(String resourcePath) {
            try (InputStream is = ChineseFontUtil.class.getResourceAsStream(resourcePath)) {
                if (is != null) {
                    return Font.createFont(Font.TRUETYPE_FONT, is);
                }
            } catch (FontFormatException | IOException e) {
                System.err.println("Failed to load font from resource: " + resourcePath + ", error: " + e.getMessage());
            }
            return null;
        }

        /**
         * 获取默认中文字体
         *
         * @return 图表文本的默认中文字体
         */
        public Font getChineseFont() {
            if (!fontInitialized) {
                initializeChineseFont();
            }
            return defaultChineseFont;
        }

        /**
         * 获取指定大小的中文字体
         *
         * @param size 字体大小
         * @return 指定大小的中文字体
         */
        public Font getChineseFont(int size) {
            if (!fontInitialized) {
                initializeChineseFont();
            }
            return defaultChineseFont.deriveFont((float) size);
        }

        /**
         * 获取指定样式和大小的中文字体
         *
         * @param style 字体样式（PLAIN, BOLD, ITALIC）
         * @param size  字体大小
         * @return 指定样式和大小的中文字体
         */
        public Font getChineseFont(int style, int size) {
            if (!fontInitialized) {
                initializeChineseFont();
            }
            return defaultChineseFont.deriveFont(style, (float) size);
        }

        /**
         * 将中文字体应用到图形上下文
         *
         * @param g2d Graphics2D上下文
         */
        public void applyChineseFont(Graphics2D g2d) {
            if (!fontInitialized) {
                initializeChineseFont();
            }
            g2d.setFont(defaultChineseFont);
        }
    }
}