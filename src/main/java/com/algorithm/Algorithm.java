package com.algorithm;

import java.util.List;
import java.util.Map;

/**
 * 机器学习算法接口，定义了系统中所有机器学习算法的核心操作。
 * <p>
 * 该接口支持分类和聚类算法，具有统一的训练和预测方法，支持链式调用。
 */
public interface Algorithm {

    /**
     * 使用提供的数据训练算法
     *
     * @param className                算法类名
     * @param dataList                 包含训练数据的Map列表，其中每个Map代表一个数据记录
     * @param featureNames             用作输入特征的特征列名列表
     * @param targetNames              要预测的目标列名列表
     * @param categoricalFeaturesNames 离散特征列名列表
     * @return 用于链式调用的算法实例
     */
    Algorithm train(String className, List<Map<String, Object>> dataList, List<String> featureNames, List<String> targetNames, List<String> categoricalFeaturesNames);

    /**
     * 使用训练好的模型进行预测
     *
     * @param predictData 包含预测输入数据的Map
     * @return 包含预测结果的Map列表，结构与predictData相同
     * 但目标字段值被预测值填充
     */
    Algorithm predict(Map<String, Object> predictData);

    /**
     * 生成算法的可视化结果
     */
    Algorithm generateVisualization();

    /**
     * 获取预测结果
     *
     * @return 预测结果列表，结构与输入数据相同
     */
    List<Map<String, Object>> getPredictResult();


    /**
     * 获取算法名称
     *
     * @return 算法名称字符串
     */
    String getAlgorithmName();

    /**
     * 检查算法是否为分类算法（相对于聚类）
     *
     * @return 如果是分类算法则返回true，如果是聚类则返回false
     */
    boolean isClassification();
}