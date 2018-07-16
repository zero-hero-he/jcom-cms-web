CREATE TABLE `pro_classify` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
`classify_name` varchar(255) NOT NULL COMMENT '分类名称',
`parent_id` int(11) NULL COMMENT '所属父类id',
`user_id` int(11) NOT NULL COMMENT '所属用户',
`gmt_create` datetime NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
`gmt_modified` datetime NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
`gmt_user_id` int(11) NULL COMMENT '修改人',
PRIMARY KEY (`id`) 
)
COMMENT = '分类表';
CREATE TABLE `pro_label` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
`label_name` varchar(255) NULL COMMENT '标签名',
`user_id` int(11) NULL COMMENT '所属用户',
`gmt_create` varchar(255) NULL COMMENT '创建时间',
`gmt_modified` varchar(255) NULL COMMENT '修改时间',
`gmt_user_id` int(11) NULL COMMENT '修改用户',
PRIMARY KEY (`id`) 
)
COMMENT = '标签表';
CREATE TABLE `pro_pro` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`pro_name` varchar(255) NOT NULL COMMENT '商品名称',
`pro_code` varchar(20) NOT NULL COMMENT '商品编号',
`gmt_create` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`gmt_modified` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`gmt_user_id` int(11) NULL,
PRIMARY KEY (`id`) 
)
COMMENT = '商品表';
CREATE TABLE `pro_batch` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`batch_code` varchar(20) NULL COMMENT '批次号',
`batch_name` varchar(255) NULL COMMENT '批次名称',
`pro_cost` decimal(10,2) NULL COMMENT '成本价',
`pro_retail_price` decimal(10,2) NULL COMMENT '零售价',
`pro_count` int NULL COMMENT '商品总量',
`pro_stock` int NULL COMMENT '库存',
`gmt_create` datetime NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
`gmt_modified` datetime NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
`gmt_user_id` int(11) NULL COMMENT '修改人',
PRIMARY KEY (`id`) 
)
COMMENT = '商品批次表';
CREATE TABLE `pro_detail` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`pro_id` int(11) NULL COMMENT '商品编号',
`pro_desc` text NULL COMMENT '商品描述信息',
`gmt_create` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`gmt_modified` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`gmt_user_id` int(11) NULL,
PRIMARY KEY (`id`) 
)
COMMENT = '商品详细信息';
CREATE TABLE `pro_store` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`store_code` varchar(20) NULL COMMENT '商店编号',
`store_name` varchar(255) NULL,
`store_location` varchar(255) NULL COMMENT '商店地址',
`gmt_create` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`gmt_modified` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`gmt_user_id` int(11) NULL,
PRIMARY KEY (`id`) 
)
COMMENT = '商店信息表';
CREATE TABLE `pro_warehouse` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`wh_code` varchar(20) NULL COMMENT '编号',
`wh_name` varchar(255) NULL COMMENT '名称',
`wh_location` varchar(255) NULL COMMENT '地理位置',
`gmt_create` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`gmt_modified` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`gmt_user_id` int NULL,
PRIMARY KEY (`id`) 
)
COMMENT = '仓库信息表';
CREATE TABLE `pro_warehouse_rack` (
`id` int(11) NOT NULL,
`warehouse_id` int(11) NULL COMMENT '仓库编号',
`rack_code` varchar(20) NULL,
`rack_desc` varchar(255) NULL,
`rack_type` int NULL,
PRIMARY KEY (`id`) 
)
COMMENT = '货架信息表';
CREATE TABLE `pro_store1` (
);
CREATE TABLE `pro_store_rack` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`store_id` int(11) NULL COMMENT '商店id',
`rack_code` varchar(20) NULL,
`rack_desc` varchar(255) NULL,
`rack_type` int NULL,
`gmt_create` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`gmt_modified` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`gmt_user_id` int(11) NULL,
PRIMARY KEY (`id`) 
)
COMMENT = '商店货架表';
CREATE TABLE `pro_location` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`pro_id` int(11) NULL COMMENT '商品id',
`wh_rack_id` int(11) NULL COMMENT '仓库货架id',
`store_rack_id` int(11) NULL COMMENT '商店货架id',
`gmt_create` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`gmt_modified` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`gmt_user_id` int(11) NULL,
PRIMARY KEY (`id`) 
)
COMMENT = '商品存放信息表';
CREATE TABLE `pro_pro_classify_batch` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`pro_id` int(11) NULL,
`classify_id` int(11) NULL,
`batch_id` int(11) NULL,
`gmt_create` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`gmt_modified` varchar(255) NULL,
`gmt_user_id` int(11) NULL,
PRIMARY KEY (`id`) 
);
CREATE TABLE `pro_pro_label` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`pro_id` int(11) NULL,
`label_id` int(11) NULL,
`gmt_create` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`gmt_modified` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`gmt_user_id` int(11) NULL,
PRIMARY KEY (`id`) 
);

ALTER TABLE `pro_classify` ADD CONSTRAINT `fk_pro_classify_pro_pro_classify_batch_1` FOREIGN KEY (`id`) REFERENCES `pro_pro_classify_batch` (`classify_id`);
ALTER TABLE `pro_batch` ADD CONSTRAINT `fk_pro_batch_pro_pro_classify_batch_1` FOREIGN KEY (`id`) REFERENCES `pro_pro_classify_batch` (`batch_id`);
ALTER TABLE `pro_label` ADD CONSTRAINT `fk_pro_label_pro_pro_label_1` FOREIGN KEY (`id`) REFERENCES `pro_pro_label` (`label_id`);
ALTER TABLE `pro_pro` ADD CONSTRAINT `fk_pro_pro_pro_pro_classify_batch_1` FOREIGN KEY (`id`) REFERENCES `pro_pro_classify_batch` (`pro_id`);
ALTER TABLE `pro_detail` ADD CONSTRAINT `fk_pro_detail_pro_pro_1` FOREIGN KEY (`pro_id`) REFERENCES `pro_pro` (`id`);
ALTER TABLE `pro_pro` ADD CONSTRAINT `fk_pro_pro_pro_pro_label_1` FOREIGN KEY (`id`) REFERENCES `pro_pro_label` (`pro_id`);
ALTER TABLE `pro_warehouse` ADD CONSTRAINT `fk_pro_warehouse_pro_warehouse_rack_1` FOREIGN KEY (`id`) REFERENCES `pro_warehouse_rack` (`warehouse_id`);
ALTER TABLE `pro_warehouse_rack` ADD CONSTRAINT `fk_pro_warehouse_rack_pro_location_1` FOREIGN KEY (`id`) REFERENCES `pro_location` (`wh_rack_id`);
ALTER TABLE `pro_pro` ADD CONSTRAINT `fk_pro_pro_pro_location_1` FOREIGN KEY (`id`) REFERENCES `pro_location` (`pro_id`);
ALTER TABLE `pro_store_rack` ADD CONSTRAINT `fk_pro_store_rack_pro_location_1` FOREIGN KEY (`id`) REFERENCES `pro_location` (`store_rack_id`);
ALTER TABLE `pro_store` ADD CONSTRAINT `fk_pro_store_pro_store_rack_1` FOREIGN KEY (`id`) REFERENCES `pro_store_rack` (`store_id`);

