CREATE  TABLE `test`.`recommend` (

  `id` INT NOT NULL AUTO_INCREMENT ,

  `url` VARCHAR(3000) NULL COMMENT '\'图片地址，可多条\'' ,

  `title` VARCHAR(450) NULL COMMENT '\'文章标题\'' ,

  `content` VARCHAR(3000) NULL COMMENT '\'内容\'' ,

  `create_time` DATETIME NULL COMMENT '创建时间' ,

  `create_id` INT NULL COMMENT '创建人id；user_id' ,

  `type` INT NULL COMMENT '样式类型' ,

  PRIMARY KEY (`id`) )

COMMENT = '推荐信息表';

