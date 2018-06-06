/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.55 : Database - site
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`site` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `site`;

/*Table structure for table `attachment` */

DROP TABLE IF EXISTS `attachment`;

CREATE TABLE `attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` date NOT NULL COMMENT '上传时间',
  `fileName` varchar(50) NOT NULL COMMENT '名称',
  `fileUrl` varchar(50) NOT NULL COMMENT '文件地址',
  `size` bigint(20) DEFAULT NULL COMMENT '文件大小',
  `download` int(10) DEFAULT NULL COMMENT '下载次数',
  `fileType` varchar(10) DEFAULT NULL COMMENT '文件类型',
  `ordernum` int(10) NOT NULL COMMENT '上传人编号',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `state` int(11) DEFAULT '1' COMMENT '状态 0 删除  1启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `attachment` */

insert  into `attachment`(`id`,`createDate`,`fileName`,`fileUrl`,`size`,`download`,`fileType`,`ordernum`,`remark`,`state`) values (1,'2017-11-30','赵丽颖','赵丽颖.jpg',NULL,NULL,NULL,2003001,'',1);

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` date NOT NULL COMMENT '创建时间',
  `deptNum` int(10) NOT NULL COMMENT '部门编号',
  `name` varchar(10) NOT NULL COMMENT '部门名称',
  `fullName` varchar(20) NOT NULL COMMENT '部门全称',
  `pid` int(10) NOT NULL COMMENT '上级部门',
  `address` varchar(30) DEFAULT NULL COMMENT '地址',
  `description` varchar(50) DEFAULT NULL COMMENT '简介',
  `remark` varchar(30) DEFAULT NULL COMMENT '部门描述',
  `state` int(10) NOT NULL COMMENT '是否启用 1启用 0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`id`,`createDate`,`deptNum`,`name`,`fullName`,`pid`,`address`,`description`,`remark`,`state`) values (1,'2017-04-12',200301,'某某公司','某某公司',0,'北京','公司一级部门',NULL,1),(2,'2017-04-12',200302,'管理部门','管理部门',200301,'北京怀柔','管理部门经理',NULL,1),(3,'2017-04-12',200303,'行政部','行政部',200301,'北京怀柔','负责公司的行政事务',NULL,1),(4,'2017-04-12',200304,'销售部','销售部',200301,'北京怀柔','推广公司的产品',NULL,1),(5,'2017-04-12',200305,'财务部','财务部',200301,'北京怀柔','对公司的财务进行管理',NULL,1),(6,'2017-04-12',200306,'网络技术部','网络技术部',200301,'北京怀柔','对公司的线上网站维护','',1),(7,'2017-04-12',200307,'网络运维部','网络运维部',200301,'北京怀柔','对公司的线上网站推广','网络部',1),(8,'2017-04-12',200308,'人事部','人事部',200301,'北京怀柔','负责人员的变动',NULL,1),(9,'2017-04-12',200309,'后勤部','后勤部',200301,'北京怀柔','对员工的后勤有所保障',NULL,1),(10,'2017-04-12',200310,'制作部','制作部',200301,'北京怀柔','制作公司的宣传片',NULL,1),(14,'2017-04-12',200311,'测试部门','测试部门',200301,'思想天下','测试系统','测试',1),(15,'2017-04-12',200312,'销售一部','销售一部',200304,'北京海淀',NULL,NULL,1),(16,'2017-04-12',200313,'销售二部','销售二部',200304,'北京朝阳','','',1);

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employeeNum` varchar(10) NOT NULL COMMENT '员工编号',
  `loginName` varchar(16) NOT NULL COMMENT '用户名',
  `loginPassword` varchar(50) NOT NULL COMMENT '登录密码',
  `userName` varchar(10) NOT NULL COMMENT '姓名',
  `createDate` date DEFAULT NULL COMMENT '注册时间',
  `deptId` int(5) NOT NULL COMMENT '部门编号',
  `roleId` int(5) NOT NULL COMMENT '职位编号',
  `idCard` varchar(18) NOT NULL COMMENT '身份证号',
  `telphone` varchar(11) NOT NULL COMMENT '手机号码',
  `email` varchar(30) NOT NULL COMMENT '邮箱',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `register` int(30) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `url` varchar(100) DEFAULT NULL COMMENT '头像地址',
  `phone` varchar(20) NOT NULL DEFAULT '0' COMMENT '座机号码 默认是0',
  `entryMan` int(10) DEFAULT NULL COMMENT '上级领导',
  `remark` varchar(20) DEFAULT NULL COMMENT '备注',
  `state` int(10) NOT NULL DEFAULT '1' COMMENT '状态 1启用 0未启用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `employeeNum` (`employeeNum`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`id`,`employeeNum`,`loginName`,`loginPassword`,`userName`,`createDate`,`deptId`,`roleId`,`idCard`,`telphone`,`email`,`address`,`register`,`url`,`phone`,`entryMan`,`remark`,`state`) values (1,'2003001','admin','e10adc3949ba59abbe56e057f20f883e','董事长','2017-06-01',200302,20170001,'411722197105218416','13856521011','614749555@qq.com','思想天下',207,'','0',2003001,'',1),(2,'2003002','yaoweiling','e10adc3949ba59abbe56e057f20f883e','姚卫玲','2017-07-24',200308,20170011,'41172219790617867X','15332439952','4242@163.com','',0,NULL,'0',2003002,NULL,1),(3,'2003003','maqian','e10adc3949ba59abbe56e057f20f883e','马倩','2017-07-24',200308,20170012,'411722197505138511','15324399526','151541@qq.com','',0,NULL,'0',2003002,NULL,1),(4,'2003004','ceshi','e10adc3949ba59abbe56e057f20f883e','测试经理','2017-08-15',200311,20170017,'131102199606012014','15510252421','2542523@qq.com',NULL,0,NULL,'0',2003001,NULL,1),(5,'2003005','wuqiong','e10adc3949ba59abbe56e057f20f883e','吴琼','2017-07-24',200306,20170018,'210104198001195011','15324395241','1551@qq.com','',0,NULL,'0',2003002,NULL,1),(6,'2003006','yanpei','e10adc3949ba59abbe56e057f20f883e','闫培','2017-07-24',200306,20170021,'320104198806183590','18810420654','15324399524@163com','',0,'','0',2003002,'',1),(7,'2003007','sunying','e10adc3949ba59abbe56e057f20f883e','孙颖','2017-07-24',200307,20170009,'532300199005144891','15324399526','sdfsfd@166.com','',0,NULL,'0',2003002,NULL,1),(8,'2003008','lidongxu','e10adc3949ba59abbe56e057f20f883e','李东旭','2017-11-29',200305,20170004,'131102199606012014','15732896521','6144@qq.com','',0,NULL,'0',2003001,NULL,1);

/*Table structure for table `function` */

DROP TABLE IF EXISTS `function`;

CREATE TABLE `function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `function` */

insert  into `function`(`id`,`menuname`) values (1,'查询'),(2,'提交'),(3,'增加'),(4,'修改'),(5,'删除'),(6,'导入'),(7,'导出');

/*Table structure for table `knowledge` */

DROP TABLE IF EXISTS `knowledge`;

CREATE TABLE `knowledge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `knowledge` */

