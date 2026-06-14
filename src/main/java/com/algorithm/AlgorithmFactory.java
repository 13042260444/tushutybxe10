package com.algorithm;
import cn.hutool.core.date.DateUtil;
import lombok.Data;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtils;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;
import org.jfree.data.xy.DefaultXYDataset;
import org.springframework.util.ResourceUtils;
import weka.core.*;
import weka.classifiers.*;
import weka.classifiers.trees.RandomForest;
import javax.swing.*;
import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;
import java.util.*;

/**
 * 创建机器学习算法实例的工厂类
 */
public class AlgorithmFactory {

    /**
     * 根据算法类型获取算法实例
     *
     * @param algorithmType 要创建的算法类型
     * @return MLAlgorithm 实例
     */
    public static Algorithm getAlgorithm(AlgorithmType algorithmType) {
        switch (algorithmType) {
            case RANDOM_FOREST_Regression:
            case RANDOM_FOREST_Classification:
                return new RandomForestAlgorithm();
            default:
                throw new IllegalArgumentException("Unsupported algorithm type: " + algorithmType);
        }
    }

    /**
     * 根据算法名称获取算法实例
     *
     * @param algorithmName 要创建的算法名称
     * @return MLAlgorithm 实例
     */
    public static Algorithm getAlgorithm(String algorithmName) {
        for (AlgorithmType type : AlgorithmType.values()) {
            if (type.getName().equals(algorithmName)) {
                return getAlgorithm(type);
            }
        }
        throw new IllegalArgumentException("Unsupported algorithm name: " + algorithmName);
    }

    public enum AlgorithmType {
        RANDOM_FOREST_Regression("随机森林回归"),
        RANDOM_FOREST_Classification("随机森林分类"),
        OTHER("OTHER");
        private final String name;

        AlgorithmType(String name) {
            this.name = name;
        }

        public String getName() {
            return name;
        }
    }
}
/**
 * 使用Weka实现的随机森林算法
 * 支持分类和回归任务
 */
class RandomForestAlgorithm extends AlgorithmVisualization {

    private Map<String, RandomForest> models; // 每个目标字段的随机森林模型实例
    private List<String> featureNames; // 特征名称列表
    private List<String> targetNames; // 目标变量名称列表
    private List<String> categoricalFeaturesNames; // 分类特征名称列表
    private Map<String, List<Attribute>> attributesMap; // 每个目标的属性列表
    private Map<String, List<String>> nominalValues; // 存储分类特征的取值
    private Map<String, Boolean> classificationMap; // 每个目标的分类标记
    private List<String> targetUniqueValues; // 目标变量的唯一值
    private List<Map<String, Object>> dataList; // 训练数据列表
    private List<Map<String, Object>> predictionResults; // 预测数据结果
    private String className; // 模型类名

    private Map<String, Map<String, Double>> featureValueMappings = new HashMap<>();
    private Map<String, Map<String, Double>> targetValueMappings = new HashMap<>();

