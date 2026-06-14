package com.config;

import com.algorithm.recommend.RecommendAlgorithmFactory;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.entity.BookannouncementEntity;
import com.entity.BookinformationEntity;
import com.entity.OrdersEntity;
import com.entity.StoreupEntity;
import com.entity.UserEntity;
import com.service.BookannouncementService;
import com.service.BookinformationService;
import com.service.OrdersService;
import com.service.StoreupService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class RecommendTrainRunner implements ApplicationRunner {

    @Autowired
    private UserService userService;

    @Autowired
    private BookinformationService bookinformationService;

    @Autowired
    private OrdersService ordersService;

    @Autowired
    private StoreupService storeupService;

    @Autowired
    private BookannouncementService bookannouncementService;

    @Override
    public void run(ApplicationArguments args) {
        System.out.println("========================================");
        System.out.println("  检测推荐模型，尝试自动训练...");
        System.out.println("========================================");
        try {
            trainBookinformationModel();
        } catch (Exception e) {
            System.out.println("图书推荐模型训练失败: " + e.getMessage());
            e.printStackTrace();
        }
        try {
            trainBookannouncementModel();
        } catch (Exception e) {
            System.out.println("公告推荐模型训练失败: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private void trainBookinformationModel() {
        try {
            String userFeaturesFields = "gender, age";
            List<Map<String, Object>> userDataList = userService.selectMaps(
                    new EntityWrapper<UserEntity>().setSqlSelect("id as userId," + userFeaturesFields));
            if (userDataList == null || userDataList.isEmpty()) {
                System.out.println("跳过训练：用户数据为空");
                return;
            }

            String itemFeaturesFields = "bookclassification, price, sales";
            List<Map<String, Object>> itemDataList = bookinformationService.selectMaps(
                    new EntityWrapper<BookinformationEntity>().setSqlSelect("id as itemId," + itemFeaturesFields));
            if (itemDataList == null || itemDataList.isEmpty()) {
                System.out.println("跳过训练：图书数据为空");
                return;
            }

            List<RecommendAlgorithmFactory.UserBehavior> userBehaviors = new ArrayList<>();
            List<OrdersEntity> ordersList = ordersService.selectList(new EntityWrapper<>());
            if (ordersList == null || ordersList.isEmpty()) {
                System.out.println("跳过训练：订单数据为空");
                return;
            }
            userBehaviors.addAll(ordersList.stream()
                    .map(order -> new RecommendAlgorithmFactory.UserBehavior(order.getUserid(), order.getGoodid()))
                    .collect(Collectors.toList()));

            System.out.println("--- 训练图书推荐模型 (bookinformation) ---");
            System.out.println("  用户数量: " + userDataList.size());
            System.out.println("  图书数量: " + itemDataList.size());
            System.out.println("  订单记录: " + userBehaviors.size());
            RecommendAlgorithmFactory.buildAlgorithm("随机森林", "bookinformation")
                    .train(userDataList, itemDataList, userBehaviors);
            System.out.println("图书推荐模型训练完成！");
        } catch (Exception e) {
            System.out.println("图书推荐模型训练失败: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private void trainBookannouncementModel() {
        try {
            // 用户特征（与图书推荐共用用户数据）
            String userFeaturesFields = "gender, age";
            List<Map<String, Object>> userDataList = userService.selectMaps(
                    new EntityWrapper<UserEntity>().setSqlSelect("id as userId," + userFeaturesFields));
            if (userDataList == null || userDataList.isEmpty()) {
                System.out.println("跳过公告训练：用户数据为空");
                return;
            }

            // 公告物品特征：发布人(publisher, 类别特征) + 收藏数(storeupnum, 数值特征)
            String itemFeaturesFields = "publisher, storeupnum";
            List<Map<String, Object>> itemDataList = bookannouncementService.selectMaps(
                    new EntityWrapper<BookannouncementEntity>().setSqlSelect("id as itemId," + itemFeaturesFields));
            if (itemDataList == null || itemDataList.isEmpty()) {
                System.out.println("跳过公告训练：公告数据为空");
                return;
            }

            // 用户行为数据（收藏表中公告的收藏记录）
            List<RecommendAlgorithmFactory.UserBehavior> userBehaviors = new ArrayList<>();
            List<StoreupEntity> storeupList = storeupService.selectList(
                    new EntityWrapper<StoreupEntity>().eq("tablename", "bookannouncement"));
            if (storeupList != null && !storeupList.isEmpty()) {
                userBehaviors.addAll(storeupList.stream()
                        .map(s -> new RecommendAlgorithmFactory.UserBehavior(s.getUserid(), s.getRefid()))
                        .collect(Collectors.toList()));
            }

            if (userBehaviors.isEmpty()) {
                System.out.println("跳过公告训练：暂无用户对公告的收藏行为数据");
                return;
            }

            System.out.println("--- 训练公告推荐模型 (bookannouncement) ---");
            System.out.println("  用户数量: " + userDataList.size());
            System.out.println("  公告数量: " + itemDataList.size());
            System.out.println("  收藏记录: " + userBehaviors.size());
            RecommendAlgorithmFactory.buildAlgorithm("随机森林", "bookannouncement")
                    .train(userDataList, itemDataList, userBehaviors);
            System.out.println("公告推荐模型训练完成！");
        } catch (Exception e) {
            System.out.println("公告推荐模型训练失败: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