insert  into `knowledge`(`id`,`title`,`pid`,`state`) values (1,'Java',0,1),(2,'MYSQL',0,1),(3,'HTML',0,1),(4,'jQuery',0,1);

/*Table structure for table `knowledge_details` */

DROP TABLE IF EXISTS `knowledge_details`;

CREATE TABLE `knowledge_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `pid` int(11) NOT NULL,
  `createTime` datetime NOT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `knowledge_details` */

insert  into `knowledge_details`(`id`,`content`,`pid`,`createTime`,`state`) values (1,' <!--springMVC+thymeleaf的跳转页面配置-->\r\n       <bean id=\"templateResolver\"\r\n          class=\"org.thymeleaf.templateresolver.ServletContextTemplateResolver\">\r\n         <property name=\"prefix\" value=\"/WEB-INF/views/\" />\r\n         <property name=\"suffix\" value=\".html\" />\r\n         <property name=\"templateMode\" value=\"HTML5\" />\r\n       </bean>\r\n\r\n       <bean id=\"templateEngine\"\r\n           class=\"org.thymeleaf.spring4.SpringTemplateEngine\">\r\n          <property name=\"templateResolver\" ref=\"templateResolver\" />\r\n       </bean>\r\n\r\n       <bean class=\"org.thymeleaf.spring4.view.ThymeleafViewResolver\">\r\n         <property name=\"templateEngine\" ref=\"templateEngine\" />\r\n       </bean>',1,'2017-12-11 14:22:58',1);

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuname` varchar(10) NOT NULL COMMENT '菜单名称',
  `pid` int(10) NOT NULL COMMENT '上级菜单编号',
  `url` varchar(50) DEFAULT NULL COMMENT '地址',
  `iconfont` varchar(15) DEFAULT NULL COMMENT '图标',
  `remark` varchar(20) DEFAULT NULL COMMENT '备注',
  `target` int(5) DEFAULT '1' COMMENT '窗口位置',
  `state` int(5) NOT NULL COMMENT '状态1 启用 0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`id`,`menuname`,`pid`,`url`,`iconfont`,`remark`,`target`,`state`) values (1,'系统管理',0,'','&#xe61d;','',1,1),(2,'用户管理',0,'','&#xe62d;','管理员工',1,1),(3,'部门管理',0,NULL,'&#xe72c;',NULL,1,1),(4,'薪酬管理',0,NULL,'&#xe6c6;',NULL,1,1),(5,'招聘管理',0,NULL,'&#xe6cc;',NULL,1,1),(6,'人事管理',0,'','&#xe6d3;','',1,1),(7,'培训管理',0,'','&#xe620;','',1,1),(8,'菜单管理',1,'showMenu.action',NULL,NULL,1,1),(9,'员工列表',2,'showEmp.action',NULL,'公司员工',1,1),(10,'角色管理',3,'showRole.action',NULL,NULL,1,1),(11,'部门信息',3,'showDept.action',NULL,NULL,1,1),(12,'薪酬标准管理',4,'salarymanagerStandard.action',NULL,NULL,1,1),(13,'薪酬标准审批',4,'salarymanagerExamine.action',NULL,NULL,1,1),(14,'薪酬入档管理',4,'salarymanagerFile.action',NULL,NULL,1,1),(15,'职位管理',5,'selectPosition.action',NULL,NULL,1,1),(16,'简历管理',5,'selectResumeManage.action',NULL,NULL,1,1),(17,'面试管理',5,'selectInterview.action',NULL,NULL,1,1),(18,'录用管理',5,'selectHire.action',NULL,NULL,1,1),(19,'人事档案管理',6,'showPsnFile1.action',NULL,NULL,1,1),(20,'人事档案审批',6,'showPsnFile2.action',NULL,NULL,1,1),(21,'人事档案删除（逻辑）',6,'showPsnFile3.action',NULL,NULL,1,1),(22,'培训计划',7,'showTrain1.action',NULL,NULL,1,1),(23,'培训审核',7,'showTrain2.action',NULL,NULL,1,1),(24,'培训考核与反馈',7,'showTrain3.action',NULL,NULL,1,1),(25,'iconfont',1,'styles/lib/Hui-iconfont/1.0.8/demo.html',NULL,NULL,1,1),(26,'文档下载',1,'showFile.action',NULL,NULL,1,1),(27,'百度',28,'http://www.baidu.com',NULL,'',1,1),(28,'外部连接',0,'','&#xe634;','',1,1),(30,'版本日志',1,'showVersionLogList.action',NULL,NULL,1,1);

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `userId` varchar(10) DEFAULT NULL COMMENT '用户id',
  `sendId` varchar(10) DEFAULT NULL COMMENT '发送人',
  `type` int(5) DEFAULT NULL COMMENT '消息类型 1 通知  2 公告   3 私信',
  `state` int(5) DEFAULT '1' COMMENT '状态  1 未读  2 已读  3 删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `message` */

insert  into `message`(`id`,`title`,`content`,`userId`,`sendId`,`type`,`state`) values (1,'通知','佛挡杀佛对方是否斯蒂芬斯蒂芬第三方发生大幅度释放速度地方撒第三方','2003007','2003004',1,1);

/*Table structure for table `operation` */

DROP TABLE IF EXISTS `operation`;

CREATE TABLE `operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuname` varchar(255) DEFAULT NULL COMMENT '功能名称',
  `pid` int(11) DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100134 DEFAULT CHARSET=utf8;

/*Data for the table `operation` */

insert  into `operation`(`id`,`menuname`,`pid`) values (100001,'1',8),(100002,'2',8),(100003,'3',8),(100004,'4',8),(100005,'5',8),(100006,'6',8),(100007,'7',8),(100008,'1',9),(100009,'2',9),(100010,'3',9),(100011,'4',9),(100012,'5',9),(100013,'6',9),(100014,'7',9),(100015,'1',10),(100016,'2',10),(100017,'3',10),(100018,'4',10),(100019,'5',10),(100020,'6',10),(100021,'7',10),(100022,'1',11),(100023,'2',11),(100024,'3',11),(100025,'4',11),(100026,'5',11),(100027,'6',11),(100028,'7',11),(100029,'1',12),(100030,'2',12),(100031,'3',12),(100032,'4',12),(100033,'5',12),(100034,'6',12),(100035,'7',12),(100036,'1',13),(100037,'2',13),(100038,'3',13),(100039,'4',13),(100040,'5',13),(100041,'6',13),(100042,'7',13),(100043,'1',14),(100044,'2',14),(100045,'3',14),(100046,'4',14),(100047,'5',14),(100048,'6',14),(100049,'7',14),(100050,'1',15),(100051,'2',15),(100052,'3',15),(100053,'4',15),(100054,'5',15),(100055,'6',15),(100056,'7',15),(100057,'1',16),(100058,'2',16),(100059,'3',16),(100060,'4',16),(100061,'5',16),(100062,'6',16),(100063,'7',16),(100064,'1',17),(100065,'2',17),(100066,'3',17),(100067,'4',17),(100068,'5',17),(100069,'6',17),(100070,'7',17),(100071,'1',18),(100072,'2',18),(100073,'3',18),(100074,'4',18),(100075,'5',18),(100076,'6',18),(100077,'7',18),(100078,'1',19),(100079,'2',19),(100080,'3',19),(100081,'4',19),(100082,'5',19),(100083,'6',19),(100084,'7',19),(100085,'1',20),(100086,'2',20),(100087,'3',20),(100088,'4',20),(100089,'5',20),(100090,'6',20),(100091,'7',20),(100092,'1',21),(100093,'2',21),(100094,'3',21),(100095,'4',21),(100096,'5',21),(100097,'6',21),(100098,'7',21),(100099,'1',22),(100100,'2',22),(100101,'3',22),(100102,'4',22),(100103,'5',22),(100104,'6',22),(100105,'7',22),(100106,'1',23),(100107,'2',23),(100108,'3',23),(100109,'4',23),(100110,'5',23),(100111,'6',23),(100112,'7',23),(100113,'1',24),(100114,'2',24),(100115,'3',24),(100116,'4',24),(100117,'5',24),(100118,'6',24),(100119,'7',24),(100120,'1',26),(100121,'2',26),(100122,'3',26),(100123,'4',26),(100124,'5',26),(100125,'6',26),(100126,'7',26),(100127,'1',30),(100128,'2',30),(100129,'3',30),(100130,'4',30),(100131,'5',30),(100132,'6',30),(100133,'7',30);

