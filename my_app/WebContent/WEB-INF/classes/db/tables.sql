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

CREATE  TABLE `test`.`album` (

  `id` INT NOT NULL AUTO_INCREMENT ,

  `album_name` VARCHAR(450) NOT NULL ,

  `author` VARCHAR(45) NULL ,

  `descripe` VARCHAR(450) NULL ,

  `publish_date` DATETIME NULL ,

  `create_time` DATETIME NULL ,

  `img_path` VARCHAR(200) NULL ,

  PRIMARY KEY (`id`) );

  
  CREATE  TABLE `test`.`artist` (

  `artist_id` INT NOT NULL ,

  `artist_name` VARCHAR(100) NULL ,

  `artist_path` VARCHAR(100) NULL ,

  `artist_img` VARCHAR(100) NULL ,

  PRIMARY KEY (`artist_id`) );


