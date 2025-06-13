<p align="center">
  <h1 align="center">ShardingProxy Database Proxy</h1>
  <p align="center">
    <a href="README.md"><strong>English</strong></a> | <a href="README_zh.md"><strong>简体中文</strong></a>
  </p>
</p>

## Table of Contents

- [Repository Introduction](#repository-introduction)
- [Prerequisites](#prerequisites)
- [Image Specifications](#image-specifications)
- [Getting Help](#getting-help)
- [How to Contribute](#how-to-contribute)

## Repository Introduction
[ShardingProxy](https://github.com/apache/shardingsphere) is a transparent database proxy that supports features like sharding and read-write separation, providing applications with the same access experience as a single database.

**Core Features of ShardingProxy:**

1. **Transparent Sharding**: Applications operate on distributed databases as if they were single databases, without needing to understand sharding logic.
2. **SQL Compatibility**: Supports MySQL/PostgreSQL protocols and common SQL syntax (e.g., JOIN, subqueries).
3. **Read-Write Splitting**: Automatically routes read/write operations to primary or replica nodes to enhance query performance.
4. **Distributed Transactions**: Supports XA and flexible transactions (e.g., SAGA) to ensure cross-shard data consistency.
5. **Elastic Scaling**: Dynamically loads configurations and supports online expansion/shrinkage of sharding nodes.
6. **Multi-Tenancy**: Isolates data access for different businesses through logical schemas.
7. **Security & Governance**: Provides access control, SQL auditing, traffic throttling, and other management capabilities.

**Positioning**: As a lightweight database middleware, it simplifies the operational complexity of sharding architectures and serves as an alternative to traditional JDBC direct connections.

This project offers an open-source image product [**`ShardingProxy Database Proxy`**](https://marketplace.huaweicloud.com/hidden/contents/9e9217e1-5c9d-4026-96bd-b3395d0c9aa8#productid=OFFI1131118959554052096), pre-installed with ShardingProxy and its runtime environment, along with deployment templates. Follow the user guide for an "out-of-the-box" experience.

**Architecture Design:**

![](./img.png)

> **System Requirements:**
> - CPU: 2vCPUs or higher
> - RAM: 4GB or more
> - Disk: At least 50GB

## Prerequisites
[Register a Huawei Account and Activate Huawei Cloud](https://support.huaweicloud.com/usermanual-account/account_id_001.html)

## Image Specifications

| Image Specification                                                                                                                                              | Features | Notes |
|---------------------------------------------------------------------------------------------------------------------------------------------------| --- | --- |
| [shardingproxy5.5.2](https://github.com/HuaweiCloudDeveloper/shardingproxy-image/tree/shardingproxy5.5.2-arm-v1.0) | Deployed on Kunpeng servers + Huawei Cloud EulerOS 2.0 64bit |  |

## Getting Help
- For issues, submit an [issue](https://github.com/HuaweiCloudDeveloper/shardingproxy-image/issues) or contact Huawei Cloud Marketplace support for the specified product.
- Explore other open-source images at [open-source-image-repos](https://github.com/HuaweiCloudDeveloper/open-source-image-repos).

## How to Contribute
- Fork this repository and submit a pull request.
- Update README.md with your open-source image information.