/*Table structure for table `position` */

DROP TABLE IF EXISTS `position`;

CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` date NOT NULL COMMENT '添加时间',
  `deptId` varchar(20) NOT NULL COMMENT '部门编号',
  `recruitType` varchar(20) NOT NULL COMMENT '招聘类型',
  `recruitNum` int(10) NOT NULL COMMENT '招聘人数',
  `positionCode` varchar(50) NOT NULL COMMENT '职位id',
  `positionType` varchar(50) NOT NULL COMMENT '职位性质',
  `positionName` varchar(50) NOT NULL COMMENT '职位名称',
  `registPerson` varchar(30) NOT NULL COMMENT '登记人',
  `registDate` date NOT NULL COMMENT '开始时间',
  `stopDate` date NOT NULL COMMENT '结束时间',
  `positionDescribe` varchar(30) DEFAULT NULL COMMENT '职位描述',
  `recruitStandard` varchar(30) DEFAULT NULL COMMENT '招聘要求',
  `state` int(10) DEFAULT '1' COMMENT '1启用 0删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `position` */

insert  into `position`(`id`,`addDate`,`deptId`,`recruitType`,`recruitNum`,`positionCode`,`positionType`,`positionName`,`registPerson`,`registDate`,`stopDate`,`positionDescribe`,`recruitStandard`,`state`) values (1,'2017-07-24','200303','社会招聘',1,'20170014','实施','行政专员','admin','2017-07-24','2017-07-31','负责职工的日常生活','责任心强',1),(2,'2017-07-24','200307','社会招聘',2,'20170010','技术','运维工程师','admin','2017-07-24','2017-11-30','对客户的问题及时进行解决','对计算机数量使用',1),(3,'2017-08-24','200306','社会招聘',1,'20170019','技术','数据工程师','admin','2017-08-24','2017-09-02','gdtfhg','gdfdg',1),(4,'2017-08-24','200310','社会招聘',5,'20170008','技术','制作工程师','admin','2017-08-24','2017-09-08','dasdsdasdsad','dsdadsdas',1),(5,'2017-08-31','200308','社会招聘',2,'20170012','技术','人事专员','admin','2017-08-24','2017-09-09','gsdvaf','fsdfs',1),(6,'2017-11-28','200302','社会招聘',1,'20170013','管理','行政主管','admin','2017-08-31','2017-09-08','kjhgff','kjh',1),(7,'2017-11-17','200306','社会招聘',1,'20170018','管理','技术部主管','zongjl','2017-11-17','2017-11-30','vhbjnh ','hgh',1);

/*Table structure for table `psnfile` */

DROP TABLE IF EXISTS `psnfile`;

CREATE TABLE `psnfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` date NOT NULL COMMENT '创建时间',
  `fileNum` varchar(20) NOT NULL COMMENT '档案编号',
  `deptId` int(10) NOT NULL COMMENT '部门编号',
  `roleId` int(10) NOT NULL COMMENT '职位编号',
  `empName` varchar(10) NOT NULL COMMENT '员工姓名',
  `sex` int(5) NOT NULL COMMENT '性别',
  `email` varchar(30) NOT NULL COMMENT '邮箱',
  `pphone` varchar(12) NOT NULL COMMENT '电话',
  `address` varchar(30) NOT NULL COMMENT '地址',
  `idCard` varchar(20) NOT NULL COMMENT '身份证号',
  `hukouAdrs` varchar(50) DEFAULT NULL COMMENT '户口所在地',
  `polity` varchar(10) NOT NULL COMMENT '政治面貌',
  `univercity` varchar(20) NOT NULL COMMENT '毕业学校',
  `major` varchar(15) NOT NULL COMMENT '专业',
  `education` varchar(10) NOT NULL COMMENT '学历',
  `bankName` varchar(20) DEFAULT NULL COMMENT '银行名称',
  `bkCardNum` varchar(30) DEFAULT NULL COMMENT '银行卡号',
  `resume` varchar(50) DEFAULT NULL COMMENT '个人履历',
  `famRelation` varchar(20) DEFAULT NULL COMMENT '家庭信息',
  `remark` varchar(30) DEFAULT NULL COMMENT '备注',
  `sequNum` varchar(30) DEFAULT NULL COMMENT '社保卡号',
  `checkMan` varchar(10) NOT NULL COMMENT '登记人',
  `checkState` int(5) NOT NULL COMMENT '档案状态 1起草 2审核中 3审核通过 4驳回 5 变更  6变更审核中',
  `url` varchar(200) DEFAULT NULL COMMENT '附件的绝对路径',
  `fileLocation` varchar(50) DEFAULT NULL COMMENT '文件地址',
  `state` int(5) NOT NULL COMMENT '状态 1实习 2 正式员工  3离职  4实习员工',
  `flag` int(5) NOT NULL DEFAULT '1' COMMENT '1启用  0删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `psnfile` */

insert  into `psnfile`(`id`,`createDate`,`fileNum`,`deptId`,`roleId`,`empName`,`sex`,`email`,`pphone`,`address`,`idCard`,`hukouAdrs`,`polity`,`univercity`,`major`,`education`,`bankName`,`bkCardNum`,`resume`,`famRelation`,`remark`,`sequNum`,`checkMan`,`checkState`,`url`,`fileLocation`,`state`,`flag`) values (1,'2017-11-23','20170001',200306,20170018,'2003002',0,'1551@qq.com','15324395241','fsdfsdf','210104198001195011','fsdfdsf','群众','fsdf','fdsf','专科','','','防守对方','','','防守对方','2003001',1,NULL,NULL,1,1),(2,'2017-08-28','20170002',200306,20170021,'2003003',1,'61474945@qq.com','13835241520','山西','320104198803171412','山西','群众','北京大学','计算机科学与技术','本科','','','大撒旦','','发给','大撒旦','2003004',3,'','',2,1),(3,'2017-11-28','20170003',200306,20170021,'2003004',0,'15324399524@163com','18810420654','衡水','320104198806183590','衡水','群众','衡水学院','计算机科学与技术','本科','','','大多数的','','','大多数的','2003001',6,'','',2,1),(4,'2017-11-17','20170004',200306,20170019,'2003005',0,'14455@163.com','15324585241','河南111','532300197608262732','河南','群众','北京大学','数据库','本科','','','辅导费','','','辅导费','2003001',4,NULL,NULL,2,1),(5,'2017-11-28','20170005',200306,20170021,'2003006',1,'15324399524@163com','18810420654','怀柔','320104198806183590','河北衡水','团员','衡水','计算机','专科','','','打啊打','','','打啊打','2003001',4,'20170005/专技天下1.doc','专技天下1.doc',1,1);

/*Table structure for table `resumemanage` */

DROP TABLE IF EXISTS `resumemanage`;

CREATE TABLE `resumemanage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` date NOT NULL COMMENT '创建时间',
  `positionCode` varchar(20) NOT NULL COMMENT '职位编号',
  `positionName` varchar(20) NOT NULL COMMENT '职位名称',
  `positionType` varchar(20) NOT NULL COMMENT '属于什么岗位  管理 技术 实施',
  `username` varchar(20) NOT NULL COMMENT '姓名',
  `sex` varchar(5) NOT NULL COMMENT '性别',
  `recruitType` varchar(10) NOT NULL COMMENT '社会招聘  校园招聘',
  `mail` varchar(20) NOT NULL COMMENT '邮箱',
  `phone` varchar(11) NOT NULL COMMENT '电话',
  `homeLocation` varchar(30) DEFAULT NULL COMMENT '户口所在地',
  `address` varchar(20) DEFAULT NULL COMMENT '住址',
  `politicalFace` varchar(10) NOT NULL COMMENT '政治面貌',
  `idCard` varchar(20) NOT NULL COMMENT '身份证号',
  `graduateCollege` varchar(20) NOT NULL COMMENT '毕业学院',
  `major` varchar(20) NOT NULL COMMENT '专业',
  `educationBackground` varchar(20) NOT NULL COMMENT '学历',
  `workExperience` varchar(20) NOT NULL COMMENT '工作经验',
  `hopeWages` int(20) NOT NULL COMMENT '工资',
  `leadership` int(11) DEFAULT NULL COMMENT '上级领导',
  `onTheJob` varchar(20) NOT NULL COMMENT '现在状态',
  `graduateNow` varchar(20) NOT NULL COMMENT '是否应届毕业生',
  `registDate` date NOT NULL COMMENT '添加日期',
  `personalResume` varchar(500) NOT NULL COMMENT '个人简历',
  `recommend` varchar(10) DEFAULT NULL COMMENT '是否有推荐人',
  `recommendPerson` varchar(10) DEFAULT NULL COMMENT '推荐人',
  `recommendIdea` varchar(500) DEFAULT NULL COMMENT '推荐面试意见',
  `recommendDate` date NOT NULL COMMENT '推荐时间',
  `recommendPersonFirst` varchar(10) DEFAULT NULL COMMENT '一面面试人',
  `recommendDateFirst` date DEFAULT NULL COMMENT '一面时间',
  `recommendDescribeFirst` varchar(10) DEFAULT NULL COMMENT '一面意见',
  `recommendPersonSecond` varchar(10) DEFAULT NULL COMMENT '二面面试人',
  `recommendDateSecond` date DEFAULT NULL COMMENT '二面时间',
  `recommendDescribeSecond` varchar(10) DEFAULT NULL COMMENT '二面意见',
  `recommendPersonThird` varchar(10) DEFAULT NULL COMMENT '三面面试人',
  `recommendDateThird` date DEFAULT NULL COMMENT '三面时间',
  `recommendDescribeThird` varchar(10) DEFAULT NULL COMMENT '三面意见',
  `resumeStatus` int(10) DEFAULT NULL COMMENT '0存档  1推荐面试  2推荐二面  3推荐三面  4建议录用  5录用 6 驳回',
  `decide` varchar(10) DEFAULT NULL COMMENT '录用建议',
  `urlFile` varchar(30) DEFAULT NULL COMMENT '简历名称',
  `url` varchar(150) DEFAULT NULL COMMENT '简历全路径',
  `state` int(10) DEFAULT '1' COMMENT '1启用  0删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `resumemanage` */

insert  into `resumemanage`(`id`,`addDate`,`positionCode`,`positionName`,`positionType`,`username`,`sex`,`recruitType`,`mail`,`phone`,`homeLocation`,`address`,`politicalFace`,`idCard`,`graduateCollege`,`major`,`educationBackground`,`workExperience`,`hopeWages`,`leadership`,`onTheJob`,`graduateNow`,`registDate`,`personalResume`,`recommend`,`recommendPerson`,`recommendIdea`,`recommendDate`,`recommendPersonFirst`,`recommendDateFirst`,`recommendDescribeFirst`,`recommendPersonSecond`,`recommendDateSecond`,`recommendDescribeSecond`,`recommendPersonThird`,`recommendDateThird`,`recommendDescribeThird`,`resumeStatus`,`decide`,`urlFile`,`url`,`state`) values (1,'2017-07-24','20170020','实施工程师','实施','迪丽热巴','男','社会招聘','61474955@qq.com','18810120152','','','群众','330803197008123058','北京喜剧学院','表演中文系','本科','2年',10000,20170018,'离职','是','2017-07-24','优秀xcx','是','闫培','推荐面试','2017-07-24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','',1),(2,'2017-07-25','20170010','运维工程师','技术','张兵','男','社会招聘','6115@qq.com','15324399524','','','群众','131102199606012014','北京喜剧学院','计算机科学与技术','本科','1年',7000,20170009,'离职','是','2017-07-25','很好','否','','','2017-07-21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1),(3,'2017-07-26','20170010','运维工程师','技术','张超','男','社会招聘','6147495552@qq.vom','15324399524','','','群众','131102199606012014','衡水','计算机科学与技术','本科','1年',5000,20170009,'离职','是','2017-07-26','阿德萨vxcvxcv','否','','','2017-07-21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'',1),(4,'2017-07-27','20170010','运维工程师','技术','石建铭','男','社会招聘','6147495552@qq.vom','15324399524','','','团员','131102199606012014','北京喜剧学院','计算机科学与技术','本科','1年',65000,20170009,'离职','是','2017-07-27','的广泛广泛','否','','','2017-07-24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,1),(5,'2017-07-28','20170009','运维主管','管理','李华','男','社会招聘','6147495552@qq.vom','15324399524','','','群众','131102199606012014','衡水学院','计算机科学与技术','本科','1年',65000,20170003,'离职','是','2017-07-28','蝴蝶飞过的','否','','','2017-07-24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'','',1),(6,'2017-07-29','20170020','实施工程师','实施','邱莹莹','男','社会招聘','6147495552@qq.vom','15324399524','','','群众','61062919730619169X','衡水学院','计算机科学与技术','本科','2年',4000,20170018,'离职','是','2017-07-29','大撒旦','否','','','2017-07-24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','',1),(7,'2017-07-24','20170021','Java工程师','技术','刘德华','男','社会招聘','6147495552@qq.vom','15324399524','','','群众','131102199606012014','衡水学院','计算机科学与技术','本科','1年',7000,20170018,'离职','是','2017-07-24','德萨菲德萨法','否','','','2017-07-24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1),(8,'2017-07-25','20170020','实施工程师','实施','张子栋','男','社会招聘','145454@qq.com','15324399524','','','群众','131102199606012014','衡水学院','计算机科学与技术','本科','1年',6000,20170018,'离职','否','2017-07-25','倒数第三赛段gfgfg','否','','','2017-07-25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'','',1),(9,'2017-08-25','20170010','运维工程师','技术','郑凯','男','社会招聘','6147495552@qq.com','15324399524','','','团员','131102199606012014','衡水学院','计算机科学与技术','本科','1年',5000,20170009,'离职','是','2017-08-25','对方防守对方','否','','','2017-08-25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'','',1),(10,'2017-08-25','20170010','运维工程师','实施','刘涛','男','社会招聘','14515@qq.com','15324399524','','','群众','131102199606012014','北京喜剧学院','表演中文系','本科','1年',5000,20170009,'离职','是','2017-08-25','反对三翻四复','否','','','2017-08-25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1),(11,'2017-11-17','20170005','财务出纳','实施','张鑫','女','社会招聘','441545@qq.com','18810420654','','','群众','131102199606012015','1使得电风扇地方','dsd','本科','2年',500,20170004,'离职','是','2017-11-17','dasdfsdf ','否','','','2017-11-17','李东旭','2017-11-29','面试不通过','董事长','2017-11-29','建议录用',NULL,NULL,NULL,4,'录用',NULL,NULL,1),(12,'2017-11-28','20170013','行政主管','管理','蔡文姬','女','社会招聘','1515@qq.com','18810420654','','','群众','131102199606012014','财经大学','工商管理','本科','1年',10000,20170003,'离职','是','2017-11-28','大撒旦撒旦','否','','','2017-11-28','董事长','2017-11-29','一面通过','董事长','2017-11-29','二面通过',NULL,'2017-11-29','三面通过',5,NULL,NULL,NULL,1);

/*Table structure for table `role_menu` */

DROP TABLE IF EXISTS `role_menu`;

CREATE TABLE `role_menu` (
  `roleid` int(11) NOT NULL COMMENT '角色id',
  `menuid` int(11) DEFAULT NULL COMMENT '菜单id',
  `operationid` int(11) DEFAULT NULL COMMENT '菜单功能id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_menu` */

