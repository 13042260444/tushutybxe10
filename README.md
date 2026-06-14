# 图书管理系统 (tushutybxe10)

基于 Spring Boot + Vue 的图书管理系统，提供图书信息管理、图书分类、图书预览、订单管理、用户管理等功能。

## 技术栈

**后端：**
- Spring Boot
- MyBatis Plus
- MySQL
- WebSocket

**前端：**
- Vue.js (vue-admin / vue-front)

## 项目结构

```
├── src/                    # 后端代码
│   └── main/
│       ├── java/com/       # Java 源码
│       │   ├── controller/ # 控制器
│       │   ├── service/    # 服务层
│       │   ├── dao/        # 数据访问层
│       │   ├── entity/     # 实体类
│       │   └── utils/      # 工具类
│       └── resources/
│           ├── mapper/     # MyBatis XML 映射文件
│           └── application.yml
├── vue-admin/              # 管理端前端
├── vue-front/              # 用户端前端
├── db/                     # 数据库脚本
└── pom.xml                 # Maven 配置
```

## 快速开始

### 环境要求

- JDK 1.8+
- Maven 3.6+
- MySQL 5.7+
- Node.js

### 后端启动

1. 创建数据库并导入 `db/tushutybxe10.sql`
2. 修改 `src/main/resources/application.yml` 中的数据库配置
3. 运行项目：
   ```bash
   mvn spring-boot:run
   ```
4. 访问 `http://localhost:8080/tushutybxe10`

### 前端启动

```bash
# 管理端
cd vue-admin
npm install
npm run dev

# 用户端
cd vue-front
npm install
npm run dev
```

## 功能模块

- 图书信息管理
- 图书分类管理
- 图书公告管理
- 图书预览
- 图书推荐（协同过滤算法）
- 订单管理
- 购物车
- 用户管理
- 收藏管理
- 地址管理
- 充值记录
- 日志管理
