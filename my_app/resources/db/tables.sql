CREATE  TABLE `test`.`recommend` (

  `id` INT NOT NULL AUTO_INCREMENT ,

  `url` VARCHAR(3000) NULL COMMENT '\'ͼƬ��ַ���ɶ���\'' ,

  `title` VARCHAR(450) NULL COMMENT '\'���±���\'' ,

  `content` VARCHAR(3000) NULL COMMENT '\'����\'' ,

  `create_time` DATETIME NULL COMMENT '����ʱ��' ,

  `create_id` INT NULL COMMENT '������id��user_id' ,

  `type` INT NULL COMMENT '��ʽ����' ,

  PRIMARY KEY (`id`) )

COMMENT = '�Ƽ���Ϣ��';