insert  into `role_menu`(`roleid`,`menuid`,`operationid`) values (20170003,1,0),(20170003,8,0),(20170003,8,100001),(20170003,8,100002),(20170003,8,100003),(20170003,8,100004),(20170003,8,100005),(20170003,8,100006),(20170003,8,100007),(20170003,2,0),(20170003,9,0),(20170003,9,100008),(20170003,9,100009),(20170003,9,100010),(20170003,9,100011),(20170003,9,100012),(20170003,9,100013),(20170003,9,100014),(20170003,3,0),(20170003,10,0),(20170003,10,100015),(20170003,10,100016),(20170003,10,100017),(20170003,10,100018),(20170003,10,100019),(20170003,10,100020),(20170003,10,100021),(20170003,11,0),(20170003,11,100022),(20170003,11,100023),(20170003,11,100024),(20170003,11,100025),(20170003,11,100026),(20170003,11,100027),(20170003,11,100028),(20170003,4,0),(20170003,12,0),(20170003,12,100029),(20170003,12,100030),(20170003,12,100031),(20170003,12,100032),(20170003,12,100033),(20170003,12,100034),(20170003,12,100035),(20170003,13,0),(20170003,13,100036),(20170003,13,100037),(20170003,13,100038),(20170003,13,100039),(20170003,13,100040),(20170003,13,100041),(20170003,13,100042),(20170003,14,0),(20170003,14,100043),(20170003,14,100044),(20170003,14,100045),(20170003,14,100046),(20170003,14,100047),(20170003,14,100048),(20170003,14,100049),(20170003,5,0),(20170003,16,0),(20170003,16,100057),(20170003,16,100058),(20170003,16,100059),(20170003,16,100060),(20170003,16,100061),(20170003,16,100062),(20170003,16,100063),(20170003,17,0),(20170003,17,100064),(20170003,17,100065),(20170003,17,100066),(20170003,17,100067),(20170003,17,100068),(20170003,17,100069),(20170003,17,100070),(20170003,18,0),(20170003,18,100071),(20170003,18,100072),(20170003,18,100073),(20170003,18,100074),(20170003,18,100075),(20170003,18,100076),(20170003,18,100077),(20170003,19,0),(20170003,19,100078),(20170003,19,100079),(20170003,19,100080),(20170003,19,100081),(20170003,19,100082),(20170003,19,100083),(20170003,19,100084),(20170003,6,0),(20170003,20,0),(20170003,20,100085),(20170003,20,100086),(20170003,20,100087),(20170003,20,100088),(20170003,20,100089),(20170003,20,100090),(20170003,20,100091),(20170003,21,0),(20170003,21,100092),(20170003,21,100093),(20170003,21,100094),(20170003,21,100095),(20170003,21,100096),(20170003,21,100097),(20170003,21,100098),(20170003,22,0),(20170003,22,100099),(20170003,22,100100),(20170003,22,100101),(20170003,22,100102),(20170003,22,100103),(20170003,22,100104),(20170003,22,100105),(20170003,7,0),(20170003,23,0),(20170003,23,100106),(20170003,23,100107),(20170003,23,100108),(20170003,23,100110),(20170003,23,100111),(20170003,23,100112),(20170003,24,0),(20170003,24,100113),(20170003,24,100114),(20170003,24,100115),(20170003,24,100116),(20170003,24,100117),(20170003,24,100118),(20170003,24,100119),(20170003,25,0),(20170003,25,100120),(20170003,25,100121),(20170003,25,100122),(20170003,25,100123),(20170003,25,100124),(20170003,25,100125),(20170003,25,100126),(20170002,1,0),(20170002,8,0),(20170002,8,100001),(20170002,8,100002),(20170002,8,100003),(20170002,8,100004),(20170002,8,100005),(20170002,8,100006),(20170002,8,100007),(20170002,2,0),(20170002,9,0),(20170002,9,100008),(20170002,9,100009),(20170002,9,100010),(20170002,9,100011),(20170002,9,100012),(20170002,9,100013),(20170002,9,100014),(20170002,3,0),(20170002,10,0),(20170002,10,100015),(20170002,10,100016),(20170002,10,100017),(20170002,10,100018),(20170002,10,100019),(20170002,10,100020),(20170002,10,100021),(20170002,11,0),(20170002,11,100022),(20170002,11,100023),(20170002,11,100024),(20170002,11,100025),(20170002,11,100026),(20170002,11,100027),(20170002,11,100028),(20170002,4,0),(20170002,12,0),(20170002,12,100029),(20170002,12,100030),(20170002,12,100031),(20170002,12,100032),(20170002,12,100033),(20170002,12,100034),(20170002,12,100035),(20170002,13,0),(20170002,13,100036),(20170002,13,100037),(20170002,13,100038),(20170002,13,100039),(20170002,13,100040),(20170002,13,100041),(20170002,13,100042),(20170002,14,0),(20170002,14,100043),(20170002,14,100044),(20170002,14,100045),(20170002,14,100046),(20170002,14,100047),(20170002,14,100048),(20170002,14,100049),(20170002,5,0),(20170002,16,0),(20170002,16,100057),(20170002,16,100058),(20170002,16,100059),(20170002,16,100060),(20170002,16,100061),(20170002,16,100062),(20170002,16,100063),(20170002,17,0),(20170002,17,100064),(20170002,17,100065),(20170002,17,100066),(20170002,17,100067),(20170002,17,100068),(20170002,17,100069),(20170002,17,100070),(20170002,18,0),(20170002,18,100071),(20170002,18,100072),(20170002,18,100073),(20170002,18,100074),(20170002,18,100075),(20170002,18,100076),(20170002,18,100077),(20170002,19,0),(20170002,19,100078),(20170002,19,100079),(20170002,19,100080),(20170002,19,100081),(20170002,19,100082),(20170002,19,100083),(20170002,19,100084),(20170002,6,0),(20170002,20,0),(20170002,20,100085),(20170002,20,100086),(20170002,20,100087),(20170002,20,100088),(20170002,20,100089),(20170002,20,100090),(20170002,20,100091),(20170002,21,0),(20170002,21,100092),(20170002,21,100093),(20170002,21,100094),(20170002,21,100095),(20170002,21,100096),(20170002,21,100097),(20170002,21,100098),(20170002,22,0),(20170002,22,100099),(20170002,22,100100),(20170002,22,100101),(20170002,22,100102),(20170002,22,100103),(20170002,22,100104),(20170002,22,100105),(20170002,7,0),(20170002,23,0),(20170002,23,100106),(20170002,23,100107),(20170002,23,100108),(20170002,23,100110),(20170002,23,100111),(20170002,23,100112),(20170002,24,0),(20170002,24,100113),(20170002,24,100114),(20170002,24,100115),(20170002,24,100116),(20170002,24,100117),(20170002,24,100118),(20170002,24,100119),(20170002,25,0),(20170002,25,100120),(20170002,25,100121),(20170002,25,100122),(20170002,25,100123),(20170002,25,100124),(20170002,25,100125),(20170002,25,100126),(20170005,1,0),(20170005,8,0),(20170005,8,100001),(20170006,2,0),(20170006,9,0),(20170006,9,100008),(20170006,9,100009),(20170006,9,100010),(20170006,9,100011),(20170006,4,0),(20170006,12,0),(20170006,12,100029),(20170006,12,100030),(20170006,12,100031),(20170006,12,100032),(20170006,12,100033),(20170006,12,100034),(20170006,12,100035),(20170006,13,0),(20170006,13,100036),(20170006,13,100037),(20170006,13,100038),(20170006,13,100039),(20170006,13,100040),(20170006,13,100041),(20170006,13,100042),(20170006,14,0),(20170006,14,100043),(20170006,14,100044),(20170006,14,100045),(20170006,14,100046),(20170006,14,100047),(20170006,14,100048),(20170006,14,100049),(20170009,4,0),(20170009,14,0),(20170009,12,0),(20170009,12,100029),(20170009,12,100030),(20170009,12,100031),(20170009,12,100032),(20170009,12,100033),(20170009,12,100034),(20170009,12,100035),(20170009,13,0),(20170009,13,100036),(20170009,13,100037),(20170009,13,100038),(20170009,13,100039),(20170009,13,100040),(20170009,13,100041),(20170009,13,100042),(20170009,14,100043),(20170009,14,100044),(20170009,14,100045),(20170009,14,100046),(20170009,14,100047),(20170009,14,100048),(20170001,1,0),(20170001,8,0),(20170001,8,100001),(20170001,8,100002),(20170001,8,100003),(20170001,8,100004),(20170001,8,100005),(20170001,8,100006),(20170001,8,100007),(20170001,26,0),(20170001,26,100120),(20170001,26,100121),(20170001,26,100122),(20170001,26,100123),(20170001,26,100124),(20170001,26,100125),(20170001,26,100126),(20170001,2,0),(20170001,9,0),(20170001,9,100008),(20170001,9,100009),(20170001,9,100010),(20170001,9,100011),(20170001,9,100012),(20170001,9,100013),(20170001,9,100014),(20170001,3,0),(20170001,10,0),(20170001,10,100015),(20170001,10,100016),(20170001,10,100017),(20170001,10,100018),(20170001,10,100019),(20170001,10,100020),(20170001,10,100021),(20170001,11,0),(20170001,11,100022),(20170001,11,100023),(20170001,11,100024),(20170001,11,100025),(20170001,11,100026),(20170001,11,100027),(20170001,11,100028),(20170001,4,0),(20170001,12,0),(20170001,12,100029),(20170001,12,100030),(20170001,12,100031),(20170001,12,100032),(20170001,12,100033),(20170001,12,100034),(20170001,12,100035),(20170001,13,0),(20170001,13,100036),(20170001,13,100037),(20170001,13,100038),(20170001,13,100039),(20170001,13,100040),(20170001,13,100041),(20170001,13,100042),(20170001,14,0),(20170001,14,100043),(20170001,14,100044),(20170001,14,100045),(20170001,14,100046),(20170001,14,100047),(20170001,14,100048),(20170001,14,100049),(20170001,5,0),(20170001,15,0),(20170001,15,100050),(20170001,15,100051),(20170001,15,100052),(20170001,15,100053),(20170001,15,100054),(20170001,15,100055),(20170001,15,100056),(20170001,16,0),(20170001,16,100057),(20170001,16,100058),(20170001,16,100059),(20170001,16,100060),(20170001,16,100061),(20170001,16,100062),(20170001,16,100063),(20170001,17,0),(20170001,17,100064),(20170001,17,100065),(20170001,17,100066),(20170001,17,100067),(20170001,17,100068),(20170001,17,100069),(20170001,17,100070),(20170001,18,0),(20170001,18,100071),(20170001,18,100072),(20170001,18,100073),(20170001,18,100074),(20170001,18,100075),(20170001,18,100076),(20170001,18,100077),(20170001,6,0),(20170001,19,0),(20170001,19,100078),(20170001,19,100079),(20170001,19,100080),(20170001,19,100081),(20170001,19,100082),(20170001,19,100083),(20170001,19,100084),(20170001,20,0),(20170001,20,100085),(20170001,20,100086),(20170001,20,100087),(20170001,20,100088),(20170001,20,100089),(20170001,20,100090),(20170001,20,100091),(20170001,21,0),(20170001,21,100092),(20170001,21,100093),(20170001,21,100094),(20170001,21,100095),(20170001,21,100096),(20170001,21,100097),(20170001,21,100098),(20170001,7,0),(20170001,22,0),(20170001,22,100099),(20170001,22,100100),(20170001,22,100101),(20170001,22,100102),(20170001,22,100103),(20170001,22,100104),(20170001,22,100105),(20170001,23,0),(20170001,23,100106),(20170001,23,100107),(20170001,23,100108),(20170001,23,100109),(20170001,23,100110),(20170001,23,100111),(20170001,23,100112),(20170001,24,0),(20170001,24,100113),(20170001,24,100114),(20170001,24,100115),(20170001,24,100116),(20170001,24,100117),(20170001,24,100118),(20170001,24,100119),(20170004,4,0),(20170004,5,0),(20170004,13,0),(20170004,13,100036),(20170004,13,100037),(20170004,13,100038),(20170004,13,100039),(20170004,13,100040),(20170004,13,100041),(20170004,13,100042),(20170004,17,0),(20170004,17,100064),(20170004,17,100065),(20170004,17,100066),(20170004,17,100067),(20170004,17,100068),(20170004,17,100069),(20170004,17,100070),(20170001,28,0),(20170002,28,0),(20170003,28,0),(20170001,27,0),(20170002,27,0),(20170003,27,0),(20170018,1,0),(20170018,26,0),(20170018,4,0),(20170018,26,100126),(20170018,13,0),(20170018,13,100036),(20170018,13,100037),(20170018,13,100038),(20170018,13,100039),(20170018,13,100040),(20170018,13,100041),(20170018,13,100042),(20170001,30,0),(20170001,25,0),(20170001,30,0),(20170001,30,100127),(20170001,30,100128),(20170001,30,100130),(20170001,30,100131),(20170001,30,100129),(20170001,30,100132),(20170001,30,100133);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` date NOT NULL COMMENT '创建时间',
  `number` int(20) NOT NULL COMMENT '职位编码',
  `name` varchar(20) NOT NULL COMMENT '职位名称',
  `type` int(10) NOT NULL COMMENT '职位分类',
  `deptId` int(10) NOT NULL COMMENT '所属部门',
  `leadership` int(10) NOT NULL,
  `description` varchar(50) DEFAULT NULL COMMENT '描述',
  `remark` varchar(30) DEFAULT NULL COMMENT '备注',
  `typename` varchar(255) DEFAULT NULL,
  `state` int(5) NOT NULL DEFAULT '1' COMMENT '受否启用 1启用 0未启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `roles` */

insert  into `roles`(`id`,`createDate`,`number`,`name`,`type`,`deptId`,`leadership`,`description`,`remark`,`typename`,`state`) values (1,'2017-04-21',20170001,'董事长',1,200302,20170001,'','','超级管理员',1),(2,'2017-04-21',20170002,'总经理',1,200302,20170001,NULL,NULL,'超级管理员',1),(3,'2017-04-21',20170003,'副总经理',1,200302,20170001,NULL,NULL,'超级管理员',1),(4,'2017-04-21',20170004,'财务经理',1,200305,20170003,'','',NULL,1),(5,'2017-04-21',20170005,'财务出纳',3,200305,20170004,'','',NULL,1),(6,'2017-04-21',20170006,'财务专员',3,200305,20170004,'','',NULL,1),(7,'2017-04-21',20170007,'制作经理',1,200310,20170003,NULL,NULL,NULL,1),(8,'2017-04-21',20170008,'制作工程师',2,200310,20170010,NULL,NULL,NULL,1),(9,'2017-04-21',20170009,'运维主管',1,200307,20170003,NULL,NULL,NULL,1),(10,'2017-04-21',20170010,'运维工程师',2,200307,20170009,NULL,NULL,NULL,1),(11,'2017-04-21',20170011,'人事经理',1,200308,20170003,'人事变动','',NULL,1),(12,'2017-04-21',20170012,'人事专员',2,200308,20170011,NULL,NULL,NULL,1),(13,'2017-04-21',20170013,'行政主管',1,200303,20170003,NULL,NULL,NULL,1),(14,'2017-04-21',20170014,'行政专员',3,200303,20170013,NULL,NULL,NULL,1),(15,'2017-04-21',20170015,'后勤部长',1,200309,20170003,'','',NULL,1),(16,'2017-04-21',20170016,'后勤专员',3,200309,20170015,NULL,NULL,NULL,1),(17,'2017-04-21',20170017,'测试部经理',1,200311,20170003,NULL,NULL,NULL,1),(18,'2016-04-21',20170018,'技术部主管',1,200306,20170003,NULL,NULL,NULL,1),(19,'2017-04-21',20170019,'数据工程师',2,200306,20170018,NULL,NULL,NULL,1),(20,'2017-04-21',20170020,'实施工程师',3,200306,20170018,NULL,NULL,NULL,1),(21,'2017-04-21',20170021,'Java工程师',2,200306,20170018,NULL,NULL,NULL,1),(22,'2017-08-31',20170022,'测试经理',2,200311,20170017,'发顺发','',NULL,1);

/*Table structure for table `salary` */

DROP TABLE IF EXISTS `salary`;

CREATE TABLE `salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employeeId` varchar(10) NOT NULL COMMENT '制定人',
  `registrantId` varchar(10) NOT NULL COMMENT '登记人',
  `addtime` date NOT NULL COMMENT '登记时间',
  `basepay` int(10) NOT NULL COMMENT '基本工资',
  `bonus` int(10) NOT NULL COMMENT '绩效奖金',
  `travel` int(10) NOT NULL COMMENT '交通补助',
  `phone` int(10) NOT NULL COMMENT '电话补助',
  `meal` int(10) NOT NULL COMMENT '餐补',
  `house` int(10) NOT NULL COMMENT '住房补助',
  `bussiness` int(10) NOT NULL COMMENT '出差补助',
  `addwork` int(10) NOT NULL COMMENT '加班补助',
  `payroll` int(10) NOT NULL COMMENT '薪酬总额',
  `checkstate` int(10) NOT NULL COMMENT '审核状态  1起草 2审核中 3审核通过 4驳回 5变更  6 变更通过',
  `roleId` int(11) NOT NULL COMMENT '职位id',
  `deptId` int(10) NOT NULL COMMENT '部门id',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `state` int(5) DEFAULT '1' COMMENT '1启用  0删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `salary` */

insert  into `salary`(`id`,`employeeId`,`registrantId`,`addtime`,`basepay`,`bonus`,`travel`,`phone`,`meal`,`house`,`bussiness`,`addwork`,`payroll`,`checkstate`,`roleId`,`deptId`,`remark`,`state`) values (1,'2003007','2003001','2017-11-24',1000,0,0,0,0,0,0,0,1000,1,20170021,200306,'',1),(2,'2003005','2003001','2017-11-24',600000,0,0,0,0,0,0,0,45,3,20170018,200306,'',1),(3,'2003002','2003001','2017-11-24',5000,0,0,0,0,0,0,0,5000,3,20170011,200308,'',1),(4,'2003006','2003001','2017-11-28',8000,0,0,0,0,0,0,0,8000,4,20170021,200306,'',1);

/*Table structure for table `tb_heartbeat` */

DROP TABLE IF EXISTS `tb_heartbeat`;

CREATE TABLE `tb_heartbeat` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_heartbeat` */