    public RandomForestAlgorithm() {
        System.out.println("初始化随机森林模型...");
        this.models = new HashMap<>();
        this.nominalValues = new HashMap<>();
        this.targetUniqueValues = new ArrayList<>();
        this.attributesMap = new HashMap<>();
        this.classificationMap = new HashMap<>();
        // 为随机森林设置一些默认选项
        try {
            System.out.println("随机森林模型初始化完成");
        } catch (Exception e) {
            // 处理模型初始化期间的异常
            System.err.println("初始化随机森林模型时出错: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("初始化随机森林模型时出错: " + e.getMessage(), e);
        }
    }

    @Override
    public Algorithm train(String className, List<Map<String, Object>> dataList, List<String> featureNames,
                           List<String> targetNames, List<String> categoricalFeaturesNames) {
        System.out.println("开始随机森林模型训练...");
        if (dataList == null || dataList.isEmpty()) {
            System.err.println("训练数据不能为null或空");
            throw new IllegalArgumentException("训练数据不能为null或空");
        }
        this.predictionResults = new ArrayList<>();
        this.dataList = dataList;
        this.className = className;
        this.featureNames = new ArrayList<>(featureNames);
        this.targetNames = new ArrayList<>(targetNames);
        this.categoricalFeaturesNames = categoricalFeaturesNames != null ? categoricalFeaturesNames : new ArrayList<>();

        // 自动检测目标变量是否是分类变量
        this.targetUniqueValues = getUniqueValues(dataList, targetNames.get(0));

        try {
            // 收集所有分类特征的可能取值
            System.out.println("收集分类特征的可能取值...");
            collectNominalValues(dataList);

            // 为每个目标训练单独的模型
            for (String targetName : targetNames) {
                System.out.println("开始训练目标字段: " + targetName);

                // 为当前目标检测是否是分类任务
                List<String> currentTargetUniqueValues = getUniqueValues(dataList, targetName);
                boolean isCurrentTargetClassification = currentTargetUniqueValues.size() <= 20 && currentTargetUniqueValues.size() > 0;

                // 验证分类任务的数据
                if (isCurrentTargetClassification && currentTargetUniqueValues.size() < 2) {
                    throw new IllegalArgumentException(
                            "分类任务的目标变量必须至少包含2个不同的值。当前只有 " +
                                    currentTargetUniqueValues.size() + " 个值: " + currentTargetUniqueValues
                    );
                }

                // 为当前目标创建属性
                List<Attribute> currentAttributes = new ArrayList<>();
                System.out.println("开始创建 " + targetName + " 的数据集属性...");

                // 添加特征属性
                for (String featureName : featureNames) {
                    if (this.categoricalFeaturesNames.contains(featureName)) {
                        // 创建名义属性（分类特征）
                        List<String> values = nominalValues.get(featureName);
                        if (values == null || values.isEmpty()) {
                            values = getUniqueValues(dataList, featureName);
                        }
                        currentAttributes.add(new Attribute(featureName, values));
                        System.out.println("特征 '" + featureName + "' 为分类特征，唯一值数量: " + values.size());
                    } else {
                        // 创建数值属性
                        currentAttributes.add(new Attribute(featureName));
                    }
                }

                // 添加当前目标属性
                if (isCurrentTargetClassification) {
                    // 分类任务：目标变量也是名义属性
                    List<String> actualTargetValues = getUniqueValues(dataList, targetName);
                    currentAttributes.add(new Attribute(targetName, actualTargetValues));
                    System.out.println("目标变量 '" + targetName + "' 为分类变量，实际取值: " + actualTargetValues);
                } else {
                    // 回归任务：目标变量是数值属性
                    currentAttributes.add(new Attribute(targetName));
                    System.out.println("目标变量 '" + targetName + "' 为数值变量");
                }

                // 创建当前目标的数据集
                Instances dataset = new Instances("RandomForestData_" + targetName, new ArrayList<>(currentAttributes), dataList.size());
                System.out.println("创建 " + targetName + " 的数据集，实例数量: " + dataList.size());

                // 设置类别索引（最后一个属性）
                dataset.setClassIndex(dataset.numAttributes() - 1);
                System.out.println("设置 " + targetName + " 的类别索引为: " + (dataset.numAttributes() - 1));

                // 添加实例到当前目标的数据集
                System.out.println("开始添加实例到 " + targetName + " 的数据集...");
                for (int i = 0; i < dataList.size(); i++) {
                    Map<String, Object> dataRow = dataList.get(i);
                    double[] instanceValues = new double[dataset.numAttributes()];

                    // 处理特征值
                    for (int j = 0; j < featureNames.size(); j++) {
                        String featureName = featureNames.get(j);
                        Object value = dataRow.get(featureName);

                        instanceValues[j] = processFeatureValue(featureName, value, j, dataRow);
                    }

                    // 处理当前目标值
                    Object value = dataRow.get(targetName);
                    int targetIndex = featureNames.size();

                    if (isCurrentTargetClassification) {
                        // 分类：查找索引
                        Attribute targetAttr = dataset.attribute(targetIndex);
                        if (value != null) {
                            String strValue = value.toString();
                            double targetIndexValue = targetAttr.indexOfValue(strValue);
                            if (targetIndexValue < 0) {
                                // 检查是否已经在映射中
                                Map<String, Double> targetMapping = targetValueMappings.get(targetName);
                                if (targetMapping != null && targetMapping.containsKey(strValue)) {
                                    targetIndexValue = targetMapping.get(strValue);
                                } else {
                                    // 新增映射
                                    targetIndexValue = getOrAddTargetMapping(targetName, strValue);
                                }
                            }
                            instanceValues[targetIndex] = targetIndexValue;
                        } else {
                            instanceValues[targetIndex] = 0;
                        }
                    } else {
                        // 回归：数值处理
                        if (value != null) {
                            try {
                                instanceValues[targetIndex] = Double.parseDouble(value.toString());
                            } catch (NumberFormatException e) {
                                // 对于非数值目标值，使用映射值
                                instanceValues[targetIndex] = getOrAddTargetMapping(targetName, value.toString());
                            }
                        } else {
                            instanceValues[targetIndex] = 0.0;
                        }
                    }

                    dataset.add(new DenseInstance(1.0, instanceValues));
                }

                // 验证当前目标的数据集是否满足训练要求
                validateDatasetForTraining(dataset, targetName);

                // 训练当前目标的模型
                System.out.println("开始训练 " + targetName + " 的随机森林模型...");
                RandomForest currentModel = new RandomForest();
                currentModel.setNumIterations(100);
                currentModel.setSeed(1);
                currentModel.buildClassifier(dataset);

                // 保存模型和相关信息
                models.put(targetName, currentModel);
                attributesMap.put(targetName, currentAttributes);
                classificationMap.put(targetName, isCurrentTargetClassification);

                System.out.println(targetName + " 模型训练完成！");
                System.out.println("数据集信息:");
                System.out.println("  实例数量: " + dataset.numInstances());
                System.out.println("  属性数量: " + dataset.numAttributes());
                System.out.println("  类别属性: " + dataset.classAttribute().name());
                try {
                    if (dataset.classAttribute().isNominal() || dataset.classAttribute().isString()) {
                        java.util.Enumeration<?> values = dataset.classAttribute().enumerateValues();
                        if (values != null) {
                            System.out.println("  类别值: " + Collections.list(values));
                        } else {
                            System.out.println("  类别值: 无可能值域");
                        }
                    } else {
                        System.out.println("  类别值: 连续值域 (type: " + dataset.classAttribute().type() + ")");
                    }
                } catch (Exception e) {
                    System.out.println("  类别值: 查询失败 - " + e.getMessage());
                }
            }

            System.out.println("所有目标模型训练完成！");
        } catch (Exception e) {
            System.err.println("训练随机森林模型时出错: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("训练随机森林模型时出错: " + e.getMessage(), e);
        }

        return this;
    }

    /**
     * 获取或添加目标值映射
     */
    private double getOrAddTargetMapping(String targetName, String valueStr) {
        Map<String, Double> mapping = targetValueMappings.computeIfAbsent(targetName, k -> new HashMap<>());

        if (mapping.containsKey(valueStr)) {
            return mapping.get(valueStr);
        } else {
            // 新增映射：使用当前映射表大小作为新索引
            double newIndex = (double) mapping.size() + 1; // 从1开始，避免与默认的0冲突
            mapping.put(valueStr, newIndex);
            return newIndex;
        }
    }

    /**
     * 获取或添加特征值映射
     */
    private double getOrAddFeatureMapping(String featureName, String valueStr) {
        Map<String, Double> mapping = featureValueMappings.computeIfAbsent(featureName, k -> new HashMap<>());

        if (mapping.containsKey(valueStr)) {
            return mapping.get(valueStr);
        } else {
            // 新增映射：使用当前映射表大小作为新索引
            double newIndex = (double) mapping.size() + 1; // 从1开始，避免与默认的0冲突
            mapping.put(valueStr, newIndex);
            System.out.println("特征值 '" + valueStr + "' 新增映射，分配索引: " + newIndex);
            return newIndex;
        }
    }

    /**
     * 验证数据集是否满足训练要求
     */
    private void validateDatasetForTraining(Instances dataset, String targetName) {
        if (dataset.classAttribute().isNominal()) {
            int numClasses = dataset.classAttribute().numValues();
            if (numClasses < 2) {
                throw new IllegalArgumentException(
                        targetName + " - 目标类别必须至少包含2个不同的值，当前只有 " + numClasses + " 个值"
                );
            }

            // 检查每个类别是否有足够的样本
            int[] classCounts = new int[numClasses];
            for (int i = 0; i < dataset.numInstances(); i++) {
                if (!dataset.instance(i).classIsMissing()) {
                    double classValue = dataset.instance(i).classValue();
                    // 修复：检查classValue是否在有效范围内
                    if (classValue >= 0 && classValue < numClasses) {
                        int classIndex = (int) classValue;
                        classCounts[classIndex]++;
                    }
                }
            }

            // 修复：收集所有空类别的信息
            List<String> emptyClasses = new ArrayList<>();
            for (int i = 0; i < classCounts.length; i++) {
                if (classCounts[i] == 0) {
                    emptyClasses.add(dataset.classAttribute().value(i));
                }
            }

            if (!emptyClasses.isEmpty()) {
                // 添加调试信息
                System.out.println("检测到空类别: " + emptyClasses);
                System.out.println("数据集中所有类别: ");
                for (int i = 0; i < dataset.classAttribute().numValues(); i++) {
                    System.out.println("  - 类别 " + i + ": '" + dataset.classAttribute().value(i) +
                            "' - 样本数: " + classCounts[i]);
                }

                throw new IllegalArgumentException(
                        targetName + " - 以下类别没有任何训练样本: " + String.join(", ", emptyClasses)
                );
            }

            System.out.println(targetName + " 数据集验证通过：共有 " + numClasses + " 个类别，最小类别样本数: " +
                    Arrays.stream(classCounts).min().orElse(0));
        }
    }

    /**
     * 处理特征值
     */
    private double processFeatureValue(String featureName, Object value, int index, Map<String, Object> dataRow) {
        if (categoricalFeaturesNames.contains(featureName)) {
            // 分类特征：查找索引
            // 这里需要从某个属性集合中获取attribute，为简化先假设所有属性集合都是一样的
            // 实际使用时可能需要传递属性集合参数
            List<Attribute> attrs = attributesMap.values().iterator().hasNext() ?
                    attributesMap.values().iterator().next() : new ArrayList<>();

            if (index < attrs.size()) {
                Attribute attr = attrs.get(index);
                if (value != null) {
                    String strValue = value.toString();
                    double idx = attr.indexOfValue(strValue);
                    if (idx < 0) {
                        System.out.println("分类特征 '" + featureName + "' 值 '" + strValue + "' 不在训练数据中，使用默认值: 0");
                        idx = 0; // 如果值不在列表中，使用第一个值
                    }
                    System.out.println("分类特征 '" + featureName + "' 值 '" + strValue + "' 转换为索引: " + idx);
                    return idx;
                } else {
                    System.out.println("分类特征 '" + featureName + "' 值为null，使用默认值: 0");
                    return 0; // 默认值
                }
            } else {
                System.out.println("特征索引超出范围，返回默认值: 0");
                return 0;
            }
        } else {
            // 数值特征
            if (value != null) {
                try {
                    double processedValue = Double.parseDouble(value.toString());
                    System.out.println("特征 '" + featureName + "' 值 '" + value + "' 解析为: " + processedValue);
                    return processedValue;
                } catch (NumberFormatException e) {
                    // 非数值情况：使用全局映射
                    return getOrAddFeatureMapping(featureName, value.toString());
                }
            } else {
                System.out.println("数值特征 '" + featureName + "' 值为null，使用默认值: 0.0");
                return 0.0;
            }
        }
    }

    /**
     * 处理日期值，转换为数值
     */
    private double processDateValue(Object value) {
        if (value == null) return 0.0;

        String strValue = value.toString();
        try {
            // 尝试解析时间戳（毫秒）
            if (strValue.matches("\\d+")) {
                long timestamp = Long.parseLong(strValue);
                double days = timestamp / (1000.0 * 60 * 60 * 24); // 转换为天数
                System.out.println("时间戳 '" + strValue + "' 转换为天数: " + days);
                return days;
            }
            // 尝试解析日期字符串 "yyyy-MM-dd"
            else if (strValue.matches("\\d{4}-\\d{2}-\\d{2}")) {
                String[] parts = strValue.split("-");
                int year = Integer.parseInt(parts[0]);
                int month = Integer.parseInt(parts[1]);
                int day = Integer.parseInt(parts[2]);
                double numericDate = year * 10000 + month * 100 + day; // 转换为数值格式
                System.out.println("日期 '" + strValue + "' 转换为数值: " + numericDate);
                return numericDate;
            }
        } catch (Exception e) {
            System.out.println("日期值 '" + strValue + "' 解析失败: " + e.getMessage());
            // 如果解析失败，返回0
        }
        System.out.println("日期值 '" + strValue + "' 无法解析，使用默认值: 0.0");
        return 0.0;
    }

    // 添加数字格式化工具方法
    private String formatNumber(double value) {
        return String.format("%.2f", value);
    }

    // 修改预测结果处理部分
    @Override
    public Algorithm predict(Map<String, Object> predictData) {
        System.out.println("开始随机森林预测...");
        if (models.isEmpty()) {
            System.err.println("模型必须先训练才能进行预测");
            throw new IllegalStateException("模型必须先训练才能进行预测");
        }

        try {
            // 创建结果集
            Map<String, Object> result = new HashMap<>();

            // 保留原始预测数据的所有字段
            result.putAll(predictData);
            System.out.println("处理预测数据: " + predictData);

            // 对每个目标字段进行预测
            for (String targetName : targetNames) {
                RandomForest model = models.get(targetName);
                List<Attribute> attrs = attributesMap.get(targetName);
                boolean isClassification = classificationMap.get(targetName);

                if (model == null) {
                    System.out.println("模型 " + targetName + " 未找到，跳过预测");
                    continue;
                }

                // 创建实例用于预测
                double[] instanceValues = new double[attrs.size()];

                // 处理特征值
                for (int i = 0; i < featureNames.size(); i++) {
                    String featureName = featureNames.get(i);
                    Object value = predictData.get(featureName);

                    instanceValues[i] = processFeatureValue(featureName, value, i, predictData);
                }

                // 目标值初始为0（将被预测）
                instanceValues[featureNames.size()] = 0.0;

                // 创建Weka实例
                weka.core.Instance instance = new DenseInstance(1.0, instanceValues);

                // 设置数据集
                Instances dataset = new Instances("PredictionData_" + targetName,
                        new ArrayList<>(attrs), 1);
                dataset.setClassIndex(dataset.numAttributes() - 1);
                instance.setDataset(dataset);

                // 执行预测
                System.out.println("执行 " + targetName + " 的随机森林预测...");
                double predictionIndex = model.classifyInstance(instance);
                System.out.println(targetName + " 原始预测索引: " + predictionIndex);

                // 处理预测结果
                String predictedLabel = null;
                Attribute targetAttr = dataset.attribute(dataset.numAttributes() - 1);

                if (isClassification) {
                    // 分类任务：将索引转换为实际值
                    if (targetAttr.isNominal()) {
                        // 确保索引在有效范围内
                        int index = (int) Math.round(predictionIndex);
                        if (index >= 0 && index < targetAttr.numValues()) {
                            predictedLabel = targetAttr.value(index);
                        } else {
                            // 检查是否是映射的值
                            Map<String, Double> targetMapping = targetValueMappings.get(targetName);
                            if (targetMapping != null) {
                                // 尝试反向查找映射值
                                Optional<String> matchedKey = targetMapping.entrySet().stream()
                                        .filter(entry -> entry.getValue().doubleValue() == predictionIndex)
                                        .map(Map.Entry::getKey)
                                        .findFirst();

                                if (matchedKey.isPresent()) {
                                    predictedLabel = matchedKey.get();
                                } else {
                                    // 如果找不到匹配的映射，使用第一个值
                                    predictedLabel = targetAttr.value(0);
                                }
                            } else {
                                // 如果没有映射，使用第一个值
                                predictedLabel = targetAttr.value(0);
                            }
                        }
                        System.out.println(targetName + " 预测结果: " + predictedLabel + " (索引: " + index + ")");
                    } else {
                        // 检查是否是映射的值
                        Map<String, Double> targetMapping = targetValueMappings.get(targetName);
                        if (targetMapping != null) {
                            Optional<String> matchedKey = targetMapping.entrySet().stream()
                                    .filter(entry -> entry.getValue().doubleValue() == predictionIndex)
                                    .map(Map.Entry::getKey)
                                    .findFirst();

                            if (matchedKey.isPresent()) {
                                predictedLabel = matchedKey.get();
                                System.out.println(targetName + " 预测结果: " + matchedKey.get() + " (映射值)");
                            } else {
                                // 回归预测结果格式化
                                predictedLabel = formatNumber(predictionIndex);
                            }
                        } else {
                            // 回归预测结果格式化
                            predictedLabel = formatNumber(predictionIndex);
                        }
                    }
                } else {
                    // 检查是否是映射的值
                    Map<String, Double> targetMapping = targetValueMappings.get(targetName);
                    if (targetMapping != null) {
                        Optional<String> matchedKey = targetMapping.entrySet().stream()
                                .filter(entry -> entry.getValue().doubleValue() == predictionIndex)
                                .map(Map.Entry::getKey)
                                .findFirst();

                        if (matchedKey.isPresent()) {
                            predictedLabel = matchedKey.get();
                            System.out.println(targetName + " 预测结果: " + matchedKey.get() + " (映射值)");
                        } else {
                            // 回归预测结果格式化
                            predictedLabel = formatNumber(predictionIndex);
                        }
                    } else {
                        // 回归预测结果格式化
                        predictedLabel = formatNumber(predictionIndex);
                    }
                }

                result.put(targetName, predictedLabel);
            }

            predictionResults.add(result);
            System.out.println("预测完成，结果已添加到缓存");
            return this;

        } catch (Exception e) {
            System.err.println("预测过程中发生错误: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("预测过程中发生错误: " + e.getMessage(), e);
        }
    }



    @Override
    public Algorithm generateVisualization() {
        System.out.println("开始生成随机森林可视化图表...");
        try {
            // 生成可视化图表
            generateFeatureImportanceChart();
            System.out.println("随机森林可视化图表生成完成");
        } catch (Exception e) {
            System.err.println("生成随机森林可视化时出错: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("生成随机森林可视化时出错: " + e.getMessage(), e);
        }
        return this;
    }

    /**
     * 生成特征重要性图表
     *
     * @return
     * @throws IOException
     */
    private String generateFeatureImportanceChart() throws IOException {
        String chartPath = "upload/" + this.className + "_" + this.getAlgorithmName() + "_" + System.currentTimeMillis() + ".png";
        System.out.println("生成特征重要性图表，保存路径: " + chartPath);

        // 为图表创建数据集
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();

        // 计算特征重要性（简化方法 - 使用方差作为代理）
        for (int i = 0; i < featureNames.size(); i++) {
            String featureName = featureNames.get(i);
            System.out.println("计算特征 '" + featureName + "' 的重要性...");

            // 计算此特征的方差作为重要性度量
            double[] values = new double[dataList.size()];
            double sum = 0;
            for (int j = 0; j < dataList.size(); j++) {
                Object value = dataList.get(j).get(featureName);
                if (value != null) {
                    try {
                        values[j] = Double.parseDouble(value.toString());
                        sum += values[j];
                    } catch (NumberFormatException e) {
                        // 如果值是非数值，使用映射值
                        String strValue = value.toString();
                        double mappedValue = getOrAddFeatureMapping(featureName, strValue);
                        values[j] = mappedValue;
                        sum += mappedValue;
                    }
                } else {
                    values[j] = 0.0;
                }
            }

            double mean = sum / dataList.size();
            double variance = 0;
            for (double value : values) {
                variance += Math.pow(value - mean, 2);
            }
            variance = variance / dataList.size();

            // 添加到数据集（使用方差作为重要性度量）
            dataset.addValue(variance, "特征重要性", featureName);
            System.out.println("特征 '" + featureName + "' 的方差（重要性）: " + variance);
        }

        // 创建图表
        System.out.println("创建特征重要性柱状图...");
        JFreeChart chart = ChartFactory.createBarChart(
                "随机森林 - 特征重要性排序图",
                "特征",
                "重要性（方差）",
                dataset,
                PlotOrientation.VERTICAL,
                true, // 图例
                true, // 工具提示
                false // 网址
        );

        // 保存图表到文件
        saveChartToFile(chart, chartPath, 800, 600);
        System.out.println("特征重要性图表已保存到: " + chartPath);

        return chartPath;
    }

    @Override
    public List<Map<String, Object>> getPredictResult() {
        System.out.println("获取随机森林预测结果，共 " + (predictionResults != null ? predictionResults.size() : 0) + " 条记录");
        return this.predictionResults;
    }

    @Override
    public String getAlgorithmName() {
        return "随机森林";
    }

    @Override
    public boolean isClassification() {
        // 返回第一个目标的分类状态，如果有多个目标且类型不同，需要特殊处理
        if (classificationMap.isEmpty()) {
            return false;
        }
        return classificationMap.values().iterator().next();
    }

    /**
     * 收集分类特征的所有可能取值
     */
    private void collectNominalValues(List<Map<String, Object>> dataList) {
        if (categoricalFeaturesNames == null || categoricalFeaturesNames.isEmpty()) {
            System.out.println("没有分类特征需要收集取值");
            return;
        }

        System.out.println("收集分类特征的所有可能取值...");
        for (String featureName : categoricalFeaturesNames) {
            List<String> values = getUniqueValues(dataList, featureName);
            nominalValues.put(featureName, values);
            System.out.println("分类特征 '" + featureName + "' 的可能取值: " + values);
        }
    }

    /**
     * 获取指定字段的唯一值列表
     */
    private List<String> getUniqueValues(List<Map<String, Object>> dataList, String fieldName) {
        Set<String> uniqueValues = new LinkedHashSet<>(); // 保持插入顺序
        for (Map<String, Object> dataRow : dataList) {
            Object value = dataRow.get(fieldName);
            if (value != null) {
                uniqueValues.add(value.toString());
            }
        }
        List<String> result = new ArrayList<>(uniqueValues);
        System.out.println("字段 '" + fieldName + "' 的唯一值数量: " + result.size());
        return result;
    }

    /**
     * 获取目标变量的可能取值（仅用于分类任务）
     */
    public List<String> getTargetValues() {
        return targetUniqueValues;
    }
}