/*Table structure for table `training` */

DROP TABLE IF EXISTS `training`;

CREATE TABLE `training` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tcreatetime` date NOT NULL COMMENT '创建时间',
  `tname` varchar(20) NOT NULL COMMENT '培训名称',
  `teacher` varchar(10) NOT NULL COMMENT '培训讲师',
  `begintime` date NOT NULL COMMENT '培训开始时间',
  `endtime` date NOT NULL COMMENT '培训结束时间',
  `taim` varchar(20) NOT NULL COMMENT '培训目的',
  `tpersion` varchar(30) NOT NULL COMMENT '参与人员',
  `tabstracts` varchar(30) DEFAULT NULL COMMENT '培训简介',
  `topenions` int(10) NOT NULL COMMENT '培训简介1起草2审核中3审核通过4驳回',
  `tfeedback` int(10) NOT NULL DEFAULT '0' COMMENT '培训反馈 1 优 2 良 3 差',
  `tsummary` varchar(50) DEFAULT NULL COMMENT '培训总结',
  `tout` varchar(30) DEFAULT NULL COMMENT '培训结果',
  `tfiles` varchar(50) DEFAULT NULL COMMENT '培训资料名称',
  `url` varchar(200) DEFAULT NULL COMMENT '保存的全路径',
  `tview` varchar(50) DEFAULT NULL COMMENT '审核意见',
  `state` int(10) NOT NULL DEFAULT '1' COMMENT '状态1 删除 0 未删除',
  PRIMARY KEY (`id`,`tfeedback`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `training` */

insert  into `training`(`id`,`tcreatetime`,`tname`,`teacher`,`begintime`,`endtime`,`taim`,`tpersion`,`tabstracts`,`topenions`,`tfeedback`,`tsummary`,`tout`,`tfiles`,`url`,`tview`,`state`) values (1,'2017-11-28','公司管理层培训计划','董静光','2017-11-29','2017-12-02','培养管理能力','所有中层干部','得瑟得瑟',3,1,'所有员工积极配合','全体通过','','','通过',1),(2,'2017-11-28','新员工培训','人事经理','2017-12-01','2018-01-06','让新员工了解公司','所有新员工','大夫撒旦',4,0,NULL,NULL,'','','驳回',1),(3,'2017-11-28','测试计划','测试讲师','2017-12-01','2018-01-05','大撒旦','打伞 ',' 伤的',2,0,NULL,NULL,NULL,NULL,NULL,1);

/*Table structure for table `version_log` */

DROP TABLE IF EXISTS `version_log`;

CREATE TABLE `version_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '版本日志ID',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `createBy` varchar(64) CHARACTER SET utf8mb4 NOT NULL COMMENT '创建者',
  `title` varchar(255) NOT NULL COMMENT '日志标题',
  `content` text NOT NULL COMMENT '日志内容',
  `versionNumber` decimal(10,1) NOT NULL COMMENT '版本号',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '0删除  1启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='系统日志表';

/*Data for the table `version_log` */

insert  into `version_log`(`id`,`createTime`,`createBy`,`title`,`content`,`versionNumber`,`state`) values (1,'2016-05-02 20:04:08','超级管理员','项目框架初步搭建','<div>1.综合项目框架初步搭建。</div><div>2.搭建用户登录页面。</div>',1.0,1),(2,'2016-05-04 23:46:54','超级管理员','搭建登录模块','<div>1.登陆界面的初步实现。</div><div>2.登录系统之后的主页面及样式（第一版）。</div><div>3.商城数据库初步设计与搭建。</div>',1.0,1),(3,'2016-05-05 14:13:40','超级管理员','数据库与J2EE集成','<div>1.数据库与J2EE连接测试。</div><div>2.数据库查询并输入查询集合。</div><div>3.mybatis一对多查询功能实现。</div>',1.0,1),(4,'2016-05-06 18:46:17','超级管理员','修复数据库连接BUG','1.修复页面与数据库连接若干BUG。',1.0,1),(5,'2016-05-10 16:33:48','超级管理员','数据库事务处理','<div>1.分页功能的初步实现。</div><div>2.完善分类页面。</div><div>3.添加事务处理器。</div>',1.0,1),(6,'2016-05-11 16:38:20','超级管理员','调整项目结构','<div>1.项目结构调整。</div><div>2.404错误页面搭建。</div><div>3.网站图标测试。</div>',1.0,1),(7,'2016-05-13 21:42:13','超级管理员','在线客服','<div>1.右侧在线客服代码。</div><div>2.鼠标悬浮向上、向下图标，页面跟随移动。</div>',1.0,1),(8,'2016-05-15 19:45:35','超级管理员','系统、用户管理页面实现','<div>1.完成系统中菜单管理。</div><div>2.完成用户管理。</div>',1.0,1),(9,'2016-05-20 16:46:48','超级管理员','各功能的完成','<div>1.完成部门管理和角色管理。</div><div>2.完成人事管理。</div><div>3.完成薪资管理。</div><div>4.完成培训管理。</div>',1.0,1),(10,'2016-08-13 14:47:32','超级管理员','角色的权限分配及表单验证','<div>1.完善角色管理中分配权限（只限于分配菜单权限，没有功能权限）。</div><div>2.使用validate进行表单验证。</div>',1.0,1),(11,'2016-08-15 19:48:28','超级管理员','使用DataTables搭建','<div>1.使用DataTables的初步使用及页面调整。</div><div>2.将页面放入安全路径下。</div>',1.0,1),(12,'2016-08-20 23:49:53','超级管理员','完善个人信息功能，修复BUG','<div>1.完善修改密码、个人信息等功能。</div><div>2.实现个人头像的上传.</div>',1.0,1),(13,'2017-08-25 09:14:04','超级管理员','面试管理优化','<div>1.推荐面试之后，如果该人是员工则把该人的面试信息推到所属的部门主管上（其他部门主管看不到）。</div><div>2.面试是主管（经理）推送到副总及老总。</div><div>3.所有面试副总和老总都可以看到。</div>',1.0,1),(14,'2017-09-02 09:19:17','超级管理员','权限分配的完善','<div>1.在添加菜单时给菜单添加功能，并且给超级管理员添加所有权限。</div><div>2.分配菜单时已树形显示。</div>',1.0,1),(15,'2017-09-10 09:09:35','超级管理员','系统删除优化','<div>1.删除部门时下面存在角色删除失败！</div><div>2.删除角色下面存在用户删除失败！</div>',1.1,1),(16,'2016-09-25 16:51:03','超级管理员','实现上传文件及删除','<div>1.完成系统中需要上传文件的功能。</div><div>2.在修改时可以进行选择重新上传或不上传及删除附件功能。</div>',1.1,1),(17,'2017-11-08 09:04:10','超级管理员','邮箱找回密码','<div>1.加入邮箱发送邮件功能。</div><div>2.使用邮箱功能找回密码。</div>',1.1,1),(18,'2017-11-15 11:17:47','超级管理员','优化系统','<div>1.优化datatables显示的臃肿问题。</div><div>2.实现菜单的功能控制。</div><div>3.优化页面的显示，以百分比显示。</div>',1.1,1),(19,'2017-12-12 11:19:17','超级管理员','实现版本日志','<div>1.版本日志的页面显示.</div><div>2.页面背景颜色和样式的切换。</div><div>3.版本日志的模糊查询。</div>',1.1,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
