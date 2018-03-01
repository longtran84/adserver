/*
SQLyog Community v12.4.3 (64 bit)
MySQL - 5.5.57 : Database - mobileads
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mobileads` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mobileads`;

/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values 
('10002',1,'E:\\works\\Fintechviet\\AdServer\\adserver\\target\\classes\\processes\\Order.bpmn20.xml','10001','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"OrderProcess\" name=\"Order process\" isExecutable=\"true\">\n    <startEvent id=\"task1\" name=\"Start\"></startEvent>\n    <exclusiveGateway id=\"exclusivegateway1\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow5\" sourceRef=\"exclusivegateway1\" targetRef=\"CancelOrder\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${cancelOrder == true}]]></conditionExpression>\n    </sequenceFlow>\n    <subProcess id=\"subprocess1\" name=\"Sub Process\">\n      <startEvent id=\"startevent2\" name=\"Start\"></startEvent>\n      <exclusiveGateway id=\"exclusivegateway2\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow8\" sourceRef=\"startevent2\" targetRef=\"exclusivegateway2\"></sequenceFlow>\n      <endEvent id=\"endevent2\"></endEvent>\n      <userTask id=\"ShipVoucher\" name=\"Ship voucher\"></userTask>\n      <exclusiveGateway id=\"exclusivegateway3\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow17\" sourceRef=\"SendEVoucher\" targetRef=\"exclusivegateway3\"></sequenceFlow>\n      <sequenceFlow id=\"flow18\" sourceRef=\"exclusivegateway3\" targetRef=\"SendFail\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${sendFail == true}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"flow19\" sourceRef=\"exclusivegateway3\" targetRef=\"SendSuccessful\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${sendFail == false}]]></conditionExpression>\n      </sequenceFlow>\n      <endEvent id=\"endevent3\"></endEvent>\n      <sequenceFlow id=\"flow20\" sourceRef=\"SendFail\" targetRef=\"endevent3\"></sequenceFlow>\n      <sequenceFlow id=\"flow21\" sourceRef=\"exclusivegateway2\" targetRef=\"SendEVoucher\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${eVoucher == true}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"flow22\" sourceRef=\"exclusivegateway2\" targetRef=\"ShipVoucher\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${eVoucher == false}]]></conditionExpression>\n      </sequenceFlow>\n      <exclusiveGateway id=\"exclusivegateway4\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow23\" sourceRef=\"ShipVoucher\" targetRef=\"exclusivegateway4\"></sequenceFlow>\n      <sequenceFlow id=\"flow24\" sourceRef=\"exclusivegateway4\" targetRef=\"ShipSuccessful\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${shipFail == false}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"flow25\" sourceRef=\"exclusivegateway4\" targetRef=\"ShipFail\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${shipFail == true}]]></conditionExpression>\n      </sequenceFlow>\n      <parallelGateway id=\"parallelgateway1\" name=\"Parallel Gateway\"></parallelGateway>\n      <sequenceFlow id=\"flow26\" sourceRef=\"SendSuccessful\" targetRef=\"parallelgateway1\"></sequenceFlow>\n      <sequenceFlow id=\"flow27\" sourceRef=\"ShipSuccessful\" targetRef=\"parallelgateway1\"></sequenceFlow>\n      <endEvent id=\"endevent4\"></endEvent>\n      <sequenceFlow id=\"flow29\" sourceRef=\"ShipFail\" targetRef=\"endevent4\"></sequenceFlow>\n      <serviceTask id=\"SendEVoucher\" name=\"Send e-voucher, phone card\" activiti:delegateExpression=\"${sendVoucherDelegate}\"></serviceTask>\n      <serviceTask id=\"SendFail\" name=\"Send fail\" activiti:delegateExpression=\"${sendFailDelegate}\"></serviceTask>\n      <serviceTask id=\"SendSuccessful\" name=\"Send successful\" activiti:delegateExpression=\"${sendSuccessfulDelegate}\"></serviceTask>\n      <serviceTask id=\"ShipSuccessful\" name=\"Ship successful\" activiti:delegateExpression=\"${shipSuccessfulDelegate}\"></serviceTask>\n      <serviceTask id=\"ShipFail\" name=\"Ship fail\" activiti:delegateExpression=\"${shipFailDelegate}\"></serviceTask>\n      <sequenceFlow id=\"flow36\" sourceRef=\"parallelgateway1\" targetRef=\"endevent2\"></sequenceFlow>\n    </subProcess>\n    <sequenceFlow id=\"flow6\" sourceRef=\"exclusivegateway1\" targetRef=\"subprocess1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${cancelOrder == false}]]></conditionExpression>\n    </sequenceFlow>\n    <endEvent id=\"endevent1\"></endEvent>\n    <endEvent id=\"endevent5\"></endEvent>\n    <userTask id=\"Processing\" name=\"Processing\"></userTask>\n    <sequenceFlow id=\"flow32\" sourceRef=\"Processing\" targetRef=\"exclusivegateway1\"></sequenceFlow>\n    <sequenceFlow id=\"flow33\" sourceRef=\"task1\" targetRef=\"Processing\"></sequenceFlow>\n    <serviceTask id=\"CancelOrder\" name=\"Cancel order\" activiti:delegateExpression=\"${cancelOrderDelegate}\"></serviceTask>\n    <userTask id=\"CloseOrder1\" name=\"Close order\"></userTask>\n    <sequenceFlow id=\"flow34\" sourceRef=\"CancelOrder\" targetRef=\"CloseOrder1\"></sequenceFlow>\n    <sequenceFlow id=\"flow35\" sourceRef=\"CloseOrder1\" targetRef=\"endevent1\"></sequenceFlow>\n    <userTask id=\"CloseOrder2\" name=\"Close order\"></userTask>\n    <sequenceFlow id=\"flow37\" sourceRef=\"subprocess1\" targetRef=\"CloseOrder2\"></sequenceFlow>\n    <sequenceFlow id=\"flow38\" sourceRef=\"CloseOrder2\" targetRef=\"endevent5\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_OrderProcess\">\n    <bpmndi:BPMNPlane bpmnElement=\"OrderProcess\" id=\"BPMNPlane_OrderProcess\">\n      <bpmndi:BPMNShape bpmnElement=\"task1\" id=\"BPMNShape_task1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"260.0\" y=\"140.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"BPMNShape_exclusivegateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"520.0\" y=\"137.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subprocess1\" id=\"BPMNShape_subprocess1\">\n        <omgdc:Bounds height=\"367.0\" width=\"751.0\" x=\"610.0\" y=\"124.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"startevent2\" id=\"BPMNShape_startevent2\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"620.0\" y=\"303.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway2\" id=\"BPMNShape_exclusivegateway2\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"710.0\" y=\"300.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent2\" id=\"BPMNShape_endevent2\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1300.0\" y=\"290.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"ShipVoucher\" id=\"BPMNShape_ShipVoucher\">\n        <omgdc:Bounds height=\"71.0\" width=\"121.0\" x=\"790.0\" y=\"362.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway3\" id=\"BPMNShape_exclusivegateway3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"974.0\" y=\"196.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent3\" id=\"BPMNShape_endevent3\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1206.0\" y=\"147.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway4\" id=\"BPMNShape_exclusivegateway4\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"980.0\" y=\"377.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"parallelgateway1\" id=\"BPMNShape_parallelgateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"1210.0\" y=\"287.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent4\" id=\"BPMNShape_endevent4\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1206.0\" y=\"412.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SendEVoucher\" id=\"BPMNShape_SendEVoucher\">\n        <omgdc:Bounds height=\"71.0\" width=\"121.0\" x=\"790.0\" y=\"181.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SendFail\" id=\"BPMNShape_SendFail\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"137.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SendSuccessful\" id=\"BPMNShape_SendSuccessful\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"236.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"ShipSuccessful\" id=\"BPMNShape_ShipSuccessful\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"321.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"ShipFail\" id=\"BPMNShape_ShipFail\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"402.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"940.0\" y=\"50.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent5\" id=\"BPMNShape_endevent5\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1550.0\" y=\"290.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"Processing\" id=\"BPMNShape_Processing\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"370.0\" y=\"130.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"CancelOrder\" id=\"BPMNShape_CancelOrder\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"620.0\" y=\"40.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"CloseOrder1\" id=\"BPMNShape_CloseOrder1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"790.0\" y=\"40.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"CloseOrder2\" id=\"BPMNShape_CloseOrder2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1400.0\" y=\"280.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"540.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"540.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"620.0\" y=\"67.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"655.0\" y=\"320.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"710.0\" y=\"320.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow17\" id=\"BPMNEdge_flow17\">\n        <omgdi:waypoint x=\"911.0\" y=\"216.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"974.0\" y=\"216.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow18\" id=\"BPMNEdge_flow18\">\n        <omgdi:waypoint x=\"994.0\" y=\"196.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"993.0\" y=\"167.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"164.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow19\" id=\"BPMNEdge_flow19\">\n        <omgdi:waypoint x=\"994.0\" y=\"236.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"994.0\" y=\"263.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"263.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow20\" id=\"BPMNEdge_flow20\">\n        <omgdi:waypoint x=\"1155.0\" y=\"164.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1206.0\" y=\"164.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow21\" id=\"BPMNEdge_flow21\">\n        <omgdi:waypoint x=\"730.0\" y=\"300.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"730.0\" y=\"215.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"790.0\" y=\"216.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow22\" id=\"BPMNEdge_flow22\">\n        <omgdi:waypoint x=\"730.0\" y=\"340.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"730.0\" y=\"396.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"790.0\" y=\"397.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow23\" id=\"BPMNEdge_flow23\">\n        <omgdi:waypoint x=\"911.0\" y=\"397.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"980.0\" y=\"397.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow24\" id=\"BPMNEdge_flow24\">\n        <omgdi:waypoint x=\"1000.0\" y=\"377.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"999.0\" y=\"347.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"348.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow25\" id=\"BPMNEdge_flow25\">\n        <omgdi:waypoint x=\"1000.0\" y=\"417.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1000.0\" y=\"430.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"429.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow26\" id=\"BPMNEdge_flow26\">\n        <omgdi:waypoint x=\"1155.0\" y=\"263.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1230.0\" y=\"263.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1230.0\" y=\"287.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow27\" id=\"BPMNEdge_flow27\">\n        <omgdi:waypoint x=\"1155.0\" y=\"348.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1192.0\" y=\"349.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1229.0\" y=\"350.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1230.0\" y=\"327.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow29\" id=\"BPMNEdge_flow29\">\n        <omgdi:waypoint x=\"1155.0\" y=\"429.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1206.0\" y=\"429.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow36\" id=\"BPMNEdge_flow36\">\n        <omgdi:waypoint x=\"1250.0\" y=\"307.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1300.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"540.0\" y=\"177.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"540.0\" y=\"231.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"540.0\" y=\"310.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow32\" id=\"BPMNEdge_flow32\">\n        <omgdi:waypoint x=\"475.0\" y=\"157.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"520.0\" y=\"157.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow33\" id=\"BPMNEdge_flow33\">\n        <omgdi:waypoint x=\"295.0\" y=\"157.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"370.0\" y=\"157.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow34\" id=\"BPMNEdge_flow34\">\n        <omgdi:waypoint x=\"725.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"790.0\" y=\"67.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow35\" id=\"BPMNEdge_flow35\">\n        <omgdi:waypoint x=\"895.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"940.0\" y=\"67.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow37\" id=\"BPMNEdge_flow37\">\n        <omgdi:waypoint x=\"1361.0\" y=\"307.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1400.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow38\" id=\"BPMNEdge_flow38\">\n        <omgdi:waypoint x=\"1505.0\" y=\"307.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1550.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('10003',1,'E:\\works\\Fintechviet\\AdServer\\adserver\\target\\classes\\processes\\Order.OrderProcess.png','10001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0;\0\0õ\0\0\0 L€\0\0zIDATxÚìÝÔå/|¢ñx,“r­ŠÇS•äœM½[×ãñhÕzL½®µ•¼ÆJêMRÇá\"£‚\"šE=\Z—Ä˜˜]CˆæM0†#v¹¬ë%ŠÂ,^@E8ˆ\\†¹ˆ #5ÏÛ¿ÿ¡\'=C÷LÏ½{æó©zjºÿÿ¾ÍÌÓÝÿþ}ûyž!C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`I)}ôõ×_ŸW__ÿáÒ¥KÓâÅ‹µ\nhK–,IË—/ß›k£ôRýT?\0\0\0\0hGW¬X‘vïÞþøÇ?jÔöìÙ“ž}öÙK–,ùš~ªŸê§\0\0\0\0\0%Ä7å+ºüÇÅ‹¿ªŸê§ú)\0\0\0\0@	1%bme·Å‹¿¯Ÿê§ú)\0\0\0\0@	1ï¾BmÅ‘“~ªŸê§\0\0\0\0\0%t¦ˆÜøÖ»é[sÖf-N+ð*\"WZ?}÷íÆôús³Ò†%wd-NÇ6ýH?\0\0\0\0°öŠÈ‡ÿ1í;ø^Ëùå¯6µ„q:¿}÷ÛÍéíwÞSðUDî—~šoïìoHë7-½ôØäV-¶Å>}I?\0\0\0\0¨REä:f¯Üš¾3o]zêå]iÙ+iÚüõ-aGœŽí­Ù™¦æ.óã\'_KÞx(\"÷m?-l;6üË1AG¾íÜð¨¾¤Ÿ\0\0\0\0U©\"òÞÍiÊÜu-áFGmÒo_J;öTôUDîÓ~ZØ^}æ%ÃŽØ§/é§\0\0\0\0À\0Õ^ùñµ\re‡sÿm›‚¯\"r¿ôÓ|[¿øö’aGìÓ—ôÓî¨­­ýDMMÍå9?ÌµgrmG®¥‚Ö˜k«r—ùEî²cs§ÿÒ;\0\0\0\0ô‘öŠÈ1uU>Ì˜üÈKéá?¼‘¶4½µ8ÛòûŸxÉšŠÈýÓO…úioºì²Ë>WSS³àòË/?Ô&Üè¨½áG®Õ\r:ô£Þm\0\0\0\0 +\"7¾õn¶\0yá\Zn´½\\l+\\Ã#®×UøUDî‹~Ú¶mXrGÉ°#öéKúig\\~ùå“kÏu2à(Õ^ÑÞq\0\0\0\0 —+\"›¦*Fs´½\\l+vY…_Eä¾è§mÛæ•?-vÄ>}I?-Wmmíô£#3Z‹‘#G¦éÓ§§yóæ¥\r6¤ÆÆÆtèÐ¡Ž9’vïÞ6mÚ”æÏŸŸ]nôèÑÅB\'r·ó)ï<\0\0\0\0ÐÃ„ŠÈÕÚOÛ¶}\rëÒú§n;v\n«Ü¶Ø§/é§>|øÇŽ®ÇÑPÔÕÕ¥Ù³ggaFg477§…¦‰\'¶\n<jjjöç~õî\0\0\0\0=È4VŠÈÕÚO‹µ­Ï?tLØÛô#ý´#GƒŽ…ÁÄ´iÓ²ÝñÁ¤Ç<RpÛïäÚ×¼\0\0\0@iò¦²(Ë*ø*\"÷G?mi‡§Í˜yìV¹m±O_ÒOÛÓvDGLWAEOihhH“\'O.<ÕÔÔ|É»\0\0\0\0ô€öŠÈO®k(:MU±ö¯kv*ø*\"÷K?öÎþ†´iå}%×ìˆ}qýI?-æè\Z-AD}}}ê\r±ÆG¬çQ8Â#wßgz\'\0\0\0€n*UDÞ{ 9}gÞº²ÃŽ›æ¾”v¿Ý¬è«ˆÜ§ý4Fl4n~:½üäwKù—‰Ë\Zå¡ŸºüòËÿ¦p1òÑÑ›b1ó»îº«0ðh¬­­ý„w#\0\0\0\0è†REäæ÷§™OoÎ¦ªZðüöôÌ+­×ðˆÓË^iLO½¼+E~µ|K:¤ˆ¬ˆÜ‡ý´£ÑFyè§å¨©©YS¸FGON]UÊÁƒÓ¸qã\n-¿×»\0\0\0\0tC{ÓEàÑ´ÿÏŽÇäù°#Nç·¿uð=A‡\"rŸ÷ÓrFs´7ÊCßÒO/»ì²Ïå‡ºººn/FÞ/¼ðBÛËÿÒ;\0\0\0\0tQY?mo½ÛvÄi^Eäþì§]\r:òMßÒO/¿üòGóÃìÙ³S_»çž{\nzG\0\0\0€.êLØ¡)\"ë§Ú@é§±NÆå—_~(‚†‘#G¦Ý»w÷yØ±eË–Â©¬ö×ÕÕý…w%\0\0\0\0(P[[»8×þ¶£Ë)\"+\"WýT?íi555—çƒ†éÓ§§þ2qâÄ–À#÷šýï^\0\0\0\0P  x¶¸¦¦æ³¥.§ˆ¬ˆÜŸ„rúiõ«˜6*ÿ:9oÞ¼~;yä•\0\0\0@)óÀçÛÅŠŠÈŠÈ•ÐO…rúi_÷«Üþgò—Û¸qc¿…õõõ…#;{÷\0\0\0€EÂŽ–bZaè¡ˆ¬ˆ\\aýT(§ŸöI¿ÊmÛ‘ßßØØØoaÇöíÛg£w/\0\0\0\0(P*ì(,þÅ7ž‘‘+±Ÿ\nåôÓÞîW…Û:ÔoaÇ‘#GZ=Fï^\0\0\0\0ƒTE}­¦ˆ¬ˆ\\áÏ_¡œ~Ú+ýªð|v\0\0\0\00Dq¨ôß¥D{®¦¦æKC‡ýh\\N¹ò›PN(§Ÿön3²\0\0\0€~§8TúïÒ^È‘×“Eä»ï¾;}æ3ŸI\'œpBúøÇ?žFŒ‘¶lÙÒ§×Ü¯”µj¹]#;ú/”k¯¿öçÿ»šúfŽìhéWÖì\0\0\0\0 ¢;Jÿ]Ž¶Uµµµ_iräõTyÆŒYÁõóŸÿ|ö-éE‹eçÏ9ça‡°£œ~Úg¡\\9ýuˆ°c …Çô«Ü¶gòû7nÜØoaG}}}«5E¼{\0\0\0RÂŽ’—¢Eã¶zªˆ|î¹çf×Ýÿì³Ï¦³Î:+ûýé§Ÿž|ðÁV…ÚI“&¥“O>9vÚiéÈömÛ¶-åv3Ï<3­Zµ*Û¾gÏžtÅW¤O<1tÒIiØ°aiçÎí~÷íÛ—®½öÚìòq½ñãÇ§´ºÎÅ_œÎ?ÿül[?ãwŠË_uÕU­n·œû/¼-aGûÏß¾åÊí¯…ÿïöúN„$gŸ}vÖGcüßó£CÚë\'¥oVAØQ²_åöÝ—¿Ü¼yóú-ìˆû.x¼÷y÷\0\0\0¤„ÝÓSEä(öæn®¥HÛ¶EÐ±zõê´cÇŽìr§œrJ«l×¯_Ÿ>õÔS³}—^ziv>BŽ!ßº¯««ËÎ¿øâ‹iíÚµÙéK.¹¤Ý°#ŠÉ±ýá‡ÎŠ‹q:ŠÊ…×YºtiÚµkW¶-B–üãÊë?»åÜám	;Ú}þöi(Wn-ü·×w¢Çù­[·fý;Nçƒ„öúÉ@é›vtØ¯jkkGåC†éÓ§÷[Ø1yòäÂ°ãkÞ•\0\0\0\0)aG÷ôTùøãÏ\n©ñ-õbû£<eÊ”¬<¤ 8;¤M8§ã¶ât|;}H‘à\"¿½°Å¶öÂŽüubÊ¢hÅ®ÛÛ»|þvË¹ÿÂÛvTN?-·¿ûë;^xav>Â“çbz¬]ÑQ?(}³šûéÈ‘#?•{ÿ8ï!¹ÓéàÁƒý½^Ç¡ÚÚÚOxW\0\0\0¤„ÝÓSEäu1¤ib\ZªØÿè£vviS¸m¯8\\îú1¥Ï6â˜6«ÔuÊ)(wæþ…•ÑOËí¯…ÿÇöúNœÇöo|#}úÓŸÎöqÆö“Ò7«½Ÿ®Û1þü>;fÎœYvÌòŽ\0\0\00ˆ	;º§§ŠÈ?ÿùÏ³Bê¿øÅ¬ÐúÏÿüÏÙù¿ú«¿jU„éu†”vä§±Z¹re«i¬FŒ‘µ=ò·wÑEµ[ÐÍOïS8UÐ„	J^\'¦þr´ž¿|þ2]¹aGeôÓrûë\"SCë;\\pAËTk15Tœþä\'?Ùa?(}³ÚûiáTVñ7¾ÐW\Z\Z\Z²%ùûÏýïÎõŽ\0\0\00ˆ	;º§\'‹ÈQ`…“kÎ/*ÓûDàÑvAå!í„1õU“ãöbèX!¶755eâü‚ÎQüÅÌ;Z |ìØ±Ùå£Ea³í\"Ð…—E¦#\\‰ûŽë^¦+÷/ì¨œ~ZNÒfòR}\'þï_ýêW³ëÇíÄ4mÏ>ûl‡ýd ôÍjï§±¦Gî=äå|à°páÂ>;î¸ãŽ– £¦¦fw#\0\0\0€ANØÑ=½QDÖ‘õSý´ZŽîˆ‘o¼ñF¯?þxáôUï×ÔÔœíÝ\0\0\0`vt\"²\"²~ª\rö~š{y4>|ë[ßJÍÍÍ½tÄ´|…ÓWåÚxïD\0\0\0\0;ºIYY?Õ{?>|øÌ½—ìÉwÝuW:räH¯1Í˜EÉ\0\0\08†°£{‘‘õSM?2¤¦¦æ³¹¶?DÄš\Z±žJON]ÕfDÇÃ‡ÿ˜w!\0\0\0\02ÂŽîQDVDÖO5ýôÿ¨­­ýJî=åP>ˆQõõõÝ\n9\Z\Z\ZÒm·ÝVr:\0\0\0\08–°£{‘‘õSM?ý³Ë.»ìs¹÷•w\nÃ‰éÓ§§7v*äØ¾}{š9sfÛÑÙÔU‚\0\0\0\0Ž!ìèEdEdýTÓO[«­­=3÷Þ²£MH‘¾þõ¯§9sæ¤+V¤7Þx£e]øáFŒ™7o^š2eJÛ€#Úû#\0\0\0 $aG÷(\"+\"ë§š~z¬}Q[[;½í(®´ššš¹v¶w\0\0\0\0Jvt\"²\"²~ªé§¥9òS¹÷™;//³ÅÚ³FŒq®w\Z\0\0\0\0:$ìèEdEdýTÓO;VWW÷ï®çñÃX`¼È4Wµµµ‹s?ï«©©¹<wúÞa\0\0\0\0(›°£{‘‘õSM?\0\0\0€~&ìèEdEdýTÓO\0\0\0 Ÿ	;ºGYY?ÕôS\0\0\0\0ègÂŽîQDVDÖO5ý\0\0\0\0ú™°£{‘‘õSM?\0\0\0€~&ìèž¥K—*ÔVv;´xñâ÷õSýT?\0\0\0€LØÑ=Ë—/oÜ½{·bm…¶†††ß.^¼øUýT?ÕO\0\0\0`\0vtÏÓO?ýåeË–½ýæ›o¾§h[Yß”ò’%K¶åÚ×ôSýT?\0\0\0€LØÑ}K–,ùÒâÅ‹Ÿ‹ihbÞ}­\"Zü/^U@ÖOõS\0\0\0\0„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„¥­^½úÿž0aÂæ¿þë¿~?w6iš¦iš¦išVíSŸúÔ{gœqÆ¬Üéùä\0\0;Jˆ #çƒ/}éKé¹çžK‡J\0\0@ÿ{ÿý÷ÓË/¿œ†\rö§üã›\0\0€°£„ë¯¿~K\0\0@åúüç?¿\'wø>Ý\'\0\0v;Šˆ©«bD\0\0P¹6lØp0wø¾Ù\'\0\0v;Š3u\0\0T¸˜ÒjÈÿYÇ\0\0vP,ì\0\0\0*Ÿ°\0 ÷+¥}ýõ×çÕ××¸téÒ´xñb­Ú’%KÒòåË÷æÚ(½TØ!ì\0\0\0a\0\0íˆ cÅŠi÷îÝéü£VAmÏž=éÙgŸ=°dÉ’¯	;„Ý	;Ö¬Y“.¾øâtâ‰\'¦“N:)ýíßþmZ½zu¹ÈÊ¾\\´¸ÿþßÿ{vŸ\0\0€°\0 OÄˆAGE\\¼xñ«ÂaGwÂŽÿò_þKöáêÕW_M/¿ürvú?ý§ÿÔãaGøýïŸŽÀ\0\0v\0\0ô‰˜ºJ¨PÙmñâÅï;„Ý	;b4G\\vË–-\Z…çó§¯¹æšì6Î;ï¼²oã„NhµoèÐ¡éüÿ‘m{çwÒu×]—ÝfŒ¹þúë[ZßµkWú»¿û»ìúý×žþùlûR]]]Ëè”áÃ‡g#ÒÂc=–þÛûoÙub_Ü×öíÛ;Ü\0\0Â\0€\"Ö‡(T|Ø1èŠ…Ý;~ô£e®N>ùäôõ¯=áÑ™°#ƒhùÐ¢½°#?²#‚‘Â}Ë—/O{÷îÍ¶EÐÛæÎ›,XŽÀ#|ñ‹_ÌÎGÈ1¤`„ÈUW]•‘)6lÈN_zé¥Ù¾SN9%;¿sçÎlú¬8VÚÛ\0\0Â\0€Av¼ûvczý¹YiÃ’;²§c›0BØ!ì¨ü°#Ä\ZDà×‹\0¤Ü°ãÃ?ÌÚ£kr”\n;¢üñé¿þ×ÿšêëë¹¼¸R·›ß×V~û6ëƒ„XƒdÈÑÑ$–ÜÿýÙHŽö\0€°\0`…ïìoHë7-½ôØäV-¶Å>„°CØQùaG^SSS«  ³aGLU*ìhçC]«mùiµ\no7B˜rÂŽÂÐ$/¶-[¶,ÝxãÙZ$q¹X§¤£}\0\0 ì\0\0DaÇŽ\rÿrLÐ‘o;7<*vô¶/\r;¾àÛµ°#Ö¾ˆËÆ4N/½ôR«‚ÿøÿ!;ÿÚk¯¥ßýîwEÃŽßþö·é‰\'žÈNÇèˆî†ù)©\n§±ŠéµB~\Z«‰2¤`\Z«Q£Feçõ«_µ,²~ñÅgû>ûÙÏ¶L}SeÅéO}êSî rÅúJ«V­J±¾\\iýß–,Y’MK¹yóf„\0\0Õv¼úÌJ†±O !ìèEŸËµý¹vïÑŸ_ò¬í|Øk\\D0£#bš©˜Ú)¿ð÷ìÙ³³u-b´Å·¿ýí¢aG¬±Ó@EððÆot;ìˆÊcÑóx<Ñ\"èÈ/PkkD@÷‹G@Þzë­,$É/jëuÄbæ!~6,Û×‹59þð‡?t¸€Ê\r:V¬X‘vïÞíX°ÂÚž={²“›6mÒQAØ\0P}aÇúÅ·—;bŸ~ÂŽ^:òGŒìØ#ðè|Ø\0Õ$Ft:*;ðˆ7€°\0È¹ýöÛÿbÆŒß»óÎ;ŸŸ6mÚž	&9rdŠ©j¢]sÍ5ÜtÓMûï¸ãŽµ?ûÙÏî¿å–[þ/5a‡°cPmv\0À\0…tÇ€•|\n;\0`P»ë®».¹í¶ÛÖŒ\Z5êOÓ¦MK.LëÖ­Ë¾¹õÁ´ìÛ·/mÜ¸1=ùä“éž{î‰¹ÚÿtÓM7íÈ]çš¡C‡~Ô_²oÃŽ\rKî(vÄ>ø„=ì\ZùýÖðv\00\0•s|ª	;@Ø\0ô‹‰\'þåw¾óµcÇŽýÓ¼yó²0£3Ž9’V®\\™n¹å–?M˜0¡iÜ¸qÿ¯¿jß…›Wþ´dØû|àvôBÐÑQa„‡°\0aGj|ëÝô­9k³§;\n;@Ø\0ôšiÓ¦ÝpõÕW¿ÿë_ÿ:577wû\0á¹çžKãÆ;2~üø…Ã‡ÿ˜¿pï‡û\ZÖ¥õOÝvìV¹m±Ï>aGùÜÎØèìå…\0PåaÇáÃ¹cÓƒïµœ_þjSKØ§óÛw¿ÝœÞ~ç=Ç’Âv\0\0=cêÔ©÷_ýõ¼ðÂ=zpðàÁ4cÆŒ#uuu»†þý¥{7ìˆ¶õù‡Ž	;b›{ÂŽ:¾Ô…ë½3ˆŸ\Z4aG³WnMß™·.=õò®´ì•Æ4mþú–°#NÇöÇÖìLSs—ùñ“¯¥ï\n<„ ì\0\0z è¸á†>Œõ8zËÃ?üá¨Q£>ü¯üÅ{1ì8|8mþÃÌc§°Êm‹}>ð	;ú)èè©ë;\0 \nÂŽ½šÓ”¹ëZÂŽÚ¤ß¾”vì=èxRØÂ\0 ëbêªÑÑ›AGÞ¢E‹\Z5ªÁÞ	;ÞÙß6­¼¯äš±/.ãCŸ°£‹:ZŒ¼¯oGØ\0\ZvD{|mCÙaÇÜÛæXRØÑ£víÚ•fÍš•n¾ùætõÕW§#F¤Ë/¿¼¥Åùºººtã7¦ŸýìgiãÆžÐ;\0 šÅbä±FÇÚµkûì áý¯ÿµ+w`ù/C‡ý¨ÿ@…‡§ÆÍO§—ŸünÉ #ßâ2qY£<„](zj\nªÁ8ÂÃ§F\0UØSWåÃŒÉ¼”þÃiKÓÛY‹Ó±-¿ÿ‰—|!GØÑ3-Z”Æß*Ø(§ÕÖÖfáÇý÷ßŸýÝv¨@\0@•™:uêË±y_ûæ7¿¹«¦¦æÿî‡æ0ÊCØÑƒÁD>èøH®9ú³3Ú^o°-ZîS#\0ƒ\"ìh|ëÝlòÂ5:\"Üh{¹ØV¸†G\\\'®ë˜RØÑË—/OcÆŒétÈQ¬\Z5*í°\0¨wÝu×%cÇŽýSsssŸ8444|0bÄˆ·jkk?á?Ñ½°£œÑíòðPØQfÐñ¥‚Àâ—GþÙ‰À£ÔõSàáS#\0ƒ\"ì(6MUŒæh{¹ØVì²Ž)…uë­·XŒ92MŸ>=Í›7/mØ°!566¦C‡e—?räHŠiœ7mÚ”æÏŸŸ]nôèÑÇÜÆ¸qãÒ–-[<Ñ…\0@¥»í¶ÛÖÄ]ùþ÷¿¿¡¶¶vºÿD÷ÂŽ®ùæ °£AGsôÀ?u\"ð(:òíŠ‚ýƒe\rŸ\Zv;„=hÿþýÙz…ELE5{öìÔÙ5)ãK€.L\'N<&ôxüñÇ=Ù…\0@¥ºýöÛÿbÔ¨QÚ·o_¿<444ì®­­ÝkíŽî…š°£—”\n ŠíÅ.ÿÿ¹ü`XÃÃ§F\0EØa\Z+aG_W^ye«PbÚ´iÙŽîøàƒ²p#F†®çñ›ßüÆ^Ø\0T¢™3gNÁþvÝu×½–;pü[ÿa‡°£çåž[‹»øüêh1òrrƒŽ¶Ç@ÒÊ§F\0EØñçÊ›Ê^ <.ëXRØÑmGtÄtUTô”†††4yòäV÷1wî\\Oza\0Piî¼óÎç}ôÑ~?€øÉO~²ÒTVå¥…ÂŽÎ(ø&ÚâšššÏ–yµr‡ŽÎ…÷¿gÈÀááS#\0ƒ*ìxr]CÑiªŠµ]³Ó±¤°£lm×è¨¯¯ï•û‰5>b=ÂkÖ¬ñÄv\0\0•dÚ´i{Ö­[×ï¹ƒÒµ¹ƒÆgûÿ£Ü¢´°CØÑ•~UÐžè TëìTR¥ãºtä\rÔ5<|j`Ð„{4§ïÌ[WvØqÓÜ—Òî·›O\n;:´|ùòcFtô¦XÌü®»îj¹¿#F¤]»vyò;\0€J1aÂ„#]°­74555æ…å¥…ÂŽnö«–P­HÿêêšÅ×ºtt÷ñ;\0 ÂŽæ÷§™OoÎ¦ªZðüöôÌ+­×ðˆÓË^iLO½¼+E~µ|K:tø°ãIaG‡FÝjŽžœºª”ƒ¦qãÆµÜïÔ©S=ù…\0@¥ˆÅÖúâ °q°(ì(¯(-ìvôD¿*ÕŽŽ$êîHŠbGw‚Ž¶Ç@YÃÃ§F\0MØ‘<šöÿyÁñX€<vÄéüö·¾\'èv”eÑ¢E-Ç²uuuÝ^Œ¼3^xá…VÓYmÜ¸Ñ€°\0¨”\"h¥v”_”vT~+ãY‘-×\rïíf7Ž©«ÚŽèxíèöî¸÷èmý…°\0ª+ìhÛ\Zßz·%ìˆÓŽ…uíµ×¶¿Îž=»Ïïÿž{îi¹ÿ›o¾Ù€°\0¨•6²C+¯	;Œìè¡í¹ššš/\r:ô£G/šÙÑÕíì(\\´¼³Œì\0€vhÂŽîˆu2òÇ³ñy¶?¦eÞ²eK«ãê½{÷zv\0\0ý­RÖìØ³gÏ.kv”_”î­“…ÅéO<1sÎ9iõêÕÿÁ-ÿ˜…e÷«¶!GÛ`á!½³fGWkv\0€°Cv´˜5kVËqíôéÓûíqLœ8±åqÌ™3Ç‹€°\0èo7ß|óÞ\r6ôûD}}ýÚÜAâ\naGyEéÞ;âô3Ï<“ŽÀÃ‡Ãv¬ª­­ýJ‰£XÀPîHŠbAG¬Ñq\\‘í	<º»†ˆ°\0„Z…cÇŽMO=õT»—‰i£òÇ·óæÍë·ÇúÈ#X¨\\Ø\0T’;ï¼óùÇ¼ß ~ò“Ÿ¬Ì$þPØQ^Qº/ÂŽüùN8¡Õ¾‹/¾8þùÙ¶}ûöeóåžtÒIÙHñãÇ§dû¶mÛ–r?»þ™gž™V­Z•mß³gOºâŠ+²ËÇõ†\r–vîÜ™í‹…Ï>ûìì:±/î+†ˆw´¯ðqçOOš4)|òÉé´ÓNK<ð@¶/.=nã²Ë.ëÕ!v´7’££À££ ¡TÐñ‘vö—xüM®í€A‡°€ªÇN7ÞxcöSØ!ìèùÏCz,]º´èe®¾úê–Ëõçâàõõõ­/Â\0 ŸÍ˜1ãž»îº«ß n¸á†õ¹ƒÄ¡ÂŽòŠÒ}9²ãÜsÏmµ/>tÄ<¹±-‚ŽØöðÃgßªŠÓxÄ¾K/½4;!Ç‚\"uuuÙù_|1­]»6;}É%—dûN9å”ìüÖ­[³é³ât>Xio_±°cÁ‚iýúõÙéSO=5Û÷“ß—¼ƒ!ìè†ŽFVttébà‘ŸJë+ô©îS#\0U!\nÉùbn|‘¤½Â²°CØÑ“aG¾7î˜‘#FŒhÙßØØØouûöí-#Â\0 ŸMž<ù?Ž3æOÍÍÍývðÐÔÔ´»¶¶öÝºººï?Rž¾X³ãøãOguVZ±bE«}‡j¹|ŒÎÈo‹6äèZ…ûÚÞG~û6ëƒÄ¾/¼°e4I„%3fÌÈF‚t´¯XØQø;ÅïRêñ\n;:Tj„G¹AGgüý}e\0?…}j *Äg„¶ÅçX§ ¾Ì\"ìvôEØQ8r\"zncúþräÈ‘Va\0P¦L™ò¿—-[Öo?ýéOŸ¯©©ù…ÿDå„åî‹é¤Ú†1uT9aGah’o±-~·o|ãéÓŸþtv¹3Î8£Ã}…ùóÂŽ.‹m§”\ZÓ‰ £½ÀãŠ6÷3×èv\0PµÊ)>;„½Ýß\nGzTRÀ ìv\0\0fêÔ©µ“&Múðƒ>èo‹½?bÄˆ·FŽù)ÿ‰ê;òSRNc5aÂ„VÓX­\\¹²Õ4V1Ä;ÎÇ:\Z1•Uœ¾è¢‹²}\\pAËÔW1UVœþä\'?Ùá¾rÃŽ/ùË-ÓXÅ‚‚ÂŽN…‹–åC:¸^gEv\0@…ŸcšSaGå·Žþ—ÕØŒì@Ø\0cÂ„	M1]Q_»óÎ;×åïó¨Î°#(oõÅˆ‰htä(µ5\" ˆi§bañXg#¶755e!I~QóXG#3Ï/jþÕ¯~5Û×‹59ž}öÙ÷•vÄcŠ5HbZ«xÜC\n`v”¥í”VT\\Ñ‰ cH‰ë}aÂ€AèÃ?ÌŽÞyçìø)Ž‡vîÜ™-üýÚk¯¥uëÖ¥5kÖdÇKñE‘u½dÉ’ôÄO¤G}4ÍŸ??Í;7û‚ÉC=”~õ«_e_ùÙÏ~£¤Ó½÷Þ›~ô£¥ïÿûéïÿþïÓwÜ‘n¿ýötë­·¦›o¾9M:5Mž<9}ûÛßÎ¦¡úæ7¿kæ¥ë¯¿>[o-Öa‹c£hW]uUºòÊ+³ãµ+®¸¢ì¢s…ñ7‹/ÎÄqe\'ÆÔ§ñ7ì‹cäÙ³g§ÓO?=;¶¼øâ‹Ëº~o~Ùf ì3fLöÈyÊš;\0€’®¹æšÿgÜ¸qGöïßßg\r/¾øâæÚÚÚÿ=|øðùTFØ1ÐÛÇ?þñ¬óOGqaHÁˆaG—î*6E–°€tmsÇ¿--\n¤ÑF\Z•µÑ£GgCv#pˆà!ˆ=Äu×]—_ÿú×³ÀâÆoÌŒ›nº)4n¹å–4mÚ´,è¸óÎ;³àãî»ïÎ‚Ÿüä\'Y0òóŸÿ<JfÍš•\'sæÌÉŠÈ.Ì‚•X\"h‰À%BƒRÅçxœ¿þõ¯S|~ÈûôÇñ]Lk\Zï­åG\rÇ”§}vÄ—fb{|Ù§Ø­ýr‘°#µrä]}õÕ-û7nÜØoµ¾¾¾Õ´n;\0€\n2~üøÊ}z¿/¦³ÚµkWsL_uÙe—}Î_^ØÑW-¦¯Šp£ð›1-–°£ßžN„\0Tl7¾lQ\n¿EŸÿûý÷ßßªøúëø4¿†\\½ÛîÛ³gOÊäý†\r–¨)&Mš”­9wÚi§e!Pì‹ÛŠÑÀqœŠùµà\n÷Å¨ã³Î:+AbÄÇƒ>hdGÃŽYA\\Û~\"ÜË_.¦Òí/qßùÇ	a\0PA†úÑ+¯¼rëC=t¤7vïÞýAîàuWmmíDuaÇ@^\0r€wÃîN=5Ø¦®v\0b1Š#w\\•}äÈ‘-!GL—Uj$xŸÆÈ•xoÀ\"¦Tm×—‹k×®ÍNÇª…¡C|fýúõÙéSO=5Û—û\\Ô²oÑ¢E%Š¶Û#èˆiµvìØ‘m?å”S„Tl$G[¿üå/[B†éÓ§÷Ûc©áòã7¿ù:a\0PirÄ>1zôè}óçÏÿco(ÄˆŽ£AÇtma‡°cÀ™1˜#v\0±vX5Šé´b\Z¬ŽF¦ôçñiL·ÁFñ>H±ÑÑb[©uÞbíÂëÅÔTÑÊ\r;â<eÊ”lm¹R‡°£ûb:Ú|ÈaÜÁƒûü1®×-÷9×°\0¨D¹ÆO\Z5ªáW¿úUSO$Ä\Z1u•ÂaÇ€ÒÙ©¨ëÔUÂ€A,\n²1z \Zµ÷\rûJ	;ò-?¢\"h†…ç»\Zvœyæ™ÙùXûDØÑ»\n×í˜?~ŸßÿÌ™3[îâÄ‰^ä„\0@%‹#FŒø—	&4mÛ¶ípwš››ß¿óÎ;×ÅbäÖèv;uàñ7¹öN®}e?…}jdbáñçŸ~@ÿŽýu|šbú¨øÇéX´<öÅˆš8kqä/¿è¢‹:;bª«!G§±ŠuÊ\r;ò!Iþ¾„½§p*«˜¾,B©¾ÒÐÐÐ2½[´Xa\0PjjjnÈ}Hxó{ßûÞË[¶léÔH¦¦¦Ý3fÌx.Fsäg>ücþ¢ÂaÇ€õ…£AÆÚÙ¿GÐ!ì\0Œb‚åË—;z¡ÅZ`DÐÓP]xá…Yñ9öå>dÓ[ÅBã±?BŒmÛ¶uvÄ4IçœsN¶ÐøØ±cË;rŸ}²ûi»¨¹°£çÅï!b>pX¸paŸÝ÷wÜÑr¿ãÇ÷\'ì\0\0ªI„¹¹ÛsmÇ5×\\óÚÝwß½ê™gžyqûöíÛ\nöíÛ÷f}}ýÚŸüä\'+o¸á†õµµµïÖÔÔü\"¦ÅòWv;…R#<L]%ì\0Ô¢øý»ßýNØ¡õûñé@R8º#FZ¼ñÆ½~Ÿ?þx«µ:bDÂ\0 JÕÔÔ|öhðñD®mÍµ÷ö\ZsmU®ý0×†ÖÕÕý{1a‡°cÐ‚aÀ 7nÜ¸>ýæ¹°CaG¸öÚk[‚‡o}ë[1…r¯Ý×Ê•+[M_uß}÷yqv\0\0 ìv’Àã^A‡°€”Mu3gÎa‡&ìèa1-YmmmK\0q×]w¥#GŽôJÐS¢Y”\\Ø\0€°CØ1ø|!>)½†‡°€Aãúë¯O³fÍvhÂŽ^°téÒVSKÅš\Zûöíë±Û©«\nGtÄH­ýû÷{av\0\0 ìvGÃ„\0ƒ^|üþûïvhÂŽ^#§\n…Q__ß­ÛlhhH·Ýv[«Ût;\0\0v;„;\0­É“\'§ø‡vhÂŽ^´hÑ¢VSZE›>}zÚ¸qc§ngûöíiæÌ™­Fsä§®t;\0\0v;„;\0­ï~÷»é‡?ü¡°Cvô²5kÖ¤#F´\n)¢}ýë_ÏF¬X±\"½ñÆ-ëzÄÏ7bÈ¼yóÒ”)SŽ¹®ÅÈ…>¾\0\0;„Â„Q$ZµjU6gz¼öiÕß–,Y’–/_ž6oÞ¬ƒ÷Ûo¿=}ï{ßvhÂŽ>£/n½õÖcFyt¥?>­^½Ú‹˜°\0€Þ%Ø*ºÊ}˜|_Ø!ìv0‚Žø–ìîÝ»½ö°¶gÏž´lÙ²´iÓ&½DÐ‡°Cvô-[¶³æF¹-¦¬Š „\0\0½lùòå\nK•Û\Z\Z\Z~›û0ùª°CØ!ì` ‹B÷£xÄ,è¾˜Â*¦²vhÂŽ¾×ÜÜœ­çqóÍ7gŒ·æ*Î;6ÝtÓMiÖ¬Yi×®]^´v\0\0ô•§Ÿ~úËË–-{ûÍ7ß|Ï·Ê\ZÑAÇ’%K¶åÚ×„Âa‘†Š£”çÿñÓ¤I“„šç3;\0\0hkÉ’%_Ê}`y.¦K2¿xÅ´ø_¼*èv;,7G)ÏÌ™3Ó7Þèõ@ó|a\0\0 ìv@57ßz7}kÎÚ¬Åi…GÅÑÁ$¦Æ¹á†¼hžÏ ì\0\0\0„Â¨¦âæáÃLû¾×r~ù«M-aGœÎoßývszû÷\"G´9sæ¤ñãÇ;4Ïgv\0\0\0ÂaTKq3‚ŽÙ+·¦ïÌ[—žzyWZöJcš6}KØ§cûckv¦©¹ËüøÉ×ÒwŠ£×Â…³…‘…šç3;\0\0\0a‡°ª¤¸¹÷@sš2w]K¸ÑQ›ôÛ—ÒŽ½#G¬\'žx\"]uÕUúw\\ºt©çŒç3;\0\0\0a‡°Ö7¹_ÛPvØ1÷ß¶)D*ŽhË–-Kuuuúw\\±bEÚ½{·çM…¶¦¦¦,„\0\0€°CØ;bêª|˜1ù‘—ÒÃx#miz;kq:¶å÷?ñRƒb¤°c@[½zu\Z=zô€þ·lÙ’…:o¾ù¦çN…›6mòda\0\0 ìv@9aGã[ïf®ÑáFÛËÅ¶Â5<â:q]…IaÇ@´~ýú4räÈÿ{FàñôÓOgýF«œ&è\0a\0\0 ìv@\'ÃŽbÓTÅhŽ¶—‹mÅ.+`vD[·nM#FŒð‡\0v\0\0\0Âa;4aGuŠµ,jkký!\0„\0\0€°CØÕv˜ÆJØÁ±Þyçï‹\0;\0\0\0a‡°ª ìøóåMe/P—,;²;î¸#ÕÔÔ¤;ï¼Ó@Ø\0\0;„P-aÇ“ë\ZŠNSU¬ýëš‚aÇ€õƒü }ä#Içw^öóÖ[oõGv\0\0\0ÂaTzØ±÷@súÎ¼ue‡7Í})í~»Y¸ ì°AG>àˆ‘ÇwœÀ@Ø\0\0;„PéaGó{‡ÓÌ§7gSU-x~{zæ•ÖkxÄée¯4¦§^Þ•…\"¿Z¾%:|X¸ ìÐAGGÛv\0\0\0ÂaTPØ‘<šöÿyÁñX€<vÄéüö·¾\'èv81‚£½@#¿ß\Z\0Â\0\0@Ø!ì€\n;Ú¶Æ·Þm	;â´ AØ1ÐƒŽŽ‚#<\0„\0\0€°CØUvhÂŽÁ `”;b£³—@Ø\0\0;„ ìÐ„½ttv¤†À@Ø\0\0;„ ìÐ„UtôÔõv\0\0\0Âa;4aG—u´y_ß\0Â\0\0@Ø!ì\0a‡&ìèt@ÑSSPá ì\0\0\0„ÂvhÂŽ>Óv­?ü0;6ûÙm¯g\r\0a\0\0 ìv€°CvôYÐ‘AÅgœ‘Åâg¹G©ë	<\0„\0\0€°CØÂMØÑgAGˆ‘Gbe…AG¾]sÍ5-û­á ì\0\0\0„Âè†(r;4aÇ±JÅ‚‹ör/o\r\0a\0\0 ìv@]yå•éÞ{ïMÍÍÍÂaÇ€ëß1\nã©§žêrÐQjj©rŒÎ#¦´v\0\0\0ÂatÁÈ‘#S<‡GŒ‘î»ï¾’¡GwÃŽÕ«W§‹.º(xâ‰é¤“NJ^xaZ¹reëóÅäj*ñ±Ä°#úv´=–.]ZÖuÊ\r:\n2:tÞÿqÇg„€°\0\0v; \\räÂÑ\"ü˜3gN‡ù¢ïºuëÒ‹/¾˜þô§?-ìvôIØ‘oãÆkw¤Gg§’*h¼ÿþû]\n:ò¬á ì\0\0\0„ÂèF18ßÆŒ“æÏŸßcaGŒæˆçÄÆÙ·gÏžtÅW´Œú6lXÚ¹sg«P`Ò¤Iéä“ON§vZzà²}q[çž{nv«®ºªd€ÐÞí¶‡~8»þ¨Q£²óq8?{öì´oß¾tíµ×f×Û?~|:pà@Ñà¢ðü¶mÛÒÐ¡CÓ	\'œÎ<óÌ´jÕªV—™0aBv{§Ÿ~zzè¡‡Êþ{\\|ñÅéüóÏvt±›Þª«kf<þÝ¿ûw]:ºûx\0v\0\0\0Âa]*¢ÖÖÖ¶üŒ£%b„DÍGµêêê²52¢0ÅÖø–yÐ£p~ýõ×§n¸!}ãßH7Þxcúö·¿ø§L™’¾ûÝï¦[n¹%Ý~ûíéþÏÿ™¾÷½ï¥éÓ§§þð‡éG?úQúÇüÇôÓŸþ4ýüç?Ï‚€Y³fe…ó(ÞÏ;7--Z”üñ¬ÀûÌ3Ï¤ßÿþ÷Yá½T18ß¢è#=ºvÜ}÷ÝY!‹(ðÇü¾ø»Ä¾ñ±víÚìô%—\\Òª¸¿`Á‚´~ýúìô©§žší‹!¿/~¿RaG{·_ØvíÚ•íûÏÿù?gç?ó™ÏdçwìØ‘ýŸâtüMçÍ›—Žÿ[GaÇ¥—^šŽ¿uü<çœsZ]&w„6q:‚œrÿ1%S<^aG×ÂŽÂ‘ñ·ìîHŠbGw‚Ž¶‡5<\0„\0\0€°CØA¯Q£@k\\ìß¿?íÝ»7ûö}|“óæÍé•W^I/½ôRzþùçS}}}Z±bE2DØðÄOdEî!\"Œˆ0!Â‰)~ñ‹_¤™3gfáE„?þñ³P#Â9î¸ãŽ,ôˆð#B©S§f¡H„#\'NLßüæ7³Ð$Â“ë®».+ÒGA7Â•«¯¾:[¢˜!F´ŽŠÁùÖ”Ç\ZqßxÄó#Ø#Úˆc[© áøãou½C‡e­TØÑÞí·mgŸ}v¶?þWñó¬³Î*y_í=Æüùüõ:šÆªØïÕÞß#COOcUn_¨í¼óÎëÖkBL]ÕvDGœíÝ+në7ÞðÂ ì\0\0\0„Âz>ì(¿G±ÁHŒÉë‰°#ßb¤Da¿0H(\'h$”v´wûùëÅ¨“8ýå/9ûaQá4\\…÷¡MO†Å~¯¾\\ëc0ìˆ‘V4Æïò#;º:‚ÂÈ\0a\0\0 ìv ìè\'1*¥m8¦f*¶€swÃŽX¯\"ž«W¯ÎF»ä‹À±/¦ýŠó1W~ñò‹.º¨ÃP ¦v\Zrt\Z«üÔRÅ‚€ön¿mËßN¬±?yä‘VSKNcÁHì‹é§â|L³õØcÆ*Fµ)2U±ß«3ž@CØÑ6ä(,X³@Ø\0\0;v;ªH¬‘/Ç:!q¾”î†±öDìcÔBL×tá…¶,ÖÝÔÔ”…	ùÅ¿#ÄˆéÀ:\n¶lÙ’…LÄ4]¥ŠþíÝ~Û‹ŽÇãrtZ©X,<¶Çåqqýhtä(ðÁÓ)§œ’Ý~L%Vø8¶nÝš.¸à‚ì1ÆYötô{uæïÑv\n,aGñ°#þž1]\\±£XÀPîHŠbAGœ©«Šm/7ðèî\Z\"\0;\0\0\0a‡°ƒAvDXÅùöBŽž\n;´Þk\ZåGÉ;Zko$GGGGAC© #ht´¿”X¿ç¸ãŽt\0;\0\0\0a‡°aGOvTnûâ¿˜-¨.ìè9¬(7Èèlà‘Z¦NêŸ\0 ì\0\0\0„Â„ÂMØÑ=¥Fxt6À(÷ò‚\0a\0\0 ìv ìvhÂŽ#<ÚN)U¸>Ì2§¦*x\\sÍ5­îÇ\Z\0Â\0\0@Ø!ì@Ø1ÃŽ!%$¯ÖÖß¿°£tàQ¸hyapÑ™EÇK]¯³‹¢ ì\0\0\0„Â„Âa‡°£ÓÚNiAEŒÌ(7è(<\n¯×6H@Ø\0\0;„;`Ø‘\0êêêÒI\'”Î9çœ´qãÆVû&L˜N<ñÄtúé§§‡z(Û·oß¾tíµ×f×‰}ãÇOhu½I“&¥“O>9vÚiéÈöíÙ³\']qÅÙuâºÃ†\rK;wî<æqmÛ¶-\r:4pÂ	éÌ3ÏL«V­Ê¶?ûì³é¬³ÎÊ¶ÇãyðÁ[ÝçÅ_œÎ?ÿül[üçž{nv?W]u•°£Êî*6E\0Â\0\0@Ø!ì@Ø1€ÃŽþçN‹-ÊNÿÝßý]«}±=‚ƒ8ÁEì‹ #Î?üðÃiÞ¼yÙé<\n¯·`Á‚´~ýúìô©§žší‹P%Î¿øâ‹iíÚµÙéK.¹ä˜Çué¥—fû\"äˆŸÂÄö:V¯^vìØ‘m?å”SZÝçÒ¥KÓ®]»²m–äGþwvŽÀ£§ƒ\0„\0\0€°CØ°£\nÂŽC‡e-NÇ¨‹bÓ>Åéã?>;—éÎõ\n[þz…-¹¶Û·nÝš¦L™’Þ(¼ŸÂß£ím>FaGåëîÔS¦®v\0\0\0ÂaÂaG6íS©Ð\">.Óöz1eUG×+ Ú{\\¥ÂŽ˜Ò*¶?úè£EÃŽb·!ì¨ÞÀ£³#3,F ì\0\0\0„Â„ƒ8ìˆµ8òÂ¿øÅC‹ütT…ÓXÅÚ]oÄˆÙéXÃ#¦²ŠÓ]tQÉi¬V®\\Ùj\Z«|€‘¿n{aGL5äè4VùÇ(ì¨ŠÊÔU\0Â\0\0@Ø!ì@Ø1ÈÃŽXo#¦šŠé¡bª¨ŽB‹X |ìØ±Yø-‚Ž¶”»^SSSËbèq½$b1òbÓU]pÁÙBägŸ}v¶NGlŸ1cFv½¶Ž2¶lÙ’…$qñX…7ðˆ°..7uêT4\0a\0\0 ìv ì¬aG\0ƒ©	;º¦£58bûqÇ\'è\0v\0\0\0ÂaÂŽÁ\ZväGf#„•¬ÔSW;\0\0\0a‡°a‡°CvTmà!è\0v\0\0\0ÂaÂa‡&ì¨ÚÀã¼óÎt\0;\0\0\0a‡°a‡°CvT§X£#^J­á1Plß¾=­Zµ*-]º4ë;Zÿ·%K–¤åË—§Í›7{\"‚°\0\0v;v;„x}è(èX±bEÚ½{·çN…µ={ö¤eË–¥M›6y\"‚°\0\0v;PÌv;ðúPJŒètTvà#n\0a\0\0 ìv ìv;ðúPBÒ=g<ŸAØ\0\0;„(f\n;4ÅQ¯^4Ïgv\0\0\0ÂaŠ™Š›šâ¨×‡J=h|ëÝô­9k³§=×<ŸAØ\0\0;„(f\n;4ÅQ¯ýzpøðÓ¾ƒïµœ_þjSKØ§óÛw¿ÝœÞ~ç=Ï=Ïgv\0\0\0ÂaŠ™ÂMqÔëCå¼DÐ1{åÖôyëÒS/ïJË^iLÓæ¯o	;âtllÍÎ45w™?ùZ:ð®ÀÃó„\0\0€°CØb¦°CSõúP!¯{4§)s×µ„µI¿})íØ{ÐóÏó„\0\0€°CØb¦°CSõúP9¯¯m(;ì˜ûoÛ<÷<ŸAØ\0\0;„(f\n;4ÅQ¯•õzSWåÃŒÉ¼”þÃiKÓÛY‹Ó±-¿ÿ‰—\Z<÷<ŸAØ\0\0;„(f\n;4ÅQ¯•ñzÐøÖ»Ùä…ktD¸Ñör±­p\r¸N\\×sÐó„\0\0€°CØb¦°CSõúÐ¯¯Å¦©ŠÑm/ÛŠ]ÖsÐó„\0\0€°CØbf¯[ºt©¢â(^„žÏ ì\0\0\0„Â3«×Š+ÒîÝ»hkjjÊ-¼>t5ì0•°„\0\0€°CØbfÅÛ²eKZ¶lYzóÍ7hÐ±iÓ&Ol¯];þ¼@ySÙ”Çe=… ì\0\0\0„Â3û<ðxúé§³\"š6pš ÃëCO†O®k(:MU±ö¯kv\n&„ ì\0\0\0„Â3¯•vì=Ðœ¾3o]ÙaÇMs_J»ßnN;@Ø\0\0;„(f^*#ìh~ïpšùôælªªÏoOÏ¼Òz\r8½ì•ÆôÔË»²PäWË·¤C‡\'„ ì\0\0\0„Â3¯•vä¦ý^p< Ï‡q:¿ý­ƒï	:„ ì\0\0\0„Â3¯•v´mo½ÛvÄiA„°„\0\0€°CØb&àõ¡ªÂMØÂ\0\0@Ø!ì@1ðúÐgÆŽ›žzê)a‡°„\0\0€°a‡b&àõáòª}ÜÑ\"ôXºt©°CØÂ\0\0@Ø°C1ðúPaG¾7®èHa‡°„\0\0€°CØb&àõ¡*ÂŽÂ‘…¡‡°CØÂ\0\0@Ø!ì@1ðúPUaGáH˜ÞJØ!ì\0a\0\0 ìv ˜	‚×‡Ü„•ßzìéÂ\0\0@Ø!ìv\0ðfÌ˜1iîÜ¹Y=;Œìð~Ž°\0\0v;P¨Š°£mÈ‘×^Ø±zõêtÑE¥O<1tÒIéÂ/L+W®ìÑBþÑ‚ä€\n\'fÏžN?ýôtüñÇ§‹/¾¸Û¿¿°Ãû9Â\0\0@Ø!ì@qÔaG]]]š3gÎ1!G9aÇgœ‘×­[—^|ñÅìô§?ýiaGí„NÈ~§¤C‡	;¼Ÿ#ì\0\0\0„ÂG\0º¢ÔHŽÎ„1š#Þÿ6nÜxÌ¾={ö¤+®¸¢eÔÇ°aÃÒÎ;[ð\'Mš”N>ùätÚi§¥x Û·uî¹çf×¹êª«Jû-Z”Î>ûì,8ˆËÆ‰-[¶\r\nÏoÛ¶-\r:4»Þ™gž™V­ZÕîöö~öC©}q;ùÇ“Lí=^a‡÷s„\0\0€°CØâ@7µvÜ}÷ÝYÁ0‹	&d#<òûbÄHì‹k×®ÍN_rÉ%­\nø,Hë×¯ÏNŸzê©Ù¾òû\"0(Uì?å”S²í[·nÍ¦ÓŠÓçŸ~‡áÁ¥—^šŽ0#~žsÎ9ínoï÷hï1tõñ	;¼Ÿ#ì\0\0\0„ÂG\0ú0ìˆktD G¼F\0ÛÛŽ`ˆÛJ÷cýŠÂëÅôNÑJûc}Ø#\'\"¨˜1cF6\n££ð ûmo¯£íÅ~öCWŸ°Ãû9Â\0\0@Ø!ì@q ÃŽ|Û±cG«  0´èhŠbaDGaGì‹Çöo|#[\'$.kˆôVØQì÷hï1tõñ	;¼Ÿ#ì\0\0\0„ÂG\0ú0ìˆµ-âý/¦izþùç[ôGŒ‘µ8ò‹—_tÑE÷cŠ¨!G§±š7o^Ébÿ\\Ð2íÔ®]»²ÓŸüä\'³}±Hœ)²{ì±¢ÓXÅˆ”!E¦±j»½½ß£½ÇÐÞ¾¶¿S{WØáýa\0\0 ìv 8Ð‹aG¬a…ÿýÓPÅÔMù…½›šš²é­bqîØ!F,ÞQØ‹xGÐÓ?;¶d±?në«_ýjvûqÙXãÙgŸÍö=øàƒÙš±oâÄ‰­n#ÖÐˆ \"®ˆGPÓÞöö~öC{ûÚþNí=^a‡÷s„\0\0€°CØâ@/†Ze4a‡÷s„\0\0€°CØâ€°CØáýa\0\0 ì@Ø¡8 ìÐ„ÞÏv\0\0\0ÂaŠ#\0ÂMØáýa\0\0 ìv 8 ìv®½öÚìý»½6fÌ(a\0\0 ì@Ø!ì\0vhÂŽÊ´|ùòÃŽ¹sçúC	;\0\0\0aÂa€°CvT®qãÆ•:êêê²¿Â\0\0@Ø°CØ ìÐ„«½ÑsæÌñvTê‡Š¾þúëóêëë?\\ºtiö×ú¿-Y²$^SöæÚ(}\0„Â„\0ÂMØÑ§Š­ÝkuÕ!ì¨Ôt¬X±\"íÞ½Ûk\\…µ={ö¤gŸ}öÀ’%K¾æã/\0€°CØ°@Ø¡	;úL±ÑÖê ’ÃŽÑ!è¨èÀã¹×ÝW}ü\0v;v\0;4aGŸ\Z?~¼QTMØSWym«ø×Ý÷}ü\0v;v\0;4aGŸŠâq>ì˜?¾?vxÝ­Ž×]\0„Â„\0ÂMØÑçòkwÕÁ@	;Þ}»1½þÜ¬´aÉY‹Ó±Íë¢°\0\0a‡°a€°CØ1@å×î€v¼³¿!­ÿÝ´ôÒc“[µØû¼6\n;\0\0v;v\0;„ÐwÞ™½ŸÇO¨ö°cÇ†9&èÈ·õÚ(ì\0\0@Ø!ì@ØPÈB¹ÂŽà?øAúÈG>’Î;ï¼ìç­·Þê\"ì¨ê°ãÕg~P2ìˆ}^…\0\0;„;\0\n¬X±\"íÞ½[q«B[SSSHÑqÐ‘8bdÇqÇ\'ðè¢]»v¥Y³f¥›o¾9]}õÕiÄˆ-‹¿G‹óuuuéÆoL?ûÙÏÒÆ…½v¬_|{É°#öy}vtGmmí\'jjjrOéË˜kÏäÚŽÂçy®5æÚªÜe~‘»ìØÜé¿T\0\0„Â„\0mË–-iÙ²eéÍ7ßTàªÐ cÓ¦M:j™AGGÛ)mÑ¢Eiüøñ©MÁ³ÃV[[›…÷ßE-/ìÐ„Çºì²Ë>WSS³ ÷Ü=ÔÉçúû~äZÝÐ¡C?ª4\0\0;„;\0*6ðxúé§³âŽV9MÐÑ¾ÁÑ^ ‘ßo\röÅÂîcÆŒétÈQ¬\Z5*í!ìè~Ø±aÉ%ÃŽØ\'vtò3þßäÚs=ñ<ÏµWc´‡ò\0\0 ìv ì\0\0z(èè(È0Â£}ñwi[È9rdš>}zš7o^Ú°aCjllL‡Ê.äÈ‘lÚ»áæÏŸŸ]nôèÑÇÜÆ¸qã²UØÑõ°cóÊŸ–;bŸ@BØQ®ÚÚÚéGGfôèó<×žÈÝÎ§”	\0\0a‡°a\0Ðù\0£Ü½ü`°ÿþl=ŽÂÂeLE5{öì¬ÈÙÍÍÍiáÂ…iâÄ‰ÇCüqaGÃŽ}\rëÒú§n;v\n«Ü¶Ø\'vtdøðá;ºG¯=Ïkjjöç~U*\0\0„Â„\0@‚ŽÎŽÔx´:®¼òÊVËiÓ¦eßìîŽ>ø 7âã…ëyüæ7¿vt!ìˆ¶õù‡Ž	;b›0BØQfÐ±¢/žç¹öN®}M¹\0\0v;v\0\0½tôÔõŠ¶#:b\Z›(`ö”†††4yòäV÷1wî\\aGgÃŽÃ‡Óæ?Ì<v\n«Ü¶Ø\'vtð™þ™>~žª©©ù’’\0 ìv ì\0\0ÚÑÑbäÅíÔÞ1[9·3µ]££¾¾¾Wî\'æþyþGx¬Y³FØQfØñÎþ†´iå}%×ìˆ}q¡„°£˜£ktôùó<FxäîûLe\0@Ø!ì@Ø\0´Pt4U9aG¬#<–/_~ÌˆŽÞ‹ßu×]-÷7bÄˆ´k×.aG{aÇáÃ©qóÓéå\'¿[2èÈ·¸L\\Ö(aG›ÏòS¸y_?Ïs­±¶¶öJ\0€°CØ°\0(L”³ÖF¹aGgow =zt«¹û{rJ›R<˜Æ×r¿S§Nv”;:\ZÍa”‡°£555kúûyž{÷*\0\0ÂaÂ\0 M QîŒÎ„ƒ-ðX´hQK!²®®®Û‹wÆ/¼Ðj:«7\n;Š„åŒæho”‡€BØqÙe—}®žçG,ÿKå\0@Ø!ì D‘#úý`úv\'\0¤ £+aGþ`0Liuíµ×¶\"gÏžÝç÷Ï=÷´ÜÿÍ7ß,ì(vt5èÈ7…°#÷üz´Ržç¹öCå\0@Ø!ì ŸŠ)çwÞ ^°\0*EWˆ®„]\rVªI¬“‘/@Ž92íÞ½»ÏÃ–-[Z­²wï^a‡@AØÑƒbŒÜsëP¥<Ïkjjö×ÕÕý…\0 ìvÐOß\ZâÊqÇ\'ð\0€~:º2Ú²«aGá1Aµò;vlzê©§Ú½Ì¬Y³Z\nÓ§Oï·Ç:qâÄ–Ç1gÎa‡@AØÑƒjjj.¯´çymmíW”\0\0aÇ \n;öïßŸæÏŸŸ¾ÿýïgÈM˜0!û&Nþ\0ñšk®IS¦LIÿ÷Ÿ}(|ýõ×UAz)è,ßî€JoîjàÐ°#ÿÕö¥‡ü1c„K—.-z™˜6*¹yóæõÛc}ä‘Gút¡òþ;jkkçÚß\n;„}Ý¯bÚ¨J{ž[¨\0v’°ã÷¿ÿ}öA~Ô¨QYÈ±páÂ´nÝºl¸ñ|Ðr¹}ûöe‹8>ùä“Ù¨£GÎ>þÓ?ýSvN÷¾5Zª˜Ño•\0]:º4t7ì(ç¡RÃŽ|7nÜ1#=®¾úê–ý}µ8x1õõõ­Â™v|£}qMMÍg…ÂŽ¾êW¹ýÏTÚó<¯\0 ìècå~«\'ÂŽ˜Ç4><Ç¼øÆM„qäÈ‘´råÊ, ¹þúëÓ‚TGºXÄè(È0Â\0ª\'èè©°£ÚŽÚ†…aB>ô1bDËöÆÆÆ~{¬Û·ooyñ˜rØQÐž(ö9CØ!ìèé~•Û¶£Òžç¹Ö¨º\0;úéà±£o`u÷ƒóoûÛì›u¿þõ¯Ssss·$Ÿ{î¹ìÛ{1ÍUL‡EùÅ‹rGlTëüÝ\0P-ÊIQbôt«öc€RaGáHÂó‡ê·Ç\Z_Ú)|,ƒ$ìhùœQXœv;zº_Uêó\\u\0vôÿÁã%Fztù ïÇ?þq6ã…^èÑƒÉƒ¦3f¤«®º*mÛ¶MÅ¤¾¥)ð\0€ÞñÆodéóÎ;¯œ¢uŸ†!WGaBµµJ\ngSØQø9#¾\\%ìvôt¿ªÔç¹ê\n\0 ì¨ƒÇ\"Ó[u9è¸á†²õ8zK,^ëyÄºô\\ÐÑS×\0Š+gzÉ!Fv”UT,lcÆŒIsçÎÍŠ¶ƒudG%‡NÂŽÊoÕj\ZÙ\0 ìèðX]	;bêªÞ:ò-Z”®¸â\n#<JQºTTÛ‚¥\0P-¬ÙÑsýÂ#Ïšñ¹â¹Üç‰/\r:ô£q¹Þ;î¾ûîô™Ï|&pÂ	éãÿxö7Žõc_þyQ\r!C¥<Ö*ÙÑÒ¯¬Ù\0Ðõâÿ lýà.bŽµk×öÙÁåÃ?œ®»îºVp=÷­L#<\0 wî¼g÷DØQm_nÈ§ÖÕÕe#}‹Æñhþr7nì·ÇZ__ßjõAv´\n9òz:ìˆimã÷ýüç?Ÿ}«?¾çÏ9çaÇÀ;ŽéW¹mÏTÚó<fJP]\0¨œp§íAd§ôn¹å–l1ò¾6qâÄtï½÷*š´)š|øá‡ÙëøÙm¯g\r\0èÝ÷î®\rÝ\r;zè¡tÜqÇUÕ—\ZŠähë¦›nj9¾7o^¿=Ö¸ïüãˆÇ4ÀÃŽUµµµ_irôVØqî¹çf¿ï‚:öíÛ—®½öÚtÒI\'¥O<1?>8p Û!ÉÙgŸ‰ý_|qËè={öd£Èã:±oØ°aiçÎÇÜW{·Ÿq»çŸ~¶-\nóñøãò±aácmï>‹ÝÖ ;Jö«Ü¾û*íyIµ\0 ÿÃŽ¢ßÀêÌçßÿþ÷Y¼¹¹¹Ï0\Z\ZÒÈ‘#Ó®]»KŽ+\"¨8ãŒ3²Dñ³ÜÀ£Ôõ\0Ð;º3²¢;aGþ½}êÔ©îoúË_þ²å8wúôéýö8&OžÜò8~ó›ßÔ°£Ôçˆ^\r;\"œˆß7*´vD§cDx¦ãt±ï”SNÉÎoÝº5­^½:;bôPœñÅ³‘ëqú’K.9æ¾Ú»ýüãXºtiöY%¶åþV-AM~DJþ±¶wŸÅnk\0‡ö«ÚÚÚQ•ö<Ïµ¯©6\0\0ô_ØÑî7°:óÁ9>¨ÏŸ?¿ß2ï¹çžA;ÕR±o…FðTX\0)\'ð(:òíšk®é‘bÌÿßÞýÇX]Þ‰w1ÖkÜÄÖØ¤k6»ÙÓ³üa¼	Á4æ&ñ&½mo—2€€€ øT„Š?©ìX]mwµ 4-†²e\"•KÅ^pYXŠ¢T)™\n(0à:ÂŠÍsçó½žñÌáœ™3?Ï™9¯Wò„33gæÇùž™ó}Ÿçy\0€žý.ÈØ1œCGˆWæçþÞÄœ<yrÐïCÁ:þƒò¢œJÄŽrõwì8÷Üs³ÿÞ˜UÑ]ìˆYq9–»Š—ã}ñ±Q£FeoG<¹îºë²å±bvEþçåÜçå®¾~îóâý]]¿ð¾»Íb_k¸ÆŽr´ÛÙ~lª¢ãüTûsë¿p¶\0`ðcGY¯À*÷‰skkk\Z?~|öd£RbvGû—5·wG©\0Q,\\t<Ê½¾=<\0`à~§÷tI©ÞÄŽZyñBþ¾•xAÎâÅ‹;n?–\\µ;boŽsÊ\\Æ*–ƒ*Œ^xaö±x;îÛí·ßž.½ôÒŽ¿£DW÷¥«¯N‘ý8Ê‰ÅnóœÞÛc¨ÅŽ/ž×¾R-ÇyûXêL\0@u+ë¼øÃòþûï¯ø“Ú[o½5­[·nÈ=Y½¹ßÝmF^nÀèi±¤\0\\ðèÉïØžÆŽZúž¿”Õ-·Ü’<,¹%Vs·¿uëV±£ŸcÇ3Ï<“ý÷^ýõÙÿÛ^x!{ûoÿöoÏ\n¹¥¡ò—™ŠŸ‰øØÕW_½ÿböM\\þÚ×¾–}¬®®.{{É’%Ù²RqyôèÑgÝ—®¾~±@ËRåBMîú¹ëtu›bÇÙò—²ªôqÞþÿîïœ>\0\0±ãÑGMkÖ¬©ø“ÚE‹\rÉW)æþ@ŽèkðöçÉŠîBFOCGþíµ\rM`(èÉ,ÊžÄŽž†”¡.NÞN˜0¡ãï¬_|qÐn{Á‚·{7–ZŠ1\"ÄFßù›‹G´(¶Ayü³&bÄIñÜ^Hßþö·³Ï¯ûu¼úê«ÙÇš››³‘Ûx<\"E\\¿Øå¥¾~±@Ë¬ÅÌ”¸½ü¥g»»M±ãl±RAûqöûJçcÆŒùµS\0\0Ã$vÄ¬Ž]»vUüIml*KÕØ‘Ó¦Mër¦GO—’*4Îœ9Ó«ÐQxÒDð\0€ÊrcGo–È\ZògwÄ+°÷ïß?à·¹víÚN×Åß§bÇÀÄCìù³;*tœŸ3fÌN\0\0“Ø¯^jii©øÚx%TLýê±#¦GaôèížÅ‚ÇW¾ò•^‡Ž¾Þ\0 ï¿cË‰µþ»zúôé[Ýyç©­­mÀnkË–-–µyê©§õ¿Uì0j1v„öãmM¥Žóö1Ãi\0€a;â½Ï?ÿ¼jÂÁp‰ù3=by«¾Î¤(<ú:\nO¢ØÃ\0úW_—žªµ¥«Š‰%€ÆŽÛñwÕÂ…ÓgŸ}6 \'@cù¡ÁÞ”\\ì0ÄŽsÎùÞ÷¾÷Õöãîè`ç6%\0†±£šCwá`¨Žï|ç;ÙØ‘#GöéûKWÎèˆ·ãý}÷+¾Ö`L€Z=}±ƒ#|)^4’ÿwU¬µû,ô—XÒ&ÿ•ÞñB•ÖÖV±Cì;Ñ˜1cþ{ûh¬ã¼}¼ü½ï}ïÏ2\0\0f±ÃÌŽ	4\'NL\r\r\rÙ“þxu¦™\0_:xð`¶‘mœ<FåÇúõëÓ¦M›Ò¾}ûü€–ø][nð°ÌäÙV¬XÑéï¬xuö¶mÛúô5:”|ðÁ³fäV\"tˆF­ÇŽ0vìØÿÕ~ž\Zèã\\è\0\0Æ±£Zöì8zôè°Ø³£0rôÇÉ{v\0t›7oÎ~w9ÁU]#~—766¦½{÷úAíåïÜeË–e×›7ožoZÕ«WwZÒ*F}}}Ú³gOC/^\\ø*ïléªJ…±Ã;þ¿¿ÿû¿ÿíÇãÇuœÇÒUB\0À0Ž÷Ýw_zçw*þvûöíiòäÉC6vÄ+âU‡Å\"G±“åÎ¤(:âíXºªØûË\r}ÝC RbF‡ÐQÝÁ#fÜPúwo©¿âý#FŒ:º°sçÎìÅ1…/6¹í¶Û²¿Ã\"„Æ²œ¹õþãß8é¯_¹reš;wnÑ¹ƒ½¹Øaˆ¥;öòöãò½~>ÎÏØŒ\0 bÇ£>š­aZi‹-JóçÏrOº»šÉÑ×Ww–\n¹ ÑÝÇ»zÕhœL:€¡(N¤;±Uý\'ÝèÙß\0f[–/f_Ä÷©p–GoÆŒ3²ÜT±Ã;¾³/ÚñúÂY½cÆŒùuû¸Âé\0€\Zˆñê—…Vü	^,P\rÑe°_ÝYê¤F¹!£§Á#w2Å«F¡ÊI7±c¸¡£wšššŠ­Å_Öˆ¿;c–X5;±ãlãÆûËöcö‡ù›——9bï¥uuuç´\0\0@\rÅŽÃ‡g³ÚÚÚ*öä®¹¹9{u^%ïC5½º³§£Üë@­ÅŽ#~’î\\ñf6â²bbGµý\r0räH¡£âïÇØÏ#fÇã…Ë\\ÅÛS§NM÷ÜsOZºtiö·o5;±£´I“&ý·/öóx<6/²ÌÕ‘öç“ÿÖþïScÆŒù~ûå¿p:\0\0 cG¸÷Þ{³\rE+å™gžI³gÏ®É\'è¹õ¹óOrÄòsz¸4U±àqÓM7uº\'S€á;NŸþ¯tüä§ooúCsGìˆË¹÷·|Ô–>úøS\'ÈÄŽŠºùæ›cy•´`ÁßÄCì\0\0€þˆñj¸»ï¾;}þùçy5Þ¸qã²¥jUá†¥ùá¢\'›Ž—ú¼žnŠ0cG„Žå[ÞM?X¹+­ûýáÔ¸ûHºÕÛ±#.Çû_Úù~š×~\'ûŸéÄ\'‚‡ØQ9“&MÊ^‘b‡!v\0\0@?ÅŽ0sæÌ´yóæAbW__Ÿ-+Pë\n—´ŠP33Ê\rùÁ#ÿó\nC\nÀpÇN´¥¹\r»:âFwãî}+½wì¤“dbGEüüç?ïX~¥–_ðØaˆ\0\0Ðï±#6uŽ[[[íIÝÎ;Óøñãõ6‡Rðè«bKd×Øcí›‡ÊŽ\rÿqÀ	2±£\"r³Zs±Ã^Zˆ†Ø\0\0ý;B<ÙþÉO~2(ËYÅæñD?–Ð¢ÿƒG‡€¡;béª\\Ì˜óü[éWÿ¾?55”¸ïË}üå·9A&vTÄc=Öií±cÇ¦cÇŽùÆˆb‡!v\0\0@ÅŽøC96Ç^¶lÙ€>™kiiI7Þxczâ‰\'<³-¢¯KOYº\n¨µØqäÃO²\rÈó÷èˆ¸Qx½x_þñ9ñ¹N”‰ƒ%¢FÄüØãÇ?þ±oŽØQµ\'«7lØà±­ºÇ©öÇÝ3žþ\0 vˆ7ÜpCZµjÕ€<‘‹¯¡ÃŒƒò‚EO¿O6#j1v[¦*fs^/ÞWìºN”‰ƒ%fÑ†ŽuuuÙòVˆÕhÓ¦MGâÅJßªs:tè_Ûwÿàé/\0\0bG±Qf¥K—öë“¸Ø£#–®2££gá¢Üàaé*@ì;ÄŽêµk×®¢¡#7\Z\Z\Z|“ÄŽª´qãÆo566~ôÁ|ê1®ºftDèX¿~ýöñ¿=ý\0@ì(!f`Ü|óÍiæÌ™éÀ}úZñJÅúúúl3r{tLðˆ¥Çâz69j1vXÆJì\n¦M›Öeìˆ¥D;ªÕúõëÿgû±ý»X.)Žq£*Fü¿øƒÐ\0€ØQ¦XC:fcD¬øãÿØ£ÏmnnNK–,É>ÿî»ïN­­­žÉöBw{pÄûGŒ!t\05;¾Ü ¼¹ì\rÊãºÂ„Ø1XbÖì¤I“²¿‰b”\n›6mòÍ;\0\0\0ˆØ\"R<üðÃÙzÒ1Ûã\'?ùIzõÕWÓÁƒ;]ïøñãiûöíiÑ¢EiÖ¬YÙœ³gÏÎžàÓ7¥fxXº\n;¾¿Ýu¨è2UÅÆov¾/LˆËzÎ™3\'íÙ³\'ëÖ­ËþEì\0\0\0`€bG¾\r6dá#–b(|ebÄxÕâüùóÓÚµkm´9ÀÁCè\0ÄŽ/Ç±mé+w•;îix+µ|Ô&Nˆ³páB¿Ã;\0\0\0*;¨Žà1räH¡;òFÛ§§Óâû²¥ª~½ã`zewç=<ârãî#iÝïgQä›šÒ©Ó§Å	±£bâwx;\0\0\0ÄŽš{tÄLšR{x\0ÔbìÈæÖ/7\rÈs±#.çÞÿáÉO…±£âæÎ›-eb\0\0€ØQ³\"v\0ˆ]#~Ò;â²!vT“Ø×,ö9±\0\0@ì;\0†‰cÇŽõ{ì0ÄŽjvë­·¦¥K—úF v\0\0\0ˆbÀp1~üø4þün£‡Ø!vÓ§OO\r\r\r¾ˆ\0\0\0b‡Ø0\\Œ7.{l‹ñÈ#¤ÖÖV±CìÖ¦L™’~ó›ßøF v\0\0\0ˆbÀp1vìØŽØ‘Ï>ûlvò\\ì;†£I“&¥W^yÅ7±\0\0@ì;\0Êñ§?ýiH<®±¼ÕªU«Ä±cØ™0aBÚ¾}»ob\0\0€Ø!v\0”:ŠE„ºººlÄòQâÄë\r7Ü&Nœ˜&Ožœ-±3uêÔtÓM7¥3f¤™3g¦Ûn»-ÝqÇiöìÙiÎœ9iîÜ¹éÞ{ïM<ð@zè¡‡ÒøÃôÿðéñÇOO>ùdú§ú§´hÑ¢´dÉ’ô‹_ü\"-[¶,­X±\"­\\¹2½øâ‹Ù>ëÖ­Ë^Ý^*väFÜ·ø\\±Cì.âØÛ½{·ob\0\0€Ø!v\0”û˜{`|üñÇéøñã©¹¹98p íÛ·/;ÙºsçÎìæ[¶lIY€ˆA\"ÂDD†,\"\\DÀˆA#ÂFŽ<\"|D\0‰A$ÂH’%L\"œD@™6mZT\"¬Är>ÝÅŽÜ2Wb‡Ø1\\ÄÏôûï¿ïØ\0\0 vˆ\0å>f;v¬êïc±qË-·¤µk×v\\Oì¨þÑ]¸ªäˆÀ£pVS·o¼±c6SüÜÝzë­iÖ¬Yé®»îÊâÝ}÷Ý—|ðÁôÈ#¤G}4‹}O=õTZ¼xqÿå_þ%544¤Õ«W§—_~9›±´uëÖôúë¯gQ±©©)‹ÛÚÚ²ûqâÄ	Pˆ\0\0\0b‡ØPŽ8©\Z39ªUÌ:)<)=oÞ¼¢û”;âóFÎ?ÿütÁ¤Q£Fe³Vâc_œP,úy]}l8ŽåË—§K.¹${î¹éšk®éòº=ùÞTëÌŽS§Ne¡áðáÃYxˆ\0!\"‚D„‰*b6S|o–.]šž}öÙôôÓOga#G„Ž>\"€D‰ÙK1séæ›oNÓ§OÏ‚I„“(R\"¨DX‰À’›¡”ûw(ì§ƒØ\0\0 v v\0U¡Ú÷Ø³gOÇ	àˆq2º”rbÇe—]–8ÜµkWzã7²Ë—^ziM®Æyç—}/bvA„€á;ªÐØ\0\0 vˆbÐñêò;vTíý‹Y\'?üpYKm•;b6GüŒˆRê¤},S3?bfCìGRxB?w9^_ïÊ+¯,úõb&ÀW\\‘…ƒ¸^ÌˆYÅAþÛñßüo|#û¼Ë/¿<›]ÐÕû=šmÒž›­òÝï~7[©»ûPêcñur÷§ð¿¹Øý;@ì\0\0\0;;€Šš8qbzíµ×†ÅK9±ã±ÇËN^xá…YÔˆ…\'ð#D¼ˆË_|qÉ“û/¼ðBvÝ¸|íµ×žu[]tQö±wß}7[>+._uÕUÝÆƒë®».»1#þ˜ÒÕû#ºÄÛ1SåÍ7ßÌ.ó›ßìö>ôöþ‰ v\0\0\0ˆˆ@U™<yrZ·n]ÍÄŽ±GG‚ñ;1H©ú±gE©“û±¼SŒ¸³!\no\'ö‰ÅÌ‰?ýéO³YÝÅƒÜÌŠÂ¯×ÝûóGîþtuz{ÿÄ;\0\0\0ÄÄ ªÄ†É1;¡–bGn¼÷Þ{Â@¹\'ô‹ÅŽXªðëÇÇâ>Ý~ûíÙ¾ q½Ø3d bG±½5ºº½½bˆ\0\0\0bbPU¦OŸž\Z\Z\Zj&vÄ^ñ{0–mŠ½JÊ=Á_ìrìç±fÍšìòõ×_Öm]}õÕËNÅÆêqùk_ûZö±X+Þ~ûí·ÓK/½Tt«˜rN‘e¬\nß_WW—½½dÉ’ŽM×GÝí}èêc…ß‹®î¯Øb\0\0€ØØTÔÌ™3³“öµ;bO‹1\"–¨Š¥œr}÷4vÌ˜1#û\Z±ÏEì{Qx[±¡ø·¿ýílÖG,×{õÕW³=÷ÜsÙžñ±Y³fuúúñµ\"DÄçÄâfºzsssÇféñßûuÄmwwºúXá÷¢«û+v€Ø\0\0 v v\0Kýìg?«™ØÑ£\'\'÷\r±Ä\0\0\0±±`wÝuWzúé§ÅŽŒ˜=QlCrCì\0±\0\0@ì@ì\0*`îÜ¹éÉ\'Ÿ;±Ä\0\0\0±±šî»ï¾T__/vbˆ\0\0\0bbG%<x0Û`xÃ†\rÙ‰4cèõë×§M›6¥}ûö9¨ØÃ?œ,X vbˆ\0\0\0bbG%CÇæÍ›SKK‹‰Ãl=z4566¦½{÷:°PÌêˆÙb‡!v€Ø\0\0 v vTHÌè:†wðˆ;œ\'žx\"Í›7Oì0Ä;\0\0\0ÄÄŽJ‰áN :9Jï=ýôÓé®»î;Ç3ˆ\0\0\0bb‡“›†“£CÓ’%KÒwÜáñÀp<ƒØ\0\0 v vTûÉÍO>:’þø»¥éõ²—ã}N>:9Zë–-[–fÎœ)vŽg;\0\0\0ÄÄŽj>¹ùqë¡ôöÿ½?½õÒœN#ÞsÒÉÑZÖÐÐ¦OŸ.vŽg;\0\0\0ÄÄŽj>¹ùÞ;ÿç¬Ð‘ï¿³Æ	H\'GkÚêÕ«ÓÔ©SÅÃñb\0\0€ØØQÍ\'7ÿðÊJÆŽø˜NŽÖ²uëÖ¥É“\'‹†ãÄ\0\0\0±±£šOn¾ýo•Œñ1\' ­e¯½öZºá†ÄÃñb\0\0€ØØ!vNŽM;vìH&L;Ç3ˆ\0\0\0bbG5ŸÜ|gý‚’±#>æ¤“£µl÷îÝiÜ¸qÃâ¿eÃ†\rŽÇ3ˆ\0\0\0bbÇðŒû¶<]2vÄÇœ€tr´–8p ;vXü·lÞ¼9µ´´8nªt477gA\n;\0\0\0ÄÄŽ^ÄŽã‡v¥·×=xöVíï‹9	)vÔ²ˆÃ%v455¥ÆÆÆôÁ8vª4tìÝ»×Ab\0\0€ØØÑ›ØãÝËÎŠñ>\'!ÅŽZ×ÖÖ6¬7\"xlÜ¸1û¹1ªg v\0\0\0ˆˆ}§O§}ÿ¾øì%¬ÚßÄŽZ¶`Á‚4fÌ˜ôÃþÐ7@ì\0\0\0;;ª1v|Üz(íÝòTÉ=;âcqQAì¨E?úÑÒŸýÙŸ¥‘#Gfÿ>ðÀ¾)\0b\0\0€ØØQ5±ãôétdßÆôûßÞ[2täF\\\'®k–‡ØQ‹¡#8bfÇˆ#\0±\0\0@ì@ì¨†ØÑÝl³<Ä¡ãGEgr”z?\0b\0\0€ØØ1È±£œÙ]ÍòÄŽá,fpt4r·‡€Ø\0\0 v vT0vô6tä†À v÷ÐÑ]È0Ã@ì\0\0\0;;*;±ƒÒ£Ü=½>\0b\0\0€ØØ!vbÇ€‡ŽžÎÔ<\0Ä\0\0\0±±Cì0ÄŽ!:úëó;\0\0\0ÄÄ±Cì;z­»ÍÈûë\0 v\0\0\0ˆˆb‡ØAE-Ae†€Ø\0\0 v vˆ†Ø1h\n÷ÚøÓŸþ”¦NšýÛ…Ÿg\0±\0\0@ì@ì;±cÐBGnF„ŠË.»,;Yÿ–<J}žà v\0\0\0ˆˆb‡!vZè13ã‹eeüÐ‘7ÝtSÇÇíá v\0\0\0ˆˆeˆ“Üb‡!v”¯T€(.º\nå^ß\0b\0\0€ØØÑÉ“\'§ÿøÇ©­­Mì;jæøYëÖ­ëuè(µ´T¹£§aÄ’V\0b\0\0€ØØÑ…qãÆeÿ-uuué©§ž*=Ä±c¸¿1\"zlØ°¡¬Ï)78t2z\Z:òoÄˆfx\0ˆ\0\0\0bbG¡ˆ¹¿1\"~¬X±Bì;j\"väÆ´iÓºœéÑÓ¥¤J3gÎô*täØÃ@ì\0\0\0;;Ê8é›\'NL«V­;ÄŽšˆù3=\n£Go÷Ì(<¾ò•¯ô:tôõþ\0 v\0\0\0ˆty²tìØ±ÿÆˆÙ1CbüøñiÂ„	Ùˆx0iÒ¤lŒo¼1;©\Z¯&Ÿ>}zš1cFš9sfºõÖ[Óí·ßžfÏžîºë®t÷Ýw§¹sç¦{ï½7Ýwß}é¡‡J?üpzä‘GR}}}züñÇÓO<‘þùŸÿ9=ýôÓé™gžIK–,IK—.MË–-K¿úÕ¯RCCC-V¯^Ö®]›È}å•WÒk¯½–¶nÝZò¤onÜpÃ\rÙL±Cì¨…Ø‘?Ó#–·êëLŠbÁ£/¡£0xØÃ@ì\0\0\0;è³8A{\\´¶¶¦cÇŽ¥÷ß?8p íÛ·/íÞ½;½õÖ[iÇŽiÛ¶mióæÍYdˆØðòË/gñ!\"DÄˆˆ	\'\"Rüìg?K‹/ÎâEDŒ\'Ÿ|2‹\Z7\"r,X° ‹?\"‚Ì›7/‹\"GfÍš•î¸ãŽ,šD<¹ùæ›³˜\'n#®L™2%‹-]\"bÄèî¤onˆÃ”û³P+ã;ßùNvâkäÈ‘}zœˆ¥«\ngtÄÛñþ¾ˆû_kÿþýŒÄ\0\0\0±ƒÚVêDo„‘˜	’#v˜ÙQ?÷1+d|?BnfGogP˜Ù v\0\0\0ˆ0ÀbVJáÉÞXR«ØFÍƒ;¶oßžFÎ?ÿütÁ¤Q£F¥-[¶dË .öy]}¬Ò£šï›ØQ:röì\0;\0\0\0Ä¨B{öìé8Ùû„ÄÛ¥FìÈÞµkWzã7²Ë—^zé‹bÇÐ‰±¤[,#W,råÎ¤(:âíXºªØûË\r}ÝC\0±\0\0@ì`ØijjÊöùè*rfìˆÙqÜÄý)\rn¹å–læÇ%—\\’ísRr—ã$v|½+¯¼ò¬¯·Çubùx;ö.‰·—/_žŽ?žísŸ·3]Nœ8Q4\\ä¿{µ|ãßHçw^ºüòË³Íß»»ßGÍn;7“å»ßýn¶ïKþç]sÍ5éª«®;úYW39ºÝ…†R¡#4ºûx)ñs3bÄ¡@ì\0\0\0; ·#v<öØcÙ‰†/¼0‹1Ã£0,ÄÆî/âòÅ_\\2v¼ðÂÙuãòµ×^Ûév>œ½ÿ¯þê¯²·ÿú¯ÿ:{û½÷ÞËBG\\Ž ²råÊìrîbÇu×]—]ŽÈÿFdéî~G‰·cË›o¾™]þæ7¿Ùéó6lØÝ_±£:t7³¢ÜÑÓà‘-óæÍ«šïÅÁƒ³Ÿ÷øŸ£òcýúõiÓ¦Miß¾}V;\0\0\0Ä¨Tìˆ{tDˆàÇPR¡áÜsÏ-;N:•¸3\'\noçŠ+®È>öÊ+¯dÿ~ýë_ÏÞ×-õù]ÅŽÜçu·ŒUþýÎ}Nþ(¼­¸–±ª.¥fxô4`”{ýj\r›7oN---Cni¹á>bÆXcccÚ»w¯ƒÄ\0\0\0±*;r#fY”\Zº‹±DTá×™#ñ±o}ë[Ù¿1£#)­üÏðÒŸ±£ðsŠs*°×‡ØÑ³…KJM:µÇKS7ÝtSÙ3I*%ftÕ<bÆ\r v\0\0\0ˆPØ{]Äq³}ûö´cÇŽŽÆ½‰±¿Áš5k²Ë×_ýY·•[¢*öØˆŸþùNKKå/ca$>ËOÅÛo¿ývzé¥—Š.c3SÎ)²ŒU±û]WW—]^²dIÇ†ì£G;†PðÈß´<?\\ôdÓñRŸ×ÓMÑSœHª{8žAì\0\0\0; B±#ö­ˆ“ý1ã!–z\Z5jÔY}—;bŸø\Z±¹÷»ï¾{ÖmÅ¦ãññs¾XV*^	ï\rÊãúqbDèÈmPþÜsÏ¥‹.º(›ý»çßnÜÆÕW_Å“X\"+‚Mw÷»¹¹¹c#õ¸­Ø¯#6:;†ŽÂ%­\"TÄÌŒrCG~ðÈÿ¼ÂR‹†ãÄ\0\0\0±jöäf%\"“£‚G.5Ul‰¬¡üxpäÃOÒ+ÞÌF\\v¬9žAì\0\0\0;@ìèfäfd8ÙéäèPýN*ñxpúô¥ã\'?íx{Óš;bG\\Î½¿å£¶ôÑÇŸ:öÏ v\0\0\0ˆ vNŽV‹¾.=UíKW•óx¡cù–wÓVîJë~85î>’î_õvGìˆËñþ—v¾Ÿæµ_çÉßþg:ñ‰àáx±\0\0@ì\0±Ãpr´ê‚GOgfTófä=y<8v¢-ÍmØÕ7ºwÿë[é½c\'Žg;\0\0\0Ä;\'G«IO—¢\Z*KW•ûx°öÍCeÇŽ†ÿ8àØs<÷«Ã‡§¥K—¦ùóç§)S¦¤ºººôýï¿cÄÛ“&MJ³gÏN‹-J{öìñ …Ø\0\0 v vNŽÒ—€±lÙ²ìzóæÍ6±tU.fÌyþ­ô«ßŸšš?ÊF\\Ž÷å>þò[‡{Žç~±zõê4cÆŒNa£œ1vìØ,~<ûì³Ù÷\r±ÃÓ\0\0\0±±Ãpr”<ÝíÁï1bÄ¥Ž|øI¶yþ7\n¯ïËßÃ#>\'>×1èxîM›6¥‰\'ö8rãÇÏf{ v\0\0\0 v vNŽRÆ¡¸tUwÅ–©ŠÙ…×‹÷»®cÐñÜSqü‹qãÆ¥úúú´råÊôÎ;ï¤#GŽ¤S§Ne×ÿì³ÏRKKKÚ»woZµjUv½	&œõ5¦M›–ššš<€‰\0\0\0ˆˆ†“£”\nC=tˆŽçJkmmÍöãÈ±ÕòåË³˜ÑmmméÅ_L³fÍ:+z¬]»Ö˜Ø\0\0€ØØa89Jað9rä¥,cåx¬Ð1yòäNQâþûïÏfpôÅçŸžÅ˜’¿ŸÇ/ùK`b\0\0\0bb‡áä(9±GGœ@-µ‡Çpy<hÜÝ\\öåq]Çžã¹\'\ngtÄrU*úË¡C‡Òœ9s:ÝFCCƒ0±\0\0@ì\0±Ãpr”œ8q:Ü~»ëPÑeªŠßì|ß±çx.[áÛ¶mÛ‰=>b?ü;wîô\0&v\0\0\0ˆ vNŽR±ãØ‰¶ôƒ•»ÊŽ÷4¼•Z>jsü9ž»µiÓ¦³ft¤ØÌ|áÂ…·WWW—>ìALì\0\0\0;@ì0œe¸ÇŽ¶OO§Å÷eKUýzÇÁôÊîÎ{xÄåÆÝGÒºßÎ¢È/65¥S§O;þÏÝš0aB§=:úséªRNž<™¦M›Öq»óæÍó &v\0\0\0ˆ vNŽRËXEðhnýrÃñØ€<;ârîýžüTèp<—eõêÕÁaÒ¤I}ÞŒ¼\'^ýõNËYíÙ³Ç™Ø\0\0 v€Øa89*vÔÚãÁ‘?éˆqÙ±æxî©éÓ§w‡åË—úíÿã?þcÇíÏŸ?ß™Ø\0\0 v€Øa89*vx<0Ïå‹}2r¡aÜ¸q©¥¥eÐïCSSS§ýBŽ;æÁLì\0\0\0;ÀÉMÃÉQ±Ããáx.ÏÒ¥K;\"C}}}ÅîÇ¬Y³:îÇŠ+<˜‰\0\0\0b8¹i89*vT«©S§¦uëÖy<p<WÍÏ[,•‹+W®¬Ø}}þùçmT.v\0\0\0ˆ vNŽ2bGîdnœ„Þ°aƒÇÇsÅÞ¦L™Òq½Jn¾mÛ¶N÷±\0\0@ì\0±ÃprTì¨ò“Ï¹1mÚ´¢¯¼÷xàx¬Ÿ·ºººŽ9r¤b÷õàÁƒ÷#îb\0\0€Øb‡áä¨Ø1DN>ç¿’=ÿ$´ÇÇó`ý¼å¿ÿÔ©S»¯Ÿ}öY§û‚Ø\0\0 v€Øa89*v±“Ïù¯¼å†<8žëç­šƒØ!v\0\0\0ˆ0Ä	N\'e`Oî•!vTÿ.?kfv v\0\0\0ˆÐ¯6oÞœZZZœD¦£¹¹¹Ë\r©©í3qâÄÔÐÐý¬„JÇŽíÛ·§Ñ£G§óÏ??]pÁiÔ¨QiË–-ÙÇ¾8YYôóºúX©±|ùòtÉ%—¤sÏ=7]sÍ5%¯—ÿµ{s;fvÿy³gb\0\0€Øýª©©)566¦>ø@¦¡cïÞ½~ÐÅŽ.#GN¥cÇe—]–”ÜµkWzã7²Ë—^zé€„†óÎ;/ûz\'NœÈf”ó9bGÿý¼M™2¥ãã{öì©Ø}Ý¶m[§=E;\0\0\0ÄâÁcãÆÙI4cø¡ƒÂ“Ï“&MJ+V¬8+rTKìˆÙñ;6N~—\n\r·ÜrK6ó#fe,[¶¬äì‹øo¯wå•Wžõõâós×Ë}Þ«¯¾š¾þõ¯g$¾ösÏ=gfÇ\0þ¼ÝsÏ=×[¹reÅîkÜvî~Ä}Bì\0\0\0;\0 J•šÉQm±ã±ÇËNJ^xá…YÔˆ…±cõêÕY¼ˆË_|qÉ ñÂ/d×Ë×^{m·³4\"tÄ2Zï½÷^öþ‹.ºHìÀŸ·Ÿÿüç‘¡¾¾¾b÷uÎœ9÷ã—¿ü¥±\0\0@ì\0€¡®\Z6(=:bF@ø}¤XhˆË±ßF© KSÅˆË1“£»Øñî»ï¦¹sç¦«®ºªdà;úOÌ(ÌE†qãÆ¥“\'Oú}Èß¯#ÆáÃ‡=ˆ\0\0\0b\0ˆý7r3,r¡¢Xìè*HäÇŽXÎª»Øqùå—go¯Y³Fì$ùûv¬ZµjÐoñâÅ·?kÖ,\0b\0\0€Ø\0bGßG.8ÄrR;vìÈ.Ç¦å½‰±ŸG.\\\\ýõÝÆŽÜ>¹ÑÅŽ—¿”U,[qj°:t(›Q’»ý­[·z\0;\0\0\0Ä\0;ú>Þ|óÍ4zôè,<ÄU£FÊNB÷&vÌ˜1#û\Z±,U,QÕ]ìøéOšÝî7Þ(v’øï™0aBGpxñÅí¶,XÐq»ñ³‚Ø\0\0 v\0€ØQ5£\Z‚„ØQ¾üÙ1Óbÿþý~›k×®í´WGÌ$Bì\0\0\0;\0@ì¨š³3ŠmH.vT¯éÓ§w„‡;ï¼3µµµ\rØmmÙ²¥ÓòUO=õ”_ì\0\0\0;\0@ì0ÄŽ¾9pà@\Z;vlG€X¸paúì³Ï$tLš4É¦äb\0\0\0b\0b‡!vô¿\r6tZZ*öÔ8~üx¿}ýXº*FÇ´iÓRkk«ƒ^ì\0\0\0;\0@ì0ÄŽþ³bÅŠNÁ#falÛ¶­O_óÐ¡CéÁìôu…±\0\0\0±\0±Ã;ÌêÕ«;-i£¾¾>íÙ³§G_çàÁƒiñâÅfsä–®:Ä\0\0\0Ä\0ÄCìP;wîLuuu\"EŒÛn»-›ý±yóæ´ÿþŽ}=âßˆ1dåÊ•iîÜ¹g}®ÍÈÅO_\0\0\0Ä\0ÄCìT1ûâ8k–GoÆŒ3ÒöíÛàb\0\0\0b\0b‡!v¾¦¦¦³öÜ(wÄ’U[·nu`#v\0\0\0ˆ\0ˆ†ØQymmmÙ~óçÏÏ6/\\æ*Þž:ujºçž{ÒÒ¥KÓáÃ‡Ðˆ\0\0\0b\0b‡!v€Ø\0\0 v\0€Øaˆ v\0\0\0ˆ\0 vbˆ\0\0\0b\0ˆbˆ\0\0\0ˆ\0ˆ†Øb\0\0€Ø\0UmÃ†\r‚‚Øb\0\0€Ø\0C×æÍ›SKK‹¨P¥£¹¹9R€Ø\0\0 v\0@	MMM©±±1}ðÁâB•†Ž½{÷úA±\0\0@ì\0€î‚ÇÆ³å’ŒêBˆ\0\0\0b\0\0ˆ\0\0\0ˆ\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0b\0\0\0b\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0ˆ\0\0\0b\0\0 v\0\0\0Tcì8uê”gŽ\0\0PÅÎœ9Ó*v\0\0\0”ð7ó7ÿîw¿óì\0\0ªØë¯¿¾£ýÏ÷}žÁ\0\0\0qùå—?sÝu×ñô\0\0ªÖ™¯~õ«Úÿ|¯÷\0\0 ¸?o÷ÎèÑ£nÛ¶­õÌÝ\0\0ª¢pœ9Ó\Z3:¾ˆ¿Ý=}\0\0è\"x´‡¾x•Ã0Ã0Ã¨šKW=~ŽÐ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@_ü?cW/Å1UÏ\0\0\0\0IEND®B`‚',1),
('2',1,'E:\\works\\Fintechviet\\AdServer\\adserver\\target\\classes\\processes\\Order.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"OrderProcess\" name=\"Order process\" isExecutable=\"true\">\n    <startEvent id=\"task1\" name=\"Start\"></startEvent>\n    <exclusiveGateway id=\"exclusivegateway1\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow5\" sourceRef=\"exclusivegateway1\" targetRef=\"CancelOrder\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${cancelOrder == true}]]></conditionExpression>\n    </sequenceFlow>\n    <subProcess id=\"subprocess1\" name=\"Sub Process\">\n      <startEvent id=\"startevent2\" name=\"Start\"></startEvent>\n      <exclusiveGateway id=\"exclusivegateway2\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow8\" sourceRef=\"startevent2\" targetRef=\"exclusivegateway2\"></sequenceFlow>\n      <endEvent id=\"endevent2\"></endEvent>\n      <userTask id=\"ShipVoucher\" name=\"Ship voucher\"></userTask>\n      <exclusiveGateway id=\"exclusivegateway3\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow17\" sourceRef=\"SendEVoucher\" targetRef=\"exclusivegateway3\"></sequenceFlow>\n      <sequenceFlow id=\"flow18\" sourceRef=\"exclusivegateway3\" targetRef=\"SendFail\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${sendFail == true}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"flow19\" sourceRef=\"exclusivegateway3\" targetRef=\"SendSuccessful\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${sendFail == false}]]></conditionExpression>\n      </sequenceFlow>\n      <endEvent id=\"endevent3\"></endEvent>\n      <sequenceFlow id=\"flow20\" sourceRef=\"SendFail\" targetRef=\"endevent3\"></sequenceFlow>\n      <sequenceFlow id=\"flow21\" sourceRef=\"exclusivegateway2\" targetRef=\"SendEVoucher\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${eVoucher == true}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"flow22\" sourceRef=\"exclusivegateway2\" targetRef=\"ShipVoucher\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${eVoucher == false}]]></conditionExpression>\n      </sequenceFlow>\n      <exclusiveGateway id=\"exclusivegateway4\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow23\" sourceRef=\"ShipVoucher\" targetRef=\"exclusivegateway4\"></sequenceFlow>\n      <sequenceFlow id=\"flow24\" sourceRef=\"exclusivegateway4\" targetRef=\"ShipSuccessful\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${shipFail == false}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"flow25\" sourceRef=\"exclusivegateway4\" targetRef=\"ShipFail\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${shipFail == true}]]></conditionExpression>\n      </sequenceFlow>\n      <parallelGateway id=\"parallelgateway1\" name=\"Parallel Gateway\"></parallelGateway>\n      <sequenceFlow id=\"flow26\" sourceRef=\"SendSuccessful\" targetRef=\"parallelgateway1\"></sequenceFlow>\n      <sequenceFlow id=\"flow27\" sourceRef=\"ShipSuccessful\" targetRef=\"parallelgateway1\"></sequenceFlow>\n      <endEvent id=\"endevent4\"></endEvent>\n      <sequenceFlow id=\"flow29\" sourceRef=\"ShipFail\" targetRef=\"endevent4\"></sequenceFlow>\n      <serviceTask id=\"SendEVoucher\" name=\"Send e-voucher, phone card\" activiti:delegateExpression=\"${sendVoucherDelegate}\"></serviceTask>\n      <serviceTask id=\"SendFail\" name=\"Send fail\" activiti:delegateExpression=\"${sendFailDelegate}\"></serviceTask>\n      <serviceTask id=\"SendSuccessful\" name=\"Send successful\" activiti:delegateExpression=\"${sendSuccessfulDelegate}\"></serviceTask>\n      <serviceTask id=\"ShipSuccessful\" name=\"Ship successful\" activiti:delegateExpression=\"${shipSuccessfulDelegate}\"></serviceTask>\n      <serviceTask id=\"ShipFail\" name=\"Ship fail\" activiti:delegateExpression=\"${shipFailDelegate}\"></serviceTask>\n      <sequenceFlow id=\"flow36\" sourceRef=\"parallelgateway1\" targetRef=\"endevent2\"></sequenceFlow>\n    </subProcess>\n    <sequenceFlow id=\"flow6\" sourceRef=\"exclusivegateway1\" targetRef=\"subprocess1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${cancelOrder == false}]]></conditionExpression>\n    </sequenceFlow>\n    <endEvent id=\"endevent1\"></endEvent>\n    <endEvent id=\"endevent5\"></endEvent>\n    <userTask id=\"Processing\" name=\"Processing\"></userTask>\n    <sequenceFlow id=\"flow32\" sourceRef=\"Processing\" targetRef=\"exclusivegateway1\"></sequenceFlow>\n    <sequenceFlow id=\"flow33\" sourceRef=\"task1\" targetRef=\"Processing\"></sequenceFlow>\n    <serviceTask id=\"CancelOrder\" name=\"Cancel order\" activiti:delegateExpression=\"${cancelOrderDelegate}\"></serviceTask>\n    <userTask id=\"CloseOrder1\" name=\"Close order\"></userTask>\n    <sequenceFlow id=\"flow34\" sourceRef=\"CancelOrder\" targetRef=\"CloseOrder1\"></sequenceFlow>\n    <sequenceFlow id=\"flow35\" sourceRef=\"CloseOrder1\" targetRef=\"endevent1\"></sequenceFlow>\n    <userTask id=\"CloseOrder2\" name=\"Close order\"></userTask>\n    <sequenceFlow id=\"flow37\" sourceRef=\"subprocess1\" targetRef=\"CloseOrder2\"></sequenceFlow>\n    <sequenceFlow id=\"flow38\" sourceRef=\"CloseOrder2\" targetRef=\"endevent5\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_OrderProcess\">\n    <bpmndi:BPMNPlane bpmnElement=\"OrderProcess\" id=\"BPMNPlane_OrderProcess\">\n      <bpmndi:BPMNShape bpmnElement=\"task1\" id=\"BPMNShape_task1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"260.0\" y=\"140.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"BPMNShape_exclusivegateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"520.0\" y=\"137.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subprocess1\" id=\"BPMNShape_subprocess1\">\n        <omgdc:Bounds height=\"367.0\" width=\"751.0\" x=\"610.0\" y=\"124.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"startevent2\" id=\"BPMNShape_startevent2\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"620.0\" y=\"303.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway2\" id=\"BPMNShape_exclusivegateway2\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"710.0\" y=\"300.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent2\" id=\"BPMNShape_endevent2\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1300.0\" y=\"290.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"ShipVoucher\" id=\"BPMNShape_ShipVoucher\">\n        <omgdc:Bounds height=\"71.0\" width=\"121.0\" x=\"790.0\" y=\"362.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway3\" id=\"BPMNShape_exclusivegateway3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"974.0\" y=\"196.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent3\" id=\"BPMNShape_endevent3\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1206.0\" y=\"147.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway4\" id=\"BPMNShape_exclusivegateway4\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"980.0\" y=\"377.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"parallelgateway1\" id=\"BPMNShape_parallelgateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"1210.0\" y=\"287.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent4\" id=\"BPMNShape_endevent4\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1206.0\" y=\"412.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SendEVoucher\" id=\"BPMNShape_SendEVoucher\">\n        <omgdc:Bounds height=\"71.0\" width=\"121.0\" x=\"790.0\" y=\"181.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SendFail\" id=\"BPMNShape_SendFail\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"137.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SendSuccessful\" id=\"BPMNShape_SendSuccessful\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"236.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"ShipSuccessful\" id=\"BPMNShape_ShipSuccessful\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"321.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"ShipFail\" id=\"BPMNShape_ShipFail\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"402.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"940.0\" y=\"50.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent5\" id=\"BPMNShape_endevent5\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1550.0\" y=\"290.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"Processing\" id=\"BPMNShape_Processing\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"370.0\" y=\"130.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"CancelOrder\" id=\"BPMNShape_CancelOrder\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"620.0\" y=\"40.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"CloseOrder1\" id=\"BPMNShape_CloseOrder1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"790.0\" y=\"40.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"CloseOrder2\" id=\"BPMNShape_CloseOrder2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1400.0\" y=\"280.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"540.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"540.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"620.0\" y=\"67.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"655.0\" y=\"320.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"710.0\" y=\"320.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow17\" id=\"BPMNEdge_flow17\">\n        <omgdi:waypoint x=\"911.0\" y=\"216.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"974.0\" y=\"216.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow18\" id=\"BPMNEdge_flow18\">\n        <omgdi:waypoint x=\"994.0\" y=\"196.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"993.0\" y=\"167.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"164.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow19\" id=\"BPMNEdge_flow19\">\n        <omgdi:waypoint x=\"994.0\" y=\"236.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"994.0\" y=\"263.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"263.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow20\" id=\"BPMNEdge_flow20\">\n        <omgdi:waypoint x=\"1155.0\" y=\"164.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1206.0\" y=\"164.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow21\" id=\"BPMNEdge_flow21\">\n        <omgdi:waypoint x=\"730.0\" y=\"300.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"730.0\" y=\"215.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"790.0\" y=\"216.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow22\" id=\"BPMNEdge_flow22\">\n        <omgdi:waypoint x=\"730.0\" y=\"340.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"730.0\" y=\"396.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"790.0\" y=\"397.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow23\" id=\"BPMNEdge_flow23\">\n        <omgdi:waypoint x=\"911.0\" y=\"397.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"980.0\" y=\"397.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow24\" id=\"BPMNEdge_flow24\">\n        <omgdi:waypoint x=\"1000.0\" y=\"377.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"999.0\" y=\"347.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"348.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow25\" id=\"BPMNEdge_flow25\">\n        <omgdi:waypoint x=\"1000.0\" y=\"417.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1000.0\" y=\"430.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"429.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow26\" id=\"BPMNEdge_flow26\">\n        <omgdi:waypoint x=\"1155.0\" y=\"263.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1230.0\" y=\"263.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1230.0\" y=\"287.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow27\" id=\"BPMNEdge_flow27\">\n        <omgdi:waypoint x=\"1155.0\" y=\"348.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1192.0\" y=\"349.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1229.0\" y=\"350.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1230.0\" y=\"327.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow29\" id=\"BPMNEdge_flow29\">\n        <omgdi:waypoint x=\"1155.0\" y=\"429.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1206.0\" y=\"429.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow36\" id=\"BPMNEdge_flow36\">\n        <omgdi:waypoint x=\"1250.0\" y=\"307.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1300.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"540.0\" y=\"177.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"540.0\" y=\"231.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"540.0\" y=\"310.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow32\" id=\"BPMNEdge_flow32\">\n        <omgdi:waypoint x=\"475.0\" y=\"157.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"520.0\" y=\"157.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow33\" id=\"BPMNEdge_flow33\">\n        <omgdi:waypoint x=\"295.0\" y=\"157.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"370.0\" y=\"157.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow34\" id=\"BPMNEdge_flow34\">\n        <omgdi:waypoint x=\"725.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"790.0\" y=\"67.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow35\" id=\"BPMNEdge_flow35\">\n        <omgdi:waypoint x=\"895.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"940.0\" y=\"67.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow37\" id=\"BPMNEdge_flow37\">\n        <omgdi:waypoint x=\"1361.0\" y=\"307.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1400.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow38\" id=\"BPMNEdge_flow38\">\n        <omgdi:waypoint x=\"1505.0\" y=\"307.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1550.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('22502',1,'E:\\works\\Fintechviet\\AdServer\\adserver_msb\\target\\classes\\processes\\Order.bpmn20.xml','22501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"OrderProcess\" name=\"Order process\" isExecutable=\"true\">\n    <startEvent id=\"task1\" name=\"Start\"></startEvent>\n    <exclusiveGateway id=\"exclusivegateway1\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow5\" sourceRef=\"exclusivegateway1\" targetRef=\"CancelOrder\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${cancelOrder == true}]]></conditionExpression>\n    </sequenceFlow>\n    <subProcess id=\"subprocess1\" name=\"Sub Process\">\n      <startEvent id=\"startevent2\" name=\"Start\"></startEvent>\n      <exclusiveGateway id=\"exclusivegateway2\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow8\" sourceRef=\"startevent2\" targetRef=\"exclusivegateway2\"></sequenceFlow>\n      <endEvent id=\"endevent2\"></endEvent>\n      <userTask id=\"ShipVoucher\" name=\"Ship voucher\"></userTask>\n      <exclusiveGateway id=\"exclusivegateway3\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow17\" sourceRef=\"SendEVoucher\" targetRef=\"exclusivegateway3\"></sequenceFlow>\n      <sequenceFlow id=\"flow18\" sourceRef=\"exclusivegateway3\" targetRef=\"SendFail\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${sendFail == true}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"flow19\" sourceRef=\"exclusivegateway3\" targetRef=\"SendSuccessful\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${sendFail == false}]]></conditionExpression>\n      </sequenceFlow>\n      <endEvent id=\"endevent3\"></endEvent>\n      <sequenceFlow id=\"flow20\" sourceRef=\"SendFail\" targetRef=\"endevent3\"></sequenceFlow>\n      <sequenceFlow id=\"flow21\" sourceRef=\"exclusivegateway2\" targetRef=\"SendEVoucher\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${eVoucher == true}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"flow22\" sourceRef=\"exclusivegateway2\" targetRef=\"ShipVoucher\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${eVoucher == false}]]></conditionExpression>\n      </sequenceFlow>\n      <exclusiveGateway id=\"exclusivegateway4\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow23\" sourceRef=\"ShipVoucher\" targetRef=\"exclusivegateway4\"></sequenceFlow>\n      <sequenceFlow id=\"flow24\" sourceRef=\"exclusivegateway4\" targetRef=\"ShipSuccessful\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${shipFail == false}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"flow25\" sourceRef=\"exclusivegateway4\" targetRef=\"ShipFail\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${shipFail == true}]]></conditionExpression>\n      </sequenceFlow>\n      <parallelGateway id=\"parallelgateway1\" name=\"Parallel Gateway\"></parallelGateway>\n      <sequenceFlow id=\"flow26\" sourceRef=\"SendSuccessful\" targetRef=\"parallelgateway1\"></sequenceFlow>\n      <sequenceFlow id=\"flow27\" sourceRef=\"ShipSuccessful\" targetRef=\"parallelgateway1\"></sequenceFlow>\n      <endEvent id=\"endevent4\"></endEvent>\n      <sequenceFlow id=\"flow29\" sourceRef=\"ShipFail\" targetRef=\"endevent4\"></sequenceFlow>\n      <serviceTask id=\"SendEVoucher\" name=\"Send e-voucher, phone card\" activiti:delegateExpression=\"${sendVoucherDelegate}\"></serviceTask>\n      <serviceTask id=\"SendFail\" name=\"Send fail\" activiti:delegateExpression=\"${sendFailDelegate}\"></serviceTask>\n      <serviceTask id=\"SendSuccessful\" name=\"Send successful\" activiti:delegateExpression=\"${sendSuccessfulDelegate}\"></serviceTask>\n      <serviceTask id=\"ShipSuccessful\" name=\"Ship successful\" activiti:delegateExpression=\"${shipSuccessfulDelegate}\"></serviceTask>\n      <serviceTask id=\"ShipFail\" name=\"Ship fail\" activiti:delegateExpression=\"${shipFailDelegate}\"></serviceTask>\n      <sequenceFlow id=\"flow36\" sourceRef=\"parallelgateway1\" targetRef=\"endevent2\"></sequenceFlow>\n    </subProcess>\n    <sequenceFlow id=\"flow6\" sourceRef=\"exclusivegateway1\" targetRef=\"subprocess1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${cancelOrder == false}]]></conditionExpression>\n    </sequenceFlow>\n    <endEvent id=\"endevent1\"></endEvent>\n    <endEvent id=\"endevent5\"></endEvent>\n    <userTask id=\"Processing\" name=\"Processing\"></userTask>\n    <sequenceFlow id=\"flow32\" sourceRef=\"Processing\" targetRef=\"exclusivegateway1\"></sequenceFlow>\n    <sequenceFlow id=\"flow33\" sourceRef=\"task1\" targetRef=\"Processing\"></sequenceFlow>\n    <serviceTask id=\"CancelOrder\" name=\"Cancel order\" activiti:delegateExpression=\"${cancelOrderDelegate}\"></serviceTask>\n    <userTask id=\"CloseOrder1\" name=\"Close order\"></userTask>\n    <sequenceFlow id=\"flow34\" sourceRef=\"CancelOrder\" targetRef=\"CloseOrder1\"></sequenceFlow>\n    <sequenceFlow id=\"flow35\" sourceRef=\"CloseOrder1\" targetRef=\"endevent1\"></sequenceFlow>\n    <userTask id=\"CloseOrder2\" name=\"Close order\"></userTask>\n    <sequenceFlow id=\"flow37\" sourceRef=\"subprocess1\" targetRef=\"CloseOrder2\"></sequenceFlow>\n    <sequenceFlow id=\"flow38\" sourceRef=\"CloseOrder2\" targetRef=\"endevent5\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_OrderProcess\">\n    <bpmndi:BPMNPlane bpmnElement=\"OrderProcess\" id=\"BPMNPlane_OrderProcess\">\n      <bpmndi:BPMNShape bpmnElement=\"task1\" id=\"BPMNShape_task1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"260.0\" y=\"140.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"BPMNShape_exclusivegateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"520.0\" y=\"137.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subprocess1\" id=\"BPMNShape_subprocess1\">\n        <omgdc:Bounds height=\"367.0\" width=\"751.0\" x=\"610.0\" y=\"124.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"startevent2\" id=\"BPMNShape_startevent2\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"620.0\" y=\"303.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway2\" id=\"BPMNShape_exclusivegateway2\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"710.0\" y=\"300.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent2\" id=\"BPMNShape_endevent2\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1300.0\" y=\"290.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"ShipVoucher\" id=\"BPMNShape_ShipVoucher\">\n        <omgdc:Bounds height=\"71.0\" width=\"121.0\" x=\"790.0\" y=\"362.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway3\" id=\"BPMNShape_exclusivegateway3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"974.0\" y=\"196.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent3\" id=\"BPMNShape_endevent3\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1206.0\" y=\"147.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway4\" id=\"BPMNShape_exclusivegateway4\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"980.0\" y=\"377.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"parallelgateway1\" id=\"BPMNShape_parallelgateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"1210.0\" y=\"287.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent4\" id=\"BPMNShape_endevent4\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1206.0\" y=\"412.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SendEVoucher\" id=\"BPMNShape_SendEVoucher\">\n        <omgdc:Bounds height=\"71.0\" width=\"121.0\" x=\"790.0\" y=\"181.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SendFail\" id=\"BPMNShape_SendFail\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"137.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SendSuccessful\" id=\"BPMNShape_SendSuccessful\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"236.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"ShipSuccessful\" id=\"BPMNShape_ShipSuccessful\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"321.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"ShipFail\" id=\"BPMNShape_ShipFail\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"402.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"940.0\" y=\"50.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent5\" id=\"BPMNShape_endevent5\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1550.0\" y=\"290.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"Processing\" id=\"BPMNShape_Processing\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"370.0\" y=\"130.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"CancelOrder\" id=\"BPMNShape_CancelOrder\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"620.0\" y=\"40.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"CloseOrder1\" id=\"BPMNShape_CloseOrder1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"790.0\" y=\"40.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"CloseOrder2\" id=\"BPMNShape_CloseOrder2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1400.0\" y=\"280.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"540.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"540.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"620.0\" y=\"67.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"655.0\" y=\"320.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"710.0\" y=\"320.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow17\" id=\"BPMNEdge_flow17\">\n        <omgdi:waypoint x=\"911.0\" y=\"216.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"974.0\" y=\"216.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow18\" id=\"BPMNEdge_flow18\">\n        <omgdi:waypoint x=\"994.0\" y=\"196.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"993.0\" y=\"167.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"164.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow19\" id=\"BPMNEdge_flow19\">\n        <omgdi:waypoint x=\"994.0\" y=\"236.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"994.0\" y=\"263.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"263.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow20\" id=\"BPMNEdge_flow20\">\n        <omgdi:waypoint x=\"1155.0\" y=\"164.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1206.0\" y=\"164.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow21\" id=\"BPMNEdge_flow21\">\n        <omgdi:waypoint x=\"730.0\" y=\"300.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"730.0\" y=\"215.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"790.0\" y=\"216.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow22\" id=\"BPMNEdge_flow22\">\n        <omgdi:waypoint x=\"730.0\" y=\"340.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"730.0\" y=\"396.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"790.0\" y=\"397.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow23\" id=\"BPMNEdge_flow23\">\n        <omgdi:waypoint x=\"911.0\" y=\"397.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"980.0\" y=\"397.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow24\" id=\"BPMNEdge_flow24\">\n        <omgdi:waypoint x=\"1000.0\" y=\"377.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"999.0\" y=\"347.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"348.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow25\" id=\"BPMNEdge_flow25\">\n        <omgdi:waypoint x=\"1000.0\" y=\"417.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1000.0\" y=\"430.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"429.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow26\" id=\"BPMNEdge_flow26\">\n        <omgdi:waypoint x=\"1155.0\" y=\"263.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1230.0\" y=\"263.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1230.0\" y=\"287.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow27\" id=\"BPMNEdge_flow27\">\n        <omgdi:waypoint x=\"1155.0\" y=\"348.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1192.0\" y=\"349.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1229.0\" y=\"350.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1230.0\" y=\"327.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow29\" id=\"BPMNEdge_flow29\">\n        <omgdi:waypoint x=\"1155.0\" y=\"429.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1206.0\" y=\"429.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow36\" id=\"BPMNEdge_flow36\">\n        <omgdi:waypoint x=\"1250.0\" y=\"307.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1300.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"540.0\" y=\"177.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"540.0\" y=\"231.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"540.0\" y=\"310.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow32\" id=\"BPMNEdge_flow32\">\n        <omgdi:waypoint x=\"475.0\" y=\"157.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"520.0\" y=\"157.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow33\" id=\"BPMNEdge_flow33\">\n        <omgdi:waypoint x=\"295.0\" y=\"157.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"370.0\" y=\"157.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow34\" id=\"BPMNEdge_flow34\">\n        <omgdi:waypoint x=\"725.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"790.0\" y=\"67.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow35\" id=\"BPMNEdge_flow35\">\n        <omgdi:waypoint x=\"895.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"940.0\" y=\"67.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow37\" id=\"BPMNEdge_flow37\">\n        <omgdi:waypoint x=\"1361.0\" y=\"307.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1400.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow38\" id=\"BPMNEdge_flow38\">\n        <omgdi:waypoint x=\"1505.0\" y=\"307.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1550.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('22503',1,'E:\\works\\Fintechviet\\AdServer\\adserver_msb\\target\\classes\\processes\\Order.OrderProcess.png','22501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0;\0\0õ\0\0\0 L€\0\0zIDATxÚìÝÔå/|¢ñx,“r­ŠÇS•äœM½[×ãñhÕzL½®µ•¼ÆJêMRÇá\"£‚\"šE=\Z—Ä˜˜]CˆæM0†#v¹¬ë%ŠÂ,^@E8ˆ\\†¹ˆ #5ÏÛ¿ÿ¡\'=C÷LÏ½{æó©zjºÿÿ¾ÍÌÓÝÿþ}ûyž!C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`I)}ôõ×_ŸW__ÿáÒ¥KÓâÅ‹µ\nhK–,IË—/ß›k£ôRýT?\0\0\0\0hGW¬X‘vïÞþøÇ?jÔöìÙ“ž}öÙK–,ùš~ªŸê§\0\0\0\0\0%Ä7å+ºüÇÅ‹¿ªŸê§ú)\0\0\0\0@	1%bme·Å‹¿¯Ÿê§ú)\0\0\0\0@	1ï¾BmÅ‘“~ªŸê§\0\0\0\0\0%t¦ˆÜøÖ»é[sÖf-N+ð*\"WZ?}÷íÆôús³Ò†%wd-NÇ6ýH?\0\0\0\0°öŠÈ‡ÿ1í;ø^Ëùå¯6µ„q:¿}÷ÛÍéíwÞSðUDî—~šoïìoHë7-½ôØäV-¶Å>}I?\0\0\0\0¨REä:f¯Üš¾3o]zêå]iÙ+iÚüõ-aGœŽí­Ù™¦æ.óã\'_KÞx(\"÷m?-l;6üË1AG¾íÜð¨¾¤Ÿ\0\0\0\0U©\"òÞÍiÊÜu-áFGmÒo_J;öTôUDîÓ~ZØ^}æ%ÃŽØ§/é§\0\0\0\0À\0Õ^ùñµ\re‡sÿm›‚¯\"r¿ôÓ|[¿øö’aGìÓ—ôÓî¨­­ýDMMÍå9?ÌµgrmG®¥‚Ö˜k«r—ùEî²cs§ÿÒ;\0\0\0\0ô‘öŠÈ1uU>Ì˜üÈKéá?¼‘¶4½µ8ÛòûŸxÉšŠÈýÓO…úioºì²Ë>WSS³àòË/?Ô&Üè¨½áG®Õ\r:ô£Þm\0\0\0\0 +\"7¾õn¶\0yá\Zn´½\\l+\\Ã#®×UøUDî‹~Ú¶mXrGÉ°#öéKúig\\~ùå“kÏu2à(Õ^ÑÞq\0\0\0\0 —+\"›¦*Fs´½\\l+vY…_Eä¾è§mÛæ•?-vÄ>}I?-Wmmíô£#3Z‹‘#G¦éÓ§§yóæ¥\r6¤ÆÆÆtèÐ¡Ž9’vïÞ6mÚ”æÏŸŸ]nôèÑÅB\'r·ó)ï<\0\0\0\0ÐÃ„ŠÈÕÚOÛ¶}\rëÒú§n;v\n«Ü¶Ø§/é§>|øÇŽ®ÇÑPÔÕÕ¥Ù³ggaFg477§…¦‰\'¶\n<jjjöç~õî\0\0\0\0=È4VŠÈÕÚO‹µ­Ï?tLØÛô#ý´#GƒŽ…ÁÄ´iÓ²ÝñÁ¤Ç<RpÛïäÚ×¼\0\0\0@iò¦²(Ë*ø*\"÷G?mi‡§Í˜yìV¹m±O_ÒOÛÓvDGLWAEOihhH“\'O.<ÕÔÔ|É»\0\0\0\0ô€öŠÈO®k(:MU±ö¯kv*ø*\"÷K?öÎþ†´iå}%×ìˆ}qýI?-æè\Z-AD}}}ê\r±ÆG¬çQ8Â#wßgz\'\0\0\0€n*UDÞ{ 9}gÞº²ÃŽ›æ¾”v¿Ý¬è«ˆÜ§ý4Fl4n~:½üäwKù—‰Ë\Zå¡ŸºüòËÿ¦p1òÑÑ›b1ó»îº«0ðh¬­­ý„w#\0\0\0\0è†REäæ÷§™OoÎ¦ªZðüöôÌ+­×ðˆÓË^iLO½¼+E~µ|K:¤ˆ¬ˆÜ‡ý´£ÑFyè§å¨©©YS¸FGON]UÊÁƒÓ¸qã\n-¿×»\0\0\0\0tC{ÓEàÑ´ÿÏŽÇäù°#Nç·¿uð=A‡\"rŸ÷ÓrFs´7ÊCßÒO/»ì²Ïå‡ºººn/FÞ/¼ðBÛËÿÒ;\0\0\0\0tQY?mo½ÛvÄi^Eäþì§]\r:òMßÒO/¿üòGóÃìÙ³S_»çž{\nzG\0\0\0€.êLØ¡)\"ë§Ú@é§±NÆå—_~(‚†‘#G¦Ý»w÷yØ±eË–Â©¬ö×ÕÕý…w%\0\0\0\0(P[[»8×þ¶£Ë)\"+\"WýT?íi555—çƒ†éÓ§§þ2qâÄ–À#÷šýï^\0\0\0\0P  x¶¸¦¦æ³¥.§ˆ¬ˆÜŸ„rúiõ«˜6*ÿ:9oÞ¼~;yä•\0\0\0@)óÀçÛÅŠŠÈŠÈ•ÐO…rúi_÷«Üþgò—Û¸qc¿…õõõ…#;{÷\0\0\0€EÂŽ–bZaè¡ˆ¬ˆ\\aýT(§ŸöI¿ÊmÛ‘ßßØØØoaÇöíÛg£w/\0\0\0\0(P*ì(,þÅ7ž‘‘+±Ÿ\nåôÓÞîW…Û:ÔoaÇ‘#GZ=Fï^\0\0\0\0ƒTE}­¦ˆ¬ˆ\\áÏ_¡œ~Ú+ýªð|v\0\0\0\00Dq¨ôß¥D{®¦¦æKC‡ýh\\N¹ò›PN(§Ÿön3²\0\0\0€~§8TúïÒ^È‘×“Eä»ï¾;}æ3ŸI\'œpBúøÇ?žFŒ‘¶lÙÒ§×Ü¯”µj¹]#;ú/”k¯¿öçÿ»šúfŽìhéWÖì\0\0\0\0 ¢;Jÿ]Ž¶Uµµµ_iräõTyÆŒYÁõóŸÿ|ö-éE‹eçÏ9ça‡°£œ~Úg¡\\9ýuˆ°c …Çô«Ü¶gòû7nÜØoaG}}}«5E¼{\0\0\0RÂŽ’—¢Eã¶zªˆ|î¹çf×Ýÿì³Ï¦³Î:+ûýé§Ÿž|ðÁV…ÚI“&¥“O>9vÚiéÈömÛ¶-åv3Ï<3­Zµ*Û¾gÏžtÅW¤O<1tÒIiØ°aiçÎí~÷íÛ—®½öÚìòq½ñãÇ§´ºÎÅ_œÎ?ÿül[?ãwŠË_uÕU­n·œû/¼-aGûÏß¾åÊí¯…ÿïöúN„$gŸ}vÖGcüßó£CÚë\'¥oVAØQ²_åöÝ—¿Ü¼yóú-ìˆû.x¼÷y÷\0\0\0¤„ÝÓSEä(öæn®¥HÛ¶EÐ±zõê´cÇŽìr§œrJ«l×¯_Ÿ>õÔS³}—^ziv>BŽ!ßº¯««ËÎ¿øâ‹iíÚµÙéK.¹¤Ý°#ŠÉ±ýá‡ÎŠ‹q:ŠÊ…×YºtiÚµkW¶-B–üãÊë?»åÜám	;Ú}þöi(Wn-ü·×w¢Çù­[·fý;Nçƒ„öúÉ@é›vtØ¯jkkGåC†éÓ§÷[Ø1yòäÂ°ãkÞ•\0\0\0\0)aG÷ôTùøãÏ\n©ñ-õbû£<eÊ”¬<¤ 8;¤M8§ã¶ât|;}H‘à\"¿½°Å¶öÂŽüubÊ¢hÅ®ÛÛ»|þvË¹ÿÂÛvTN?-·¿ûë;^xav>Â“çbz¬]ÑQ?(}³šûéÈ‘#?•{ÿ8ï!¹ÓéàÁƒý½^Ç¡ÚÚÚOxW\0\0\0¤„ÝÓSEäu1¤ib\ZªØÿè£vviS¸m¯8\\îú1¥Ï6â˜6«ÔuÊ)(wæþ…•ÑOËí¯…ÿÇöúNœÇöo|#}úÓŸÎöqÆö“Ò7«½Ÿ®Û1þü>;fÎœYvÌòŽ\0\0\00ˆ	;º§§ŠÈ?ÿùÏ³Bê¿øÅ¬ÐúÏÿüÏÙù¿ú«¿jU„éu†”vä§±Z¹re«i¬FŒ‘µ=ò·wÑEµ[ÐÍOïS8UÐ„	J^\'¦þr´ž¿|þ2]¹aGeôÓrûë\"SCë;\\pAËTk15Tœþä\'?Ùa?(}³ÚûiáTVñ7¾ÐW\Z\Z\Z²%ùûÏýïÎõŽ\0\0\00ˆ	;º§\'‹ÈQ`…“kÎ/*ÓûDàÑvAå!í„1õU“ãöbèX!¶755eâü‚ÎQüÅÌ;Z |ìØ±Ùå£Ea³í\"Ð…—E¦#\\‰ûŽë^¦+÷/ì¨œ~ZNÒfòR}\'þï_ýêW³ëÇíÄ4mÏ>ûl‡ýd ôÍjï§±¦Gî=äå|à°páÂ>;î¸ãŽ– £¦¦fw#\0\0\0€ANØÑ=½QDÖ‘õSý´ZŽîˆ‘o¼ñF¯?þxáôUï×ÔÔœíÝ\0\0\0`vt\"²\"²~ª\rö~š{y4>|ë[ßJÍÍÍ½tÄ´|…ÓWåÚxïD\0\0\0\0;ºIYY?Õ{?>|øÌ½—ìÉwÝuW:räH¯1Í˜EÉ\0\0\08†°£{‘‘õSM?2¤¦¦æ³¹¶?DÄš\Z±žJON]ÕfDÇÃ‡ÿ˜w!\0\0\0\02ÂŽîQDVDÖO5ýôÿ¨­­ýJî=åP>ˆQõõõÝ\n9\Z\Z\ZÒm·ÝVr:\0\0\0\08–°£{‘‘õSM?ý³Ë.»ìs¹÷•w\nÃ‰éÓ§§7v*äØ¾}{š9sfÛÑÙÔU‚\0\0\0\0Ž!ìèEdEdýTÓO[«­­=3÷Þ²£MH‘¾þõ¯§9sæ¤+V¤7Þx£e]øáFŒ™7o^š2eJÛ€#Úû#\0\0\0 $aG÷(\"+\"ë§š~z¬}Q[[;½í(®´ššš¹v¶w\0\0\0\0Jvt\"²\"²~ªé§¥9òS¹÷™;//³ÅÚ³FŒq®w\Z\0\0\0\0:$ìèEdEdýTÓO;VWW÷ï®çñÃX`¼È4Wµµµ‹s?ï«©©¹<wúÞa\0\0\0\0(›°£{‘‘õSM?\0\0\0€~&ìèEdEdýTÓO\0\0\0 Ÿ	;ºGYY?ÕôS\0\0\0\0ègÂŽîQDVDÖO5ý\0\0\0\0ú™°£{‘‘õSM?\0\0\0€~&ìèž¥K—*ÔVv;´xñâ÷õSýT?\0\0\0€LØÑ=Ë—/oÜ½{·bm…¶†††ß.^¼øUýT?ÕO\0\0\0`\0vtÏÓO?ýåeË–½ýæ›o¾§h[Yß”ò’%K¶åÚ×ôSýT?\0\0\0€LØÑ}K–,ùÒâÅ‹Ÿ‹ihbÞ}­\"Zü/^U@ÖOõS\0\0\0\0„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„¥­^½úÿž0aÂæ¿þë¿~?w6iš¦iš¦išVíSŸúÔ{gœqÆ¬Üéùä\0\0;Jˆ #çƒ/}éKé¹çžK‡J\0\0@ÿ{ÿý÷ÓË/¿œ†\rö§üã›\0\0€°£„ë¯¿~K\0\0@åúüç?¿\'wø>Ý\'\0\0v;Šˆ©«bD\0\0P¹6lØp0wø¾Ù\'\0\0v;Š3u\0\0T¸˜ÒjÈÿYÇ\0\0vP,ì\0\0\0*Ÿ°\0 ÷+¥}ýõ×çÕ××¸téÒ´xñb­Ú’%KÒòåË÷æÚ(½TØ!ì\0\0\0a\0\0íˆ cÅŠi÷îÝéü£VAmÏž=éÙgŸ=°dÉ’¯	;„Ý	;Ö¬Y“.¾øâtâ‰\'¦“N:)ýíßþmZ½zu¹ÈÊ¾\\´¸ÿþßÿ{vŸ\0\0€°\0 OÄˆAGE\\¼xñ«ÂaGwÂŽÿò_þKöáêÕW_M/¿ürvú?ý§ÿÔãaGøýïŸŽÀ\0\0v\0\0ô‰˜ºJ¨PÙmñâÅï;„Ý	;b4G\\vË–-\Z…çó§¯¹æšì6Î;ï¼²oã„NhµoèÐ¡éüÿ‘m{çwÒu×]—ÝfŒ¹þúë[ZßµkWú»¿û»ìúý×žþùlûR]]]Ëè”áÃ‡g#ÒÂc=–þÛûoÙub_Ü×öíÛ;Ü\0\0Â\0€\"Ö‡(T|Ø1èŠ…Ý;~ô£e®N>ùäôõ¯=áÑ™°#ƒhùÐ¢½°#?²#‚‘Â}Ë—/O{÷îÍ¶EÐÛæÎ›,XŽÀ#|ñ‹_ÌÎGÈ1¤`„ÈUW]•‘)6lÈN_zé¥Ù¾SN9%;¿sçÎlú¬8VÚÛ\0\0Â\0€Av¼ûvczý¹YiÃ’;²§c›0BØ!ì¨ü°#Ä\ZDà×‹\0¤Ü°ãÃ?ÌÚ£kr”\n;¢üñé¿þ×ÿšêëë¹¼¸R·›ß×V~û6ëƒ„XƒdÈÑÑ$–ÜÿýÙHŽö\0€°\0`…ïìoHë7-½ôØäV-¶Å>„°CØQùaG^SSS«  ³aGLU*ìhçC]«mùiµ\no7B˜rÂŽÂÐ$/¶-[¶,ÝxãÙZ$q¹X§¤£}\0\0 ì\0\0DaÇŽ\rÿrLÐ‘o;7<*vô¶/\r;¾àÛµ°#Ö¾ˆËÆ4N/½ôR«‚ÿøÿ!;ÿÚk¯¥ßýîwEÃŽßþö·é‰\'žÈNÇèˆî†ù)©\n§±ŠéµB~\Z«‰2¤`\Z«Q£Feçõ«_µ,²~ñÅgû>ûÙÏ¶L}SeÅéO}êSî rÅúJ«V­J±¾\\iýß–,Y’MK¹yóf„\0\0Õv¼úÌJ†±O !ìèEŸËµý¹vïÑŸ_ò¬í|Øk\\D0£#bš©˜Ú)¿ð÷ìÙ³³u-b´Å·¿ýí¢aG¬±Ó@EððÆot;ìˆÊcÑóx<Ñ\"èÈ/PkkD@÷‹G@Þzë­,$É/jëuÄbæ!~6,Û×‹59þð‡?t¸€Ê\r:V¬X‘vïÞíX°ÂÚž={²“›6mÒQAØ\0P}aÇúÅ·—;bŸ~ÂŽ^:òGŒìØ#ðè|Ø\0Õ$Ft:*;ðˆ7€°\0È¹ýöÛÿbÆŒß»óÎ;ŸŸ6mÚž	&9rdŠ©j¢]sÍ5ÜtÓMûï¸ãŽµ?ûÙÏî¿å–[þ/5a‡°cPmv\0À\0…tÇ€•|\n;\0`P»ë®».¹í¶ÛÖŒ\Z5êOÓ¦MK.LëÖ­Ë¾¹õÁ´ìÛ·/mÜ¸1=ùä“éž{î‰¹ÚÿtÓM7íÈ]çš¡C‡~Ô_²oÃŽ\rKî(vÄ>ø„=ì\ZùýÖðv\00\0•s|ª	;@Ø\0ô‹‰\'þåw¾óµcÇŽýÓ¼yó²0£3Ž9’V®\\™n¹å–?M˜0¡iÜ¸qÿ¯¿jß…›Wþ´dØû|àvôBÐÑQa„‡°\0aGj|ëÝô­9k³§;\n;@Ø\0ôšiÓ¦ÝpõÕW¿ÿë_ÿ:577wû\0á¹çžKãÆ;2~üø…Ã‡ÿ˜¿pï‡û\ZÖ¥õOÝvìV¹m±Ï>aGùÜÎØèìå…\0PåaÇáÃ¹cÓƒïµœ_þjSKØ§óÛw¿ÝœÞ~ç=Ç’Âv\0\0=cêÔ©÷_ýõ¼ðÂ=zpðàÁ4cÆŒ#uuu»†þý¥{7ìˆ¶õù‡Ž	;b›{ÂŽ:¾Ô…ë½3ˆŸ\Z4aG³WnMß™·.=õò®´ì•Æ4mþú–°#NÇöÇÖìLSs—ùñ“¯¥ï\n<„ ì\0\0z è¸á†>Œõ8zËÃ?üá¨Q£>ü¯üÅ{1ì8|8mþÃÌc§°Êm‹}>ð	;ú)èè©ë;\0 \nÂŽ½šÓ”¹ëZÂŽÚ¤ß¾”vì=èxRØÂ\0 ëbêªÑÑ›AGÞ¢E‹\Z5ªÁÞ	;ÞÙß6­¼¯äš±/.ãCŸ°£‹:ZŒ¼¯oGØ\0\ZvD{|mCÙaÇÜÛæXRØÑ£víÚ•fÍš•n¾ùætõÕW§#F¤Ë/¿¼¥Åùºººtã7¦ŸýìgiãÆžÐ;\0 šÅbä±FÇÚµkûì áý¯ÿµ+w`ù/C‡ý¨ÿ@…‡§ÆÍO§—ŸünÉ #ßâ2qY£<„](zj\nªÁ8ÂÃ§F\0UØSWåÃŒÉ¼”þÃiKÓÛY‹Ó±-¿ÿ‰—|!GØÑ3-Z”Æß*Ø(§ÕÖÖfáÇý÷ßŸýÝv¨@\0@•™:uêË±y_ûæ7¿¹«¦¦æÿî‡æ0ÊCØÑƒÁD>èøH®9ú³3Ú^o°-ZîS#\0ƒ\"ìh|ëÝlòÂ5:\"Üh{¹ØV¸†G\\\'®ë˜RØÑË—/OcÆŒétÈQ¬\Z5*í°\0¨wÝu×%cÇŽýSsssŸ8444|0bÄˆ·jkk?á?Ñ½°£œÑíòðPØQfÐñ¥‚Àâ—GþÙ‰À£ÔõSàáS#\0ƒ\"ì(6MUŒæh{¹ØVì²Ž)…uë­·XŒ92MŸ>=Í›7/mØ°!566¦C‡e—?räHŠiœ7mÚ”æÏŸŸ]nôèÑÇÜÆ¸qãÒ–-[<Ñ…\0@¥»í¶ÛÖÄ]ùþ÷¿¿¡¶¶vºÿD÷ÂŽ®ùæ °£AGsôÀ?u\"ð(:òíŠ‚ýƒe\rŸ\Zv;„=hÿþýÙz…ELE5{öìÔÙ5)ãK€.L\'N<&ôxüñÇ=Ù…\0@¥ºýöÛÿbÔ¨QÚ·o_¿<444ì®­­ÝkíŽî…š°£—”\n ŠíÅ.ÿÿ¹ü`XÃÃ§F\0EØa\Z+aG_W^ye«PbÚ´iÙŽîøàƒ²p#F†®çñ›ßüÆ^Ø\0T¢™3gNÁþvÝu×½–;pü[ÿa‡°£çåž[‹»øüêh1òrrƒŽ¶Ç@ÒÊ§F\0EØñçÊ›Ê^ <.ëXRØÑmGtÄtUTô”†††4yòäV÷1wî\\Oza\0Piî¼óÎç}ôÑ~?€øÉO~²ÒTVå¥…ÂŽÎ(ø&ÚâšššÏ–yµr‡ŽÎ…÷¿gÈÀááS#\0ƒ*ìxr]CÑiªŠµ]³Ó±¤°£lm×è¨¯¯ï•û‰5>b=ÂkÖ¬ñÄv\0\0•dÚ´i{Ö­[×ï¹ƒÒµ¹ƒÆgûÿ£Ü¢´°CØÑ•~UÐžè TëìTR¥ãºtä\rÔ5<|j`Ð„{4§ïÌ[WvØqÓÜ—Òî·›O\n;:´|ùòcFtô¦XÌü®»îj¹¿#F¤]»vyò;\0€J1aÂ„#]°­74555æ…å¥…ÂŽnö«–P­HÿêêšÅ×ºtt÷ñ;\0 ÂŽæ÷§™OoÎ¦ªZðüöôÌ+­×ðˆÓË^iLO½¼+E~µ|K:tø°ãIaG‡FÝjŽžœºª”ƒ¦qãÆµÜïÔ©S=ù…\0@¥ˆÅÖúâ °q°(ì(¯(-ìvôD¿*ÕŽŽ$êîHŠbGw‚Ž¶Ç@YÃÃ§F\0MØ‘<šöÿyÁñX€<vÄéüö·¾\'èv”eÑ¢E-Ç²uuuÝ^Œ¼3^xá…VÓYmÜ¸Ñ€°\0¨”\"h¥v”_”vT~+ãY‘-×\rïíf7Ž©«ÚŽèxíèöî¸÷èmý…°\0ª+ìhÛ\Zßz·%ìˆÓŽ…uíµ×¶¿Îž=»Ïïÿž{îi¹ÿ›o¾Ù€°\0¨•6²C+¯	;Œìè¡í¹ššš/\r:ô£G/šÙÑÕíì(\\´¼³Œì\0€vhÂŽîˆu2òÇ³ñy¶?¦eÞ²eK«ãê½{÷zv\0\0ý­RÖìØ³gÏ.kv”_”î­“…ÅéO<1sÎ9iõêÕÿÁ-ÿ˜…e÷«¶!GÛ`á!½³fGWkv\0€°Cv´˜5kVËqíôéÓûíqLœ8±åqÌ™3Ç‹€°\0èo7ß|óÞ\r6ôûD}}ýÚÜAâ\naGyEéÞ;âô3Ï<“ŽÀÃ‡Ãv¬ª­­ýJ‰£XÀPîHŠbAG¬Ñq\\‘í	<º»†ˆ°\0„Z…cÇŽMO=õT»—‰i£òÇ·óæÍë·ÇúÈ#X¨\\Ø\0T’;ï¼óùÇ¼ß ~ò“Ÿ¬Ì$þPØQ^Qº/ÂŽüùN8¡Õ¾‹/¾8þùÙ¶}ûöeóåžtÒIÙHñãÇ§dû¶mÛ–r?»þ™gž™V­Z•mß³gOºâŠ+²ËÇõ†\r–vîÜ™í‹…Ï>ûìì:±/î+†ˆw´¯ðqçOOš4)|òÉé´ÓNK<ð@¶/.=nã²Ë.ëÕ!v´7’££À££ ¡TÐñ‘vö—xüM®í€A‡°€ªÇN7ÞxcöSØ!ìèùÏCz,]º´èe®¾úê–Ëõçâàõõõ­/Â\0 ŸÍ˜1ãž»îº«ß n¸á†õ¹ƒÄ¡ÂŽòŠÒ}9²ãÜsÏmµ/>tÄ<¹±-‚ŽØöðÃgßªŠÓxÄ¾K/½4;!Ç‚\"uuuÙù_|1­]»6;}É%—dûN9å”ìüÖ­[³é³ât>Xio_±°cÁ‚iýúõÙéSO=5Û÷“ß—¼ƒ!ìè†ŽFVttébà‘ŸJë+ô©îS#\0U!\nÉùbn|‘¤½Â²°CØÑ“aG¾7î˜‘#FŒhÙßØØØouûöí-#Â\0 ŸMž<ù?Ž3æOÍÍÍývðÐÔÔ´»¶¶öÝºººï?Rž¾X³ãøãOguVZ±bE«}‡j¹|ŒÎÈo‹6äèZ…ûÚÞG~û6ëƒÄ¾/¼°e4I„%3fÌÈF‚t´¯XØQø;ÅïRêñ\n;:Tj„G¹AGgüý}e\0?…}j *Äg„¶ÅçX§ ¾Ì\"ìvôEØQ8r\"zncúþräÈ‘Va\0P¦L™ò¿—-[Öo?ýéOŸ¯©©ù…ÿDå„åî‹é¤Ú†1uT9aGah’o±-~·o|ãéÓŸþtv¹3Î8£Ã}…ùóÂŽ.‹m§”\ZÓ‰ £½ÀãŠ6÷3×èv\0PµÊ)>;„½Ýß\nGzTRÀ ìv\0\0fêÔ©µ“&Múðƒ>èo‹½?bÄˆ·FŽù)ÿ‰ê;òSRNc5aÂ„VÓX­\\¹²Õ4V1Ä;ÎÇ:\Z1•Uœ¾è¢‹²}\\pAËÔW1UVœþä\'?Ùá¾rÃŽ/ùË-ÓXÅ‚‚ÂŽN…‹–åC:¸^gEv\0@…ŸcšSaGå·Žþ—ÕØŒì@Ø\0cÂ„	M1]Q_»óÎ;×åïó¨Î°#(oõÅˆ‰htä(µ5\" ˆi§bañXg#¶755e!I~QóXG#3Ï/jþÕ¯~5Û×‹59ž}öÙ÷•vÄcŠ5HbZ«xÜC\n`v”¥í”VT\\Ñ‰ cH‰ë}aÂ€AèÃ?ÌŽÞyçìø)Ž‡vîÜ™-üýÚk¯¥uëÖ¥5kÖdÇKñE‘u½dÉ’ôÄO¤G}4ÍŸ??Í;7û‚ÉC=”~õ«_e_ùÙÏ~£¤Ó½÷Þ›~ô£¥ïÿûéïÿþïÓwÜ‘n¿ýötë­·¦›o¾9M:5Mž<9}ûÛßÎ¦¡úæ7¿kæ¥ë¯¿>[o-Öa‹c£hW]uUºòÊ+³ãµ+®¸¢ì¢s…ñ7‹/ÎÄqe\'ÆÔ§ñ7ì‹cäÙ³g§ÓO?=;¶¼øâ‹Ëº~o~Ùf ì3fLöÈyÊš;\0€’®¹æšÿgÜ¸qGöïßßg\r/¾øâæÚÚÚÿ=|øðùTFØ1ÐÛÇ?þñ¬óOGqaHÁˆaG—î*6E–°€tmsÇ¿--\n¤ÑF\Z•µÑ£GgCv#pˆà!ˆ=Äu×]—_ÿú×³ÀâÆoÌŒ›nº)4n¹å–4mÚ´,è¸óÎ;³àãî»ïÎ‚Ÿüä\'Y0òóŸÿ<JfÍš•\'sæÌÉŠÈ.Ì‚•X\"h‰À%BƒRÅçxœ¿þõ¯S|~ÈûôÇñ]Lk\Zï­åG\rÇ”§}vÄ—fb{|Ù§Ø­ýr‘°#µrä]}õÕ-û7nÜØoµ¾¾¾Õ´n;\0€\n2~üøÊ}z¿/¦³ÚµkWsL_uÙe—}Î_^ØÑW-¦¯Šp£ð›1-–°£ßžN„\0Tl7¾lQ\n¿EŸÿûý÷ßßªøúëø4¿†\\½ÛîÛ³gOÊäý†\r–¨)&Mš”­9wÚi§e!Pì‹ÛŠÑÀqœŠùµà\n÷Å¨ã³Î:+AbÄÇƒ>hdGÃŽYA\\Û~\"ÜË_.¦Òí/qßùÇ	a\0PA†úÑ+¯¼rëC=t¤7vïÞýAîàuWmmíDuaÇ@^\0r€wÃîN=5Ø¦®v\0b1Š#w\\•}äÈ‘-!GL—Uj$xŸÆÈ•xoÀ\"¦Tm×—‹k×®ÍNÇª…¡C|fýúõÙéSO=5Û—û\\Ô²oÑ¢E%Š¶Û#èˆiµvìØ‘m?å”S„Tl$G[¿üå/[B†éÓ§÷Ûc©áòã7¿ù:a\0PirÄ>1zôè}óçÏÿco(ÄˆŽ£AÇtma‡°cÀ™1˜#v\0±vX5Šé´b\Z¬ŽF¦ôçñiL·ÁFñ>H±ÑÑb[©uÞbíÂëÅÔTÑÊ\r;â<eÊ”lm¹R‡°£ûb:Ú|ÈaÜÁƒûü1®×-÷9×°\0¨D¹ÆO\Z5ªáW¿úUSO$Ä\Z1u•ÂaÇ€ÒÙ©¨ëÔUÂ€A,\n²1z \Zµ÷\rûJ	;ò-?¢\"h†…ç»\Zvœyæ™ÙùXûDØÑ»\n×í˜?~ŸßÿÌ™3[îâÄ‰^ä„\0@%‹#FŒø—	&4mÛ¶ípwš››ß¿óÎ;×ÅbäÖèv;uàñ7¹öN®}e?…}jdbáñçŸ~@ÿŽýu|šbú¨øÇéX´<öÅˆš8kqä/¿è¢‹:;bª«!G§±ŠuÊ\r;ò!Iþ¾„½§p*«˜¾,B©¾ÒÐÐÐ2½[´Xa\0PjjjnÈ}Hxó{ßûÞË[¶léÔH¦¦¦Ý3fÌx.Fsäg>ücþ¢ÂaÇ€õ…£AÆÚÙ¿GÐ!ì\0Œb‚åË—;z¡ÅZ`DÐÓP]xá…Yñ9öå>dÓ[ÅBã±?BŒmÛ¶uvÄ4IçœsN¶ÐøØ±cË;rŸ}²ûi»¨¹°£çÅï!b>pX¸paŸÝ÷wÜÑr¿ãÇ÷\'ì\0\0ªI„¹¹ÛsmÇ5×\\óÚÝwß½ê™gžyqûöíÛ\nöíÛ÷f}}ýÚŸüä\'+o¸á†õµµµïÖÔÔü\"¦ÅòWv;…R#<L]%ì\0Ô¢øý»ßýNØ¡õûñé@R8º#FZ¼ñÆ½~Ÿ?þx«µ:bDÂ\0 JÕÔÔ|öhðñD®mÍµ÷ö\ZsmU®ý0×†ÖÕÕý{1a‡°cÐ‚aÀ 7nÜ¸>ýæ¹°CaG¸öÚk[‚‡o}ë[1…r¯Ý×Ê•+[M_uß}÷yqv\0\0 ìv’Àã^A‡°€”Mu3gÎa‡&ìèa1-YmmmK\0q×]w¥#GŽôJÐS¢Y”\\Ø\0€°CØ1ø|!>)½†‡°€Aãúë¯O³fÍvhÂŽ^°téÒVSKÅš\Zûöíë±Û©«\nGtÄH­ýû÷{av\0\0 ìvGÃ„\0ƒ^|üþûïvhÂŽ^#§\n…Q__ß­ÛlhhH·Ýv[«Ût;\0\0v;„;\0­É“\'§ø‡vhÂŽ^´hÑ¢VSZE›>}zÚ¸qc§ngûöíiæÌ™­Fsä§®t;\0\0v;„;\0­ï~÷»é‡?ü¡°Cvô²5kÖ¤#F´\n)¢}ýë_ÏF¬X±\"½ñÆ-ëzÄÏ7bÈ¼yóÒ”)SŽ¹®ÅÈ…>¾\0\0;„Â„Q$ZµjU6gz¼öiÕß–,Y’–/_ž6oÞ¬ƒ÷Ûo¿=}ï{ßvhÂŽ>£/n½õÖcFyt¥?>­^½Ú‹˜°\0€Þ%Ø*ºÊ}˜|_Ø!ìv0‚Žø–ìîÝ»½ö°¶gÏž´lÙ²´iÓ&½DÐ‡°Cvô-[¶³æF¹-¦¬Š „\0\0½lùòå\nK•Û\Z\Z\Z~›û0ùª°CØ!ì` ‹B÷£xÄ,è¾˜Â*¦²vhÂŽ¾×ÜÜœ­çqóÍ7gŒ·æ*Î;6ÝtÓMiÖ¬Yi×®]^´v\0\0ô•§Ÿ~úËË–-{ûÍ7ß|Ï·Ê\ZÑAÇ’%K¶åÚ×„Âa‘†Š£”çÿñÓ¤I“„šç3;\0\0hkÉ’%_Ê}`y.¦K2¿xÅ´ø_¼*èv;,7G)ÏÌ™3Ó7Þèõ@ó|a\0\0 ìv@57ßz7}kÎÚ¬Åi…GÅÑÁ$¦Æ¹á†¼hžÏ ì\0\0\0„Â¨¦âæáÃLû¾×r~ù«M-aGœÎoßývszû÷\"G´9sæ¤ñãÇ;4Ïgv\0\0\0ÂaTKq3‚ŽÙ+·¦ïÌ[—žzyWZöJcš6}KØ§cûckv¦©¹ËüøÉ×ÒwŠ£×Â…³…‘…šç3;\0\0\0a‡°ª¤¸¹÷@sš2w]K¸ÑQ›ôÛ—ÒŽ½#G¬\'žx\"]uÕUúw\\ºt©çŒç3;\0\0\0a‡°Ö7¹_ÛPvØ1÷ß¶)D*ŽhË–-Kuuuúw\\±bEÚ½{·çM…¶¦¦¦,„\0\0€°CØ;bêª|˜1ù‘—ÒÃx#miz;kq:¶å÷?ñRƒb¤°c@[½zu\Z=zô€þ·lÙ’…:o¾ù¦çN…›6mòda\0\0 ìv@9aGã[ïf®ÑáFÛËÅ¶Â5<â:q]…IaÇ@´~ýú4räÈÿ{FàñôÓOgýF«œ&è\0a\0\0 ìv@\'ÃŽbÓTÅhŽ¶—‹mÅ.+`vD[·nM#FŒð‡\0v\0\0\0Âa;4aGuŠµ,jkký!\0„\0\0€°CØÕv˜ÆJØÁ±Þyçï‹\0;\0\0\0a‡°ª ìøóåMe/P—,;²;î¸#ÕÔÔ¤;ï¼Ó@Ø\0\0;„P-aÇ“ë\ZŠNSU¬ýëš‚aÇ€õƒü }ä#Içw^öóÖ[oõGv\0\0\0ÂaTzØ±÷@súÎ¼ue‡7Í})í~»Y¸ ì°AG>àˆ‘ÇwœÀ@Ø\0\0;„PéaGó{‡ÓÌ§7gSU-x~{zæ•ÖkxÄée¯4¦§^Þ•…\"¿Z¾%:|X¸ ìÐAGGÛv\0\0\0ÂaTPØ‘<šöÿyÁñX€<vÄéüö·¾\'èv81‚£½@#¿ß\Z\0Â\0\0@Ø!ì€\n;Ú¶Æ·Þm	;â´ AØ1ÐƒŽŽ‚#<\0„\0\0€°CØUvhÂŽÁ `”;b£³—@Ø\0\0;„ ìÐ„½ttv¤†À@Ø\0\0;„ ìÐ„UtôÔõv\0\0\0Âa;4aG—u´y_ß\0Â\0\0@Ø!ì\0a‡&ìèt@ÑSSPá ì\0\0\0„ÂvhÂŽ>Óv­?ü0;6ûÙm¯g\r\0a\0\0 ìv€°CvôYÐ‘AÅgœ‘Åâg¹G©ë	<\0„\0\0€°CØÂMØÑgAGˆ‘Gbe…AG¾]sÍ5-û­á ì\0\0\0„Âè†(r;4aÇ±JÅ‚‹ör/o\r\0a\0\0 ìv@]yå•éÞ{ïMÍÍÍÂaÇ€ëß1\nã©§žêrÐQjj©rŒÎ#¦´v\0\0\0ÂatÁÈ‘#S<‡GŒ‘î»ï¾’¡GwÃŽÕ«W§‹.º(xâ‰é¤“NJ^xaZ¹reëóÅäj*ñ±Ä°#úv´=–.]ZÖuÊ\r:\n2:tÞÿqÇg„€°\0\0v; \\räÂÑ\"ü˜3gN‡ù¢ïºuëÒ‹/¾˜þô§?-ìvôIØ‘oãÆkw¤Gg§’*h¼ÿþû]\n:ò¬á ì\0\0\0„ÂèF18ßÆŒ“æÏŸßcaGŒæˆçÄÆÙ·gÏžtÅW´Œú6lXÚ¹sg«P`Ò¤Iéä“ON§vZzà²}q[çž{nv«®ºªd€ÐÞí¶‡~8»þ¨Q£²óq8?{öì´oß¾tíµ×f×Û?~|:pà@Ñà¢ðü¶mÛÒÐ¡CÓ	\'œÎ<óÌ´jÕªV—™0aBv{§Ÿ~zzè¡‡Êþ{\\|ñÅéüóÏvt±›Þª«kf<þÝ¿ûw]:ºûx\0v\0\0\0Âa]*¢ÖÖÖ¶üŒ£%b„DÍGµêêê²52¢0ÅÖø–yÐ£p~ýõ×§n¸!}ãßH7Þxcúö·¿ø§L™’¾ûÝï¦[n¹%Ý~ûíéþÏÿ™¾÷½ï¥éÓ§§þð‡éG?úQúÇüÇôÓŸþ4ýüç?Ï‚€Y³fe…ó(ÞÏ;7--Z”üñ¬ÀûÌ3Ï¤ßÿþ÷Yá½T18ß¢è#=ºvÜ}÷ÝY!‹(ðÇü¾ø»Ä¾ñ±víÚìô%—\\Òª¸¿`Á‚´~ýúìô©§žší‹!¿/~¿RaG{·_ØvíÚ•íûÏÿù?gç?ó™ÏdçwìØ‘ýŸâtüMçÍ›—Žÿ[GaÇ¥—^šŽ¿uü<çœsZ]&w„6q:‚œrÿ1%S<^aG×ÂŽÂ‘ñ·ìîHŠbGw‚Ž¶‡5<\0„\0\0€°CØA¯Q£@k\\ìß¿?íÝ»7ûö}|“óæÍé•W^I/½ôRzþùçS}}}Z±bE2DØðÄOdEî!\"Œˆ0!Â‰)~ñ‹_¤™3gfáE„?þñ³P#Â9î¸ãŽ,ôˆð#B©S§f¡H„#\'NLßüæ7³Ð$Â“ë®».+ÒGA7Â•«¯¾:[¢˜!F´ŽŠÁùÖ”Ç\ZqßxÄó#Ø#Úˆc[© áøãou½C‡e­TØÑÞí·mgŸ}v¶?þWñó¬³Î*y_í=Æüùüõ:šÆªØïÕÞß#COOcUn_¨í¼óÎëÖkBL]ÕvDGœíÝ+në7ÞðÂ ì\0\0\0„Âz>ì(¿G±ÁHŒÉë‰°#ßb¤Da¿0H(\'h$”v´wûùëÅ¨“8ýå/9ûaQá4\\…÷¡MO†Å~¯¾\\ëc0ìˆ‘V4Æïò#;º:‚ÂÈ\0a\0\0 ìv ìè\'1*¥m8¦f*¶€swÃŽX¯\"ž«W¯ÎF»ä‹À±/¦ýŠó1W~ñò‹.º¨ÃP ¦v\Zrt\Z«üÔRÅ‚€ön¿mËßN¬±?yä‘VSKNcÁHì‹é§â|L³õØcÆ*Fµ)2U±ß«3ž@CØÑ6ä(,X³@Ø\0\0;v;ªH¬‘/Ç:!q¾”î†±öDìcÔBL×tá…¶,ÖÝÔÔ”…	ùÅ¿#ÄˆéÀ:\n¶lÙ’…LÄ4]¥ŠþíÝ~Û‹ŽÇãrtZ©X,<¶Çåqqýhtä(ðÁÓ)§œ’Ý~L%Vø8¶nÝš.¸à‚ì1ÆYötô{uæïÑv\n,aGñ°#þž1]\\±£XÀPîHŠbAGœ©«Šm/7ðèî\Z\"\0;\0\0\0a‡°ƒAvDXÅùöBŽž\n;´Þk\ZåGÉ;Zko$GGGGAC© #ht´¿”X¿ç¸ãŽt\0;\0\0\0a‡°aGOvTnûâ¿˜-¨.ìè9¬(7Èèlà‘Z¦NêŸ\0 ì\0\0\0„Â„ÂMØÑ=¥Fxt6À(÷ò‚\0a\0\0 ìv ìvhÂŽ#<ÚN)U¸>Ì2§¦*x\\sÍ5­îÇ\Z\0Â\0\0@Ø!ì@Ø1ÃŽ!%$¯ÖÖß¿°£tàQ¸hyapÑ™EÇK]¯³‹¢ ì\0\0\0„Â„Âa‡°£ÓÚNiAEŒÌ(7è(<\n¯×6H@Ø\0\0;„;`Ø‘\0êêêÒI\'”Î9çœ´qãÆVû&L˜N<ñÄtúé§§‡z(Û·oß¾tíµ×f×‰}ãÇOhu½I“&¥“O>9vÚiéÈöíÙ³\']qÅÙuâºÃ†\rK;wî<æqmÛ¶-\r:4pÂ	éÌ3ÏL«V­Ê¶?ûì³é¬³ÎÊ¶ÇãyðÁ[ÝçÅ_œÎ?ÿül[üçž{nv?W]u•°£Êî*6E\0Â\0\0@Ø!ì@Ø1€ÃŽþçN‹-ÊNÿÝßý]«}±=‚ƒ8ÁEì‹ #Î?üðÃiÞ¼yÙé<\n¯·`Á‚´~ýúìô©§žší‹P%Î¿øâ‹iíÚµÙéK.¹ä˜Çué¥—fû\"äˆŸÂÄö:V¯^vìØ‘m?å”SZÝçÒ¥KÓ®]»²m–äGþwvŽÀ£§ƒ\0„\0\0€°CØ°£\nÂŽC‡e-NÇ¨‹bÓ>Åéã?>;—éÎõ\n[þz…-¹¶Û·nÝš¦L™’Þ(¼ŸÂß£ím>FaGåëîÔS¦®v\0\0\0ÂaÂaG6íS©Ð\">.Óöz1eUG×+ Ú{\\¥ÂŽ˜Ò*¶?úè£EÃŽb·!ì¨ÞÀ£³#3,F ì\0\0\0„Â„ƒ8ìˆµ8òÂ¿øÅC‹ütT…ÓXÅÚ]oÄˆÙéXÃ#¦²ŠÓ]tQÉi¬V®\\Ùj\Z«|€‘¿n{aGL5äè4VùÇ(ì¨ŠÊÔU\0Â\0\0@Ø!ì@Ø1ÈÃŽXo#¦šŠé¡bª¨ŽB‹X |ìØ±Yø-‚Ž¶”»^SSSËbèq½$b1òbÓU]pÁÙBägŸ}v¶NGlŸ1cFv½¶Ž2¶lÙ’…$qñX…7ðˆ°..7uêT4\0a\0\0 ìv ì¬aG\0ƒ©	;º¦£58bûqÇ\'è\0v\0\0\0ÂaÂŽÁ\ZväGf#„•¬ÔSW;\0\0\0a‡°a‡°CvTmà!è\0v\0\0\0ÂaÂa‡&ì¨ÚÀã¼óÎt\0;\0\0\0a‡°a‡°CvT§X£#^J­á1Plß¾=­Zµ*-]º4ë;Zÿ·%K–¤åË—§Í›7{\"‚°\0\0v;v;„x}è(èX±bEÚ½{·çN…µ={ö¤eË–¥M›6y\"‚°\0\0v;PÌv;ðúPJŒètTvà#n\0a\0\0 ìv ìv;ðúPBÒ=g<ŸAØ\0\0;„(f\n;4ÅQ¯^4Ïgv\0\0\0ÂaŠ™Š›šâ¨×‡J=h|ëÝô­9k³§=×<ŸAØ\0\0;„(f\n;4ÅQ¯ýzpøðÓ¾ƒïµœ_þjSKØ§óÛw¿ÝœÞ~ç=Ï=Ïgv\0\0\0ÂaŠ™ÂMqÔëCå¼DÐ1{åÖôyëÒS/ïJË^iLÓæ¯o	;âtllÍÎ45w™?ùZ:ð®ÀÃó„\0\0€°CØb¦°CSõúP!¯{4§)s×µ„µI¿})íØ{ÐóÏó„\0\0€°CØb¦°CSõúP9¯¯m(;ì˜ûoÛ<÷<ŸAØ\0\0;„(f\n;4ÅQ¯•õzSWåÃŒÉ¼”þÃiKÓÛY‹Ó±-¿ÿ‰—\Z<÷<ŸAØ\0\0;„(f\n;4ÅQ¯•ñzÐøÖ»Ùä…ktD¸Ñör±­p\r¸N\\×sÐó„\0\0€°CØb¦°CSõúÐ¯¯Å¦©ŠÑm/ÛŠ]ÖsÐó„\0\0€°CØbf¯[ºt©¢â(^„žÏ ì\0\0\0„Â3«×Š+ÒîÝ»hkjjÊ-¼>t5ì0•°„\0\0€°CØbfÅÛ²eKZ¶lYzóÍ7hÐ±iÓ&Ol¯];þ¼@ySÙ”Çe=… ì\0\0\0„Â3û<ðxúé§³\"š6pš ÃëCO†O®k(:MU±ö¯kv\n&„ ì\0\0\0„Â3¯•vì=Ðœ¾3o]ÙaÇMs_J»ßnN;@Ø\0\0;„(f^*#ìh~ïpšùôælªªÏoOÏ¼Òz\r8½ì•ÆôÔË»²PäWË·¤C‡\'„ ì\0\0\0„Â3¯•vä¦ý^p< Ï‡q:¿ý­ƒï	:„ ì\0\0\0„Â3¯•v´mo½ÛvÄiA„°„\0\0€°CØb&àõ¡ªÂMØÂ\0\0@Ø!ì@1ðúÐgÆŽ›žzê)a‡°„\0\0€°a‡b&àõáòª}ÜÑ\"ôXºt©°CØÂ\0\0@Ø°C1ðúPaG¾7®èHa‡°„\0\0€°CØb&àõ¡*ÂŽÂ‘…¡‡°CØÂ\0\0@Ø!ì@1ðúPUaGáH˜ÞJØ!ì\0a\0\0 ìv ˜	‚×‡Ü„•ßzìéÂ\0\0@Ø!ìv\0ðfÌ˜1iîÜ¹Y=;Œìð~Ž°\0\0v;P¨Š°£mÈ‘×^Ø±zõêtÑE¥O<1tÒIéÂ/L+W®ìÑBþÑ‚ä€\n\'fÏžN?ýôtüñÇ§‹/¾¸Û¿¿°Ãû9Â\0\0@Ø!ì@qÔaG]]]š3gÎ1!G9aÇgœ‘×­[—^|ñÅìô§?ýiaGí„NÈ~§¤C‡	;¼Ÿ#ì\0\0\0„ÂG\0º¢ÔHŽÎ„1š#Þÿ6nÜxÌ¾={ö¤+®¸¢eÔÇ°aÃÒÎ;[ð\'Mš”N>ùätÚi§¥x Û·uî¹çf×¹êª«Jû-Z”Î>ûì,8ˆËÆ‰-[¶\r\nÏoÛ¶-\r:4»Þ™gž™V­ZÕîöö~öC©}q;ùÇ“Lí=^a‡÷s„\0\0€°CØâ@7µvÜ}÷ÝYÁ0‹	&d#<òûbÄHì‹k×®ÍN_rÉ%­\nø,Hë×¯ÏNŸzê©Ù¾òû\"0(Uì?å”S²í[·nÍ¦ÓŠÓçŸ~‡áÁ¥—^šŽ0#~žsÎ9ínoï÷hï1tõñ	;¼Ÿ#ì\0\0\0„ÂG\0ú0ìˆktD G¼F\0ÛÛŽ`ˆÛJ÷cýŠÂëÅôNÑJûc}Ø#\'\"¨˜1cF6\n££ð ûmo¯£íÅ~öCWŸ°Ãû9Â\0\0@Ø!ì@q ÃŽ|Û±cG«  0´èhŠbaDGaGì‹Çöo|#[\'$.kˆôVØQì÷hï1tõñ	;¼Ÿ#ì\0\0\0„ÂG\0ú0ìˆµ-âý/¦izþùç[ôGŒ‘µ8ò‹—_tÑE÷cŠ¨!G§±š7o^Ébÿ\\Ð2íÔ®]»²ÓŸüä\'³}±Hœ)²{ì±¢ÓXÅˆ”!E¦±j»½½ß£½ÇÐÞ¾¶¿S{WØáýa\0\0 ìv 8Ð‹aG¬a…ÿýÓPÅÔMù…½›šš²é­bqîØ!F,ÞQØ‹xGÐÓ?;¶d±?në«_ýjvûqÙXãÙgŸÍö=øàƒÙš±oâÄ‰­n#ÖÐˆ \"®ˆGPÓÞöö~öC{ûÚþNí=^a‡÷s„\0\0€°CØâ@/†Ze4a‡÷s„\0\0€°CØâ€°CØáýa\0\0 ì@Ø¡8 ìÐ„ÞÏv\0\0\0ÂaŠ#\0ÂMØáýa\0\0 ìv 8 ìv®½öÚìý»½6fÌ(a\0\0 ì@Ø!ì\0vhÂŽÊ´|ùòÃŽ¹sçúC	;\0\0\0aÂa€°CvT®qãÆ•:êêê²¿Â\0\0@Ø°CØ ìÐ„«½ÑsæÌñvTê‡Š¾þúëóêëë?\\ºtiö×ú¿-Y²$^SöæÚ(}\0„Â„\0ÂMØÑ§Š­ÝkuÕ!ì¨Ôt¬X±\"íÞ½Ûk\\…µ={ö¤gŸ}öÀ’%K¾æã/\0€°CØ°@Ø¡	;úL±ÑÖê ’ÃŽÑ!è¨èÀã¹×ÝW}ü\0v;v\0;4aGŸ\Z?~¼QTMØSWym«ø×Ý÷}ü\0v;v\0;4aGŸŠâq>ì˜?¾?vxÝ­Ž×]\0„Â„\0ÂMØÑçòkwÕÁ@	;Þ}»1½þÜ¬´aÉY‹Ó±Íë¢°\0\0a‡°a€°CØ1@å×î€v¼³¿!­ÿÝ´ôÒc“[µØû¼6\n;\0\0v;v\0;„ÐwÞ™½ŸÇO¨ö°cÇ†9&èÈ·õÚ(ì\0\0@Ø!ì@ØPÈB¹ÂŽà?øAúÈG>’Î;ï¼ìç­·Þê\"ì¨ê°ãÕg~P2ìˆ}^…\0\0;„;\0\n¬X±\"íÞ½[q«B[SSSHÑqÐ‘8bdÇqÇ\'ðè¢]»v¥Y³f¥›o¾9]}õÕiÄˆ-‹¿G‹óuuuéÆoL?ûÙÏÒÆ…½v¬_|{É°#öy}vtGmmí\'jjjrOéË˜kÏäÚŽÂçy®5æÚªÜe~‘»ìØÜé¿T\0\0„Â„\0mË–-iÙ²eéÍ7ßTàªÐ cÓ¦M:j™AGGÛ)mÑ¢Eiüøñ©MÁ³ÃV[[›…÷ßE-/ìÐ„Çºì²Ë>WSS³ ÷Ü=ÔÉçúû~äZÝÐ¡C?ª4\0\0;„;\0*6ðxúé§³âŽV9MÐÑ¾ÁÑ^ ‘ßo\röÅÂîcÆŒétÈQ¬\Z5*í!ìè~Ø±aÉ%ÃŽØ\'vtò3þßäÚs=ñ<ÏµWc´‡ò\0\0 ìv ì\0\0z(èè(È0Â£}ñwi[È9rdš>}zš7o^Ú°aCjllL‡Ê.äÈ‘lÚ»áæÏŸŸ]nôèÑÇÜÆ¸qã²UØÑõ°cóÊŸ–;bŸ@BØQ®ÚÚÚéGGfôèó<×žÈÝÎ§”	\0\0a‡°a\0Ðù\0£Ü½ü`°ÿþl=ŽÂÂeLE5{öì¬ÈÙÍÍÍiáÂ…iâÄ‰ÇCüqaGÃŽ}\rëÒú§n;v\n«Ü¶Ø\'vtdøðá;ºG¯=Ïkjjöç~U*\0\0„Â„\0@‚ŽÎŽÔx´:®¼òÊVËiÓ¦eßìîŽ>ø 7âã…ëyüæ7¿vt!ìˆ¶õù‡Ž	;b›0BØQfÐ±¢/žç¹öN®}M¹\0\0v;v\0\0½tôÔõŠ¶#:b\Z›(`ö”†††4yòäV÷1wî\\aGgÃŽÃ‡Óæ?Ì<v\n«Ü¶Ø\'vtð™þ™>~žª©©ù’’\0 ìv ì\0\0ÚÑÑbäÅíÔÞ1[9·3µ]££¾¾¾Wî\'æþyþGx¬Y³FØQfØñÎþ†´iå}%×ìˆ}q¡„°£˜£ktôùó<FxäîûLe\0@Ø!ì@Ø\0´Pt4U9aG¬#<–/_~ÌˆŽÞ‹ßu×]-÷7bÄˆ´k×.aG{aÇáÃ©qóÓéå\'¿[2èÈ·¸L\\Ö(aG›ÏòS¸y_?Ïs­±¶¶öJ\0€°CØ°\0(L”³ÖF¹aGgow =zt«¹û{rJ›R<˜Æ×r¿S§Nv”;:\ZÍa”‡°£555kúûyž{÷*\0\0ÂaÂ\0 M QîŒÎ„ƒ-ðX´hQK!²®®®Û‹wÆ/¼Ðj:«7\n;Š„åŒæho”‡€BØqÙe—}®žçG,ÿKå\0@Ø!ì D‘#úý`úv\'\0¤ £+aGþ`0Liuíµ×¶\"gÏžÝç÷Ï=÷´ÜÿÍ7ß,ì(vt5èÈ7…°#÷üz´Ržç¹öCå\0@Ø!ì ŸŠ)çwÞ ^°\0*EWˆ®„]\rVªI¬“‘/@Ž92íÞ½»ÏÃ–-[Z­²wï^a‡@AØÑƒbŒÜsëP¥<Ïkjjö×ÕÕý…\0 ìvÐOß\ZâÊqÇ\'ð\0€~:º2Ú²«aGá1Aµò;vlzê©§Ú½Ì¬Y³Z\nÓ§Oï·Ç:qâÄ–Ç1gÎa‡@AØÑƒjjj.¯´çymmíW”\0\0aÇ \n;öïßŸæÏŸŸ¾ÿýïgÈM˜0!û&Nþ\0ñšk®IS¦LIÿ÷Ÿ}(|ýõ×UAz)è,ßî€JoîjàÐ°#ÿÕö¥‡ü1c„K—.-z™˜6*¹yóæõÛc}ä‘Gút¡òþ;jkkçÚß\n;„}Ý¯bÚ¨J{ž[¨\0v’°ã÷¿ÿ}öA~Ô¨QYÈ±páÂ´nÝºl¸ñ|Ðr¹}ûöe‹8>ùä“Ù¨£GÎ>þÓ?ýSvN÷¾5Zª˜Ño•\0]:º4t7ì(ç¡RÃŽ|7nÜ1#=®¾úê–ý}µ8x1õõõ­Â™v|£}qMMÍg…ÂŽ¾êW¹ýÏTÚó<¯\0 ìècå~«\'ÂŽ˜Ç4><Ç¼øÆM„qäÈ‘´råÊ, ¹þúëÓ‚TGºXÄè(È0Â\0ª\'èè©°£ÚŽÚ†…aB>ô1bDËöÆÆÆ~{¬Û·ooyñ˜rØQÐž(ö9CØ!ìèé~•Û¶£Òžç¹Ö¨º\0;úéà±£o`u÷ƒóoûÛì›u¿þõ¯Ssss·$Ÿ{î¹ìÛ{1ÍUL‡EùÅ‹rGlTëüÝ\0P-ÊIQbôt«öc€RaGáHÂó‡ê·Ç\Z_Ú)|,ƒ$ìhùœQXœv;zº_Uêó\\u\0vôÿÁã%Fztù ïÇ?þq6ã…^èÑƒÉƒ¦3f¤«®º*mÛ¶MÅ¤¾¥)ð\0€ÞñÆodéóÎ;¯œ¢uŸ†!WGaBµµJ\ngSØQø9#¾\\%ìvôt¿ªÔç¹ê\n\0 ì¨ƒÇ\"Ó[u9è¸á†²õ8zK,^ëyÄºô\\ÐÑS×\0Š+gzÉ!Fv”UT,lcÆŒIsçÎÍŠ¶ƒudG%‡NÂŽÊoÕj\ZÙ\0 ìèðX]	;bêªÞ:ò-Z”®¸â\n#<JQºTTÛ‚¥\0P-¬ÙÑsýÂ#Ïšñ¹â¹Üç‰/\r:ô£q¹Þ;î¾ûîô™Ï|&pÂ	éãÿxö7Žõc_þyQ\r!C¥<Ö*ÙÑÒ¯¬Ù\0Ðõâÿ lýà.bŽµk×öÙÁåÃ?œ®»îºVp=÷­L#<\0 wî¼g÷DØQm_nÈ§ÖÕÕe#}‹Æñhþr7nì·ÇZ__ßjõAv´\n9òz:ìˆimã÷ýüç?Ÿ}«?¾çÏ9çaÇÀ;ŽéW¹mÏTÚó<fJP]\0¨œp§íAd§ôn¹å–l1ò¾6qâÄtï½÷*š´)š|øá‡ÙëøÙm¯g\r\0èÝ÷î®\rÝ\r;zè¡tÜqÇUÕ—\ZŠähë¦›nj9¾7o^¿=Ö¸ïüãˆÇ4ÀÃŽUµµµ_irôVØqî¹çf¿ï‚:öíÛ—®½öÚtÒI\'¥O<1?>8p Û!ÉÙgŸ‰ý_|qËè={öd£Èã:±oØ°aiçÎÇÜW{·Ÿq»çŸ~¶-\nóñøãò±aácmï>‹ÝÖ ;Jö«Ü¾û*íyIµ\0 ÿÃŽ¢ßÀêÌçßÿþ÷Y¼¹¹¹Ï0\Z\ZÒÈ‘#Ó®]»KŽ+\"¨8ãŒ3²Dñ³ÜÀ£Ôõ\0Ð;º3²¢;aGþ½}êÔ©îoúË_þ²å8wúôéýö8&OžÜò8~ó›ßÔ°£Ôçˆ^\r;\"œˆß7*´vD§cDx¦ãt±ï”SNÉÎoÝº5­^½:;bôPœñÅ³‘ëqú’K.9æ¾Ú»ýüãXºtiöY%¶åþV-AM~DJþ±¶wŸÅnk\0‡ö«ÚÚÚQ•ö<Ïµ¯©6\0\0ô_ØÑî7°:óÁ9>¨ÏŸ?¿ß2ï¹çžA;ÕR±o…FðTX\0)\'ð(:òíšk®é‘bÌÿßÞýÇX]Þ‰w1ÖkÜÄÖØ¤k6»ÙÓ³üa¼	Á4æ&ñ&½mo—2€€€ øT„Š?©ìX]mwµ 4-†²e\"•KÅ^pYXŠ¢T)™\n(0à:ÂŠÍsçó½žñÌáœ™3?Ï™9¯Wò„33gæÇùž™ó}Ÿçy\0€žý.ÈØ1œCGˆWæçþÞÄœ<yrÐïCÁ:þƒò¢œJÄŽrõwì8÷Üs³ÿÞ˜UÑ]ìˆYq9–»Š—ã}ñ±Q£FeoG<¹îºë²å±bvEþçåÜçå®¾~îóâý]]¿ð¾»Íb_k¸ÆŽr´ÛÙ~lª¢ãüTûsë¿p¶\0`ðcGY¯À*÷‰skkk\Z?~|öd£RbvGû—5·wG©\0Q,\\t<Ê½¾=<\0`à~§÷tI©ÞÄŽZyñBþ¾•xAÎâÅ‹;n?–\\µ;boŽsÊ\\Æ*–ƒ*Œ^xaö±x;îÛí·ßž.½ôÒŽ¿£DW÷¥«¯N‘ý8Ê‰ÅnóœÞÛc¨ÅŽ/ž×¾R-ÇyûXêL\0@u+ë¼øÃòþûï¯ø“Ú[o½5­[·nÈ=Y½¹ßÝmF^nÀèi±¤\0\\ðèÉïØžÆŽZúž¿”Õ-·Ü’<,¹%Vs·¿uëV±£ŸcÇ3Ï<“ý÷^ýõÙÿÛ^x!{ûoÿöoÏ\n¹¥¡ò—™ŠŸ‰øØÕW_½ÿböM\\þÚ×¾–}¬®®.{{É’%Ù²RqyôèÑgÝ—®¾~±@ËRåBMîú¹ëtu›bÇÙò—²ªôqÞþÿîïœ>\0\0±ãÑGMkÖ¬©ø“ÚE‹\rÉW)æþ@ŽèkðöçÉŠîBFOCGþíµ\rM`(èÉ,ÊžÄŽž†”¡.NÞN˜0¡ãï¬_|qÐn{Á‚·{7–ZŠ1\"ÄFßù›‹G´(¶Ayü³&bÄIñÜ^Hßþö·³Ï¯ûu¼úê«ÙÇš››³‘Ûx<\"E\\¿Øå¥¾~±@Ë¬ÅÌ”¸½ü¥g»»M±ãl±RAûqöûJçcÆŒùµS\0\0Ã$vÄ¬Ž]»vUüIml*KÕØ‘Ó¦Mër¦GO—’*4Îœ9Ó«ÐQxÒDð\0€ÊrcGo–È\ZògwÄ+°÷ïß?à·¹víÚN×Åß§bÇÀÄCìù³;*tœŸ3fÌN\0\0“Ø¯^jii©øÚx%TLýê±#¦GaôèížÅ‚ÇW¾ò•^‡Ž¾Þ\0 ï¿cË‰µþ»zúôé[Ýyç©­­mÀnkË–-–µyê©§õ¿Uì0j1v„öãmM¥Žóö1Ãi\0€a;â½Ï?ÿ¼jÂÁp‰ù3=by«¾Î¤(<ú:\nO¢ØÃ\0úW_—žªµ¥«Š‰%€ÆŽÛñwÕÂ…ÓgŸ}6 \'@cù¡ÁÞ”\\ì0ÄŽsÎùÞ÷¾÷Õöãîè`ç6%\0†±£šCwá`¨Žï|ç;ÙØ‘#GöéûKWÎèˆ·ãý}÷+¾Ö`L€Z=}±ƒ#|)^4’ÿwU¬µû,ô—XÒ&ÿ•ÞñB•ÖÖV±Cì;Ñ˜1cþ{ûh¬ã¼}¼ü½ï}ïÏ2\0\0f±ÃÌŽ	4\'NL\r\r\rÙ“þxu¦™\0_:xð`¶‘mœ<FåÇúõëÓ¦M›Ò¾}ûü€–ø][nð°ÌäÙV¬XÑéï¬xuö¶mÛúô5:”|ðÁ³fäV\"tˆF­ÇŽ0vìØÿÕ~ž\Zèã\\è\0\0Æ±£Zöì8zôè°Ø³£0rôÇÉ{v\0t›7oÎ~w9ÁU]#~—766¦½{÷úAíåïÜeË–e×›7ožoZÕ«WwZÒ*F}}}Ú³gOC/^\\ø*ïléªJ…±Ã;þ¿¿ÿû¿ÿíÇãÇuœÇÒUB\0À0Ž÷Ýw_zçw*þvûöíiòäÉC6vÄ+âU‡Å\"G±“åÎ¤(:âíXºªØûË\r}ÝC RbF‡ÐQÝÁ#fÜPúwo©¿âý#FŒ:º°sçÎìÅ1…/6¹í¶Û²¿Ã\"„Æ²œ¹õþãß8é¯_¹reš;wnÑ¹ƒ½¹Øaˆ¥;öòöãò½~>ÎÏØŒ\0 bÇ£>š­aZi‹-JóçÏrOº»šÉÑ×Ww–\n¹ ÑÝÇ»zÕhœL:€¡(N¤;±Uý\'ÝèÙß\0f[–/f_Ä÷©p–GoÆŒ3²ÜT±Ã;¾³/ÚñúÂY½cÆŒùuû¸Âé\0€\Zˆñê—…Vü	^,P\rÑe°_ÝYê¤F¹!£§Á#w2Å«F¡ÊI7±c¸¡£wšššŠ­Å_Öˆ¿;c–X5;±ãlãÆûËöcö‡ù›——9bï¥uuuç´\0\0@\rÅŽÃ‡g³ÚÚÚ*öä®¹¹9{u^%ïC5½º³§£Üë@­ÅŽ#~’î\\ñf6â²bbGµý\r0räH¡£âïÇØÏ#fÇã…Ë\\ÅÛS§NM÷ÜsOZºtiö·o5;±£´I“&ý·/öóx<6/²ÌÕ‘öç“ÿÖþïScÆŒù~ûå¿p:\0\0 cG¸÷Þ{³\rE+å™gžI³gÏ®É\'è¹õ¹óOrÄòsz¸4U±àqÓM7uº\'S€á;NŸþ¯tüä§ooúCsGìˆË¹÷·|Ô–>úøS\'ÈÄŽŠºùæ›cy•´`ÁßÄCì\0\0€þˆñj¸»ï¾;}þùçy5Þ¸qã²¥jUá†¥ùá¢\'›Ž—ú¼žnŠ0cG„Žå[ÞM?X¹+­ûýáÔ¸ûHºÕÛ±#.Çû_Úù~š×~\'ûŸéÄ\'‚‡ØQ9“&MÊ^‘b‡!v\0\0@?ÅŽ0sæÌ´yóæAbW__Ÿ-+Pë\n—´ŠP33Ê\rùÁ#ÿó\nC\nÀpÇN´¥¹\r»:âFwãî}+½wì¤“dbGEüüç?ïX~¥–_ðØaˆ\0\0Ðï±#6uŽ[[[íIÝÎ;Óøñãõ6‡Rðè«bKd×Øcí›‡ÊŽ\rÿqÀ	2±£\"r³Zs±Ã^Zˆ†Ø\0\0ý;B<ÙþÉO~2(ËYÅæñD?–Ð¢ÿƒG‡€¡;béª\\Ì˜óü[éWÿ¾?55”¸ïË}üå·9A&vTÄc=Öií±cÇ¦cÇŽùÆˆb‡!v\0\0@ÅŽøC96Ç^¶lÙ€>™kiiI7Þxczâ‰\'<³-¢¯KOYº\n¨µØqäÃO²\rÈó÷èˆ¸Qx½x_þñ9ñ¹N”‰ƒ%¢FÄüØãÇ?þ±oŽØQµ\'«7lØà±­ºÇ©öÇÝ3žþ\0 vˆ7ÜpCZµjÕ€<‘‹¯¡ÃŒƒò‚EO¿O6#j1v[¦*fs^/ÞWìºN”‰ƒ%fÑ†ŽuuuÙòVˆÕhÓ¦MGâÅJßªs:tè_Ûwÿàé/\0\0bG±Qf¥K—öë“¸Ø£#–®2££gá¢Üàaé*@ì;ÄŽêµk×®¢¡#7\Z\Z\Z|“ÄŽª´qãÆo566~ôÁ|ê1®ºftDèX¿~ýöñ¿=ý\0@ì(!f`Ü|óÍiæÌ™éÀ}úZñJÅúúúl3r{tLðˆ¥Çâz69j1vXÆJì\n¦M›Öeìˆ¥D;ªÕúõëÿgû±ý»X.)Žq£*Fü¿øƒÐ\0€ØQ¦XC:fcD¬øãÿØ£ÏmnnNK–,É>ÿî»ïN­­­žÉöBw{pÄûGŒ!t\05;¾Ü ¼¹ì\rÊãºÂ„Ø1XbÖì¤I“²¿‰b”\n›6mòÍ;\0\0\0ˆØ\"R<üðÃÙzÒ1Ûã\'?ùIzõÕWÓÁƒ;]ïøñãiûöíiÑ¢EiÖ¬YÙœ³gÏÎžàÓ7¥fxXº\n;¾¿Ýu¨è2UÅÆov¾/LˆËzÎ™3\'íÙ³\'ëÖ­ËþEì\0\0\0`€bG¾\r6dá#–b(|ebÄxÕâüùóÓÚµkm´9ÀÁCè\0ÄŽ/Ç±mé+w•;îix+µ|Ô&Nˆ³páB¿Ã;\0\0\0*;¨Žà1räH¡;òFÛ§§Óâû²¥ª~½ã`zewç=<ârãî#iÝïgQä›šÒ©Ó§Å	±£bâwx;\0\0\0ÄŽš{tÄLšR{x\0ÔbìÈæÖ/7\rÈs±#.çÞÿáÉO…±£âæÎ›-eb\0\0€ØQ³\"v\0ˆ]#~Ò;â²!vT“Ø×,ö9±\0\0@ì;\0†‰cÇŽõ{ì0ÄŽjvë­·¦¥K—úF v\0\0\0ˆbÀp1~üø4þün£‡Ø!vÓ§OO\r\r\r¾ˆ\0\0\0b‡Ø0\\Œ7.{l‹ñÈ#¤ÖÖV±CìÖ¦L™’~ó›ßøF v\0\0\0ˆbÀp1vìØŽØ‘Ï>ûlvò\\ì;†£I“&¥W^yÅ7±\0\0@ì;\0Êñ§?ýiH<®±¼ÕªU«Ä±cØ™0aBÚ¾}»ob\0\0€Ø!v\0”:ŠE„ºººlÄòQâÄë\r7Ü&Nœ˜&Ožœ-±3uêÔtÓM7¥3f¤™3g¦Ûn»-ÝqÇiöìÙiÎœ9iîÜ¹éÞ{ïM<ð@zè¡‡ÒøÃôÿðéñÇOO>ùdú§ú§´hÑ¢´dÉ’ô‹_ü\"-[¶,­X±\"­\\¹2½øâ‹Ù>ëÖ­Ë^Ý^*väFÜ·ø\\±Cì.âØÛ½{·ob\0\0€Ø!v\0”û˜{`|üñÇéøñã©¹¹98p íÛ·/;ÙºsçÎìæ[¶lIY€ˆA\"ÂDD†,\"\\DÀˆA#ÂFŽ<\"|D\0‰A$ÂH’%L\"œD@™6mZT\"¬Är>ÝÅŽÜ2Wb‡Ø1\\ÄÏôûï¿ïØ\0\0 vˆ\0å>f;v¬êïc±qË-·¤µk×v\\Oì¨þÑ]¸ªäˆÀ£pVS·o¼±c6SüÜÝzë­iÖ¬Yé®»îÊâÝ}÷Ý—|ðÁôÈ#¤G}4‹}O=õTZ¼xqÿå_þ%544¤Õ«W§—_~9›±´uëÖôúë¯gQ±©©)‹ÛÚÚ²ûqâÄ	Pˆ\0\0\0b‡ØPŽ8©\Z39ªUÌ:)<)=oÞ¼¢û”;âóFÎ?ÿütÁ¤Q£Fe³Vâc_œP,úy]}l8ŽåË—§K.¹${î¹éšk®éòº=ùÞTëÌŽS§Ne¡áðáÃYxˆ\0!\"‚D„‰*b6S|o–.]šž}öÙôôÓOga#G„Ž>\"€D‰ÙK1séæ›oNÓ§OÏ‚I„“(R\"¨DX‰À’›¡”ûw(ì§ƒØ\0\0 v v\0U¡Ú÷Ø³gOÇ	àˆq2º”rbÇe—]–8ÜµkWzã7²Ë—^ziM®Æyç—}/bvA„€á;ªÐØ\0\0 vˆbÐñêò;vTíý‹Y\'?üpYKm•;b6GüŒˆRê¤},S3?bfCìGRxB?w9^_ïÊ+¯,úõb&ÀW\\‘…ƒ¸^ÌˆYÅAþÛñßüo|#û¼Ë/¿<›]ÐÕû=šmÒž›­òÝï~7[©»ûPêcñur÷§ð¿¹Øý;@ì\0\0\0;;€Šš8qbzíµ×†ÅK9±ã±ÇËN^xá…YÔˆ…\'ð#D¼ˆË_|qÉ“û/¼ðBvÝ¸|íµ×žu[]tQö±wß}7[>+._uÕUÝÆƒë®».»1#þ˜ÒÕû#ºÄÛ1SåÍ7ßÌ.ó›ßìö>ôöþ‰ v\0\0\0ˆˆ@U™<yrZ·n]ÍÄŽ±GG‚ñ;1H©ú±gE©“û±¼SŒ¸³!\no\'ö‰ÅÌ‰?ýéO³YÝÅƒÜÌŠÂ¯×ÝûóGîþtuz{ÿÄ;\0\0\0ÄÄ ªÄ†É1;¡–bGn¼÷Þ{Â@¹\'ô‹ÅŽXªðëÇÇâ>Ý~ûíÙ¾ q½Ø3d bG±½5ºº½½bˆ\0\0\0bbPU¦OŸž\Z\Z\Zj&vÄ^ñ{0–mŠ½JÊ=Á_ìrìç±fÍšìòõ×_Öm]}õÕËNÅÆêqùk_ûZö±X+Þ~ûí·ÓK/½Tt«˜rN‘e¬\nß_WW—½½dÉ’ŽM×GÝí}èêc…ß‹®î¯Øb\0\0€ØØTÔÌ™3³“öµ;bO‹1\"–¨Š¥œr}÷4vÌ˜1#û\Z±ÏEì{Qx[±¡ø·¿ýílÖG,×{õÕW³=÷ÜsÙžñ±Y³fuúúñµ\"DÄçÄâfºzsssÇféñßûuÄmwwºúXá÷¢«û+v€Ø\0\0 v v\0Kýìg?«™ØÑ£\'\'÷\r±Ä\0\0\0±±`wÝuWzúé§ÅŽŒ˜=QlCrCì\0±\0\0@ì@ì\0*`îÜ¹éÉ\'Ÿ;±Ä\0\0\0±±šî»ï¾T__/vbˆ\0\0\0bbG%<x0Û`xÃ†\rÙ‰4cèõë×§M›6¥}ûö9¨ØÃ?œ,X vbˆ\0\0\0bbG%CÇæÍ›SKK‹‰Ãl=z4566¦½{÷:°PÌêˆÙb‡!v€Ø\0\0 v vTHÌè:†wðˆ;œ\'žx\"Í›7Oì0Ä;\0\0\0ÄÄŽJ‰áN :9Jï=ýôÓé®»î;Ç3ˆ\0\0\0bb‡“›†“£CÓ’%KÒwÜáñÀp<ƒØ\0\0 v vTûÉÍO>:’þø»¥éõ²—ã}N>:9Zë–-[–fÎœ)vŽg;\0\0\0ÄÄŽj>¹ùqë¡ôöÿ½?½õÒœN#ÞsÒÉÑZÖÐÐ¦OŸ.vŽg;\0\0\0ÄÄŽj>¹ùÞ;ÿç¬Ð‘ï¿³Æ	H\'GkÚêÕ«ÓÔ©SÅÃñb\0\0€ØØQÍ\'7ÿðÊJÆŽø˜NŽÖ²uëÖ¥É“\'‹†ãÄ\0\0\0±±£šOn¾ýo•Œñ1\' ­e¯½öZºá†ÄÃñb\0\0€ØØ!vNŽM;vìH&L;Ç3ˆ\0\0\0bbG5ŸÜ|gý‚’±#>æ¤“£µl÷îÝiÜ¸qÃâ¿eÃ†\rŽÇ3ˆ\0\0\0bbÇðŒû¶<]2vÄÇœ€tr´–8p ;vXü·lÞ¼9µ´´8nªt477gA\n;\0\0\0ÄÄŽ^ÄŽã‡v¥·×=xöVíï‹9	)vÔ²ˆÃ%v455¥ÆÆÆôÁ8vª4tìÝ»×Ab\0\0€ØØÑ›ØãÝËÎŠñ>\'!ÅŽZ×ÖÖ6¬7\"xlÜ¸1û¹1ªg v\0\0\0ˆˆ}§O§}ÿ¾øì%¬ÚßÄŽZ¶`Á‚4fÌ˜ôÃþÐ7@ì\0\0\0;;ª1v|Üz(íÝòTÉ=;âcqQAì¨E?úÑÒŸýÙŸ¥‘#Gfÿ>ðÀ¾)\0b\0\0€ØØQ5±ãôétdßÆôûßÞ[2täF\\\'®k–‡ØQ‹¡#8bfÇˆ#\0±\0\0@ì@ì¨†ØÑÝl³<Ä¡ãGEgr”z?\0b\0\0€ØØ1È±£œÙ]ÍòÄŽá,fpt4r·‡€Ø\0\0 v vT0vô6tä†À v÷ÐÑ]È0Ã@ì\0\0\0;;*;±ƒÒ£Ü=½>\0b\0\0€ØØ!vbÇ€‡ŽžÎÔ<\0Ä\0\0\0±±Cì0ÄŽ!:úëó;\0\0\0ÄÄ±Cì;z­»ÍÈûë\0 v\0\0\0ˆˆb‡ØAE-Ae†€Ø\0\0 v vˆ†Ø1h\n÷ÚøÓŸþ”¦NšýÛ…Ÿg\0±\0\0@ì@ì;±cÐBGnF„ŠË.»,;Yÿ–<J}žà v\0\0\0ˆˆb‡!vZè13ã‹eeüÐ‘7ÝtSÇÇíá v\0\0\0ˆˆeˆ“Üb‡!v”¯T€(.º\nå^ß\0b\0\0€ØØÑÉ“\'§ÿøÇ©­­Mì;jæøYëÖ­ëuè(µ´T¹£§aÄ’V\0b\0\0€ØØÑ…qãÆeÿ-uuué©§ž*=Ä±c¸¿1\"zlØ°¡¬Ï)78t2z\Z:òoÄˆfx\0ˆ\0\0\0bbG¡ˆ¹¿1\"~¬X±Bì;j\"väÆ´iÓºœéÑÓ¥¤J3gÎô*täØÃ@ì\0\0\0;;Ê8é›\'NL«V­;ÄŽšˆù3=\n£Go÷Ì(<¾ò•¯ô:tôõþ\0 v\0\0\0ˆty²tìØ±ÿÆˆÙ1CbüøñiÂ„	Ùˆx0iÒ¤lŒo¼1;©\Z¯&Ÿ>}zš1cFš9sfºõÖ[Óí·ßžfÏžîºë®t÷Ýw§¹sç¦{ï½7Ýwß}é¡‡J?üpzä‘GR}}}züñÇÓO<‘þùŸÿ9=ýôÓé™gžIK–,IK—.MË–-K¿úÕ¯RCCC-V¯^Ö®]›È}å•WÒk¯½–¶nÝZò¤onÜpÃ\rÙL±Cì¨…Ø‘?Ó#–·êëLŠbÁ£/¡£0xØÃ@ì\0\0\0;è³8A{\\´¶¶¦cÇŽ¥÷ß?8p íÛ·/íÞ½;½õÖ[iÇŽiÛ¶mióæÍYdˆØðòË/gñ!\"DÄˆˆ	\'\"Rüìg?K‹/ÎâEDŒ\'Ÿ|2‹\Z7\"r,X° ‹?\"‚Ì›7/‹\"GfÍš•î¸ãŽ,šD<¹ùæ›³˜\'n#®L™2%‹-]\"bÄèî¤onˆÃ”û³P+ã;ßùNvâkäÈ‘}zœˆ¥«\ngtÄÛñþ¾ˆû_kÿþýŒÄ\0\0\0±ƒÚVêDo„‘˜	’#v˜ÙQ?÷1+d|?BnfGogP˜Ù v\0\0\0ˆ0ÀbVJáÉÞXR«ØFÍƒ;¶oßžFÎ?ÿütÁ¤Q£F¥-[¶dË .öy]}¬Ò£šï›ØQ:röì\0;\0\0\0Ä¨B{öìé8Ùû„ÄÛ¥FìÈÞµkWzã7²Ë—^zé‹bÇÐ‰±¤[,#W,råÎ¤(:âíXºªØûË\r}ÝC\0±\0\0@ì`ØijjÊöùè*rfìˆÙqÜÄý)\rn¹å–læÇ%—\\’ísRr—ã$v|½+¯¼ò¬¯·Çubùx;ö.‰·—/_žŽ?žísŸ·3]Nœ8Q4\\ä¿{µ|ãßHçw^ºüòË³Íß»»ßGÍn;7“å»ßýn¶ïKþç]sÍ5éª«®;úYW39ºÝ…†R¡#4ºûx)ñs3bÄ¡@ì\0\0\0; ·#v<öØcÙ‰†/¼0‹1Ã£0,ÄÆî/âòÅ_\\2v¼ðÂÙuãòµ×^Ûév>œ½ÿ¯þê¯²·ÿú¯ÿ:{û½÷ÞËBG\\Ž ²råÊìrîbÇu×]—]ŽÈÿFdéî~G‰·cË›o¾™]þæ7¿Ùéó6lØÝ_±£:t7³¢ÜÑÓà‘-óæÍ«šïÅÁƒ³Ÿ÷øŸ£òcýúõiÓ¦Miß¾}V;\0\0\0Ä¨Tìˆ{tDˆàÇPR¡áÜsÏ-;N:•¸3\'\noçŠ+®È>öÊ+¯dÿ~ýë_ÏÞ×-õù]ÅŽÜçu·ŒUþýÎ}Nþ(¼­¸–±ª.¥fxô4`”{ýj\r›7oN---Cni¹á>bÆXcccÚ»w¯ƒÄ\0\0\0±*;r#fY”\Zº‹±DTá×™#ñ±o}ë[Ù¿1£#)­üÏðÒŸ±£ðsŠs*°×‡ØÑ³…KJM:µÇKS7ÝtSÙ3I*%ftÕ<bÆ\r v\0\0\0ˆPØ{]Äq³}ûö´cÇŽŽÆ½‰±¿Áš5k²Ë×_ýY·•[¢*öØˆŸþùNKKå/ca$>ËOÅÛo¿ývzé¥—Š.c3SÎ)²ŒU±û]WW—]^²dIÇ†ì£G;†PðÈß´<?\\ôdÓñRŸ×ÓMÑSœHª{8žAì\0\0\0; B±#ö­ˆ“ý1ã!–z\Z5jÔY}—;bŸø\Z±¹÷»ï¾{ÖmÅ¦ãññs¾XV*^	ï\rÊãúqbDèÈmPþÜsÏ¥‹.º(›ý»çßnÜÆÕW_Å“X\"+‚Mw÷»¹¹¹c#õ¸­Ø¯#6:;†ŽÂ%­\"TÄÌŒrCG~ðÈÿ¼ÂR‹†ãÄ\0\0\0±jöäf%\"“£‚G.5Ul‰¬¡üxpäÃOÒ+ÞÌF\\v¬9žAì\0\0\0;@ìèfäfd8ÙéäèPýN*ñxpúô¥ã\'?íx{Óš;bG\\Î½¿å£¶ôÑÇŸ:öÏ v\0\0\0ˆ vNŽV‹¾.=UíKW•óx¡cù–wÓVîJë~85î>’î_õvGìˆËñþ—v¾Ÿæµ_çÉßþg:ñ‰àáx±\0\0@ì\0±Ãpr´ê‚GOgfTófä=y<8v¢-ÍmØÕ7ºwÿë[é½c\'Žg;\0\0\0Ä;\'G«IO—¢\Z*KW•ûx°öÍCeÇŽ†ÿ8àØs<÷«Ã‡§¥K—¦ùóç§)S¦¤ºººôýï¿cÄÛ“&MJ³gÏN‹-J{öìñ …Ø\0\0 v vNŽÒ—€±lÙ²ìzóæÍ6±tU.fÌyþ­ô«ßŸšš?ÊF\\Ž÷å>þò[‡{Žç~±zõê4cÆŒNa£œ1vìØ,~<ûì³Ù÷\r±ÃÓ\0\0\0±±Ãpr”<ÝíÁï1bÄ¥Ž|øI¶yþ7\n¯ïËßÃ#>\'>×1èxîM›6¥‰\'ö8rãÇÏf{ v\0\0\0 v vNŽRÆ¡¸tUwÅ–©ŠÙ…×‹÷»®cÐñÜSqü‹qãÆ¥úúú´råÊôÎ;ï¤#GŽ¤S§Ne×ÿì³ÏRKKKÚ»woZµjUv½	&œõ5¦M›–ššš<€‰\0\0\0ˆˆ†“£”\nC=tˆŽçJkmmÍöãÈ±ÕòåË³˜ÑmmméÅ_L³fÍ:+z¬]»Ö˜Ø\0\0€ØØa89Jað9rä¥,cåx¬Ð1yòäNQâþûïÏfpôÅçŸžÅ˜’¿ŸÇ/ùK`b\0\0\0bb‡áä(9±GGœ@-µ‡Çpy<hÜÝ\\öåq]Çžã¹\'\ngtÄrU*úË¡C‡Òœ9s:ÝFCCƒ0±\0\0@ì\0±Ãpr”œ8q:Ü~»ëPÑeªŠßì|ß±çx.[áÛ¶mÛ‰=>b?ü;wîô\0&v\0\0\0ˆ vNŽR±ãØ‰¶ôƒ•»ÊŽ÷4¼•Z>jsü9ž»µiÓ¦³ft¤ØÌ|áÂ…·WWW—>ìALì\0\0\0;@ì0œe¸ÇŽ¶OO§Å÷eKUýzÇÁôÊîÎ{xÄåÆÝGÒºßÎ¢È/65¥S§O;þÏÝš0aB§=:úséªRNž<™¦M›Öq»óæÍó &v\0\0\0ˆ vNŽRËXEðhnýrÃñØ€<;ârîýžüTèp<—eõêÕÁaÒ¤I}ÞŒ¼\'^ýõNËYíÙ³Ç™Ø\0\0 v€Øa89*vÔÚãÁ‘?éˆqÙ±æxî©éÓ§w‡åË—úíÿã?þcÇíÏŸ?ß™Ø\0\0 v€Øa89*vx<0Ïå‹}2r¡aÜ¸q©¥¥eÐïCSSS§ýBŽ;æÁLì\0\0\0;ÀÉMÃÉQ±Ããáx.ÏÒ¥K;\"C}}}ÅîÇ¬Y³:îÇŠ+<˜‰\0\0\0b8¹i89*vT«©S§¦uëÖy<p<WÍÏ[,•‹+W®¬Ø}}þùçmT.v\0\0\0ˆ vNŽ2bGîdnœ„Þ°aƒÇÇsÅÞ¦L™Òq½Jn¾mÛ¶N÷±\0\0@ì\0±ÃprTì¨ò“Ï¹1mÚ´¢¯¼÷xàx¬Ÿ·ºººŽ9r¤b÷õàÁƒ÷#îb\0\0€Øb‡áä¨Ø1DN>ç¿’=ÿ$´ÇÇó`ý¼å¿ÿÔ©S»¯Ÿ}öY§û‚Ø\0\0 v€Øa89*v±“Ïù¯¼å†<8žëç­šƒØ!v\0\0\0ˆ0Ä	N\'e`Oî•!vTÿ.?kfv v\0\0\0ˆÐ¯6oÞœZZZœD¦£¹¹¹Ë\r©©í3qâÄÔÐÐý¬„JÇŽíÛ·§Ñ£G§óÏ??]pÁiÔ¨QiË–-ÙÇ¾8YYôóºúX©±|ùòtÉ%—¤sÏ=7]sÍ5%¯—ÿµ{s;fvÿy³gb\0\0€Øýª©©)566¦>ø@¦¡cïÞ½~ÐÅŽ.#GN¥cÇe—]–”ÜµkWzã7²Ë—^zé€„†óÎ;/ûz\'NœÈf”ó9bGÿý¼M™2¥ãã{öì©Ø}Ý¶m[§=E;\0\0\0ÄâÁcãÆÙI4cø¡ƒÂ“Ï“&MJ+V¬8+rTKìˆÙñ;6N~—\n\r·ÜrK6ó#fe,[¶¬äì‹øo¯wå•Wžõõâós×Ë}Þ«¯¾š¾þõ¯g$¾ösÏ=gfÇ\0þ¼ÝsÏ=×[¹reÅîkÜvî~Ä}Bì\0\0\0;\0 J•šÉQm±ã±ÇËNJ^xá…YÔˆ…±cõêÕY¼ˆË_|qÉ ñÂ/d×Ë×^{m·³4\"tÄ2Zï½÷^öþ‹.ºHìÀŸ·Ÿÿüç‘¡¾¾¾b÷uÎœ9÷ã—¿ü¥±\0\0@ì\0€¡®\Z6(=:bF@ø}¤XhˆË±ßF© KSÅˆË1“£»Øñî»ï¦¹sç¦«®ºªdà;úOÌ(ÌE†qãÆ¥“\'Oú}Èß¯#ÆáÃ‡=ˆ\0\0\0b\0ˆý7r3,r¡¢Xìè*HäÇŽXÎª»Øqùå—go¯Y³Fì$ùûv¬ZµjÐoñâÅ·?kÖ,\0b\0\0€Ø\0bGßG.8ÄrR;vìÈ.Ç¦å½‰±ŸG.\\\\ýõÝÆŽÜ>¹ÑÅŽ—¿”U,[qj°:t(›Q’»ý­[·z\0;\0\0\0Ä\0;ú>Þ|óÍ4zôè,<ÄU£FÊNB÷&vÌ˜1#û\Z±,U,QÕ]ìøéOšÝî7Þ(v’øï™0aBGpxñÅí¶,XÐq»ñ³‚Ø\0\0 v\0€ØQ5£\Z‚„ØQ¾üÙ1Óbÿþý~›k×®í´WGÌ$Bì\0\0\0;\0@ì¨š³3ŠmH.vT¯éÓ§w„‡;ï¼3µµµ\rØmmÙ²¥ÓòUO=õ”_ì\0\0\0;\0@ì0ÄŽ¾9pà@\Z;vlG€X¸paúì³Ï$tLš4É¦äb\0\0\0b\0b‡!vô¿\r6tZZ*öÔ8~üx¿}ýXº*FÇ´iÓRkk«ƒ^ì\0\0\0;\0@ì0ÄŽþ³bÅŠNÁ#falÛ¶­O_óÐ¡CéÁìôu…±\0\0\0±\0±Ã;ÌêÕ«;-i£¾¾>íÙ³§G_çàÁƒiñâÅfsä–®:Ä\0\0\0Ä\0ÄCìP;wîLuuu\"EŒÛn»-›ý±yóæ´ÿþŽ}=âßˆ1dåÊ•iîÜ¹g}®ÍÈÅO_\0\0\0Ä\0ÄCìT1ûâ8k–GoÆŒ3ÒöíÛàb\0\0\0b\0b‡!v¾¦¦¦³öÜ(wÄ’U[·nu`#v\0\0\0ˆ\0ˆ†ØQymmmÙ~óçÏÏ6/\\æ*Þž:ujºçž{ÒÒ¥KÓáÃ‡Ðˆ\0\0\0b\0b‡!v€Ø\0\0 v\0€Øaˆ v\0\0\0ˆ\0 vbˆ\0\0\0b\0ˆbˆ\0\0\0ˆ\0ˆ†Øb\0\0€Ø\0UmÃ†\r‚‚Øb\0\0€Ø\0C×æÍ›SKK‹¨P¥£¹¹9R€Ø\0\0 v\0@	MMM©±±1}ðÁâB•†Ž½{÷úA±\0\0@ì\0€î‚ÇÆ³å’ŒêBˆ\0\0\0b\0\0ˆ\0\0\0ˆ\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0b\0\0\0b\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0ˆ\0\0\0b\0\0 v\0\0\0Tcì8uê”gŽ\0\0PÅÎœ9Ó*v\0\0\0”ð7ó7ÿîw¿óì\0\0ªØë¯¿¾£ýÏ÷}žÁ\0\0\0qùå—?sÝu×ñô\0\0ªÖ™¯~õ«Úÿ|¯÷\0\0 ¸?o÷ÎèÑ£nÛ¶­õÌÝ\0\0ª¢pœ9Ó\Z3:¾ˆ¿Ý=}\0\0è\"x´‡¾x•Ã0Ã0Ã¨šKW=~ŽÐ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@_ü?cW/Å1UÏ\0\0\0\0IEND®B`‚',1),
('25002',1,'E:\\works\\Fintechviet\\AdServer\\adserver\\target\\classes\\processes\\Order.bpmn20.xml','25001','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"OrderProcess\" name=\"Order process\" isExecutable=\"true\">\n    <startEvent id=\"task1\" name=\"Start\"></startEvent>\n    <exclusiveGateway id=\"exclusivegateway1\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow5\" sourceRef=\"exclusivegateway1\" targetRef=\"CancelOrder\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${cancelOrder == true}]]></conditionExpression>\n    </sequenceFlow>\n    <subProcess id=\"subprocess1\" name=\"Sub Process\">\n      <startEvent id=\"startevent2\" name=\"Start\"></startEvent>\n      <exclusiveGateway id=\"exclusivegateway2\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow8\" sourceRef=\"startevent2\" targetRef=\"exclusivegateway2\"></sequenceFlow>\n      <endEvent id=\"endevent2\"></endEvent>\n      <userTask id=\"ShipVoucher\" name=\"Ship voucher\"></userTask>\n      <exclusiveGateway id=\"exclusivegateway3\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow17\" sourceRef=\"SendEVoucher\" targetRef=\"exclusivegateway3\"></sequenceFlow>\n      <sequenceFlow id=\"flow18\" sourceRef=\"exclusivegateway3\" targetRef=\"SendFail\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${sendFail == true}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"flow19\" sourceRef=\"exclusivegateway3\" targetRef=\"SendSuccessful\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${sendFail == false}]]></conditionExpression>\n      </sequenceFlow>\n      <endEvent id=\"endevent3\"></endEvent>\n      <sequenceFlow id=\"flow20\" sourceRef=\"SendFail\" targetRef=\"endevent3\"></sequenceFlow>\n      <sequenceFlow id=\"flow21\" sourceRef=\"exclusivegateway2\" targetRef=\"SendEVoucher\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${eVoucher == true}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"flow22\" sourceRef=\"exclusivegateway2\" targetRef=\"ShipVoucher\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${eVoucher == false}]]></conditionExpression>\n      </sequenceFlow>\n      <exclusiveGateway id=\"exclusivegateway4\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow23\" sourceRef=\"ShipVoucher\" targetRef=\"exclusivegateway4\"></sequenceFlow>\n      <sequenceFlow id=\"flow24\" sourceRef=\"exclusivegateway4\" targetRef=\"ShipSuccessful\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${shipFail == false}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"flow25\" sourceRef=\"exclusivegateway4\" targetRef=\"ShipFail\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${shipFail == true}]]></conditionExpression>\n      </sequenceFlow>\n      <parallelGateway id=\"parallelgateway1\" name=\"Parallel Gateway\"></parallelGateway>\n      <sequenceFlow id=\"flow26\" sourceRef=\"SendSuccessful\" targetRef=\"parallelgateway1\"></sequenceFlow>\n      <sequenceFlow id=\"flow27\" sourceRef=\"ShipSuccessful\" targetRef=\"parallelgateway1\"></sequenceFlow>\n      <endEvent id=\"endevent4\"></endEvent>\n      <sequenceFlow id=\"flow29\" sourceRef=\"ShipFail\" targetRef=\"endevent4\"></sequenceFlow>\n      <serviceTask id=\"SendEVoucher\" name=\"Send e-voucher, phone card\" activiti:delegateExpression=\"${sendVoucherDelegate}\"></serviceTask>\n      <serviceTask id=\"SendFail\" name=\"Send fail\" activiti:delegateExpression=\"${sendFailDelegate}\"></serviceTask>\n      <serviceTask id=\"SendSuccessful\" name=\"Send successful\" activiti:delegateExpression=\"${sendSuccessfulDelegate}\"></serviceTask>\n      <serviceTask id=\"ShipSuccessful\" name=\"Ship successful\" activiti:delegateExpression=\"${shipSuccessfulDelegate}\"></serviceTask>\n      <serviceTask id=\"ShipFail\" name=\"Ship fail\" activiti:delegateExpression=\"${shipFailDelegate}\"></serviceTask>\n      <sequenceFlow id=\"flow36\" sourceRef=\"parallelgateway1\" targetRef=\"endevent2\"></sequenceFlow>\n    </subProcess>\n    <sequenceFlow id=\"flow6\" sourceRef=\"exclusivegateway1\" targetRef=\"subprocess1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${cancelOrder == false}]]></conditionExpression>\n    </sequenceFlow>\n    <endEvent id=\"endevent1\"></endEvent>\n    <endEvent id=\"endevent5\"></endEvent>\n    <userTask id=\"Processing\" name=\"Processing\"></userTask>\n    <sequenceFlow id=\"flow32\" sourceRef=\"Processing\" targetRef=\"exclusivegateway1\"></sequenceFlow>\n    <sequenceFlow id=\"flow33\" sourceRef=\"task1\" targetRef=\"Processing\"></sequenceFlow>\n    <serviceTask id=\"CancelOrder\" name=\"Cancel order\" activiti:delegateExpression=\"${cancelOrderDelegate}\"></serviceTask>\n    <userTask id=\"CloseOrder1\" name=\"Close order\"></userTask>\n    <sequenceFlow id=\"flow34\" sourceRef=\"CancelOrder\" targetRef=\"CloseOrder1\"></sequenceFlow>\n    <sequenceFlow id=\"flow35\" sourceRef=\"CloseOrder1\" targetRef=\"endevent1\"></sequenceFlow>\n    <userTask id=\"CloseOrder2\" name=\"Close order\"></userTask>\n    <sequenceFlow id=\"flow37\" sourceRef=\"subprocess1\" targetRef=\"CloseOrder2\"></sequenceFlow>\n    <sequenceFlow id=\"flow38\" sourceRef=\"CloseOrder2\" targetRef=\"endevent5\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_OrderProcess\">\n    <bpmndi:BPMNPlane bpmnElement=\"OrderProcess\" id=\"BPMNPlane_OrderProcess\">\n      <bpmndi:BPMNShape bpmnElement=\"task1\" id=\"BPMNShape_task1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"260.0\" y=\"140.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"BPMNShape_exclusivegateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"520.0\" y=\"137.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subprocess1\" id=\"BPMNShape_subprocess1\">\n        <omgdc:Bounds height=\"367.0\" width=\"751.0\" x=\"610.0\" y=\"124.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"startevent2\" id=\"BPMNShape_startevent2\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"620.0\" y=\"303.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway2\" id=\"BPMNShape_exclusivegateway2\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"710.0\" y=\"300.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent2\" id=\"BPMNShape_endevent2\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1300.0\" y=\"290.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"ShipVoucher\" id=\"BPMNShape_ShipVoucher\">\n        <omgdc:Bounds height=\"71.0\" width=\"121.0\" x=\"790.0\" y=\"362.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway3\" id=\"BPMNShape_exclusivegateway3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"974.0\" y=\"196.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent3\" id=\"BPMNShape_endevent3\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1206.0\" y=\"147.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway4\" id=\"BPMNShape_exclusivegateway4\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"980.0\" y=\"377.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"parallelgateway1\" id=\"BPMNShape_parallelgateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"1210.0\" y=\"287.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent4\" id=\"BPMNShape_endevent4\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1206.0\" y=\"412.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SendEVoucher\" id=\"BPMNShape_SendEVoucher\">\n        <omgdc:Bounds height=\"71.0\" width=\"121.0\" x=\"790.0\" y=\"181.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SendFail\" id=\"BPMNShape_SendFail\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"137.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SendSuccessful\" id=\"BPMNShape_SendSuccessful\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"236.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"ShipSuccessful\" id=\"BPMNShape_ShipSuccessful\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"321.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"ShipFail\" id=\"BPMNShape_ShipFail\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"402.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"940.0\" y=\"50.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent5\" id=\"BPMNShape_endevent5\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1550.0\" y=\"290.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"Processing\" id=\"BPMNShape_Processing\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"370.0\" y=\"130.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"CancelOrder\" id=\"BPMNShape_CancelOrder\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"620.0\" y=\"40.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"CloseOrder1\" id=\"BPMNShape_CloseOrder1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"790.0\" y=\"40.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"CloseOrder2\" id=\"BPMNShape_CloseOrder2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1400.0\" y=\"280.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"540.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"540.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"620.0\" y=\"67.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"655.0\" y=\"320.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"710.0\" y=\"320.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow17\" id=\"BPMNEdge_flow17\">\n        <omgdi:waypoint x=\"911.0\" y=\"216.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"974.0\" y=\"216.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow18\" id=\"BPMNEdge_flow18\">\n        <omgdi:waypoint x=\"994.0\" y=\"196.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"993.0\" y=\"167.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"164.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow19\" id=\"BPMNEdge_flow19\">\n        <omgdi:waypoint x=\"994.0\" y=\"236.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"994.0\" y=\"263.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"263.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow20\" id=\"BPMNEdge_flow20\">\n        <omgdi:waypoint x=\"1155.0\" y=\"164.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1206.0\" y=\"164.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow21\" id=\"BPMNEdge_flow21\">\n        <omgdi:waypoint x=\"730.0\" y=\"300.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"730.0\" y=\"215.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"790.0\" y=\"216.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow22\" id=\"BPMNEdge_flow22\">\n        <omgdi:waypoint x=\"730.0\" y=\"340.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"730.0\" y=\"396.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"790.0\" y=\"397.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow23\" id=\"BPMNEdge_flow23\">\n        <omgdi:waypoint x=\"911.0\" y=\"397.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"980.0\" y=\"397.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow24\" id=\"BPMNEdge_flow24\">\n        <omgdi:waypoint x=\"1000.0\" y=\"377.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"999.0\" y=\"347.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"348.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow25\" id=\"BPMNEdge_flow25\">\n        <omgdi:waypoint x=\"1000.0\" y=\"417.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1000.0\" y=\"430.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"429.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow26\" id=\"BPMNEdge_flow26\">\n        <omgdi:waypoint x=\"1155.0\" y=\"263.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1230.0\" y=\"263.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1230.0\" y=\"287.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow27\" id=\"BPMNEdge_flow27\">\n        <omgdi:waypoint x=\"1155.0\" y=\"348.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1192.0\" y=\"349.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1229.0\" y=\"350.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1230.0\" y=\"327.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow29\" id=\"BPMNEdge_flow29\">\n        <omgdi:waypoint x=\"1155.0\" y=\"429.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1206.0\" y=\"429.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow36\" id=\"BPMNEdge_flow36\">\n        <omgdi:waypoint x=\"1250.0\" y=\"307.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1300.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"540.0\" y=\"177.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"540.0\" y=\"231.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"540.0\" y=\"310.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow32\" id=\"BPMNEdge_flow32\">\n        <omgdi:waypoint x=\"475.0\" y=\"157.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"520.0\" y=\"157.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow33\" id=\"BPMNEdge_flow33\">\n        <omgdi:waypoint x=\"295.0\" y=\"157.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"370.0\" y=\"157.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow34\" id=\"BPMNEdge_flow34\">\n        <omgdi:waypoint x=\"725.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"790.0\" y=\"67.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow35\" id=\"BPMNEdge_flow35\">\n        <omgdi:waypoint x=\"895.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"940.0\" y=\"67.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow37\" id=\"BPMNEdge_flow37\">\n        <omgdi:waypoint x=\"1361.0\" y=\"307.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1400.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow38\" id=\"BPMNEdge_flow38\">\n        <omgdi:waypoint x=\"1505.0\" y=\"307.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1550.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('25003',1,'E:\\works\\Fintechviet\\AdServer\\adserver\\target\\classes\\processes\\Order.OrderProcess.png','25001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0;\0\0õ\0\0\0 L€\0\0zIDATxÚìÝÔå/|¢ñx,“r­ŠÇS•äœM½[×ãñhÕzL½®µ•¼ÆJêMRÇá\"£‚\"šE=\Z—Ä˜˜]CˆæM0†#v¹¬ë%ŠÂ,^@E8ˆ\\†¹ˆ #5ÏÛ¿ÿ¡\'=C÷LÏ½{æó©zjºÿÿ¾ÍÌÓÝÿþ}ûyž!C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`I)}ôõ×_ŸW__ÿáÒ¥KÓâÅ‹µ\nhK–,IË—/ß›k£ôRýT?\0\0\0\0hGW¬X‘vïÞþøÇ?jÔöìÙ“ž}öÙK–,ùš~ªŸê§\0\0\0\0\0%Ä7å+ºüÇÅ‹¿ªŸê§ú)\0\0\0\0@	1%bme·Å‹¿¯Ÿê§ú)\0\0\0\0@	1ï¾BmÅ‘“~ªŸê§\0\0\0\0\0%t¦ˆÜøÖ»é[sÖf-N+ð*\"WZ?}÷íÆôús³Ò†%wd-NÇ6ýH?\0\0\0\0°öŠÈ‡ÿ1í;ø^Ëùå¯6µ„q:¿}÷ÛÍéíwÞSðUDî—~šoïìoHë7-½ôØäV-¶Å>}I?\0\0\0\0¨REä:f¯Üš¾3o]zêå]iÙ+iÚüõ-aGœŽí­Ù™¦æ.óã\'_KÞx(\"÷m?-l;6üË1AG¾íÜð¨¾¤Ÿ\0\0\0\0U©\"òÞÍiÊÜu-áFGmÒo_J;öTôUDîÓ~ZØ^}æ%ÃŽØ§/é§\0\0\0\0À\0Õ^ùñµ\re‡sÿm›‚¯\"r¿ôÓ|[¿øö’aGìÓ—ôÓî¨­­ýDMMÍå9?ÌµgrmG®¥‚Ö˜k«r—ùEî²cs§ÿÒ;\0\0\0\0ô‘öŠÈ1uU>Ì˜üÈKéá?¼‘¶4½µ8ÛòûŸxÉšŠÈýÓO…úioºì²Ë>WSS³àòË/?Ô&Üè¨½áG®Õ\r:ô£Þm\0\0\0\0 +\"7¾õn¶\0yá\Zn´½\\l+\\Ã#®×UøUDî‹~Ú¶mXrGÉ°#öéKúig\\~ùå“kÏu2à(Õ^ÑÞq\0\0\0\0 —+\"›¦*Fs´½\\l+vY…_Eä¾è§mÛæ•?-vÄ>}I?-Wmmíô£#3Z‹‘#G¦éÓ§§yóæ¥\r6¤ÆÆÆtèÐ¡Ž9’vïÞ6mÚ”æÏŸŸ]nôèÑÅB\'r·ó)ï<\0\0\0\0ÐÃ„ŠÈÕÚOÛ¶}\rëÒú§n;v\n«Ü¶Ø§/é§>|øÇŽ®ÇÑPÔÕÕ¥Ù³ggaFg477§…¦‰\'¶\n<jjjöç~õî\0\0\0\0=È4VŠÈÕÚO‹µ­Ï?tLØÛô#ý´#GƒŽ…ÁÄ´iÓ²ÝñÁ¤Ç<RpÛïäÚ×¼\0\0\0@iò¦²(Ë*ø*\"÷G?mi‡§Í˜yìV¹m±O_ÒOÛÓvDGLWAEOihhH“\'O.<ÕÔÔ|É»\0\0\0\0ô€öŠÈO®k(:MU±ö¯kv*ø*\"÷K?öÎþ†´iå}%×ìˆ}qýI?-æè\Z-AD}}}ê\r±ÆG¬çQ8Â#wßgz\'\0\0\0€n*UDÞ{ 9}gÞº²ÃŽ›æ¾”v¿Ý¬è«ˆÜ§ý4Fl4n~:½üäwKù—‰Ë\Zå¡ŸºüòËÿ¦p1òÑÑ›b1ó»îº«0ðh¬­­ý„w#\0\0\0\0è†REäæ÷§™OoÎ¦ªZðüöôÌ+­×ðˆÓË^iLO½¼+E~µ|K:¤ˆ¬ˆÜ‡ý´£ÑFyè§å¨©©YS¸FGON]UÊÁƒÓ¸qã\n-¿×»\0\0\0\0tC{ÓEàÑ´ÿÏŽÇäù°#Nç·¿uð=A‡\"rŸ÷ÓrFs´7ÊCßÒO/»ì²Ïå‡ºººn/FÞ/¼ðBÛËÿÒ;\0\0\0\0tQY?mo½ÛvÄi^Eäþì§]\r:òMßÒO/¿üòGóÃìÙ³S_»çž{\nzG\0\0\0€.êLØ¡)\"ë§Ú@é§±NÆå—_~(‚†‘#G¦Ý»w÷yØ±eË–Â©¬ö×ÕÕý…w%\0\0\0\0(P[[»8×þ¶£Ë)\"+\"WýT?íi555—çƒ†éÓ§§þ2qâÄ–À#÷šýï^\0\0\0\0P  x¶¸¦¦æ³¥.§ˆ¬ˆÜŸ„rúiõ«˜6*ÿ:9oÞ¼~;yä•\0\0\0@)óÀçÛÅŠŠÈŠÈ•ÐO…rúi_÷«Üþgò—Û¸qc¿…õõõ…#;{÷\0\0\0€EÂŽ–bZaè¡ˆ¬ˆ\\aýT(§ŸöI¿ÊmÛ‘ßßØØØoaÇöíÛg£w/\0\0\0\0(P*ì(,þÅ7ž‘‘+±Ÿ\nåôÓÞîW…Û:ÔoaÇ‘#GZ=Fï^\0\0\0\0ƒTE}­¦ˆ¬ˆ\\áÏ_¡œ~Ú+ýªð|v\0\0\0\00Dq¨ôß¥D{®¦¦æKC‡ýh\\N¹ò›PN(§Ÿön3²\0\0\0€~§8TúïÒ^È‘×“Eä»ï¾;}æ3ŸI\'œpBúøÇ?žFŒ‘¶lÙÒ§×Ü¯”µj¹]#;ú/”k¯¿öçÿ»šúfŽìhéWÖì\0\0\0\0 ¢;Jÿ]Ž¶Uµµµ_iräõTyÆŒYÁõóŸÿ|ö-éE‹eçÏ9ça‡°£œ~Úg¡\\9ýuˆ°c …Çô«Ü¶gòû7nÜØoaG}}}«5E¼{\0\0\0RÂŽ’—¢Eã¶zªˆ|î¹çf×Ýÿì³Ï¦³Î:+ûýé§Ÿž|ðÁV…ÚI“&¥“O>9vÚiéÈömÛ¶-åv3Ï<3­Zµ*Û¾gÏžtÅW¤O<1tÒIiØ°aiçÎí~÷íÛ—®½öÚìòq½ñãÇ§´ºÎÅ_œÎ?ÿül[?ãwŠË_uÕU­n·œû/¼-aGûÏß¾åÊí¯…ÿïöúN„$gŸ}vÖGcüßó£CÚë\'¥oVAØQ²_åöÝ—¿Ü¼yóú-ìˆû.x¼÷y÷\0\0\0¤„ÝÓSEä(öæn®¥HÛ¶EÐ±zõê´cÇŽìr§œrJ«l×¯_Ÿ>õÔS³}—^ziv>BŽ!ßº¯««ËÎ¿øâ‹iíÚµÙéK.¹¤Ý°#ŠÉ±ýá‡ÎŠ‹q:ŠÊ…×YºtiÚµkW¶-B–üãÊë?»åÜám	;Ú}þöi(Wn-ü·×w¢Çù­[·fý;Nçƒ„öúÉ@é›vtØ¯jkkGåC†éÓ§÷[Ø1yòäÂ°ãkÞ•\0\0\0\0)aG÷ôTùøãÏ\n©ñ-õbû£<eÊ”¬<¤ 8;¤M8§ã¶ât|;}H‘à\"¿½°Å¶öÂŽüubÊ¢hÅ®ÛÛ»|þvË¹ÿÂÛvTN?-·¿ûë;^xav>Â“çbz¬]ÑQ?(}³šûéÈ‘#?•{ÿ8ï!¹ÓéàÁƒý½^Ç¡ÚÚÚOxW\0\0\0¤„ÝÓSEäu1¤ib\ZªØÿè£vviS¸m¯8\\îú1¥Ï6â˜6«ÔuÊ)(wæþ…•ÑOËí¯…ÿÇöúNœÇöo|#}úÓŸÎöqÆö“Ò7«½Ÿ®Û1þü>;fÎœYvÌòŽ\0\0\00ˆ	;º§§ŠÈ?ÿùÏ³Bê¿øÅ¬ÐúÏÿüÏÙù¿ú«¿jU„éu†”vä§±Z¹re«i¬FŒ‘µ=ò·wÑEµ[ÐÍOïS8UÐ„	J^\'¦þr´ž¿|þ2]¹aGeôÓrûë\"SCë;\\pAËTk15Tœþä\'?Ùa?(}³ÚûiáTVñ7¾ÐW\Z\Z\Z²%ùûÏýïÎõŽ\0\0\00ˆ	;º§\'‹ÈQ`…“kÎ/*ÓûDàÑvAå!í„1õU“ãöbèX!¶755eâü‚ÎQüÅÌ;Z |ìØ±Ùå£Ea³í\"Ð…—E¦#\\‰ûŽë^¦+÷/ì¨œ~ZNÒfòR}\'þï_ýêW³ëÇíÄ4mÏ>ûl‡ýd ôÍjï§±¦Gî=äå|à°páÂ>;î¸ãŽ– £¦¦fw#\0\0\0€ANØÑ=½QDÖ‘õSý´ZŽîˆ‘o¼ñF¯?þxáôUï×ÔÔœíÝ\0\0\0`vt\"²\"²~ª\rö~š{y4>|ë[ßJÍÍÍ½tÄ´|…ÓWåÚxïD\0\0\0\0;ºIYY?Õ{?>|øÌ½—ìÉwÝuW:räH¯1Í˜EÉ\0\0\08†°£{‘‘õSM?2¤¦¦æ³¹¶?DÄš\Z±žJON]ÕfDÇÃ‡ÿ˜w!\0\0\0\02ÂŽîQDVDÖO5ýôÿ¨­­ýJî=åP>ˆQõõõÝ\n9\Z\Z\ZÒm·ÝVr:\0\0\0\08–°£{‘‘õSM?ý³Ë.»ìs¹÷•w\nÃ‰éÓ§§7v*äØ¾}{š9sfÛÑÙÔU‚\0\0\0\0Ž!ìèEdEdýTÓO[«­­=3÷Þ²£MH‘¾þõ¯§9sæ¤+V¤7Þx£e]øáFŒ™7o^š2eJÛ€#Úû#\0\0\0 $aG÷(\"+\"ë§š~z¬}Q[[;½í(®´ššš¹v¶w\0\0\0\0Jvt\"²\"²~ªé§¥9òS¹÷™;//³ÅÚ³FŒq®w\Z\0\0\0\0:$ìèEdEdýTÓO;VWW÷ï®çñÃX`¼È4Wµµµ‹s?ï«©©¹<wúÞa\0\0\0\0(›°£{‘‘õSM?\0\0\0€~&ìèEdEdýTÓO\0\0\0 Ÿ	;ºGYY?ÕôS\0\0\0\0ègÂŽîQDVDÖO5ý\0\0\0\0ú™°£{‘‘õSM?\0\0\0€~&ìèž¥K—*ÔVv;´xñâ÷õSýT?\0\0\0€LØÑ=Ë—/oÜ½{·bm…¶†††ß.^¼øUýT?ÕO\0\0\0`\0vtÏÓO?ýåeË–½ýæ›o¾§h[Yß”ò’%K¶åÚ×ôSýT?\0\0\0€LØÑ}K–,ùÒâÅ‹Ÿ‹ihbÞ}­\"Zü/^U@ÖOõS\0\0\0\0„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„¥­^½úÿž0aÂæ¿þë¿~?w6iš¦iš¦išVíSŸúÔ{gœqÆ¬Üéùä\0\0;Jˆ #çƒ/}éKé¹çžK‡J\0\0@ÿ{ÿý÷ÓË/¿œ†\rö§üã›\0\0€°£„ë¯¿~K\0\0@åúüç?¿\'wø>Ý\'\0\0v;Šˆ©«bD\0\0P¹6lØp0wø¾Ù\'\0\0v;Š3u\0\0T¸˜ÒjÈÿYÇ\0\0vP,ì\0\0\0*Ÿ°\0 ÷+¥}ýõ×çÕ××¸téÒ´xñb­Ú’%KÒòåË÷æÚ(½TØ!ì\0\0\0a\0\0íˆ cÅŠi÷îÝéü£VAmÏž=éÙgŸ=°dÉ’¯	;„Ý	;Ö¬Y“.¾øâtâ‰\'¦“N:)ýíßþmZ½zu¹ÈÊ¾\\´¸ÿþßÿ{vŸ\0\0€°\0 OÄˆAGE\\¼xñ«ÂaGwÂŽÿò_þKöáêÕW_M/¿ürvú?ý§ÿÔãaGøýïŸŽÀ\0\0v\0\0ô‰˜ºJ¨PÙmñâÅï;„Ý	;b4G\\vË–-\Z…çó§¯¹æšì6Î;ï¼²oã„NhµoèÐ¡éüÿ‘m{çwÒu×]—ÝfŒ¹þúë[ZßµkWú»¿û»ìúý×žþùlûR]]]Ëè”áÃ‡g#ÒÂc=–þÛûoÙub_Ü×öíÛ;Ü\0\0Â\0€\"Ö‡(T|Ø1èŠ…Ý;~ô£e®N>ùäôõ¯=áÑ™°#ƒhùÐ¢½°#?²#‚‘Â}Ë—/O{÷îÍ¶EÐÛæÎ›,XŽÀ#|ñ‹_ÌÎGÈ1¤`„ÈUW]•‘)6lÈN_zé¥Ù¾SN9%;¿sçÎlú¬8VÚÛ\0\0Â\0€Av¼ûvczý¹YiÃ’;²§c›0BØ!ì¨ü°#Ä\ZDà×‹\0¤Ü°ãÃ?ÌÚ£kr”\n;¢üñé¿þ×ÿšêëë¹¼¸R·›ß×V~û6ëƒ„XƒdÈÑÑ$–ÜÿýÙHŽö\0€°\0`…ïìoHë7-½ôØäV-¶Å>„°CØQùaG^SSS«  ³aGLU*ìhçC]«mùiµ\no7B˜rÂŽÂÐ$/¶-[¶,ÝxãÙZ$q¹X§¤£}\0\0 ì\0\0DaÇŽ\rÿrLÐ‘o;7<*vô¶/\r;¾àÛµ°#Ö¾ˆËÆ4N/½ôR«‚ÿøÿ!;ÿÚk¯¥ßýîwEÃŽßþö·é‰\'žÈNÇèˆî†ù)©\n§±ŠéµB~\Z«‰2¤`\Z«Q£Feçõ«_µ,²~ñÅgû>ûÙÏ¶L}SeÅéO}êSî rÅúJ«V­J±¾\\iýß–,Y’MK¹yóf„\0\0Õv¼úÌJ†±O !ìèEŸËµý¹vïÑŸ_ò¬í|Øk\\D0£#bš©˜Ú)¿ð÷ìÙ³³u-b´Å·¿ýí¢aG¬±Ó@EððÆot;ìˆÊcÑóx<Ñ\"èÈ/PkkD@÷‹G@Þzë­,$É/jëuÄbæ!~6,Û×‹59þð‡?t¸€Ê\r:V¬X‘vïÞíX°ÂÚž={²“›6mÒQAØ\0P}aÇúÅ·—;bŸ~ÂŽ^:òGŒìØ#ðè|Ø\0Õ$Ft:*;ðˆ7€°\0È¹ýöÛÿbÆŒß»óÎ;ŸŸ6mÚž	&9rdŠ©j¢]sÍ5ÜtÓMûï¸ãŽµ?ûÙÏî¿å–[þ/5a‡°cPmv\0À\0…tÇ€•|\n;\0`P»ë®».¹í¶ÛÖŒ\Z5êOÓ¦MK.LëÖ­Ë¾¹õÁ´ìÛ·/mÜ¸1=ùä“éž{î‰¹ÚÿtÓM7íÈ]çš¡C‡~Ô_²oÃŽ\rKî(vÄ>ø„=ì\ZùýÖðv\00\0•s|ª	;@Ø\0ô‹‰\'þåw¾óµcÇŽýÓ¼yó²0£3Ž9’V®\\™n¹å–?M˜0¡iÜ¸qÿ¯¿jß…›Wþ´dØû|àvôBÐÑQa„‡°\0aGj|ëÝô­9k³§;\n;@Ø\0ôšiÓ¦ÝpõÕW¿ÿë_ÿ:577wû\0á¹çžKãÆ;2~üø…Ã‡ÿ˜¿pï‡û\ZÖ¥õOÝvìV¹m±Ï>aGùÜÎØèìå…\0PåaÇáÃ¹cÓƒïµœ_þjSKØ§óÛw¿ÝœÞ~ç=Ç’Âv\0\0=cêÔ©÷_ýõ¼ðÂ=zpðàÁ4cÆŒ#uuu»†þý¥{7ìˆ¶õù‡Ž	;b›{ÂŽ:¾Ô…ë½3ˆŸ\Z4aG³WnMß™·.=õò®´ì•Æ4mþú–°#NÇöÇÖìLSs—ùñ“¯¥ï\n<„ ì\0\0z è¸á†>Œõ8zËÃ?üá¨Q£>ü¯üÅ{1ì8|8mþÃÌc§°Êm‹}>ð	;ú)èè©ë;\0 \nÂŽ½šÓ”¹ëZÂŽÚ¤ß¾”vì=èxRØÂ\0 ëbêªÑÑ›AGÞ¢E‹\Z5ªÁÞ	;ÞÙß6­¼¯äš±/.ãCŸ°£‹:ZŒ¼¯oGØ\0\ZvD{|mCÙaÇÜÛæXRØÑ£víÚ•fÍš•n¾ùætõÕW§#F¤Ë/¿¼¥Åùºººtã7¦ŸýìgiãÆžÐ;\0 šÅbä±FÇÚµkûì áý¯ÿµ+w`ù/C‡ý¨ÿ@…‡§ÆÍO§—ŸünÉ #ßâ2qY£<„](zj\nªÁ8ÂÃ§F\0UØSWåÃŒÉ¼”þÃiKÓÛY‹Ó±-¿ÿ‰—|!GØÑ3-Z”Æß*Ø(§ÕÖÖfáÇý÷ßŸýÝv¨@\0@•™:uêË±y_ûæ7¿¹«¦¦æÿî‡æ0ÊCØÑƒÁD>èøH®9ú³3Ú^o°-ZîS#\0ƒ\"ìh|ëÝlòÂ5:\"Üh{¹ØV¸†G\\\'®ë˜RØÑË—/OcÆŒétÈQ¬\Z5*í°\0¨wÝu×%cÇŽýSsssŸ8444|0bÄˆ·jkk?á?Ñ½°£œÑíòðPØQfÐñ¥‚Àâ—GþÙ‰À£ÔõSàáS#\0ƒ\"ì(6MUŒæh{¹ØVì²Ž)…uë­·XŒ92MŸ>=Í›7/mØ°!566¦C‡e—?räHŠiœ7mÚ”æÏŸŸ]nôèÑÇÜÆ¸qãÒ–-[<Ñ…\0@¥»í¶ÛÖÄ]ùþ÷¿¿¡¶¶vºÿD÷ÂŽ®ùæ °£AGsôÀ?u\"ð(:òíŠ‚ýƒe\rŸ\Zv;„=hÿþýÙz…ELE5{öìÔÙ5)ãK€.L\'N<&ôxüñÇ=Ù…\0@¥ºýöÛÿbÔ¨QÚ·o_¿<444ì®­­ÝkíŽî…š°£—”\n ŠíÅ.ÿÿ¹ü`XÃÃ§F\0EØa\Z+aG_W^ye«PbÚ´iÙŽîøàƒ²p#F†®çñ›ßüÆ^Ø\0T¢™3gNÁþvÝu×½–;pü[ÿa‡°£çåž[‹»øüêh1òrrƒŽ¶Ç@ÒÊ§F\0EØñçÊ›Ê^ <.ëXRØÑmGtÄtUTô”†††4yòäV÷1wî\\Oza\0Piî¼óÎç}ôÑ~?€øÉO~²ÒTVå¥…ÂŽÎ(ø&ÚâšššÏ–yµr‡ŽÎ…÷¿gÈÀááS#\0ƒ*ìxr]CÑiªŠµ]³Ó±¤°£lm×è¨¯¯ï•û‰5>b=ÂkÖ¬ñÄv\0\0•dÚ´i{Ö­[×ï¹ƒÒµ¹ƒÆgûÿ£Ü¢´°CØÑ•~UÐžè TëìTR¥ãºtä\rÔ5<|j`Ð„{4§ïÌ[WvØqÓÜ—Òî·›O\n;:´|ùòcFtô¦XÌü®»îj¹¿#F¤]»vyò;\0€J1aÂ„#]°­74555æ…å¥…ÂŽnö«–P­HÿêêšÅ×ºtt÷ñ;\0 ÂŽæ÷§™OoÎ¦ªZðüöôÌ+­×ðˆÓË^iLO½¼+E~µ|K:tø°ãIaG‡FÝjŽžœºª”ƒ¦qãÆµÜïÔ©S=ù…\0@¥ˆÅÖúâ °q°(ì(¯(-ìvôD¿*ÕŽŽ$êîHŠbGw‚Ž¶Ç@YÃÃ§F\0MØ‘<šöÿyÁñX€<vÄéüö·¾\'èv”eÑ¢E-Ç²uuuÝ^Œ¼3^xá…VÓYmÜ¸Ñ€°\0¨”\"h¥v”_”vT~+ãY‘-×\rïíf7Ž©«ÚŽèxíèöî¸÷èmý…°\0ª+ìhÛ\Zßz·%ìˆÓŽ…uíµ×¶¿Îž=»Ïïÿž{îi¹ÿ›o¾Ù€°\0¨•6²C+¯	;Œìè¡í¹ššš/\r:ô£G/šÙÑÕíì(\\´¼³Œì\0€vhÂŽîˆu2òÇ³ñy¶?¦eÞ²eK«ãê½{÷zv\0\0ý­RÖìØ³gÏ.kv”_”î­“…ÅéO<1sÎ9iõêÕÿÁ-ÿ˜…e÷«¶!GÛ`á!½³fGWkv\0€°Cv´˜5kVËqíôéÓûíqLœ8±åqÌ™3Ç‹€°\0èo7ß|óÞ\r6ôûD}}ýÚÜAâ\naGyEéÞ;âô3Ï<“ŽÀÃ‡Ãv¬ª­­ýJ‰£XÀPîHŠbAG¬Ñq\\‘í	<º»†ˆ°\0„Z…cÇŽMO=õT»—‰i£òÇ·óæÍë·ÇúÈ#X¨\\Ø\0T’;ï¼óùÇ¼ß ~ò“Ÿ¬Ì$þPØQ^Qº/ÂŽüùN8¡Õ¾‹/¾8þùÙ¶}ûöeóåžtÒIÙHñãÇ§dû¶mÛ–r?»þ™gž™V­Z•mß³gOºâŠ+²ËÇõ†\r–vîÜ™í‹…Ï>ûìì:±/î+†ˆw´¯ðqçOOš4)|òÉé´ÓNK<ð@¶/.=nã²Ë.ëÕ!v´7’££À££ ¡TÐñ‘vö—xüM®í€A‡°€ªÇN7ÞxcöSØ!ìèùÏCz,]º´èe®¾úê–Ëõçâàõõõ­/Â\0 ŸÍ˜1ãž»îº«ß n¸á†õ¹ƒÄ¡ÂŽòŠÒ}9²ãÜsÏmµ/>tÄ<¹±-‚ŽØöðÃgßªŠÓxÄ¾K/½4;!Ç‚\"uuuÙù_|1­]»6;}É%—dûN9å”ìüÖ­[³é³ât>Xio_±°cÁ‚iýúõÙéSO=5Û÷“ß—¼ƒ!ìè†ŽFVttébà‘ŸJë+ô©îS#\0U!\nÉùbn|‘¤½Â²°CØÑ“aG¾7î˜‘#FŒhÙßØØØouûöí-#Â\0 ŸMž<ù?Ž3æOÍÍÍývðÐÔÔ´»¶¶öÝºººï?Rž¾X³ãøãOguVZ±bE«}‡j¹|ŒÎÈo‹6äèZ…ûÚÞG~û6ëƒÄ¾/¼°e4I„%3fÌÈF‚t´¯XØQø;ÅïRêñ\n;:Tj„G¹AGgüý}e\0?…}j *Äg„¶ÅçX§ ¾Ì\"ìvôEØQ8r\"zncúþräÈ‘Va\0P¦L™ò¿—-[Öo?ýéOŸ¯©©ù…ÿDå„åî‹é¤Ú†1uT9aGah’o±-~·o|ãéÓŸþtv¹3Î8£Ã}…ùóÂŽ.‹m§”\ZÓ‰ £½ÀãŠ6÷3×èv\0PµÊ)>;„½Ýß\nGzTRÀ ìv\0\0fêÔ©µ“&Múðƒ>èo‹½?bÄˆ·FŽù)ÿ‰ê;òSRNc5aÂ„VÓX­\\¹²Õ4V1Ä;ÎÇ:\Z1•Uœ¾è¢‹²}\\pAËÔW1UVœþä\'?Ùá¾rÃŽ/ùË-ÓXÅ‚‚ÂŽN…‹–åC:¸^gEv\0@…ŸcšSaGå·Žþ—ÕØŒì@Ø\0cÂ„	M1]Q_»óÎ;×åïó¨Î°#(oõÅˆ‰htä(µ5\" ˆi§bañXg#¶755e!I~QóXG#3Ï/jþÕ¯~5Û×‹59ž}öÙ÷•vÄcŠ5HbZ«xÜC\n`v”¥í”VT\\Ñ‰ cH‰ë}aÂ€AèÃ?ÌŽÞyçìø)Ž‡vîÜ™-üýÚk¯¥uëÖ¥5kÖdÇKñE‘u½dÉ’ôÄO¤G}4ÍŸ??Í;7û‚ÉC=”~õ«_e_ùÙÏ~£¤Ó½÷Þ›~ô£¥ïÿûéïÿþïÓwÜ‘n¿ýötë­·¦›o¾9M:5Mž<9}ûÛßÎ¦¡úæ7¿kæ¥ë¯¿>[o-Öa‹c£hW]uUºòÊ+³ãµ+®¸¢ì¢s…ñ7‹/ÎÄqe\'ÆÔ§ñ7ì‹cäÙ³g§ÓO?=;¶¼øâ‹Ëº~o~Ùf ì3fLöÈyÊš;\0€’®¹æšÿgÜ¸qGöïßßg\r/¾øâæÚÚÚÿ=|øðùTFØ1ÐÛÇ?þñ¬óOGqaHÁˆaG—î*6E–°€tmsÇ¿--\n¤ÑF\Z•µÑ£GgCv#pˆà!ˆ=Äu×]—_ÿú×³ÀâÆoÌŒ›nº)4n¹å–4mÚ´,è¸óÎ;³àãî»ïÎ‚Ÿüä\'Y0òóŸÿ<JfÍš•\'sæÌÉŠÈ.Ì‚•X\"h‰À%BƒRÅçxœ¿þõ¯S|~ÈûôÇñ]Lk\Zï­åG\rÇ”§}vÄ—fb{|Ù§Ø­ýr‘°#µrä]}õÕ-û7nÜØoµ¾¾¾Õ´n;\0€\n2~üøÊ}z¿/¦³ÚµkWsL_uÙe—}Î_^ØÑW-¦¯Šp£ð›1-–°£ßžN„\0Tl7¾lQ\n¿EŸÿûý÷ßßªøúëø4¿†\\½ÛîÛ³gOÊäý†\r–¨)&Mš”­9wÚi§e!Pì‹ÛŠÑÀqœŠùµà\n÷Å¨ã³Î:+AbÄÇƒ>hdGÃŽYA\\Û~\"ÜË_.¦Òí/qßùÇ	a\0PA†úÑ+¯¼rëC=t¤7vïÞýAîàuWmmíDuaÇ@^\0r€wÃîN=5Ø¦®v\0b1Š#w\\•}äÈ‘-!GL—Uj$xŸÆÈ•xoÀ\"¦Tm×—‹k×®ÍNÇª…¡C|fýúõÙéSO=5Û—û\\Ô²oÑ¢E%Š¶Û#èˆiµvìØ‘m?å”S„Tl$G[¿üå/[B†éÓ§÷Ûc©áòã7¿ù:a\0PirÄ>1zôè}óçÏÿco(ÄˆŽ£AÇtma‡°cÀ™1˜#v\0±vX5Šé´b\Z¬ŽF¦ôçñiL·ÁFñ>H±ÑÑb[©uÞbíÂëÅÔTÑÊ\r;â<eÊ”lm¹R‡°£ûb:Ú|ÈaÜÁƒûü1®×-÷9×°\0¨D¹ÆO\Z5ªáW¿úUSO$Ä\Z1u•ÂaÇ€ÒÙ©¨ëÔUÂ€A,\n²1z \Zµ÷\rûJ	;ò-?¢\"h†…ç»\Zvœyæ™ÙùXûDØÑ»\n×í˜?~ŸßÿÌ™3[îâÄ‰^ä„\0@%‹#FŒø—	&4mÛ¶ípwš››ß¿óÎ;×ÅbäÖèv;uàñ7¹öN®}e?…}jdbáñçŸ~@ÿŽýu|šbú¨øÇéX´<öÅˆš8kqä/¿è¢‹:;bª«!G§±ŠuÊ\r;ò!Iþ¾„½§p*«˜¾,B©¾ÒÐÐÐ2½[´Xa\0PjjjnÈ}Hxó{ßûÞË[¶léÔH¦¦¦Ý3fÌx.Fsäg>ücþ¢ÂaÇ€õ…£AÆÚÙ¿GÐ!ì\0Œb‚åË—;z¡ÅZ`DÐÓP]xá…Yñ9öå>dÓ[ÅBã±?BŒmÛ¶uvÄ4IçœsN¶ÐøØ±cË;rŸ}²ûi»¨¹°£çÅï!b>pX¸paŸÝ÷wÜÑr¿ãÇ÷\'ì\0\0ªI„¹¹ÛsmÇ5×\\óÚÝwß½ê™gžyqûöíÛ\nöíÛ÷f}}ýÚŸüä\'+o¸á†õµµµïÖÔÔü\"¦ÅòWv;…R#<L]%ì\0Ô¢øý»ßýNØ¡õûñé@R8º#FZ¼ñÆ½~Ÿ?þx«µ:bDÂ\0 JÕÔÔ|öhðñD®mÍµ÷ö\ZsmU®ý0×†ÖÕÕý{1a‡°cÐ‚aÀ 7nÜ¸>ýæ¹°CaG¸öÚk[‚‡o}ë[1…r¯Ý×Ê•+[M_uß}÷yqv\0\0 ìv’Àã^A‡°€”Mu3gÎa‡&ìèa1-YmmmK\0q×]w¥#GŽôJÐS¢Y”\\Ø\0€°CØ1ø|!>)½†‡°€Aãúë¯O³fÍvhÂŽ^°téÒVSKÅš\Zûöíë±Û©«\nGtÄH­ýû÷{av\0\0 ìvGÃ„\0ƒ^|üþûïvhÂŽ^#§\n…Q__ß­ÛlhhH·Ýv[«Ût;\0\0v;„;\0­É“\'§ø‡vhÂŽ^´hÑ¢VSZE›>}zÚ¸qc§ngûöíiæÌ™­Fsä§®t;\0\0v;„;\0­ï~÷»é‡?ü¡°Cvô²5kÖ¤#F´\n)¢}ýë_ÏF¬X±\"½ñÆ-ëzÄÏ7bÈ¼yóÒ”)SŽ¹®ÅÈ…>¾\0\0;„Â„Q$ZµjU6gz¼öiÕß–,Y’–/_ž6oÞ¬ƒ÷Ûo¿=}ï{ßvhÂŽ>£/n½õÖcFyt¥?>­^½Ú‹˜°\0€Þ%Ø*ºÊ}˜|_Ø!ìv0‚Žø–ìîÝ»½ö°¶gÏž´lÙ²´iÓ&½DÐ‡°Cvô-[¶³æF¹-¦¬Š „\0\0½lùòå\nK•Û\Z\Z\Z~›û0ùª°CØ!ì` ‹B÷£xÄ,è¾˜Â*¦²vhÂŽ¾×ÜÜœ­çqóÍ7gŒ·æ*Î;6ÝtÓMiÖ¬Yi×®]^´v\0\0ô•§Ÿ~úËË–-{ûÍ7ß|Ï·Ê\ZÑAÇ’%K¶åÚ×„Âa‘†Š£”çÿñÓ¤I“„šç3;\0\0hkÉ’%_Ê}`y.¦K2¿xÅ´ø_¼*èv;,7G)ÏÌ™3Ó7Þèõ@ó|a\0\0 ìv@57ßz7}kÎÚ¬Åi…GÅÑÁ$¦Æ¹á†¼hžÏ ì\0\0\0„Â¨¦âæáÃLû¾×r~ù«M-aGœÎoßývszû÷\"G´9sæ¤ñãÇ;4Ïgv\0\0\0ÂaTKq3‚ŽÙ+·¦ïÌ[—žzyWZöJcš6}KØ§cûckv¦©¹ËüøÉ×ÒwŠ£×Â…³…‘…šç3;\0\0\0a‡°ª¤¸¹÷@sš2w]K¸ÑQ›ôÛ—ÒŽ½#G¬\'žx\"]uÕUúw\\ºt©çŒç3;\0\0\0a‡°Ö7¹_ÛPvØ1÷ß¶)D*ŽhË–-Kuuuúw\\±bEÚ½{·çM…¶¦¦¦,„\0\0€°CØ;bêª|˜1ù‘—ÒÃx#miz;kq:¶å÷?ñRƒb¤°c@[½zu\Z=zô€þ·lÙ’…:o¾ù¦çN…›6mòda\0\0 ìv@9aGã[ïf®ÑáFÛËÅ¶Â5<â:q]…IaÇ@´~ýú4räÈÿ{FàñôÓOgýF«œ&è\0a\0\0 ìv@\'ÃŽbÓTÅhŽ¶—‹mÅ.+`vD[·nM#FŒð‡\0v\0\0\0Âa;4aGuŠµ,jkký!\0„\0\0€°CØÕv˜ÆJØÁ±Þyçï‹\0;\0\0\0a‡°ª ìøóåMe/P—,;²;î¸#ÕÔÔ¤;ï¼Ó@Ø\0\0;„P-aÇ“ë\ZŠNSU¬ýëš‚aÇ€õƒü }ä#Içw^öóÖ[oõGv\0\0\0ÂaTzØ±÷@súÎ¼ue‡7Í})í~»Y¸ ì°AG>àˆ‘ÇwœÀ@Ø\0\0;„PéaGó{‡ÓÌ§7gSU-x~{zæ•ÖkxÄée¯4¦§^Þ•…\"¿Z¾%:|X¸ ìÐAGGÛv\0\0\0ÂaTPØ‘<šöÿyÁñX€<vÄéüö·¾\'èv81‚£½@#¿ß\Z\0Â\0\0@Ø!ì€\n;Ú¶Æ·Þm	;â´ AØ1ÐƒŽŽ‚#<\0„\0\0€°CØUvhÂŽÁ `”;b£³—@Ø\0\0;„ ìÐ„½ttv¤†À@Ø\0\0;„ ìÐ„UtôÔõv\0\0\0Âa;4aG—u´y_ß\0Â\0\0@Ø!ì\0a‡&ìèt@ÑSSPá ì\0\0\0„ÂvhÂŽ>Óv­?ü0;6ûÙm¯g\r\0a\0\0 ìv€°CvôYÐ‘AÅgœ‘Åâg¹G©ë	<\0„\0\0€°CØÂMØÑgAGˆ‘Gbe…AG¾]sÍ5-û­á ì\0\0\0„Âè†(r;4aÇ±JÅ‚‹ör/o\r\0a\0\0 ìv@]yå•éÞ{ïMÍÍÍÂaÇ€ëß1\nã©§žêrÐQjj©rŒÎ#¦´v\0\0\0ÂatÁÈ‘#S<‡GŒ‘î»ï¾’¡GwÃŽÕ«W§‹.º(xâ‰é¤“NJ^xaZ¹reëóÅäj*ñ±Ä°#úv´=–.]ZÖuÊ\r:\n2:tÞÿqÇg„€°\0\0v; \\räÂÑ\"ü˜3gN‡ù¢ïºuëÒ‹/¾˜þô§?-ìvôIØ‘oãÆkw¤Gg§’*h¼ÿþû]\n:ò¬á ì\0\0\0„ÂèF18ßÆŒ“æÏŸßcaGŒæˆçÄÆÙ·gÏžtÅW´Œú6lXÚ¹sg«P`Ò¤Iéä“ON§vZzà²}q[çž{nv«®ºªd€ÐÞí¶‡~8»þ¨Q£²óq8?{öì´oß¾tíµ×f×Û?~|:pà@Ñà¢ðü¶mÛÒÐ¡CÓ	\'œÎ<óÌ´jÕªV—™0aBv{§Ÿ~zzè¡‡Êþ{\\|ñÅéüóÏvt±›Þª«kf<þÝ¿ûw]:ºûx\0v\0\0\0Âa]*¢ÖÖÖ¶üŒ£%b„DÍGµêêê²52¢0ÅÖø–yÐ£p~ýõ×§n¸!}ãßH7Þxcúö·¿ø§L™’¾ûÝï¦[n¹%Ý~ûíéþÏÿ™¾÷½ï¥éÓ§§þð‡éG?úQúÇüÇôÓŸþ4ýüç?Ï‚€Y³fe…ó(ÞÏ;7--Z”üñ¬ÀûÌ3Ï¤ßÿþ÷Yá½T18ß¢è#=ºvÜ}÷ÝY!‹(ðÇü¾ø»Ä¾ñ±víÚìô%—\\Òª¸¿`Á‚´~ýúìô©§žší‹!¿/~¿RaG{·_ØvíÚ•íûÏÿù?gç?ó™ÏdçwìØ‘ýŸâtüMçÍ›—Žÿ[GaÇ¥—^šŽ¿uü<çœsZ]&w„6q:‚œrÿ1%S<^aG×ÂŽÂ‘ñ·ìîHŠbGw‚Ž¶‡5<\0„\0\0€°CØA¯Q£@k\\ìß¿?íÝ»7ûö}|“óæÍé•W^I/½ôRzþùçS}}}Z±bE2DØðÄOdEî!\"Œˆ0!Â‰)~ñ‹_¤™3gfáE„?þñ³P#Â9î¸ãŽ,ôˆð#B©S§f¡H„#\'NLßüæ7³Ð$Â“ë®».+ÒGA7Â•«¯¾:[¢˜!F´ŽŠÁùÖ”Ç\ZqßxÄó#Ø#Úˆc[© áøãou½C‡e­TØÑÞí·mgŸ}v¶?þWñó¬³Î*y_í=Æüùüõ:šÆªØïÕÞß#COOcUn_¨í¼óÎëÖkBL]ÕvDGœíÝ+në7ÞðÂ ì\0\0\0„Âz>ì(¿G±ÁHŒÉë‰°#ßb¤Da¿0H(\'h$”v´wûùëÅ¨“8ýå/9ûaQá4\\…÷¡MO†Å~¯¾\\ëc0ìˆ‘V4Æïò#;º:‚ÂÈ\0a\0\0 ìv ìè\'1*¥m8¦f*¶€swÃŽX¯\"ž«W¯ÎF»ä‹À±/¦ýŠó1W~ñò‹.º¨ÃP ¦v\Zrt\Z«üÔRÅ‚€ön¿mËßN¬±?yä‘VSKNcÁHì‹é§â|L³õØcÆ*Fµ)2U±ß«3ž@CØÑ6ä(,X³@Ø\0\0;v;ªH¬‘/Ç:!q¾”î†±öDìcÔBL×tá…¶,ÖÝÔÔ”…	ùÅ¿#ÄˆéÀ:\n¶lÙ’…LÄ4]¥ŠþíÝ~Û‹ŽÇãrtZ©X,<¶Çåqqýhtä(ðÁÓ)§œ’Ý~L%Vø8¶nÝš.¸à‚ì1ÆYötô{uæïÑv\n,aGñ°#þž1]\\±£XÀPîHŠbAGœ©«Šm/7ðèî\Z\"\0;\0\0\0a‡°ƒAvDXÅùöBŽž\n;´Þk\ZåGÉ;Zko$GGGGAC© #ht´¿”X¿ç¸ãŽt\0;\0\0\0a‡°aGOvTnûâ¿˜-¨.ìè9¬(7Èèlà‘Z¦NêŸ\0 ì\0\0\0„Â„ÂMØÑ=¥Fxt6À(÷ò‚\0a\0\0 ìv ìvhÂŽ#<ÚN)U¸>Ì2§¦*x\\sÍ5­îÇ\Z\0Â\0\0@Ø!ì@Ø1ÃŽ!%$¯ÖÖß¿°£tàQ¸hyapÑ™EÇK]¯³‹¢ ì\0\0\0„Â„Âa‡°£ÓÚNiAEŒÌ(7è(<\n¯×6H@Ø\0\0;„;`Ø‘\0êêêÒI\'”Î9çœ´qãÆVû&L˜N<ñÄtúé§§‡z(Û·oß¾tíµ×f×‰}ãÇOhu½I“&¥“O>9vÚiéÈöíÙ³\']qÅÙuâºÃ†\rK;wî<æqmÛ¶-\r:4pÂ	éÌ3ÏL«V­Ê¶?ûì³é¬³ÎÊ¶ÇãyðÁ[ÝçÅ_œÎ?ÿül[üçž{nv?W]u•°£Êî*6E\0Â\0\0@Ø!ì@Ø1€ÃŽþçN‹-ÊNÿÝßý]«}±=‚ƒ8ÁEì‹ #Î?üðÃiÞ¼yÙé<\n¯·`Á‚´~ýúìô©§žší‹P%Î¿øâ‹iíÚµÙéK.¹ä˜Çué¥—fû\"äˆŸÂÄö:V¯^vìØ‘m?å”SZÝçÒ¥KÓ®]»²m–äGþwvŽÀ£§ƒ\0„\0\0€°CØ°£\nÂŽC‡e-NÇ¨‹bÓ>Åéã?>;—éÎõ\n[þz…-¹¶Û·nÝš¦L™’Þ(¼ŸÂß£ím>FaGåëîÔS¦®v\0\0\0ÂaÂaG6íS©Ð\">.Óöz1eUG×+ Ú{\\¥ÂŽ˜Ò*¶?úè£EÃŽb·!ì¨ÞÀ£³#3,F ì\0\0\0„Â„ƒ8ìˆµ8òÂ¿øÅC‹ütT…ÓXÅÚ]oÄˆÙéXÃ#¦²ŠÓ]tQÉi¬V®\\Ùj\Z«|€‘¿n{aGL5äè4VùÇ(ì¨ŠÊÔU\0Â\0\0@Ø!ì@Ø1ÈÃŽXo#¦šŠé¡bª¨ŽB‹X |ìØ±Yø-‚Ž¶”»^SSSËbèq½$b1òbÓU]pÁÙBägŸ}v¶NGlŸ1cFv½¶Ž2¶lÙ’…$qñX…7ðˆ°..7uêT4\0a\0\0 ìv ì¬aG\0ƒ©	;º¦£58bûqÇ\'è\0v\0\0\0ÂaÂŽÁ\ZväGf#„•¬ÔSW;\0\0\0a‡°a‡°CvTmà!è\0v\0\0\0ÂaÂa‡&ì¨ÚÀã¼óÎt\0;\0\0\0a‡°a‡°CvT§X£#^J­á1Plß¾=­Zµ*-]º4ë;Zÿ·%K–¤åË—§Í›7{\"‚°\0\0v;v;„x}è(èX±bEÚ½{·çN…µ={ö¤eË–¥M›6y\"‚°\0\0v;PÌv;ðúPJŒètTvà#n\0a\0\0 ìv ìv;ðúPBÒ=g<ŸAØ\0\0;„(f\n;4ÅQ¯^4Ïgv\0\0\0ÂaŠ™Š›šâ¨×‡J=h|ëÝô­9k³§=×<ŸAØ\0\0;„(f\n;4ÅQ¯ýzpøðÓ¾ƒïµœ_þjSKØ§óÛw¿ÝœÞ~ç=Ï=Ïgv\0\0\0ÂaŠ™ÂMqÔëCå¼DÐ1{åÖôyëÒS/ïJË^iLÓæ¯o	;âtllÍÎ45w™?ùZ:ð®ÀÃó„\0\0€°CØb¦°CSõúP!¯{4§)s×µ„µI¿})íØ{ÐóÏó„\0\0€°CØb¦°CSõúP9¯¯m(;ì˜ûoÛ<÷<ŸAØ\0\0;„(f\n;4ÅQ¯•õzSWåÃŒÉ¼”þÃiKÓÛY‹Ó±-¿ÿ‰—\Z<÷<ŸAØ\0\0;„(f\n;4ÅQ¯•ñzÐøÖ»Ùä…ktD¸Ñör±­p\r¸N\\×sÐó„\0\0€°CØb¦°CSõúÐ¯¯Å¦©ŠÑm/ÛŠ]ÖsÐó„\0\0€°CØbf¯[ºt©¢â(^„žÏ ì\0\0\0„Â3«×Š+ÒîÝ»hkjjÊ-¼>t5ì0•°„\0\0€°CØbfÅÛ²eKZ¶lYzóÍ7hÐ±iÓ&Ol¯];þ¼@ySÙ”Çe=… ì\0\0\0„Â3û<ðxúé§³\"š6pš ÃëCO†O®k(:MU±ö¯kv\n&„ ì\0\0\0„Â3¯•vì=Ðœ¾3o]ÙaÇMs_J»ßnN;@Ø\0\0;„(f^*#ìh~ïpšùôælªªÏoOÏ¼Òz\r8½ì•ÆôÔË»²PäWË·¤C‡\'„ ì\0\0\0„Â3¯•vä¦ý^p< Ï‡q:¿ý­ƒï	:„ ì\0\0\0„Â3¯•v´mo½ÛvÄiA„°„\0\0€°CØb&àõ¡ªÂMØÂ\0\0@Ø!ì@1ðúÐgÆŽ›žzê)a‡°„\0\0€°a‡b&àõáòª}ÜÑ\"ôXºt©°CØÂ\0\0@Ø°C1ðúPaG¾7®èHa‡°„\0\0€°CØb&àõ¡*ÂŽÂ‘…¡‡°CØÂ\0\0@Ø!ì@1ðúPUaGáH˜ÞJØ!ì\0a\0\0 ìv ˜	‚×‡Ü„•ßzìéÂ\0\0@Ø!ìv\0ðfÌ˜1iîÜ¹Y=;Œìð~Ž°\0\0v;P¨Š°£mÈ‘×^Ø±zõêtÑE¥O<1tÒIéÂ/L+W®ìÑBþÑ‚ä€\n\'fÏžN?ýôtüñÇ§‹/¾¸Û¿¿°Ãû9Â\0\0@Ø!ì@qÔaG]]]š3gÎ1!G9aÇgœ‘×­[—^|ñÅìô§?ýiaGí„NÈ~§¤C‡	;¼Ÿ#ì\0\0\0„ÂG\0º¢ÔHŽÎ„1š#Þÿ6nÜxÌ¾={ö¤+®¸¢eÔÇ°aÃÒÎ;[ð\'Mš”N>ùätÚi§¥x Û·uî¹çf×¹êª«Jû-Z”Î>ûì,8ˆËÆ‰-[¶\r\nÏoÛ¶-\r:4»Þ™gž™V­ZÕîöö~öC©}q;ùÇ“Lí=^a‡÷s„\0\0€°CØâ@7µvÜ}÷ÝYÁ0‹	&d#<òûbÄHì‹k×®ÍN_rÉ%­\nø,Hë×¯ÏNŸzê©Ù¾òû\"0(Uì?å”S²í[·nÍ¦ÓŠÓçŸ~‡áÁ¥—^šŽ0#~žsÎ9ínoï÷hï1tõñ	;¼Ÿ#ì\0\0\0„ÂG\0ú0ìˆktD G¼F\0ÛÛŽ`ˆÛJ÷cýŠÂëÅôNÑJûc}Ø#\'\"¨˜1cF6\n££ð ûmo¯£íÅ~öCWŸ°Ãû9Â\0\0@Ø!ì@q ÃŽ|Û±cG«  0´èhŠbaDGaGì‹Çöo|#[\'$.kˆôVØQì÷hï1tõñ	;¼Ÿ#ì\0\0\0„ÂG\0ú0ìˆµ-âý/¦izþùç[ôGŒ‘µ8ò‹—_tÑE÷cŠ¨!G§±š7o^Ébÿ\\Ð2íÔ®]»²ÓŸüä\'³}±Hœ)²{ì±¢ÓXÅˆ”!E¦±j»½½ß£½ÇÐÞ¾¶¿S{WØáýa\0\0 ìv 8Ð‹aG¬a…ÿýÓPÅÔMù…½›šš²é­bqîØ!F,ÞQØ‹xGÐÓ?;¶d±?në«_ýjvûqÙXãÙgŸÍö=øàƒÙš±oâÄ‰­n#ÖÐˆ \"®ˆGPÓÞöö~öC{ûÚþNí=^a‡÷s„\0\0€°CØâ@/†Ze4a‡÷s„\0\0€°CØâ€°CØáýa\0\0 ì@Ø¡8 ìÐ„ÞÏv\0\0\0ÂaŠ#\0ÂMØáýa\0\0 ìv 8 ìv®½öÚìý»½6fÌ(a\0\0 ì@Ø!ì\0vhÂŽÊ´|ùòÃŽ¹sçúC	;\0\0\0aÂa€°CvT®qãÆ•:êêê²¿Â\0\0@Ø°CØ ìÐ„«½ÑsæÌñvTê‡Š¾þúëóêëë?\\ºtiö×ú¿-Y²$^SöæÚ(}\0„Â„\0ÂMØÑ§Š­ÝkuÕ!ì¨Ôt¬X±\"íÞ½Ûk\\…µ={ö¤gŸ}öÀ’%K¾æã/\0€°CØ°@Ø¡	;úL±ÑÖê ’ÃŽÑ!è¨èÀã¹×ÝW}ü\0v;v\0;4aGŸ\Z?~¼QTMØSWym«ø×Ý÷}ü\0v;v\0;4aGŸŠâq>ì˜?¾?vxÝ­Ž×]\0„Â„\0ÂMØÑçòkwÕÁ@	;Þ}»1½þÜ¬´aÉY‹Ó±Íë¢°\0\0a‡°a€°CØ1@å×î€v¼³¿!­ÿÝ´ôÒc“[µØû¼6\n;\0\0v;v\0;„ÐwÞ™½ŸÇO¨ö°cÇ†9&èÈ·õÚ(ì\0\0@Ø!ì@ØPÈB¹ÂŽà?øAúÈG>’Î;ï¼ìç­·Þê\"ì¨ê°ãÕg~P2ìˆ}^…\0\0;„;\0\n¬X±\"íÞ½[q«B[SSSHÑqÐ‘8bdÇqÇ\'ðè¢]»v¥Y³f¥›o¾9]}õÕiÄˆ-‹¿G‹óuuuéÆoL?ûÙÏÒÆ…½v¬_|{É°#öy}vtGmmí\'jjjrOéË˜kÏäÚŽÂçy®5æÚªÜe~‘»ìØÜé¿T\0\0„Â„\0mË–-iÙ²eéÍ7ßTàªÐ cÓ¦M:j™AGGÛ)mÑ¢Eiüøñ©MÁ³ÃV[[›…÷ßE-/ìÐ„Çºì²Ë>WSS³ ÷Ü=ÔÉçúû~äZÝÐ¡C?ª4\0\0;„;\0*6ðxúé§³âŽV9MÐÑ¾ÁÑ^ ‘ßo\röÅÂîcÆŒétÈQ¬\Z5*í!ìè~Ø±aÉ%ÃŽØ\'vtò3þßäÚs=ñ<ÏµWc´‡ò\0\0 ìv ì\0\0z(èè(È0Â£}ñwi[È9rdš>}zš7o^Ú°aCjllL‡Ê.äÈ‘lÚ»áæÏŸŸ]nôèÑÇÜÆ¸qã²UØÑõ°cóÊŸ–;bŸ@BØQ®ÚÚÚéGGfôèó<×žÈÝÎ§”	\0\0a‡°a\0Ðù\0£Ü½ü`°ÿþl=ŽÂÂeLE5{öì¬ÈÙÍÍÍiáÂ…iâÄ‰ÇCüqaGÃŽ}\rëÒú§n;v\n«Ü¶Ø\'vtdøðá;ºG¯=Ïkjjöç~U*\0\0„Â„\0@‚ŽÎŽÔx´:®¼òÊVËiÓ¦eßìîŽ>ø 7âã…ëyüæ7¿vt!ìˆ¶õù‡Ž	;b›0BØQfÐ±¢/žç¹öN®}M¹\0\0v;v\0\0½tôÔõŠ¶#:b\Z›(`ö”†††4yòäV÷1wî\\aGgÃŽÃ‡Óæ?Ì<v\n«Ü¶Ø\'vtð™þ™>~žª©©ù’’\0 ìv ì\0\0ÚÑÑbäÅíÔÞ1[9·3µ]££¾¾¾Wî\'æþyþGx¬Y³FØQfØñÎþ†´iå}%×ìˆ}q¡„°£˜£ktôùó<FxäîûLe\0@Ø!ì@Ø\0´Pt4U9aG¬#<–/_~ÌˆŽÞ‹ßu×]-÷7bÄˆ´k×.aG{aÇáÃ©qóÓéå\'¿[2èÈ·¸L\\Ö(aG›ÏòS¸y_?Ïs­±¶¶öJ\0€°CØ°\0(L”³ÖF¹aGgow =zt«¹û{rJ›R<˜Æ×r¿S§Nv”;:\ZÍa”‡°£555kúûyž{÷*\0\0ÂaÂ\0 M QîŒÎ„ƒ-ðX´hQK!²®®®Û‹wÆ/¼Ðj:«7\n;Š„åŒæho”‡€BØqÙe—}®žçG,ÿKå\0@Ø!ì D‘#úý`úv\'\0¤ £+aGþ`0Liuíµ×¶\"gÏžÝç÷Ï=÷´ÜÿÍ7ß,ì(vt5èÈ7…°#÷üz´Ržç¹öCå\0@Ø!ì ŸŠ)çwÞ ^°\0*EWˆ®„]\rVªI¬“‘/@Ž92íÞ½»ÏÃ–-[Z­²wï^a‡@AØÑƒbŒÜsëP¥<Ïkjjö×ÕÕý…\0 ìvÐOß\ZâÊqÇ\'ð\0€~:º2Ú²«aGá1Aµò;vlzê©§Ú½Ì¬Y³Z\nÓ§Oï·Ç:qâÄ–Ç1gÎa‡@AØÑƒjjj.¯´çymmíW”\0\0aÇ \n;öïßŸæÏŸŸ¾ÿýïgÈM˜0!û&Nþ\0ñšk®IS¦LIÿ÷Ÿ}(|ýõ×UAz)è,ßî€JoîjàÐ°#ÿÕö¥‡ü1c„K—.-z™˜6*¹yóæõÛc}ä‘Gút¡òþ;jkkçÚß\n;„}Ý¯bÚ¨J{ž[¨\0v’°ã÷¿ÿ}öA~Ô¨QYÈ±páÂ´nÝºl¸ñ|Ðr¹}ûöe‹8>ùä“Ù¨£GÎ>þÓ?ýSvN÷¾5Zª˜Ño•\0]:º4t7ì(ç¡RÃŽ|7nÜ1#=®¾úê–ý}µ8x1õõõ­Â™v|£}qMMÍg…ÂŽ¾êW¹ýÏTÚó<¯\0 ìècå~«\'ÂŽ˜Ç4><Ç¼øÆM„qäÈ‘´råÊ, ¹þúëÓ‚TGºXÄè(È0Â\0ª\'èè©°£ÚŽÚ†…aB>ô1bDËöÆÆÆ~{¬Û·ooyñ˜rØQÐž(ö9CØ!ìèé~•Û¶£Òžç¹Ö¨º\0;úéà±£o`u÷ƒóoûÛì›u¿þõ¯Ssss·$Ÿ{î¹ìÛ{1ÍUL‡EùÅ‹rGlTëüÝ\0P-ÊIQbôt«öc€RaGáHÂó‡ê·Ç\Z_Ú)|,ƒ$ìhùœQXœv;zº_Uêó\\u\0vôÿÁã%Fztù ïÇ?þq6ã…^èÑƒÉƒ¦3f¤«®º*mÛ¶MÅ¤¾¥)ð\0€ÞñÆodéóÎ;¯œ¢uŸ†!WGaBµµJ\ngSØQø9#¾\\%ìvôt¿ªÔç¹ê\n\0 ì¨ƒÇ\"Ó[u9è¸á†²õ8zK,^ëyÄºô\\ÐÑS×\0Š+gzÉ!Fv”UT,lcÆŒIsçÎÍŠ¶ƒudG%‡NÂŽÊoÕj\ZÙ\0 ìèðX]	;bêªÞ:ò-Z”®¸â\n#<JQºTTÛ‚¥\0P-¬ÙÑsýÂ#Ïšñ¹â¹Üç‰/\r:ô£q¹Þ;î¾ûîô™Ï|&pÂ	éãÿxö7Žõc_þyQ\r!C¥<Ö*ÙÑÒ¯¬Ù\0Ðõâÿ lýà.bŽµk×öÙÁåÃ?œ®»îºVp=÷­L#<\0 wî¼g÷DØQm_nÈ§ÖÕÕe#}‹Æñhþr7nì·ÇZ__ßjõAv´\n9òz:ìˆimã÷ýüç?Ÿ}«?¾çÏ9çaÇÀ;ŽéW¹mÏTÚó<fJP]\0¨œp§íAd§ôn¹å–l1ò¾6qâÄtï½÷*š´)š|øá‡ÙëøÙm¯g\r\0èÝ÷î®\rÝ\r;zè¡tÜqÇUÕ—\ZŠähë¦›nj9¾7o^¿=Ö¸ïüãˆÇ4ÀÃŽUµµµ_irôVØqî¹çf¿ï‚:öíÛ—®½öÚtÒI\'¥O<1?>8p Û!ÉÙgŸ‰ý_|qËè={öd£Èã:±oØ°aiçÎÇÜW{·Ÿq»çŸ~¶-\nóñøãò±aácmï>‹ÝÖ ;Jö«Ü¾û*íyIµ\0 ÿÃŽ¢ßÀêÌçßÿþ÷Y¼¹¹¹Ï0\Z\ZÒÈ‘#Ó®]»KŽ+\"¨8ãŒ3²Dñ³ÜÀ£Ôõ\0Ð;º3²¢;aGþ½}êÔ©îoúË_þ²å8wúôéýö8&OžÜò8~ó›ßÔ°£Ôçˆ^\r;\"œˆß7*´vD§cDx¦ãt±ï”SNÉÎoÝº5­^½:;bôPœñÅ³‘ëqú’K.9æ¾Ú»ýüãXºtiöY%¶åþV-AM~DJþ±¶wŸÅnk\0‡ö«ÚÚÚQ•ö<Ïµ¯©6\0\0ô_ØÑî7°:óÁ9>¨ÏŸ?¿ß2ï¹çžA;ÕR±o…FðTX\0)\'ð(:òíšk®é‘bÌÿßÞýÇX]Þ‰w1ÖkÜÄÖØ¤k6»ÙÓ³üa¼	Á4æ&ñ&½mo—2€€€ øT„Š?©ìX]mwµ 4-†²e\"•KÅ^pYXŠ¢T)™\n(0à:ÂŠÍsçó½žñÌáœ™3?Ï™9¯Wò„33gæÇùž™ó}Ÿçy\0€žý.ÈØ1œCGˆWæçþÞÄœ<yrÐïCÁ:þƒò¢œJÄŽrõwì8÷Üs³ÿÞ˜UÑ]ìˆYq9–»Š—ã}ñ±Q£FeoG<¹îºë²å±bvEþçåÜçå®¾~îóâý]]¿ð¾»Íb_k¸ÆŽr´ÛÙ~lª¢ãüTûsë¿p¶\0`ðcGY¯À*÷‰skkk\Z?~|öd£RbvGû—5·wG©\0Q,\\t<Ê½¾=<\0`à~§÷tI©ÞÄŽZyñBþ¾•xAÎâÅ‹;n?–\\µ;boŽsÊ\\Æ*–ƒ*Œ^xaö±x;îÛí·ßž.½ôÒŽ¿£DW÷¥«¯N‘ý8Ê‰ÅnóœÞÛc¨ÅŽ/ž×¾R-ÇyûXêL\0@u+ë¼øÃòþûï¯ø“Ú[o½5­[·nÈ=Y½¹ßÝmF^nÀèi±¤\0\\ðèÉïØžÆŽZúž¿”Õ-·Ü’<,¹%Vs·¿uëV±£ŸcÇ3Ï<“ý÷^ýõÙÿÛ^x!{ûoÿöoÏ\n¹¥¡ò—™ŠŸ‰øØÕW_½ÿböM\\þÚ×¾–}¬®®.{{É’%Ù²RqyôèÑgÝ—®¾~±@ËRåBMîú¹ëtu›bÇÙò—²ªôqÞþÿîïœ>\0\0±ãÑGMkÖ¬©ø“ÚE‹\rÉW)æþ@ŽèkðöçÉŠîBFOCGþíµ\rM`(èÉ,ÊžÄŽž†”¡.NÞN˜0¡ãï¬_|qÐn{Á‚·{7–ZŠ1\"ÄFßù›‹G´(¶Ayü³&bÄIñÜ^Hßþö·³Ï¯ûu¼úê«ÙÇš››³‘Ûx<\"E\\¿Øå¥¾~±@Ë¬ÅÌ”¸½ü¥g»»M±ãl±RAûqöûJçcÆŒùµS\0\0Ã$vÄ¬Ž]»vUüIml*KÕØ‘Ó¦Mër¦GO—’*4Îœ9Ó«ÐQxÒDð\0€ÊrcGo–È\ZògwÄ+°÷ïß?à·¹víÚN×Åß§bÇÀÄCìù³;*tœŸ3fÌN\0\0“Ø¯^jii©øÚx%TLýê±#¦GaôèížÅ‚ÇW¾ò•^‡Ž¾Þ\0 ï¿cË‰µþ»zúôé[Ýyç©­­mÀnkË–-–µyê©§õ¿Uì0j1v„öãmM¥Žóö1Ãi\0€a;â½Ï?ÿ¼jÂÁp‰ù3=by«¾Î¤(<ú:\nO¢ØÃ\0úW_—žªµ¥«Š‰%€ÆŽÛñwÕÂ…ÓgŸ}6 \'@cù¡ÁÞ”\\ì0ÄŽsÎùÞ÷¾÷Õöãîè`ç6%\0†±£šCwá`¨Žï|ç;ÙØ‘#GöéûKWÎèˆ·ãý}÷+¾Ö`L€Z=}±ƒ#|)^4’ÿwU¬µû,ô—XÒ&ÿ•ÞñB•ÖÖV±Cì;Ñ˜1cþ{ûh¬ã¼}¼ü½ï}ïÏ2\0\0f±ÃÌŽ	4\'NL\r\r\rÙ“þxu¦™\0_:xð`¶‘mœ<FåÇúõëÓ¦M›Ò¾}ûü€–ø][nð°ÌäÙV¬XÑéï¬xuö¶mÛúô5:”|ðÁ³fäV\"tˆF­ÇŽ0vìØÿÕ~ž\Zèã\\è\0\0Æ±£Zöì8zôè°Ø³£0rôÇÉ{v\0t›7oÎ~w9ÁU]#~—766¦½{÷úAíåïÜeË–e×›7ožoZÕ«WwZÒ*F}}}Ú³gOC/^\\ø*ïléªJ…±Ã;þ¿¿ÿû¿ÿíÇãÇuœÇÒUB\0À0Ž÷Ýw_zçw*þvûöíiòäÉC6vÄ+âU‡Å\"G±“åÎ¤(:âíXºªØûË\r}ÝC RbF‡ÐQÝÁ#fÜPúwo©¿âý#FŒ:º°sçÎìÅ1…/6¹í¶Û²¿Ã\"„Æ²œ¹õþãß8é¯_¹reš;wnÑ¹ƒ½¹Øaˆ¥;öòöãò½~>ÎÏØŒ\0 bÇ£>š­aZi‹-JóçÏrOº»šÉÑ×Ww–\n¹ ÑÝÇ»zÕhœL:€¡(N¤;±Uý\'ÝèÙß\0f[–/f_Ä÷©p–GoÆŒ3²ÜT±Ã;¾³/ÚñúÂY½cÆŒùuû¸Âé\0€\Zˆñê—…Vü	^,P\rÑe°_ÝYê¤F¹!£§Á#w2Å«F¡ÊI7±c¸¡£wšššŠ­Å_Öˆ¿;c–X5;±ãlãÆûËöcö‡ù›——9bï¥uuuç´\0\0@\rÅŽÃ‡g³ÚÚÚ*öä®¹¹9{u^%ïC5½º³§£Üë@­ÅŽ#~’î\\ñf6â²bbGµý\r0räH¡£âïÇØÏ#fÇã…Ë\\ÅÛS§NM÷ÜsOZºtiö·o5;±£´I“&ý·/öóx<6/²ÌÕ‘öç“ÿÖþïScÆŒù~ûå¿p:\0\0 cG¸÷Þ{³\rE+å™gžI³gÏ®É\'è¹õ¹óOrÄòsz¸4U±àqÓM7uº\'S€á;NŸþ¯tüä§ooúCsGìˆË¹÷·|Ô–>úøS\'ÈÄŽŠºùæ›cy•´`ÁßÄCì\0\0€þˆñj¸»ï¾;}þùçy5Þ¸qã²¥jUá†¥ùá¢\'›Ž—ú¼žnŠ0cG„Žå[ÞM?X¹+­ûýáÔ¸ûHºÕÛ±#.Çû_Úù~š×~\'ûŸéÄ\'‚‡ØQ9“&MÊ^‘b‡!v\0\0@?ÅŽ0sæÌ´yóæAbW__Ÿ-+Pë\n—´ŠP33Ê\rùÁ#ÿó\nC\nÀpÇN´¥¹\r»:âFwãî}+½wì¤“dbGEüüç?ïX~¥–_ðØaˆ\0\0Ðï±#6uŽ[[[íIÝÎ;Óøñãõ6‡Rðè«bKd×Øcí›‡ÊŽ\rÿqÀ	2±£\"r³Zs±Ã^Zˆ†Ø\0\0ý;B<ÙþÉO~2(ËYÅæñD?–Ð¢ÿƒG‡€¡;béª\\Ì˜óü[éWÿ¾?55”¸ïË}üå·9A&vTÄc=Öií±cÇ¦cÇŽùÆˆb‡!v\0\0@ÅŽøC96Ç^¶lÙ€>™kiiI7Þxczâ‰\'<³-¢¯KOYº\n¨µØqäÃO²\rÈó÷èˆ¸Qx½x_þñ9ñ¹N”‰ƒ%¢FÄüØãÇ?þ±oŽØQµ\'«7lØà±­ºÇ©öÇÝ3žþ\0 vˆ7ÜpCZµjÕ€<‘‹¯¡ÃŒƒò‚EO¿O6#j1v[¦*fs^/ÞWìºN”‰ƒ%fÑ†ŽuuuÙòVˆÕhÓ¦MGâÅJßªs:tè_Ûwÿàé/\0\0bG±Qf¥K—öë“¸Ø£#–®2££gá¢Üàaé*@ì;ÄŽêµk×®¢¡#7\Z\Z\Z|“ÄŽª´qãÆo566~ôÁ|ê1®ºftDèX¿~ýöñ¿=ý\0@ì(!f`Ü|óÍiæÌ™éÀ}úZñJÅúúúl3r{tLðˆ¥Çâz69j1vXÆJì\n¦M›Öeìˆ¥D;ªÕúõëÿgû±ý»X.)Žq£*Fü¿øƒÐ\0€ØQ¦XC:fcD¬øãÿØ£ÏmnnNK–,É>ÿî»ïN­­­žÉöBw{pÄûGŒ!t\05;¾Ü ¼¹ì\rÊãºÂ„Ø1XbÖì¤I“²¿‰b”\n›6mòÍ;\0\0\0ˆØ\"R<üðÃÙzÒ1Ûã\'?ùIzõÕWÓÁƒ;]ïøñãiûöíiÑ¢EiÖ¬YÙœ³gÏÎžàÓ7¥fxXº\n;¾¿Ýu¨è2UÅÆov¾/LˆËzÎ™3\'íÙ³\'ëÖ­ËþEì\0\0\0`€bG¾\r6dá#–b(|ebÄxÕâüùóÓÚµkm´9ÀÁCè\0ÄŽ/Ç±mé+w•;îix+µ|Ô&Nˆ³páB¿Ã;\0\0\0*;¨Žà1räH¡;òFÛ§§Óâû²¥ª~½ã`zewç=<ârãî#iÝïgQä›šÒ©Ó§Å	±£bâwx;\0\0\0ÄŽš{tÄLšR{x\0ÔbìÈæÖ/7\rÈs±#.çÞÿáÉO…±£âæÎ›-eb\0\0€ØQ³\"v\0ˆ]#~Ò;â²!vT“Ø×,ö9±\0\0@ì;\0†‰cÇŽõ{ì0ÄŽjvë­·¦¥K—úF v\0\0\0ˆbÀp1~üø4þün£‡Ø!vÓ§OO\r\r\r¾ˆ\0\0\0b‡Ø0\\Œ7.{l‹ñÈ#¤ÖÖV±CìÖ¦L™’~ó›ßøF v\0\0\0ˆbÀp1vìØŽØ‘Ï>ûlvò\\ì;†£I“&¥W^yÅ7±\0\0@ì;\0Êñ§?ýiH<®±¼ÕªU«Ä±cØ™0aBÚ¾}»ob\0\0€Ø!v\0”:ŠE„ºººlÄòQâÄë\r7Ü&Nœ˜&Ožœ-±3uêÔtÓM7¥3f¤™3g¦Ûn»-ÝqÇiöìÙiÎœ9iîÜ¹éÞ{ïM<ð@zè¡‡ÒøÃôÿðéñÇOO>ùdú§ú§´hÑ¢´dÉ’ô‹_ü\"-[¶,­X±\"­\\¹2½øâ‹Ù>ëÖ­Ë^Ý^*väFÜ·ø\\±Cì.âØÛ½{·ob\0\0€Ø!v\0”û˜{`|üñÇéøñã©¹¹98p íÛ·/;ÙºsçÎìæ[¶lIY€ˆA\"ÂDD†,\"\\DÀˆA#ÂFŽ<\"|D\0‰A$ÂH’%L\"œD@™6mZT\"¬Är>ÝÅŽÜ2Wb‡Ø1\\ÄÏôûï¿ïØ\0\0 vˆ\0å>f;v¬êïc±qË-·¤µk×v\\Oì¨þÑ]¸ªäˆÀ£pVS·o¼±c6SüÜÝzë­iÖ¬Yé®»îÊâÝ}÷Ý—|ðÁôÈ#¤G}4‹}O=õTZ¼xqÿå_þ%544¤Õ«W§—_~9›±´uëÖôúë¯gQ±©©)‹ÛÚÚ²ûqâÄ	Pˆ\0\0\0b‡ØPŽ8©\Z39ªUÌ:)<)=oÞ¼¢û”;âóFÎ?ÿütÁ¤Q£Fe³Vâc_œP,úy]}l8ŽåË—§K.¹${î¹éšk®éòº=ùÞTëÌŽS§Ne¡áðáÃYxˆ\0!\"‚D„‰*b6S|o–.]šž}öÙôôÓOga#G„Ž>\"€D‰ÙK1séæ›oNÓ§OÏ‚I„“(R\"¨DX‰À’›¡”ûw(ì§ƒØ\0\0 v v\0U¡Ú÷Ø³gOÇ	àˆq2º”rbÇe—]–8ÜµkWzã7²Ë—^ziM®Æyç—}/bvA„€á;ªÐØ\0\0 vˆbÐñêò;vTíý‹Y\'?üpYKm•;b6GüŒˆRê¤},S3?bfCìGRxB?w9^_ïÊ+¯,úõb&ÀW\\‘…ƒ¸^ÌˆYÅAþÛñßüo|#û¼Ë/¿<›]ÐÕû=šmÒž›­òÝï~7[©»ûPêcñur÷§ð¿¹Øý;@ì\0\0\0;;€Šš8qbzíµ×†ÅK9±ã±ÇËN^xá…YÔˆ…\'ð#D¼ˆË_|qÉ“û/¼ðBvÝ¸|íµ×žu[]tQö±wß}7[>+._uÕUÝÆƒë®».»1#þ˜ÒÕû#ºÄÛ1SåÍ7ßÌ.ó›ßìö>ôöþ‰ v\0\0\0ˆˆ@U™<yrZ·n]ÍÄŽ±GG‚ñ;1H©ú±gE©“û±¼SŒ¸³!\no\'ö‰ÅÌ‰?ýéO³YÝÅƒÜÌŠÂ¯×ÝûóGîþtuz{ÿÄ;\0\0\0ÄÄ ªÄ†É1;¡–bGn¼÷Þ{Â@¹\'ô‹ÅŽXªðëÇÇâ>Ý~ûíÙ¾ q½Ø3d bG±½5ºº½½bˆ\0\0\0bbPU¦OŸž\Z\Z\Zj&vÄ^ñ{0–mŠ½JÊ=Á_ìrìç±fÍšìòõ×_Öm]}õÕËNÅÆêqùk_ûZö±X+Þ~ûí·ÓK/½Tt«˜rN‘e¬\nß_WW—½½dÉ’ŽM×GÝí}èêc…ß‹®î¯Øb\0\0€ØØTÔÌ™3³“öµ;bO‹1\"–¨Š¥œr}÷4vÌ˜1#û\Z±ÏEì{Qx[±¡ø·¿ýílÖG,×{õÕW³=÷ÜsÙžñ±Y³fuúúñµ\"DÄçÄâfºzsssÇféñßûuÄmwwºúXá÷¢«û+v€Ø\0\0 v v\0Kýìg?«™ØÑ£\'\'÷\r±Ä\0\0\0±±`wÝuWzúé§ÅŽŒ˜=QlCrCì\0±\0\0@ì@ì\0*`îÜ¹éÉ\'Ÿ;±Ä\0\0\0±±šî»ï¾T__/vbˆ\0\0\0bbG%<x0Û`xÃ†\rÙ‰4cèõë×§M›6¥}ûö9¨ØÃ?œ,X vbˆ\0\0\0bbG%CÇæÍ›SKK‹‰Ãl=z4566¦½{÷:°PÌêˆÙb‡!v€Ø\0\0 v vTHÌè:†wðˆ;œ\'žx\"Í›7Oì0Ä;\0\0\0ÄÄŽJ‰áN :9Jï=ýôÓé®»î;Ç3ˆ\0\0\0bb‡“›†“£CÓ’%KÒwÜáñÀp<ƒØ\0\0 v vTûÉÍO>:’þø»¥éõ²—ã}N>:9Zë–-[–fÎœ)vŽg;\0\0\0ÄÄŽj>¹ùqë¡ôöÿ½?½õÒœN#ÞsÒÉÑZÖÐÐ¦OŸ.vŽg;\0\0\0ÄÄŽj>¹ùÞ;ÿç¬Ð‘ï¿³Æ	H\'GkÚêÕ«ÓÔ©SÅÃñb\0\0€ØØQÍ\'7ÿðÊJÆŽø˜NŽÖ²uëÖ¥É“\'‹†ãÄ\0\0\0±±£šOn¾ýo•Œñ1\' ­e¯½öZºá†ÄÃñb\0\0€ØØ!vNŽM;vìH&L;Ç3ˆ\0\0\0bbG5ŸÜ|gý‚’±#>æ¤“£µl÷îÝiÜ¸qÃâ¿eÃ†\rŽÇ3ˆ\0\0\0bbÇðŒû¶<]2vÄÇœ€tr´–8p ;vXü·lÞ¼9µ´´8nªt477gA\n;\0\0\0ÄÄŽ^ÄŽã‡v¥·×=xöVíï‹9	)vÔ²ˆÃ%v455¥ÆÆÆôÁ8vª4tìÝ»×Ab\0\0€ØØÑ›ØãÝËÎŠñ>\'!ÅŽZ×ÖÖ6¬7\"xlÜ¸1û¹1ªg v\0\0\0ˆˆ}§O§}ÿ¾øì%¬ÚßÄŽZ¶`Á‚4fÌ˜ôÃþÐ7@ì\0\0\0;;ª1v|Üz(íÝòTÉ=;âcqQAì¨E?úÑÒŸýÙŸ¥‘#Gfÿ>ðÀ¾)\0b\0\0€ØØQ5±ãôétdßÆôûßÞ[2täF\\\'®k–‡ØQ‹¡#8bfÇˆ#\0±\0\0@ì@ì¨†ØÑÝl³<Ä¡ãGEgr”z?\0b\0\0€ØØ1È±£œÙ]ÍòÄŽá,fpt4r·‡€Ø\0\0 v vT0vô6tä†À v÷ÐÑ]È0Ã@ì\0\0\0;;*;±ƒÒ£Ü=½>\0b\0\0€ØØ!vbÇ€‡ŽžÎÔ<\0Ä\0\0\0±±Cì0ÄŽ!:úëó;\0\0\0ÄÄ±Cì;z­»ÍÈûë\0 v\0\0\0ˆˆb‡ØAE-Ae†€Ø\0\0 v vˆ†Ø1h\n÷ÚøÓŸþ”¦NšýÛ…Ÿg\0±\0\0@ì@ì;±cÐBGnF„ŠË.»,;Yÿ–<J}žà v\0\0\0ˆˆb‡!vZè13ã‹eeüÐ‘7ÝtSÇÇíá v\0\0\0ˆˆeˆ“Üb‡!v”¯T€(.º\nå^ß\0b\0\0€ØØÑÉ“\'§ÿøÇ©­­Mì;jæøYëÖ­ëuè(µ´T¹£§aÄ’V\0b\0\0€ØØÑ…qãÆeÿ-uuué©§ž*=Ä±c¸¿1\"zlØ°¡¬Ï)78t2z\Z:òoÄˆfx\0ˆ\0\0\0bbG¡ˆ¹¿1\"~¬X±Bì;j\"väÆ´iÓºœéÑÓ¥¤J3gÎô*täØÃ@ì\0\0\0;;Ê8é›\'NL«V­;ÄŽšˆù3=\n£Go÷Ì(<¾ò•¯ô:tôõþ\0 v\0\0\0ˆty²tìØ±ÿÆˆÙ1CbüøñiÂ„	Ùˆx0iÒ¤lŒo¼1;©\Z¯&Ÿ>}zš1cFš9sfºõÖ[Óí·ßžfÏžîºë®t÷Ýw§¹sç¦{ï½7Ýwß}é¡‡J?üpzä‘GR}}}züñÇÓO<‘þùŸÿ9=ýôÓé™gžIK–,IK—.MË–-K¿úÕ¯RCCC-V¯^Ö®]›È}å•WÒk¯½–¶nÝZò¤onÜpÃ\rÙL±Cì¨…Ø‘?Ó#–·êëLŠbÁ£/¡£0xØÃ@ì\0\0\0;è³8A{\\´¶¶¦cÇŽ¥÷ß?8p íÛ·/íÞ½;½õÖ[iÇŽiÛ¶mióæÍYdˆØðòË/gñ!\"DÄˆˆ	\'\"Rüìg?K‹/ÎâEDŒ\'Ÿ|2‹\Z7\"r,X° ‹?\"‚Ì›7/‹\"GfÍš•î¸ãŽ,šD<¹ùæ›³˜\'n#®L™2%‹-]\"bÄèî¤onˆÃ”û³P+ã;ßùNvâkäÈ‘}zœˆ¥«\ngtÄÛñþ¾ˆû_kÿþýŒÄ\0\0\0±ƒÚVêDo„‘˜	’#v˜ÙQ?÷1+d|?BnfGogP˜Ù v\0\0\0ˆ0ÀbVJáÉÞXR«ØFÍƒ;¶oßžFÎ?ÿütÁ¤Q£F¥-[¶dË .öy]}¬Ò£šï›ØQ:röì\0;\0\0\0Ä¨B{öìé8Ùû„ÄÛ¥FìÈÞµkWzã7²Ë—^zé‹bÇÐ‰±¤[,#W,råÎ¤(:âíXºªØûË\r}ÝC\0±\0\0@ì`ØijjÊöùè*rfìˆÙqÜÄý)\rn¹å–læÇ%—\\’ísRr—ã$v|½+¯¼ò¬¯·Çubùx;ö.‰·—/_žŽ?žísŸ·3]Nœ8Q4\\ä¿{µ|ãßHçw^ºüòË³Íß»»ßGÍn;7“å»ßýn¶ïKþç]sÍ5éª«®;úYW39ºÝ…†R¡#4ºûx)ñs3bÄ¡@ì\0\0\0; ·#v<öØcÙ‰†/¼0‹1Ã£0,ÄÆî/âòÅ_\\2v¼ðÂÙuãòµ×^Ûév>œ½ÿ¯þê¯²·ÿú¯ÿ:{û½÷ÞËBG\\Ž ²råÊìrîbÇu×]—]ŽÈÿFdéî~G‰·cË›o¾™]þæ7¿Ùéó6lØÝ_±£:t7³¢ÜÑÓà‘-óæÍ«šïÅÁƒ³Ÿ÷øŸ£òcýúõiÓ¦Miß¾}V;\0\0\0Ä¨Tìˆ{tDˆàÇPR¡áÜsÏ-;N:•¸3\'\noçŠ+®È>öÊ+¯dÿ~ýë_ÏÞ×-õù]ÅŽÜçu·ŒUþýÎ}Nþ(¼­¸–±ª.¥fxô4`”{ýj\r›7oN---Cni¹á>bÆXcccÚ»w¯ƒÄ\0\0\0±*;r#fY”\Zº‹±DTá×™#ñ±o}ë[Ù¿1£#)­üÏðÒŸ±£ðsŠs*°×‡ØÑ³…KJM:µÇKS7ÝtSÙ3I*%ftÕ<bÆ\r v\0\0\0ˆPØ{]Äq³}ûö´cÇŽŽÆ½‰±¿Áš5k²Ë×_ýY·•[¢*öØˆŸþùNKKå/ca$>ËOÅÛo¿ývzé¥—Š.c3SÎ)²ŒU±û]WW—]^²dIÇ†ì£G;†PðÈß´<?\\ôdÓñRŸ×ÓMÑSœHª{8žAì\0\0\0; B±#ö­ˆ“ý1ã!–z\Z5jÔY}—;bŸø\Z±¹÷»ï¾{ÖmÅ¦ãññs¾XV*^	ï\rÊãúqbDèÈmPþÜsÏ¥‹.º(›ý»çßnÜÆÕW_Å“X\"+‚Mw÷»¹¹¹c#õ¸­Ø¯#6:;†ŽÂ%­\"TÄÌŒrCG~ðÈÿ¼ÂR‹†ãÄ\0\0\0±jöäf%\"“£‚G.5Ul‰¬¡üxpäÃOÒ+ÞÌF\\v¬9žAì\0\0\0;@ìèfäfd8ÙéäèPýN*ñxpúô¥ã\'?íx{Óš;bG\\Î½¿å£¶ôÑÇŸ:öÏ v\0\0\0ˆ vNŽV‹¾.=UíKW•óx¡cù–wÓVîJë~85î>’î_õvGìˆËñþ—v¾Ÿæµ_çÉßþg:ñ‰àáx±\0\0@ì\0±Ãpr´ê‚GOgfTófä=y<8v¢-ÍmØÕ7ºwÿë[é½c\'Žg;\0\0\0Ä;\'G«IO—¢\Z*KW•ûx°öÍCeÇŽ†ÿ8àØs<÷«Ã‡§¥K—¦ùóç§)S¦¤ºººôýï¿cÄÛ“&MJ³gÏN‹-J{öìñ …Ø\0\0 v vNŽÒ—€±lÙ²ìzóæÍ6±tU.fÌyþ­ô«ßŸšš?ÊF\\Ž÷å>þò[‡{Žç~±zõê4cÆŒNa£œ1vìØ,~<ûì³Ù÷\r±ÃÓ\0\0\0±±Ãpr”<ÝíÁï1bÄ¥Ž|øI¶yþ7\n¯ïËßÃ#>\'>×1èxîM›6¥‰\'ö8rãÇÏf{ v\0\0\0 v vNŽRÆ¡¸tUwÅ–©ŠÙ…×‹÷»®cÐñÜSqü‹qãÆ¥úúú´råÊôÎ;ï¤#GŽ¤S§Ne×ÿì³ÏRKKKÚ»woZµjUv½	&œõ5¦M›–ššš<€‰\0\0\0ˆˆ†“£”\nC=tˆŽçJkmmÍöãÈ±ÕòåË³˜ÑmmméÅ_L³fÍ:+z¬]»Ö˜Ø\0\0€ØØa89Jað9rä¥,cåx¬Ð1yòäNQâþûïÏfpôÅçŸžÅ˜’¿ŸÇ/ùK`b\0\0\0bb‡áä(9±GGœ@-µ‡Çpy<hÜÝ\\öåq]Çžã¹\'\ngtÄrU*úË¡C‡Òœ9s:ÝFCCƒ0±\0\0@ì\0±Ãpr”œ8q:Ü~»ëPÑeªŠßì|ß±çx.[áÛ¶mÛ‰=>b?ü;wîô\0&v\0\0\0ˆ vNŽR±ãØ‰¶ôƒ•»ÊŽ÷4¼•Z>jsü9ž»µiÓ¦³ft¤ØÌ|áÂ…·WWW—>ìALì\0\0\0;@ì0œe¸ÇŽ¶OO§Å÷eKUýzÇÁôÊîÎ{xÄåÆÝGÒºßÎ¢È/65¥S§O;þÏÝš0aB§=:úséªRNž<™¦M›Öq»óæÍó &v\0\0\0ˆ vNŽRËXEðhnýrÃñØ€<;ârîýžüTèp<—eõêÕÁaÒ¤I}ÞŒ¼\'^ýõNËYíÙ³Ç™Ø\0\0 v€Øa89*vÔÚãÁ‘?éˆqÙ±æxî©éÓ§w‡åË—úíÿã?þcÇíÏŸ?ß™Ø\0\0 v€Øa89*vx<0Ïå‹}2r¡aÜ¸q©¥¥eÐïCSSS§ýBŽ;æÁLì\0\0\0;ÀÉMÃÉQ±Ããáx.ÏÒ¥K;\"C}}}ÅîÇ¬Y³:îÇŠ+<˜‰\0\0\0b8¹i89*vT«©S§¦uëÖy<p<WÍÏ[,•‹+W®¬Ø}}þùçmT.v\0\0\0ˆ vNŽ2bGîdnœ„Þ°aƒÇÇsÅÞ¦L™Òq½Jn¾mÛ¶N÷±\0\0@ì\0±ÃprTì¨ò“Ï¹1mÚ´¢¯¼÷xàx¬Ÿ·ºººŽ9r¤b÷õàÁƒ÷#îb\0\0€Øb‡áä¨Ø1DN>ç¿’=ÿ$´ÇÇó`ý¼å¿ÿÔ©S»¯Ÿ}öY§û‚Ø\0\0 v€Øa89*v±“Ïù¯¼å†<8žëç­šƒØ!v\0\0\0ˆ0Ä	N\'e`Oî•!vTÿ.?kfv v\0\0\0ˆÐ¯6oÞœZZZœD¦£¹¹¹Ë\r©©í3qâÄÔÐÐý¬„JÇŽíÛ·§Ñ£G§óÏ??]pÁiÔ¨QiË–-ÙÇ¾8YYôóºúX©±|ùòtÉ%—¤sÏ=7]sÍ5%¯—ÿµ{s;fvÿy³gb\0\0€Øýª©©)566¦>ø@¦¡cïÞ½~ÐÅŽ.#GN¥cÇe—]–”ÜµkWzã7²Ë—^zé€„†óÎ;/ûz\'NœÈf”ó9bGÿý¼M™2¥ãã{öì©Ø}Ý¶m[§=E;\0\0\0ÄâÁcãÆÙI4cø¡ƒÂ“Ï“&MJ+V¬8+rTKìˆÙñ;6N~—\n\r·ÜrK6ó#fe,[¶¬äì‹øo¯wå•Wžõõâós×Ë}Þ«¯¾š¾þõ¯g$¾ösÏ=gfÇ\0þ¼ÝsÏ=×[¹reÅîkÜvî~Ä}Bì\0\0\0;\0 J•šÉQm±ã±ÇËNJ^xá…YÔˆ…±cõêÕY¼ˆË_|qÉ ñÂ/d×Ë×^{m·³4\"tÄ2Zï½÷^öþ‹.ºHìÀŸ·Ÿÿüç‘¡¾¾¾b÷uÎœ9÷ã—¿ü¥±\0\0@ì\0€¡®\Z6(=:bF@ø}¤XhˆË±ßF© KSÅˆË1“£»Øñî»ï¦¹sç¦«®ºªdà;úOÌ(ÌE†qãÆ¥“\'Oú}Èß¯#ÆáÃ‡=ˆ\0\0\0b\0ˆý7r3,r¡¢Xìè*HäÇŽXÎª»Øqùå—go¯Y³Fì$ùûv¬ZµjÐoñâÅ·?kÖ,\0b\0\0€Ø\0bGßG.8ÄrR;vìÈ.Ç¦å½‰±ŸG.\\\\ýõÝÆŽÜ>¹ÑÅŽ—¿”U,[qj°:t(›Q’»ý­[·z\0;\0\0\0Ä\0;ú>Þ|óÍ4zôè,<ÄU£FÊNB÷&vÌ˜1#û\Z±,U,QÕ]ìøéOšÝî7Þ(v’øï™0aBGpxñÅí¶,XÐq»ñ³‚Ø\0\0 v\0€ØQ5£\Z‚„ØQ¾üÙ1Óbÿþý~›k×®í´WGÌ$Bì\0\0\0;\0@ì¨š³3ŠmH.vT¯éÓ§w„‡;ï¼3µµµ\rØmmÙ²¥ÓòUO=õ”_ì\0\0\0;\0@ì0ÄŽ¾9pà@\Z;vlG€X¸paúì³Ï$tLš4É¦äb\0\0\0b\0b‡!vô¿\r6tZZ*öÔ8~üx¿}ýXº*FÇ´iÓRkk«ƒ^ì\0\0\0;\0@ì0ÄŽþ³bÅŠNÁ#falÛ¶­O_óÐ¡CéÁìôu…±\0\0\0±\0±Ã;ÌêÕ«;-i£¾¾>íÙ³§G_çàÁƒiñâÅfsä–®:Ä\0\0\0Ä\0ÄCìP;wîLuuu\"EŒÛn»-›ý±yóæ´ÿþŽ}=âßˆ1dåÊ•iîÜ¹g}®ÍÈÅO_\0\0\0Ä\0ÄCìT1ûâ8k–GoÆŒ3ÒöíÛàb\0\0\0b\0b‡!v¾¦¦¦³öÜ(wÄ’U[·nu`#v\0\0\0ˆ\0ˆ†ØQymmmÙ~óçÏÏ6/\\æ*Þž:ujºçž{ÒÒ¥KÓáÃ‡Ðˆ\0\0\0b\0b‡!v€Ø\0\0 v\0€Øaˆ v\0\0\0ˆ\0 vbˆ\0\0\0b\0ˆbˆ\0\0\0ˆ\0ˆ†Øb\0\0€Ø\0UmÃ†\r‚‚Øb\0\0€Ø\0C×æÍ›SKK‹¨P¥£¹¹9R€Ø\0\0 v\0@	MMM©±±1}ðÁâB•†Ž½{÷úA±\0\0@ì\0€î‚ÇÆ³å’ŒêBˆ\0\0\0b\0\0ˆ\0\0\0ˆ\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0b\0\0\0b\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0ˆ\0\0\0b\0\0 v\0\0\0Tcì8uê”gŽ\0\0PÅÎœ9Ó*v\0\0\0”ð7ó7ÿîw¿óì\0\0ªØë¯¿¾£ýÏ÷}žÁ\0\0\0qùå—?sÝu×ñô\0\0ªÖ™¯~õ«Úÿ|¯÷\0\0 ¸?o÷ÎèÑ£nÛ¶­õÌÝ\0\0ª¢pœ9Ó\Z3:¾ˆ¿Ý=}\0\0è\"x´‡¾x•Ã0Ã0Ã¨šKW=~ŽÐ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@_ü?cW/Å1UÏ\0\0\0\0IEND®B`‚',1),
('27502',1,'E:\\works\\Fintechviet\\AdServer\\adserver_msb\\target\\classes\\processes\\Order.bpmn20.xml','27501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"OrderProcess\" name=\"Order process\" isExecutable=\"true\">\n    <startEvent id=\"task1\" name=\"Start\"></startEvent>\n    <exclusiveGateway id=\"exclusivegateway1\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow5\" sourceRef=\"exclusivegateway1\" targetRef=\"CancelOrder\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${cancelOrder == true}]]></conditionExpression>\n    </sequenceFlow>\n    <subProcess id=\"subprocess1\" name=\"Sub Process\">\n      <startEvent id=\"startevent2\" name=\"Start\"></startEvent>\n      <exclusiveGateway id=\"exclusivegateway2\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow8\" sourceRef=\"startevent2\" targetRef=\"exclusivegateway2\"></sequenceFlow>\n      <endEvent id=\"endevent2\"></endEvent>\n      <userTask id=\"ShipVoucher\" name=\"Ship voucher\"></userTask>\n      <exclusiveGateway id=\"exclusivegateway3\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow17\" sourceRef=\"SendEVoucher\" targetRef=\"exclusivegateway3\"></sequenceFlow>\n      <sequenceFlow id=\"flow18\" sourceRef=\"exclusivegateway3\" targetRef=\"SendFail\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${sendFail == true}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"flow19\" sourceRef=\"exclusivegateway3\" targetRef=\"SendSuccessful\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${sendFail == false}]]></conditionExpression>\n      </sequenceFlow>\n      <endEvent id=\"endevent3\"></endEvent>\n      <sequenceFlow id=\"flow20\" sourceRef=\"SendFail\" targetRef=\"endevent3\"></sequenceFlow>\n      <sequenceFlow id=\"flow21\" sourceRef=\"exclusivegateway2\" targetRef=\"SendEVoucher\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${eVoucher == true}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"flow22\" sourceRef=\"exclusivegateway2\" targetRef=\"ShipVoucher\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${eVoucher == false}]]></conditionExpression>\n      </sequenceFlow>\n      <exclusiveGateway id=\"exclusivegateway4\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow23\" sourceRef=\"ShipVoucher\" targetRef=\"exclusivegateway4\"></sequenceFlow>\n      <sequenceFlow id=\"flow24\" sourceRef=\"exclusivegateway4\" targetRef=\"ShipSuccessful\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${shipFail == false}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"flow25\" sourceRef=\"exclusivegateway4\" targetRef=\"ShipFail\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${shipFail == true}]]></conditionExpression>\n      </sequenceFlow>\n      <parallelGateway id=\"parallelgateway1\" name=\"Parallel Gateway\"></parallelGateway>\n      <sequenceFlow id=\"flow26\" sourceRef=\"SendSuccessful\" targetRef=\"parallelgateway1\"></sequenceFlow>\n      <sequenceFlow id=\"flow27\" sourceRef=\"ShipSuccessful\" targetRef=\"parallelgateway1\"></sequenceFlow>\n      <endEvent id=\"endevent4\"></endEvent>\n      <sequenceFlow id=\"flow29\" sourceRef=\"ShipFail\" targetRef=\"endevent4\"></sequenceFlow>\n      <serviceTask id=\"SendEVoucher\" name=\"Send e-voucher, phone card\" activiti:delegateExpression=\"${sendVoucherDelegate}\"></serviceTask>\n      <serviceTask id=\"SendFail\" name=\"Send fail\" activiti:delegateExpression=\"${sendFailDelegate}\"></serviceTask>\n      <serviceTask id=\"SendSuccessful\" name=\"Send successful\" activiti:delegateExpression=\"${sendSuccessfulDelegate}\"></serviceTask>\n      <serviceTask id=\"ShipSuccessful\" name=\"Ship successful\" activiti:delegateExpression=\"${shipSuccessfulDelegate}\"></serviceTask>\n      <serviceTask id=\"ShipFail\" name=\"Ship fail\" activiti:delegateExpression=\"${shipFailDelegate}\"></serviceTask>\n      <sequenceFlow id=\"flow36\" sourceRef=\"parallelgateway1\" targetRef=\"endevent2\"></sequenceFlow>\n    </subProcess>\n    <sequenceFlow id=\"flow6\" sourceRef=\"exclusivegateway1\" targetRef=\"subprocess1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${cancelOrder == false}]]></conditionExpression>\n    </sequenceFlow>\n    <endEvent id=\"endevent1\"></endEvent>\n    <endEvent id=\"endevent5\"></endEvent>\n    <userTask id=\"Processing\" name=\"Processing\"></userTask>\n    <sequenceFlow id=\"flow32\" sourceRef=\"Processing\" targetRef=\"exclusivegateway1\"></sequenceFlow>\n    <sequenceFlow id=\"flow33\" sourceRef=\"task1\" targetRef=\"Processing\"></sequenceFlow>\n    <serviceTask id=\"CancelOrder\" name=\"Cancel order\" activiti:delegateExpression=\"${cancelOrderDelegate}\"></serviceTask>\n    <userTask id=\"CloseOrder1\" name=\"Close order\"></userTask>\n    <sequenceFlow id=\"flow34\" sourceRef=\"CancelOrder\" targetRef=\"CloseOrder1\"></sequenceFlow>\n    <sequenceFlow id=\"flow35\" sourceRef=\"CloseOrder1\" targetRef=\"endevent1\"></sequenceFlow>\n    <userTask id=\"CloseOrder2\" name=\"Close order\"></userTask>\n    <sequenceFlow id=\"flow37\" sourceRef=\"subprocess1\" targetRef=\"CloseOrder2\"></sequenceFlow>\n    <sequenceFlow id=\"flow38\" sourceRef=\"CloseOrder2\" targetRef=\"endevent5\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_OrderProcess\">\n    <bpmndi:BPMNPlane bpmnElement=\"OrderProcess\" id=\"BPMNPlane_OrderProcess\">\n      <bpmndi:BPMNShape bpmnElement=\"task1\" id=\"BPMNShape_task1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"260.0\" y=\"140.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"BPMNShape_exclusivegateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"520.0\" y=\"137.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subprocess1\" id=\"BPMNShape_subprocess1\">\n        <omgdc:Bounds height=\"367.0\" width=\"751.0\" x=\"610.0\" y=\"124.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"startevent2\" id=\"BPMNShape_startevent2\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"620.0\" y=\"303.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway2\" id=\"BPMNShape_exclusivegateway2\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"710.0\" y=\"300.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent2\" id=\"BPMNShape_endevent2\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1300.0\" y=\"290.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"ShipVoucher\" id=\"BPMNShape_ShipVoucher\">\n        <omgdc:Bounds height=\"71.0\" width=\"121.0\" x=\"790.0\" y=\"362.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway3\" id=\"BPMNShape_exclusivegateway3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"974.0\" y=\"196.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent3\" id=\"BPMNShape_endevent3\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1206.0\" y=\"147.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway4\" id=\"BPMNShape_exclusivegateway4\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"980.0\" y=\"377.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"parallelgateway1\" id=\"BPMNShape_parallelgateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"1210.0\" y=\"287.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent4\" id=\"BPMNShape_endevent4\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1206.0\" y=\"412.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SendEVoucher\" id=\"BPMNShape_SendEVoucher\">\n        <omgdc:Bounds height=\"71.0\" width=\"121.0\" x=\"790.0\" y=\"181.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SendFail\" id=\"BPMNShape_SendFail\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"137.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SendSuccessful\" id=\"BPMNShape_SendSuccessful\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"236.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"ShipSuccessful\" id=\"BPMNShape_ShipSuccessful\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"321.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"ShipFail\" id=\"BPMNShape_ShipFail\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"402.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"940.0\" y=\"50.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent5\" id=\"BPMNShape_endevent5\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1550.0\" y=\"290.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"Processing\" id=\"BPMNShape_Processing\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"370.0\" y=\"130.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"CancelOrder\" id=\"BPMNShape_CancelOrder\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"620.0\" y=\"40.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"CloseOrder1\" id=\"BPMNShape_CloseOrder1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"790.0\" y=\"40.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"CloseOrder2\" id=\"BPMNShape_CloseOrder2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1400.0\" y=\"280.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"540.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"540.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"620.0\" y=\"67.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"655.0\" y=\"320.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"710.0\" y=\"320.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow17\" id=\"BPMNEdge_flow17\">\n        <omgdi:waypoint x=\"911.0\" y=\"216.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"974.0\" y=\"216.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow18\" id=\"BPMNEdge_flow18\">\n        <omgdi:waypoint x=\"994.0\" y=\"196.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"993.0\" y=\"167.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"164.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow19\" id=\"BPMNEdge_flow19\">\n        <omgdi:waypoint x=\"994.0\" y=\"236.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"994.0\" y=\"263.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"263.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow20\" id=\"BPMNEdge_flow20\">\n        <omgdi:waypoint x=\"1155.0\" y=\"164.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1206.0\" y=\"164.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow21\" id=\"BPMNEdge_flow21\">\n        <omgdi:waypoint x=\"730.0\" y=\"300.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"730.0\" y=\"215.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"790.0\" y=\"216.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow22\" id=\"BPMNEdge_flow22\">\n        <omgdi:waypoint x=\"730.0\" y=\"340.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"730.0\" y=\"396.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"790.0\" y=\"397.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow23\" id=\"BPMNEdge_flow23\">\n        <omgdi:waypoint x=\"911.0\" y=\"397.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"980.0\" y=\"397.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow24\" id=\"BPMNEdge_flow24\">\n        <omgdi:waypoint x=\"1000.0\" y=\"377.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"999.0\" y=\"347.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"348.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow25\" id=\"BPMNEdge_flow25\">\n        <omgdi:waypoint x=\"1000.0\" y=\"417.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1000.0\" y=\"430.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"429.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow26\" id=\"BPMNEdge_flow26\">\n        <omgdi:waypoint x=\"1155.0\" y=\"263.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1230.0\" y=\"263.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1230.0\" y=\"287.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow27\" id=\"BPMNEdge_flow27\">\n        <omgdi:waypoint x=\"1155.0\" y=\"348.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1192.0\" y=\"349.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1229.0\" y=\"350.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1230.0\" y=\"327.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow29\" id=\"BPMNEdge_flow29\">\n        <omgdi:waypoint x=\"1155.0\" y=\"429.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1206.0\" y=\"429.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow36\" id=\"BPMNEdge_flow36\">\n        <omgdi:waypoint x=\"1250.0\" y=\"307.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1300.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"540.0\" y=\"177.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"540.0\" y=\"231.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"540.0\" y=\"310.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow32\" id=\"BPMNEdge_flow32\">\n        <omgdi:waypoint x=\"475.0\" y=\"157.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"520.0\" y=\"157.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow33\" id=\"BPMNEdge_flow33\">\n        <omgdi:waypoint x=\"295.0\" y=\"157.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"370.0\" y=\"157.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow34\" id=\"BPMNEdge_flow34\">\n        <omgdi:waypoint x=\"725.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"790.0\" y=\"67.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow35\" id=\"BPMNEdge_flow35\">\n        <omgdi:waypoint x=\"895.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"940.0\" y=\"67.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow37\" id=\"BPMNEdge_flow37\">\n        <omgdi:waypoint x=\"1361.0\" y=\"307.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1400.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow38\" id=\"BPMNEdge_flow38\">\n        <omgdi:waypoint x=\"1505.0\" y=\"307.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1550.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('27503',1,'E:\\works\\Fintechviet\\AdServer\\adserver_msb\\target\\classes\\processes\\Order.OrderProcess.png','27501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0;\0\0õ\0\0\0 L€\0\0zIDATxÚìÝÔå/|¢ñx,“r­ŠÇS•äœM½[×ãñhÕzL½®µ•¼ÆJêMRÇá\"£‚\"šE=\Z—Ä˜˜]CˆæM0†#v¹¬ë%ŠÂ,^@E8ˆ\\†¹ˆ #5ÏÛ¿ÿ¡\'=C÷LÏ½{æó©zjºÿÿ¾ÍÌÓÝÿþ}ûyž!C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`I)}ôõ×_ŸW__ÿáÒ¥KÓâÅ‹µ\nhK–,IË—/ß›k£ôRýT?\0\0\0\0hGW¬X‘vïÞþøÇ?jÔöìÙ“ž}öÙK–,ùš~ªŸê§\0\0\0\0\0%Ä7å+ºüÇÅ‹¿ªŸê§ú)\0\0\0\0@	1%bme·Å‹¿¯Ÿê§ú)\0\0\0\0@	1ï¾BmÅ‘“~ªŸê§\0\0\0\0\0%t¦ˆÜøÖ»é[sÖf-N+ð*\"WZ?}÷íÆôús³Ò†%wd-NÇ6ýH?\0\0\0\0°öŠÈ‡ÿ1í;ø^Ëùå¯6µ„q:¿}÷ÛÍéíwÞSðUDî—~šoïìoHë7-½ôØäV-¶Å>}I?\0\0\0\0¨REä:f¯Üš¾3o]zêå]iÙ+iÚüõ-aGœŽí­Ù™¦æ.óã\'_KÞx(\"÷m?-l;6üË1AG¾íÜð¨¾¤Ÿ\0\0\0\0U©\"òÞÍiÊÜu-áFGmÒo_J;öTôUDîÓ~ZØ^}æ%ÃŽØ§/é§\0\0\0\0À\0Õ^ùñµ\re‡sÿm›‚¯\"r¿ôÓ|[¿øö’aGìÓ—ôÓî¨­­ýDMMÍå9?ÌµgrmG®¥‚Ö˜k«r—ùEî²cs§ÿÒ;\0\0\0\0ô‘öŠÈ1uU>Ì˜üÈKéá?¼‘¶4½µ8ÛòûŸxÉšŠÈýÓO…úioºì²Ë>WSS³àòË/?Ô&Üè¨½áG®Õ\r:ô£Þm\0\0\0\0 +\"7¾õn¶\0yá\Zn´½\\l+\\Ã#®×UøUDî‹~Ú¶mXrGÉ°#öéKúig\\~ùå“kÏu2à(Õ^ÑÞq\0\0\0\0 —+\"›¦*Fs´½\\l+vY…_Eä¾è§mÛæ•?-vÄ>}I?-Wmmíô£#3Z‹‘#G¦éÓ§§yóæ¥\r6¤ÆÆÆtèÐ¡Ž9’vïÞ6mÚ”æÏŸŸ]nôèÑÅB\'r·ó)ï<\0\0\0\0ÐÃ„ŠÈÕÚOÛ¶}\rëÒú§n;v\n«Ü¶Ø§/é§>|øÇŽ®ÇÑPÔÕÕ¥Ù³ggaFg477§…¦‰\'¶\n<jjjöç~õî\0\0\0\0=È4VŠÈÕÚO‹µ­Ï?tLØÛô#ý´#GƒŽ…ÁÄ´iÓ²ÝñÁ¤Ç<RpÛïäÚ×¼\0\0\0@iò¦²(Ë*ø*\"÷G?mi‡§Í˜yìV¹m±O_ÒOÛÓvDGLWAEOihhH“\'O.<ÕÔÔ|É»\0\0\0\0ô€öŠÈO®k(:MU±ö¯kv*ø*\"÷K?öÎþ†´iå}%×ìˆ}qýI?-æè\Z-AD}}}ê\r±ÆG¬çQ8Â#wßgz\'\0\0\0€n*UDÞ{ 9}gÞº²ÃŽ›æ¾”v¿Ý¬è«ˆÜ§ý4Fl4n~:½üäwKù—‰Ë\Zå¡ŸºüòËÿ¦p1òÑÑ›b1ó»îº«0ðh¬­­ý„w#\0\0\0\0è†REäæ÷§™OoÎ¦ªZðüöôÌ+­×ðˆÓË^iLO½¼+E~µ|K:¤ˆ¬ˆÜ‡ý´£ÑFyè§å¨©©YS¸FGON]UÊÁƒÓ¸qã\n-¿×»\0\0\0\0tC{ÓEàÑ´ÿÏŽÇäù°#Nç·¿uð=A‡\"rŸ÷ÓrFs´7ÊCßÒO/»ì²Ïå‡ºººn/FÞ/¼ðBÛËÿÒ;\0\0\0\0tQY?mo½ÛvÄi^Eäþì§]\r:òMßÒO/¿üòGóÃìÙ³S_»çž{\nzG\0\0\0€.êLØ¡)\"ë§Ú@é§±NÆå—_~(‚†‘#G¦Ý»w÷yØ±eË–Â©¬ö×ÕÕý…w%\0\0\0\0(P[[»8×þ¶£Ë)\"+\"WýT?íi555—çƒ†éÓ§§þ2qâÄ–À#÷šýï^\0\0\0\0P  x¶¸¦¦æ³¥.§ˆ¬ˆÜŸ„rúiõ«˜6*ÿ:9oÞ¼~;yä•\0\0\0@)óÀçÛÅŠŠÈŠÈ•ÐO…rúi_÷«Üþgò—Û¸qc¿…õõõ…#;{÷\0\0\0€EÂŽ–bZaè¡ˆ¬ˆ\\aýT(§ŸöI¿ÊmÛ‘ßßØØØoaÇöíÛg£w/\0\0\0\0(P*ì(,þÅ7ž‘‘+±Ÿ\nåôÓÞîW…Û:ÔoaÇ‘#GZ=Fï^\0\0\0\0ƒTE}­¦ˆ¬ˆ\\áÏ_¡œ~Ú+ýªð|v\0\0\0\00Dq¨ôß¥D{®¦¦æKC‡ýh\\N¹ò›PN(§Ÿön3²\0\0\0€~§8TúïÒ^È‘×“Eä»ï¾;}æ3ŸI\'œpBúøÇ?žFŒ‘¶lÙÒ§×Ü¯”µj¹]#;ú/”k¯¿öçÿ»šúfŽìhéWÖì\0\0\0\0 ¢;Jÿ]Ž¶Uµµµ_iräõTyÆŒYÁõóŸÿ|ö-éE‹eçÏ9ça‡°£œ~Úg¡\\9ýuˆ°c …Çô«Ü¶gòû7nÜØoaG}}}«5E¼{\0\0\0RÂŽ’—¢Eã¶zªˆ|î¹çf×Ýÿì³Ï¦³Î:+ûýé§Ÿž|ðÁV…ÚI“&¥“O>9vÚiéÈömÛ¶-åv3Ï<3­Zµ*Û¾gÏžtÅW¤O<1tÒIiØ°aiçÎí~÷íÛ—®½öÚìòq½ñãÇ§´ºÎÅ_œÎ?ÿül[?ãwŠË_uÕU­n·œû/¼-aGûÏß¾åÊí¯…ÿïöúN„$gŸ}vÖGcüßó£CÚë\'¥oVAØQ²_åöÝ—¿Ü¼yóú-ìˆû.x¼÷y÷\0\0\0¤„ÝÓSEä(öæn®¥HÛ¶EÐ±zõê´cÇŽìr§œrJ«l×¯_Ÿ>õÔS³}—^ziv>BŽ!ßº¯««ËÎ¿øâ‹iíÚµÙéK.¹¤Ý°#ŠÉ±ýá‡ÎŠ‹q:ŠÊ…×YºtiÚµkW¶-B–üãÊë?»åÜám	;Ú}þöi(Wn-ü·×w¢Çù­[·fý;Nçƒ„öúÉ@é›vtØ¯jkkGåC†éÓ§÷[Ø1yòäÂ°ãkÞ•\0\0\0\0)aG÷ôTùøãÏ\n©ñ-õbû£<eÊ”¬<¤ 8;¤M8§ã¶ât|;}H‘à\"¿½°Å¶öÂŽüubÊ¢hÅ®ÛÛ»|þvË¹ÿÂÛvTN?-·¿ûë;^xav>Â“çbz¬]ÑQ?(}³šûéÈ‘#?•{ÿ8ï!¹ÓéàÁƒý½^Ç¡ÚÚÚOxW\0\0\0¤„ÝÓSEäu1¤ib\ZªØÿè£vviS¸m¯8\\îú1¥Ï6â˜6«ÔuÊ)(wæþ…•ÑOËí¯…ÿÇöúNœÇöo|#}úÓŸÎöqÆö“Ò7«½Ÿ®Û1þü>;fÎœYvÌòŽ\0\0\00ˆ	;º§§ŠÈ?ÿùÏ³Bê¿øÅ¬ÐúÏÿüÏÙù¿ú«¿jU„éu†”vä§±Z¹re«i¬FŒ‘µ=ò·wÑEµ[ÐÍOïS8UÐ„	J^\'¦þr´ž¿|þ2]¹aGeôÓrûë\"SCë;\\pAËTk15Tœþä\'?Ùa?(}³ÚûiáTVñ7¾ÐW\Z\Z\Z²%ùûÏýïÎõŽ\0\0\00ˆ	;º§\'‹ÈQ`…“kÎ/*ÓûDàÑvAå!í„1õU“ãöbèX!¶755eâü‚ÎQüÅÌ;Z |ìØ±Ùå£Ea³í\"Ð…—E¦#\\‰ûŽë^¦+÷/ì¨œ~ZNÒfòR}\'þï_ýêW³ëÇíÄ4mÏ>ûl‡ýd ôÍjï§±¦Gî=äå|à°páÂ>;î¸ãŽ– £¦¦fw#\0\0\0€ANØÑ=½QDÖ‘õSý´ZŽîˆ‘o¼ñF¯?þxáôUï×ÔÔœíÝ\0\0\0`vt\"²\"²~ª\rö~š{y4>|ë[ßJÍÍÍ½tÄ´|…ÓWåÚxïD\0\0\0\0;ºIYY?Õ{?>|øÌ½—ìÉwÝuW:räH¯1Í˜EÉ\0\0\08†°£{‘‘õSM?2¤¦¦æ³¹¶?DÄš\Z±žJON]ÕfDÇÃ‡ÿ˜w!\0\0\0\02ÂŽîQDVDÖO5ýôÿ¨­­ýJî=åP>ˆQõõõÝ\n9\Z\Z\ZÒm·ÝVr:\0\0\0\08–°£{‘‘õSM?ý³Ë.»ìs¹÷•w\nÃ‰éÓ§§7v*äØ¾}{š9sfÛÑÙÔU‚\0\0\0\0Ž!ìèEdEdýTÓO[«­­=3÷Þ²£MH‘¾þõ¯§9sæ¤+V¤7Þx£e]øáFŒ™7o^š2eJÛ€#Úû#\0\0\0 $aG÷(\"+\"ë§š~z¬}Q[[;½í(®´ššš¹v¶w\0\0\0\0Jvt\"²\"²~ªé§¥9òS¹÷™;//³ÅÚ³FŒq®w\Z\0\0\0\0:$ìèEdEdýTÓO;VWW÷ï®çñÃX`¼È4Wµµµ‹s?ï«©©¹<wúÞa\0\0\0\0(›°£{‘‘õSM?\0\0\0€~&ìèEdEdýTÓO\0\0\0 Ÿ	;ºGYY?ÕôS\0\0\0\0ègÂŽîQDVDÖO5ý\0\0\0\0ú™°£{‘‘õSM?\0\0\0€~&ìèž¥K—*ÔVv;´xñâ÷õSýT?\0\0\0€LØÑ=Ë—/oÜ½{·bm…¶†††ß.^¼øUýT?ÕO\0\0\0`\0vtÏÓO?ýåeË–½ýæ›o¾§h[Yß”ò’%K¶åÚ×ôSýT?\0\0\0€LØÑ}K–,ùÒâÅ‹Ÿ‹ihbÞ}­\"Zü/^U@ÖOõS\0\0\0\0„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„¥­^½úÿž0aÂæ¿þë¿~?w6iš¦iš¦išVíSŸúÔ{gœqÆ¬Üéùä\0\0;Jˆ #çƒ/}éKé¹çžK‡J\0\0@ÿ{ÿý÷ÓË/¿œ†\rö§üã›\0\0€°£„ë¯¿~K\0\0@åúüç?¿\'wø>Ý\'\0\0v;Šˆ©«bD\0\0P¹6lØp0wø¾Ù\'\0\0v;Š3u\0\0T¸˜ÒjÈÿYÇ\0\0vP,ì\0\0\0*Ÿ°\0 ÷+¥}ýõ×çÕ××¸téÒ´xñb­Ú’%KÒòåË÷æÚ(½TØ!ì\0\0\0a\0\0íˆ cÅŠi÷îÝéü£VAmÏž=éÙgŸ=°dÉ’¯	;„Ý	;Ö¬Y“.¾øâtâ‰\'¦“N:)ýíßþmZ½zu¹ÈÊ¾\\´¸ÿþßÿ{vŸ\0\0€°\0 OÄˆAGE\\¼xñ«ÂaGwÂŽÿò_þKöáêÕW_M/¿ürvú?ý§ÿÔãaGøýïŸŽÀ\0\0v\0\0ô‰˜ºJ¨PÙmñâÅï;„Ý	;b4G\\vË–-\Z…çó§¯¹æšì6Î;ï¼²oã„NhµoèÐ¡éüÿ‘m{çwÒu×]—ÝfŒ¹þúë[ZßµkWú»¿û»ìúý×žþùlûR]]]Ëè”áÃ‡g#ÒÂc=–þÛûoÙub_Ü×öíÛ;Ü\0\0Â\0€\"Ö‡(T|Ø1èŠ…Ý;~ô£e®N>ùäôõ¯=áÑ™°#ƒhùÐ¢½°#?²#‚‘Â}Ë—/O{÷îÍ¶EÐÛæÎ›,XŽÀ#|ñ‹_ÌÎGÈ1¤`„ÈUW]•‘)6lÈN_zé¥Ù¾SN9%;¿sçÎlú¬8VÚÛ\0\0Â\0€Av¼ûvczý¹YiÃ’;²§c›0BØ!ì¨ü°#Ä\ZDà×‹\0¤Ü°ãÃ?ÌÚ£kr”\n;¢üñé¿þ×ÿšêëë¹¼¸R·›ß×V~û6ëƒ„XƒdÈÑÑ$–ÜÿýÙHŽö\0€°\0`…ïìoHë7-½ôØäV-¶Å>„°CØQùaG^SSS«  ³aGLU*ìhçC]«mùiµ\no7B˜rÂŽÂÐ$/¶-[¶,ÝxãÙZ$q¹X§¤£}\0\0 ì\0\0DaÇŽ\rÿrLÐ‘o;7<*vô¶/\r;¾àÛµ°#Ö¾ˆËÆ4N/½ôR«‚ÿøÿ!;ÿÚk¯¥ßýîwEÃŽßþö·é‰\'žÈNÇèˆî†ù)©\n§±ŠéµB~\Z«‰2¤`\Z«Q£Feçõ«_µ,²~ñÅgû>ûÙÏ¶L}SeÅéO}êSî rÅúJ«V­J±¾\\iýß–,Y’MK¹yóf„\0\0Õv¼úÌJ†±O !ìèEŸËµý¹vïÑŸ_ò¬í|Øk\\D0£#bš©˜Ú)¿ð÷ìÙ³³u-b´Å·¿ýí¢aG¬±Ó@EððÆot;ìˆÊcÑóx<Ñ\"èÈ/PkkD@÷‹G@Þzë­,$É/jëuÄbæ!~6,Û×‹59þð‡?t¸€Ê\r:V¬X‘vïÞíX°ÂÚž={²“›6mÒQAØ\0P}aÇúÅ·—;bŸ~ÂŽ^:òGŒìØ#ðè|Ø\0Õ$Ft:*;ðˆ7€°\0È¹ýöÛÿbÆŒß»óÎ;ŸŸ6mÚž	&9rdŠ©j¢]sÍ5ÜtÓMûï¸ãŽµ?ûÙÏî¿å–[þ/5a‡°cPmv\0À\0…tÇ€•|\n;\0`P»ë®».¹í¶ÛÖŒ\Z5êOÓ¦MK.LëÖ­Ë¾¹õÁ´ìÛ·/mÜ¸1=ùä“éž{î‰¹ÚÿtÓM7íÈ]çš¡C‡~Ô_²oÃŽ\rKî(vÄ>ø„=ì\ZùýÖðv\00\0•s|ª	;@Ø\0ô‹‰\'þåw¾óµcÇŽýÓ¼yó²0£3Ž9’V®\\™n¹å–?M˜0¡iÜ¸qÿ¯¿jß…›Wþ´dØû|àvôBÐÑQa„‡°\0aGj|ëÝô­9k³§;\n;@Ø\0ôšiÓ¦ÝpõÕW¿ÿë_ÿ:577wû\0á¹çžKãÆ;2~üø…Ã‡ÿ˜¿pï‡û\ZÖ¥õOÝvìV¹m±Ï>aGùÜÎØèìå…\0PåaÇáÃ¹cÓƒïµœ_þjSKØ§óÛw¿ÝœÞ~ç=Ç’Âv\0\0=cêÔ©÷_ýõ¼ðÂ=zpðàÁ4cÆŒ#uuu»†þý¥{7ìˆ¶õù‡Ž	;b›{ÂŽ:¾Ô…ë½3ˆŸ\Z4aG³WnMß™·.=õò®´ì•Æ4mþú–°#NÇöÇÖìLSs—ùñ“¯¥ï\n<„ ì\0\0z è¸á†>Œõ8zËÃ?üá¨Q£>ü¯üÅ{1ì8|8mþÃÌc§°Êm‹}>ð	;ú)èè©ë;\0 \nÂŽ½šÓ”¹ëZÂŽÚ¤ß¾”vì=èxRØÂ\0 ëbêªÑÑ›AGÞ¢E‹\Z5ªÁÞ	;ÞÙß6­¼¯äš±/.ãCŸ°£‹:ZŒ¼¯oGØ\0\ZvD{|mCÙaÇÜÛæXRØÑ£víÚ•fÍš•n¾ùætõÕW§#F¤Ë/¿¼¥Åùºººtã7¦ŸýìgiãÆžÐ;\0 šÅbä±FÇÚµkûì áý¯ÿµ+w`ù/C‡ý¨ÿ@…‡§ÆÍO§—ŸünÉ #ßâ2qY£<„](zj\nªÁ8ÂÃ§F\0UØSWåÃŒÉ¼”þÃiKÓÛY‹Ó±-¿ÿ‰—|!GØÑ3-Z”Æß*Ø(§ÕÖÖfáÇý÷ßŸýÝv¨@\0@•™:uêË±y_ûæ7¿¹«¦¦æÿî‡æ0ÊCØÑƒÁD>èøH®9ú³3Ú^o°-ZîS#\0ƒ\"ìh|ëÝlòÂ5:\"Üh{¹ØV¸†G\\\'®ë˜RØÑË—/OcÆŒétÈQ¬\Z5*í°\0¨wÝu×%cÇŽýSsssŸ8444|0bÄˆ·jkk?á?Ñ½°£œÑíòðPØQfÐñ¥‚Àâ—GþÙ‰À£ÔõSàáS#\0ƒ\"ì(6MUŒæh{¹ØVì²Ž)…uë­·XŒ92MŸ>=Í›7/mØ°!566¦C‡e—?räHŠiœ7mÚ”æÏŸŸ]nôèÑÇÜÆ¸qãÒ–-[<Ñ…\0@¥»í¶ÛÖÄ]ùþ÷¿¿¡¶¶vºÿD÷ÂŽ®ùæ °£AGsôÀ?u\"ð(:òíŠ‚ýƒe\rŸ\Zv;„=hÿþýÙz…ELE5{öìÔÙ5)ãK€.L\'N<&ôxüñÇ=Ù…\0@¥ºýöÛÿbÔ¨QÚ·o_¿<444ì®­­ÝkíŽî…š°£—”\n ŠíÅ.ÿÿ¹ü`XÃÃ§F\0EØa\Z+aG_W^ye«PbÚ´iÙŽîøàƒ²p#F†®çñ›ßüÆ^Ø\0T¢™3gNÁþvÝu×½–;pü[ÿa‡°£çåž[‹»øüêh1òrrƒŽ¶Ç@ÒÊ§F\0EØñçÊ›Ê^ <.ëXRØÑmGtÄtUTô”†††4yòäV÷1wî\\Oza\0Piî¼óÎç}ôÑ~?€øÉO~²ÒTVå¥…ÂŽÎ(ø&ÚâšššÏ–yµr‡ŽÎ…÷¿gÈÀááS#\0ƒ*ìxr]CÑiªŠµ]³Ó±¤°£lm×è¨¯¯ï•û‰5>b=ÂkÖ¬ñÄv\0\0•dÚ´i{Ö­[×ï¹ƒÒµ¹ƒÆgûÿ£Ü¢´°CØÑ•~UÐžè TëìTR¥ãºtä\rÔ5<|j`Ð„{4§ïÌ[WvØqÓÜ—Òî·›O\n;:´|ùòcFtô¦XÌü®»îj¹¿#F¤]»vyò;\0€J1aÂ„#]°­74555æ…å¥…ÂŽnö«–P­HÿêêšÅ×ºtt÷ñ;\0 ÂŽæ÷§™OoÎ¦ªZðüöôÌ+­×ðˆÓË^iLO½¼+E~µ|K:tø°ãIaG‡FÝjŽžœºª”ƒ¦qãÆµÜïÔ©S=ù…\0@¥ˆÅÖúâ °q°(ì(¯(-ìvôD¿*ÕŽŽ$êîHŠbGw‚Ž¶Ç@YÃÃ§F\0MØ‘<šöÿyÁñX€<vÄéüö·¾\'èv”eÑ¢E-Ç²uuuÝ^Œ¼3^xá…VÓYmÜ¸Ñ€°\0¨”\"h¥v”_”vT~+ãY‘-×\rïíf7Ž©«ÚŽèxíèöî¸÷èmý…°\0ª+ìhÛ\Zßz·%ìˆÓŽ…uíµ×¶¿Îž=»Ïïÿž{îi¹ÿ›o¾Ù€°\0¨•6²C+¯	;Œìè¡í¹ššš/\r:ô£G/šÙÑÕíì(\\´¼³Œì\0€vhÂŽîˆu2òÇ³ñy¶?¦eÞ²eK«ãê½{÷zv\0\0ý­RÖìØ³gÏ.kv”_”î­“…ÅéO<1sÎ9iõêÕÿÁ-ÿ˜…e÷«¶!GÛ`á!½³fGWkv\0€°Cv´˜5kVËqíôéÓûíqLœ8±åqÌ™3Ç‹€°\0èo7ß|óÞ\r6ôûD}}ýÚÜAâ\naGyEéÞ;âô3Ï<“ŽÀÃ‡Ãv¬ª­­ýJ‰£XÀPîHŠbAG¬Ñq\\‘í	<º»†ˆ°\0„Z…cÇŽMO=õT»—‰i£òÇ·óæÍë·ÇúÈ#X¨\\Ø\0T’;ï¼óùÇ¼ß ~ò“Ÿ¬Ì$þPØQ^Qº/ÂŽüùN8¡Õ¾‹/¾8þùÙ¶}ûöeóåžtÒIÙHñãÇ§dû¶mÛ–r?»þ™gž™V­Z•mß³gOºâŠ+²ËÇõ†\r–vîÜ™í‹…Ï>ûìì:±/î+†ˆw´¯ðqçOOš4)|òÉé´ÓNK<ð@¶/.=nã²Ë.ëÕ!v´7’££À££ ¡TÐñ‘vö—xüM®í€A‡°€ªÇN7ÞxcöSØ!ìèùÏCz,]º´èe®¾úê–Ëõçâàõõõ­/Â\0 ŸÍ˜1ãž»îº«ß n¸á†õ¹ƒÄ¡ÂŽòŠÒ}9²ãÜsÏmµ/>tÄ<¹±-‚ŽØöðÃgßªŠÓxÄ¾K/½4;!Ç‚\"uuuÙù_|1­]»6;}É%—dûN9å”ìüÖ­[³é³ât>Xio_±°cÁ‚iýúõÙéSO=5Û÷“ß—¼ƒ!ìè†ŽFVttébà‘ŸJë+ô©îS#\0U!\nÉùbn|‘¤½Â²°CØÑ“aG¾7î˜‘#FŒhÙßØØØouûöí-#Â\0 ŸMž<ù?Ž3æOÍÍÍývðÐÔÔ´»¶¶öÝºººï?Rž¾X³ãøãOguVZ±bE«}‡j¹|ŒÎÈo‹6äèZ…ûÚÞG~û6ëƒÄ¾/¼°e4I„%3fÌÈF‚t´¯XØQø;ÅïRêñ\n;:Tj„G¹AGgüý}e\0?…}j *Äg„¶ÅçX§ ¾Ì\"ìvôEØQ8r\"zncúþräÈ‘Va\0P¦L™ò¿—-[Öo?ýéOŸ¯©©ù…ÿDå„åî‹é¤Ú†1uT9aGah’o±-~·o|ãéÓŸþtv¹3Î8£Ã}…ùóÂŽ.‹m§”\ZÓ‰ £½ÀãŠ6÷3×èv\0PµÊ)>;„½Ýß\nGzTRÀ ìv\0\0fêÔ©µ“&Múðƒ>èo‹½?bÄˆ·FŽù)ÿ‰ê;òSRNc5aÂ„VÓX­\\¹²Õ4V1Ä;ÎÇ:\Z1•Uœ¾è¢‹²}\\pAËÔW1UVœþä\'?Ùá¾rÃŽ/ùË-ÓXÅ‚‚ÂŽN…‹–åC:¸^gEv\0@…ŸcšSaGå·Žþ—ÕØŒì@Ø\0cÂ„	M1]Q_»óÎ;×åïó¨Î°#(oõÅˆ‰htä(µ5\" ˆi§bañXg#¶755e!I~QóXG#3Ï/jþÕ¯~5Û×‹59ž}öÙ÷•vÄcŠ5HbZ«xÜC\n`v”¥í”VT\\Ñ‰ cH‰ë}aÂ€AèÃ?ÌŽÞyçìø)Ž‡vîÜ™-üýÚk¯¥uëÖ¥5kÖdÇKñE‘u½dÉ’ôÄO¤G}4ÍŸ??Í;7û‚ÉC=”~õ«_e_ùÙÏ~£¤Ó½÷Þ›~ô£¥ïÿûéïÿþïÓwÜ‘n¿ýötë­·¦›o¾9M:5Mž<9}ûÛßÎ¦¡úæ7¿kæ¥ë¯¿>[o-Öa‹c£hW]uUºòÊ+³ãµ+®¸¢ì¢s…ñ7‹/ÎÄqe\'ÆÔ§ñ7ì‹cäÙ³g§ÓO?=;¶¼øâ‹Ëº~o~Ùf ì3fLöÈyÊš;\0€’®¹æšÿgÜ¸qGöïßßg\r/¾øâæÚÚÚÿ=|øðùTFØ1ÐÛÇ?þñ¬óOGqaHÁˆaG—î*6E–°€tmsÇ¿--\n¤ÑF\Z•µÑ£GgCv#pˆà!ˆ=Äu×]—_ÿú×³ÀâÆoÌŒ›nº)4n¹å–4mÚ´,è¸óÎ;³àãî»ïÎ‚Ÿüä\'Y0òóŸÿ<JfÍš•\'sæÌÉŠÈ.Ì‚•X\"h‰À%BƒRÅçxœ¿þõ¯S|~ÈûôÇñ]Lk\Zï­åG\rÇ”§}vÄ—fb{|Ù§Ø­ýr‘°#µrä]}õÕ-û7nÜØoµ¾¾¾Õ´n;\0€\n2~üøÊ}z¿/¦³ÚµkWsL_uÙe—}Î_^ØÑW-¦¯Šp£ð›1-–°£ßžN„\0Tl7¾lQ\n¿EŸÿûý÷ßßªøúëø4¿†\\½ÛîÛ³gOÊäý†\r–¨)&Mš”­9wÚi§e!Pì‹ÛŠÑÀqœŠùµà\n÷Å¨ã³Î:+AbÄÇƒ>hdGÃŽYA\\Û~\"ÜË_.¦Òí/qßùÇ	a\0PA†úÑ+¯¼rëC=t¤7vïÞýAîàuWmmíDuaÇ@^\0r€wÃîN=5Ø¦®v\0b1Š#w\\•}äÈ‘-!GL—Uj$xŸÆÈ•xoÀ\"¦Tm×—‹k×®ÍNÇª…¡C|fýúõÙéSO=5Û—û\\Ô²oÑ¢E%Š¶Û#èˆiµvìØ‘m?å”S„Tl$G[¿üå/[B†éÓ§÷Ûc©áòã7¿ù:a\0PirÄ>1zôè}óçÏÿco(ÄˆŽ£AÇtma‡°cÀ™1˜#v\0±vX5Šé´b\Z¬ŽF¦ôçñiL·ÁFñ>H±ÑÑb[©uÞbíÂëÅÔTÑÊ\r;â<eÊ”lm¹R‡°£ûb:Ú|ÈaÜÁƒûü1®×-÷9×°\0¨D¹ÆO\Z5ªáW¿úUSO$Ä\Z1u•ÂaÇ€ÒÙ©¨ëÔUÂ€A,\n²1z \Zµ÷\rûJ	;ò-?¢\"h†…ç»\Zvœyæ™ÙùXûDØÑ»\n×í˜?~ŸßÿÌ™3[îâÄ‰^ä„\0@%‹#FŒø—	&4mÛ¶ípwš››ß¿óÎ;×ÅbäÖèv;uàñ7¹öN®}e?…}jdbáñçŸ~@ÿŽýu|šbú¨øÇéX´<öÅˆš8kqä/¿è¢‹:;bª«!G§±ŠuÊ\r;ò!Iþ¾„½§p*«˜¾,B©¾ÒÐÐÐ2½[´Xa\0PjjjnÈ}Hxó{ßûÞË[¶léÔH¦¦¦Ý3fÌx.Fsäg>ücþ¢ÂaÇ€õ…£AÆÚÙ¿GÐ!ì\0Œb‚åË—;z¡ÅZ`DÐÓP]xá…Yñ9öå>dÓ[ÅBã±?BŒmÛ¶uvÄ4IçœsN¶ÐøØ±cË;rŸ}²ûi»¨¹°£çÅï!b>pX¸paŸÝ÷wÜÑr¿ãÇ÷\'ì\0\0ªI„¹¹ÛsmÇ5×\\óÚÝwß½ê™gžyqûöíÛ\nöíÛ÷f}}ýÚŸüä\'+o¸á†õµµµïÖÔÔü\"¦ÅòWv;…R#<L]%ì\0Ô¢øý»ßýNØ¡õûñé@R8º#FZ¼ñÆ½~Ÿ?þx«µ:bDÂ\0 JÕÔÔ|öhðñD®mÍµ÷ö\ZsmU®ý0×†ÖÕÕý{1a‡°cÐ‚aÀ 7nÜ¸>ýæ¹°CaG¸öÚk[‚‡o}ë[1…r¯Ý×Ê•+[M_uß}÷yqv\0\0 ìv’Àã^A‡°€”Mu3gÎa‡&ìèa1-YmmmK\0q×]w¥#GŽôJÐS¢Y”\\Ø\0€°CØ1ø|!>)½†‡°€Aãúë¯O³fÍvhÂŽ^°téÒVSKÅš\Zûöíë±Û©«\nGtÄH­ýû÷{av\0\0 ìvGÃ„\0ƒ^|üþûïvhÂŽ^#§\n…Q__ß­ÛlhhH·Ýv[«Ût;\0\0v;„;\0­É“\'§ø‡vhÂŽ^´hÑ¢VSZE›>}zÚ¸qc§ngûöíiæÌ™­Fsä§®t;\0\0v;„;\0­ï~÷»é‡?ü¡°Cvô²5kÖ¤#F´\n)¢}ýë_ÏF¬X±\"½ñÆ-ëzÄÏ7bÈ¼yóÒ”)SŽ¹®ÅÈ…>¾\0\0;„Â„Q$ZµjU6gz¼öiÕß–,Y’–/_ž6oÞ¬ƒ÷Ûo¿=}ï{ßvhÂŽ>£/n½õÖcFyt¥?>­^½Ú‹˜°\0€Þ%Ø*ºÊ}˜|_Ø!ìv0‚Žø–ìîÝ»½ö°¶gÏž´lÙ²´iÓ&½DÐ‡°Cvô-[¶³æF¹-¦¬Š „\0\0½lùòå\nK•Û\Z\Z\Z~›û0ùª°CØ!ì` ‹B÷£xÄ,è¾˜Â*¦²vhÂŽ¾×ÜÜœ­çqóÍ7gŒ·æ*Î;6ÝtÓMiÖ¬Yi×®]^´v\0\0ô•§Ÿ~úËË–-{ûÍ7ß|Ï·Ê\ZÑAÇ’%K¶åÚ×„Âa‘†Š£”çÿñÓ¤I“„šç3;\0\0hkÉ’%_Ê}`y.¦K2¿xÅ´ø_¼*èv;,7G)ÏÌ™3Ó7Þèõ@ó|a\0\0 ìv@57ßz7}kÎÚ¬Åi…GÅÑÁ$¦Æ¹á†¼hžÏ ì\0\0\0„Â¨¦âæáÃLû¾×r~ù«M-aGœÎoßývszû÷\"G´9sæ¤ñãÇ;4Ïgv\0\0\0ÂaTKq3‚ŽÙ+·¦ïÌ[—žzyWZöJcš6}KØ§cûckv¦©¹ËüøÉ×ÒwŠ£×Â…³…‘…šç3;\0\0\0a‡°ª¤¸¹÷@sš2w]K¸ÑQ›ôÛ—ÒŽ½#G¬\'žx\"]uÕUúw\\ºt©çŒç3;\0\0\0a‡°Ö7¹_ÛPvØ1÷ß¶)D*ŽhË–-Kuuuúw\\±bEÚ½{·çM…¶¦¦¦,„\0\0€°CØ;bêª|˜1ù‘—ÒÃx#miz;kq:¶å÷?ñRƒb¤°c@[½zu\Z=zô€þ·lÙ’…:o¾ù¦çN…›6mòda\0\0 ìv@9aGã[ïf®ÑáFÛËÅ¶Â5<â:q]…IaÇ@´~ýú4räÈÿ{FàñôÓOgýF«œ&è\0a\0\0 ìv@\'ÃŽbÓTÅhŽ¶—‹mÅ.+`vD[·nM#FŒð‡\0v\0\0\0Âa;4aGuŠµ,jkký!\0„\0\0€°CØÕv˜ÆJØÁ±Þyçï‹\0;\0\0\0a‡°ª ìøóåMe/P—,;²;î¸#ÕÔÔ¤;ï¼Ó@Ø\0\0;„P-aÇ“ë\ZŠNSU¬ýëš‚aÇ€õƒü }ä#Içw^öóÖ[oõGv\0\0\0ÂaTzØ±÷@súÎ¼ue‡7Í})í~»Y¸ ì°AG>àˆ‘ÇwœÀ@Ø\0\0;„PéaGó{‡ÓÌ§7gSU-x~{zæ•ÖkxÄée¯4¦§^Þ•…\"¿Z¾%:|X¸ ìÐAGGÛv\0\0\0ÂaTPØ‘<šöÿyÁñX€<vÄéüö·¾\'èv81‚£½@#¿ß\Z\0Â\0\0@Ø!ì€\n;Ú¶Æ·Þm	;â´ AØ1ÐƒŽŽ‚#<\0„\0\0€°CØUvhÂŽÁ `”;b£³—@Ø\0\0;„ ìÐ„½ttv¤†À@Ø\0\0;„ ìÐ„UtôÔõv\0\0\0Âa;4aG—u´y_ß\0Â\0\0@Ø!ì\0a‡&ìèt@ÑSSPá ì\0\0\0„ÂvhÂŽ>Óv­?ü0;6ûÙm¯g\r\0a\0\0 ìv€°CvôYÐ‘AÅgœ‘Åâg¹G©ë	<\0„\0\0€°CØÂMØÑgAGˆ‘Gbe…AG¾]sÍ5-û­á ì\0\0\0„Âè†(r;4aÇ±JÅ‚‹ör/o\r\0a\0\0 ìv@]yå•éÞ{ïMÍÍÍÂaÇ€ëß1\nã©§žêrÐQjj©rŒÎ#¦´v\0\0\0ÂatÁÈ‘#S<‡GŒ‘î»ï¾’¡GwÃŽÕ«W§‹.º(xâ‰é¤“NJ^xaZ¹reëóÅäj*ñ±Ä°#úv´=–.]ZÖuÊ\r:\n2:tÞÿqÇg„€°\0\0v; \\räÂÑ\"ü˜3gN‡ù¢ïºuëÒ‹/¾˜þô§?-ìvôIØ‘oãÆkw¤Gg§’*h¼ÿþû]\n:ò¬á ì\0\0\0„ÂèF18ßÆŒ“æÏŸßcaGŒæˆçÄÆÙ·gÏžtÅW´Œú6lXÚ¹sg«P`Ò¤Iéä“ON§vZzà²}q[çž{nv«®ºªd€ÐÞí¶‡~8»þ¨Q£²óq8?{öì´oß¾tíµ×f×Û?~|:pà@Ñà¢ðü¶mÛÒÐ¡CÓ	\'œÎ<óÌ´jÕªV—™0aBv{§Ÿ~zzè¡‡Êþ{\\|ñÅéüóÏvt±›Þª«kf<þÝ¿ûw]:ºûx\0v\0\0\0Âa]*¢ÖÖÖ¶üŒ£%b„DÍGµêêê²52¢0ÅÖø–yÐ£p~ýõ×§n¸!}ãßH7Þxcúö·¿ø§L™’¾ûÝï¦[n¹%Ý~ûíéþÏÿ™¾÷½ï¥éÓ§§þð‡éG?úQúÇüÇôÓŸþ4ýüç?Ï‚€Y³fe…ó(ÞÏ;7--Z”üñ¬ÀûÌ3Ï¤ßÿþ÷Yá½T18ß¢è#=ºvÜ}÷ÝY!‹(ðÇü¾ø»Ä¾ñ±víÚìô%—\\Òª¸¿`Á‚´~ýúìô©§žší‹!¿/~¿RaG{·_ØvíÚ•íûÏÿù?gç?ó™ÏdçwìØ‘ýŸâtüMçÍ›—Žÿ[GaÇ¥—^šŽ¿uü<çœsZ]&w„6q:‚œrÿ1%S<^aG×ÂŽÂ‘ñ·ìîHŠbGw‚Ž¶‡5<\0„\0\0€°CØA¯Q£@k\\ìß¿?íÝ»7ûö}|“óæÍé•W^I/½ôRzþùçS}}}Z±bE2DØðÄOdEî!\"Œˆ0!Â‰)~ñ‹_¤™3gfáE„?þñ³P#Â9î¸ãŽ,ôˆð#B©S§f¡H„#\'NLßüæ7³Ð$Â“ë®».+ÒGA7Â•«¯¾:[¢˜!F´ŽŠÁùÖ”Ç\ZqßxÄó#Ø#Úˆc[© áøãou½C‡e­TØÑÞí·mgŸ}v¶?þWñó¬³Î*y_í=Æüùüõ:šÆªØïÕÞß#COOcUn_¨í¼óÎëÖkBL]ÕvDGœíÝ+në7ÞðÂ ì\0\0\0„Âz>ì(¿G±ÁHŒÉë‰°#ßb¤Da¿0H(\'h$”v´wûùëÅ¨“8ýå/9ûaQá4\\…÷¡MO†Å~¯¾\\ëc0ìˆ‘V4Æïò#;º:‚ÂÈ\0a\0\0 ìv ìè\'1*¥m8¦f*¶€swÃŽX¯\"ž«W¯ÎF»ä‹À±/¦ýŠó1W~ñò‹.º¨ÃP ¦v\Zrt\Z«üÔRÅ‚€ön¿mËßN¬±?yä‘VSKNcÁHì‹é§â|L³õØcÆ*Fµ)2U±ß«3ž@CØÑ6ä(,X³@Ø\0\0;v;ªH¬‘/Ç:!q¾”î†±öDìcÔBL×tá…¶,ÖÝÔÔ”…	ùÅ¿#ÄˆéÀ:\n¶lÙ’…LÄ4]¥ŠþíÝ~Û‹ŽÇãrtZ©X,<¶Çåqqýhtä(ðÁÓ)§œ’Ý~L%Vø8¶nÝš.¸à‚ì1ÆYötô{uæïÑv\n,aGñ°#þž1]\\±£XÀPîHŠbAGœ©«Šm/7ðèî\Z\"\0;\0\0\0a‡°ƒAvDXÅùöBŽž\n;´Þk\ZåGÉ;Zko$GGGGAC© #ht´¿”X¿ç¸ãŽt\0;\0\0\0a‡°aGOvTnûâ¿˜-¨.ìè9¬(7Èèlà‘Z¦NêŸ\0 ì\0\0\0„Â„ÂMØÑ=¥Fxt6À(÷ò‚\0a\0\0 ìv ìvhÂŽ#<ÚN)U¸>Ì2§¦*x\\sÍ5­îÇ\Z\0Â\0\0@Ø!ì@Ø1ÃŽ!%$¯ÖÖß¿°£tàQ¸hyapÑ™EÇK]¯³‹¢ ì\0\0\0„Â„Âa‡°£ÓÚNiAEŒÌ(7è(<\n¯×6H@Ø\0\0;„;`Ø‘\0êêêÒI\'”Î9çœ´qãÆVû&L˜N<ñÄtúé§§‡z(Û·oß¾tíµ×f×‰}ãÇOhu½I“&¥“O>9vÚiéÈöíÙ³\']qÅÙuâºÃ†\rK;wî<æqmÛ¶-\r:4pÂ	éÌ3ÏL«V­Ê¶?ûì³é¬³ÎÊ¶ÇãyðÁ[ÝçÅ_œÎ?ÿül[üçž{nv?W]u•°£Êî*6E\0Â\0\0@Ø!ì@Ø1€ÃŽþçN‹-ÊNÿÝßý]«}±=‚ƒ8ÁEì‹ #Î?üðÃiÞ¼yÙé<\n¯·`Á‚´~ýúìô©§žší‹P%Î¿øâ‹iíÚµÙéK.¹ä˜Çué¥—fû\"äˆŸÂÄö:V¯^vìØ‘m?å”SZÝçÒ¥KÓ®]»²m–äGþwvŽÀ£§ƒ\0„\0\0€°CØ°£\nÂŽC‡e-NÇ¨‹bÓ>Åéã?>;—éÎõ\n[þz…-¹¶Û·nÝš¦L™’Þ(¼ŸÂß£ím>FaGåëîÔS¦®v\0\0\0ÂaÂaG6íS©Ð\">.Óöz1eUG×+ Ú{\\¥ÂŽ˜Ò*¶?úè£EÃŽb·!ì¨ÞÀ£³#3,F ì\0\0\0„Â„ƒ8ìˆµ8òÂ¿øÅC‹ütT…ÓXÅÚ]oÄˆÙéXÃ#¦²ŠÓ]tQÉi¬V®\\Ùj\Z«|€‘¿n{aGL5äè4VùÇ(ì¨ŠÊÔU\0Â\0\0@Ø!ì@Ø1ÈÃŽXo#¦šŠé¡bª¨ŽB‹X |ìØ±Yø-‚Ž¶”»^SSSËbèq½$b1òbÓU]pÁÙBägŸ}v¶NGlŸ1cFv½¶Ž2¶lÙ’…$qñX…7ðˆ°..7uêT4\0a\0\0 ìv ì¬aG\0ƒ©	;º¦£58bûqÇ\'è\0v\0\0\0ÂaÂŽÁ\ZväGf#„•¬ÔSW;\0\0\0a‡°a‡°CvTmà!è\0v\0\0\0ÂaÂa‡&ì¨ÚÀã¼óÎt\0;\0\0\0a‡°a‡°CvT§X£#^J­á1Plß¾=­Zµ*-]º4ë;Zÿ·%K–¤åË—§Í›7{\"‚°\0\0v;v;„x}è(èX±bEÚ½{·çN…µ={ö¤eË–¥M›6y\"‚°\0\0v;PÌv;ðúPJŒètTvà#n\0a\0\0 ìv ìv;ðúPBÒ=g<ŸAØ\0\0;„(f\n;4ÅQ¯^4Ïgv\0\0\0ÂaŠ™Š›šâ¨×‡J=h|ëÝô­9k³§=×<ŸAØ\0\0;„(f\n;4ÅQ¯ýzpøðÓ¾ƒïµœ_þjSKØ§óÛw¿ÝœÞ~ç=Ï=Ïgv\0\0\0ÂaŠ™ÂMqÔëCå¼DÐ1{åÖôyëÒS/ïJË^iLÓæ¯o	;âtllÍÎ45w™?ùZ:ð®ÀÃó„\0\0€°CØb¦°CSõúP!¯{4§)s×µ„µI¿})íØ{ÐóÏó„\0\0€°CØb¦°CSõúP9¯¯m(;ì˜ûoÛ<÷<ŸAØ\0\0;„(f\n;4ÅQ¯•õzSWåÃŒÉ¼”þÃiKÓÛY‹Ó±-¿ÿ‰—\Z<÷<ŸAØ\0\0;„(f\n;4ÅQ¯•ñzÐøÖ»Ùä…ktD¸Ñör±­p\r¸N\\×sÐó„\0\0€°CØb¦°CSõúÐ¯¯Å¦©ŠÑm/ÛŠ]ÖsÐó„\0\0€°CØbf¯[ºt©¢â(^„žÏ ì\0\0\0„Â3«×Š+ÒîÝ»hkjjÊ-¼>t5ì0•°„\0\0€°CØbfÅÛ²eKZ¶lYzóÍ7hÐ±iÓ&Ol¯];þ¼@ySÙ”Çe=… ì\0\0\0„Â3û<ðxúé§³\"š6pš ÃëCO†O®k(:MU±ö¯kv\n&„ ì\0\0\0„Â3¯•vì=Ðœ¾3o]ÙaÇMs_J»ßnN;@Ø\0\0;„(f^*#ìh~ïpšùôælªªÏoOÏ¼Òz\r8½ì•ÆôÔË»²PäWË·¤C‡\'„ ì\0\0\0„Â3¯•vä¦ý^p< Ï‡q:¿ý­ƒï	:„ ì\0\0\0„Â3¯•v´mo½ÛvÄiA„°„\0\0€°CØb&àõ¡ªÂMØÂ\0\0@Ø!ì@1ðúÐgÆŽ›žzê)a‡°„\0\0€°a‡b&àõáòª}ÜÑ\"ôXºt©°CØÂ\0\0@Ø°C1ðúPaG¾7®èHa‡°„\0\0€°CØb&àõ¡*ÂŽÂ‘…¡‡°CØÂ\0\0@Ø!ì@1ðúPUaGáH˜ÞJØ!ì\0a\0\0 ìv ˜	‚×‡Ü„•ßzìéÂ\0\0@Ø!ìv\0ðfÌ˜1iîÜ¹Y=;Œìð~Ž°\0\0v;P¨Š°£mÈ‘×^Ø±zõêtÑE¥O<1tÒIéÂ/L+W®ìÑBþÑ‚ä€\n\'fÏžN?ýôtüñÇ§‹/¾¸Û¿¿°Ãû9Â\0\0@Ø!ì@qÔaG]]]š3gÎ1!G9aÇgœ‘×­[—^|ñÅìô§?ýiaGí„NÈ~§¤C‡	;¼Ÿ#ì\0\0\0„ÂG\0º¢ÔHŽÎ„1š#Þÿ6nÜxÌ¾={ö¤+®¸¢eÔÇ°aÃÒÎ;[ð\'Mš”N>ùätÚi§¥x Û·uî¹çf×¹êª«Jû-Z”Î>ûì,8ˆËÆ‰-[¶\r\nÏoÛ¶-\r:4»Þ™gž™V­ZÕîöö~öC©}q;ùÇ“Lí=^a‡÷s„\0\0€°CØâ@7µvÜ}÷ÝYÁ0‹	&d#<òûbÄHì‹k×®ÍN_rÉ%­\nø,Hë×¯ÏNŸzê©Ù¾òû\"0(Uì?å”S²í[·nÍ¦ÓŠÓçŸ~‡áÁ¥—^šŽ0#~žsÎ9ínoï÷hï1tõñ	;¼Ÿ#ì\0\0\0„ÂG\0ú0ìˆktD G¼F\0ÛÛŽ`ˆÛJ÷cýŠÂëÅôNÑJûc}Ø#\'\"¨˜1cF6\n££ð ûmo¯£íÅ~öCWŸ°Ãû9Â\0\0@Ø!ì@q ÃŽ|Û±cG«  0´èhŠbaDGaGì‹Çöo|#[\'$.kˆôVØQì÷hï1tõñ	;¼Ÿ#ì\0\0\0„ÂG\0ú0ìˆµ-âý/¦izþùç[ôGŒ‘µ8ò‹—_tÑE÷cŠ¨!G§±š7o^Ébÿ\\Ð2íÔ®]»²ÓŸüä\'³}±Hœ)²{ì±¢ÓXÅˆ”!E¦±j»½½ß£½ÇÐÞ¾¶¿S{WØáýa\0\0 ìv 8Ð‹aG¬a…ÿýÓPÅÔMù…½›šš²é­bqîØ!F,ÞQØ‹xGÐÓ?;¶d±?në«_ýjvûqÙXãÙgŸÍö=øàƒÙš±oâÄ‰­n#ÖÐˆ \"®ˆGPÓÞöö~öC{ûÚþNí=^a‡÷s„\0\0€°CØâ@/†Ze4a‡÷s„\0\0€°CØâ€°CØáýa\0\0 ì@Ø¡8 ìÐ„ÞÏv\0\0\0ÂaŠ#\0ÂMØáýa\0\0 ìv 8 ìv®½öÚìý»½6fÌ(a\0\0 ì@Ø!ì\0vhÂŽÊ´|ùòÃŽ¹sçúC	;\0\0\0aÂa€°CvT®qãÆ•:êêê²¿Â\0\0@Ø°CØ ìÐ„«½ÑsæÌñvTê‡Š¾þúëóêëë?\\ºtiö×ú¿-Y²$^SöæÚ(}\0„Â„\0ÂMØÑ§Š­ÝkuÕ!ì¨Ôt¬X±\"íÞ½Ûk\\…µ={ö¤gŸ}öÀ’%K¾æã/\0€°CØ°@Ø¡	;úL±ÑÖê ’ÃŽÑ!è¨èÀã¹×ÝW}ü\0v;v\0;4aGŸ\Z?~¼QTMØSWym«ø×Ý÷}ü\0v;v\0;4aGŸŠâq>ì˜?¾?vxÝ­Ž×]\0„Â„\0ÂMØÑçòkwÕÁ@	;Þ}»1½þÜ¬´aÉY‹Ó±Íë¢°\0\0a‡°a€°CØ1@å×î€v¼³¿!­ÿÝ´ôÒc“[µØû¼6\n;\0\0v;v\0;„ÐwÞ™½ŸÇO¨ö°cÇ†9&èÈ·õÚ(ì\0\0@Ø!ì@ØPÈB¹ÂŽà?øAúÈG>’Î;ï¼ìç­·Þê\"ì¨ê°ãÕg~P2ìˆ}^…\0\0;„;\0\n¬X±\"íÞ½[q«B[SSSHÑqÐ‘8bdÇqÇ\'ðè¢]»v¥Y³f¥›o¾9]}õÕiÄˆ-‹¿G‹óuuuéÆoL?ûÙÏÒÆ…½v¬_|{É°#öy}vtGmmí\'jjjrOéË˜kÏäÚŽÂçy®5æÚªÜe~‘»ìØÜé¿T\0\0„Â„\0mË–-iÙ²eéÍ7ßTàªÐ cÓ¦M:j™AGGÛ)mÑ¢Eiüøñ©MÁ³ÃV[[›…÷ßE-/ìÐ„Çºì²Ë>WSS³ ÷Ü=ÔÉçúû~äZÝÐ¡C?ª4\0\0;„;\0*6ðxúé§³âŽV9MÐÑ¾ÁÑ^ ‘ßo\röÅÂîcÆŒétÈQ¬\Z5*í!ìè~Ø±aÉ%ÃŽØ\'vtò3þßäÚs=ñ<ÏµWc´‡ò\0\0 ìv ì\0\0z(èè(È0Â£}ñwi[È9rdš>}zš7o^Ú°aCjllL‡Ê.äÈ‘lÚ»áæÏŸŸ]nôèÑÇÜÆ¸qã²UØÑõ°cóÊŸ–;bŸ@BØQ®ÚÚÚéGGfôèó<×žÈÝÎ§”	\0\0a‡°a\0Ðù\0£Ü½ü`°ÿþl=ŽÂÂeLE5{öì¬ÈÙÍÍÍiáÂ…iâÄ‰ÇCüqaGÃŽ}\rëÒú§n;v\n«Ü¶Ø\'vtdøðá;ºG¯=Ïkjjöç~U*\0\0„Â„\0@‚ŽÎŽÔx´:®¼òÊVËiÓ¦eßìîŽ>ø 7âã…ëyüæ7¿vt!ìˆ¶õù‡Ž	;b›0BØQfÐ±¢/žç¹öN®}M¹\0\0v;v\0\0½tôÔõŠ¶#:b\Z›(`ö”†††4yòäV÷1wî\\aGgÃŽÃ‡Óæ?Ì<v\n«Ü¶Ø\'vtð™þ™>~žª©©ù’’\0 ìv ì\0\0ÚÑÑbäÅíÔÞ1[9·3µ]££¾¾¾Wî\'æþyþGx¬Y³FØQfØñÎþ†´iå}%×ìˆ}q¡„°£˜£ktôùó<FxäîûLe\0@Ø!ì@Ø\0´Pt4U9aG¬#<–/_~ÌˆŽÞ‹ßu×]-÷7bÄˆ´k×.aG{aÇáÃ©qóÓéå\'¿[2èÈ·¸L\\Ö(aG›ÏòS¸y_?Ïs­±¶¶öJ\0€°CØ°\0(L”³ÖF¹aGgow =zt«¹û{rJ›R<˜Æ×r¿S§Nv”;:\ZÍa”‡°£555kúûyž{÷*\0\0ÂaÂ\0 M QîŒÎ„ƒ-ðX´hQK!²®®®Û‹wÆ/¼Ðj:«7\n;Š„åŒæho”‡€BØqÙe—}®žçG,ÿKå\0@Ø!ì D‘#úý`úv\'\0¤ £+aGþ`0Liuíµ×¶\"gÏžÝç÷Ï=÷´ÜÿÍ7ß,ì(vt5èÈ7…°#÷üz´Ržç¹öCå\0@Ø!ì ŸŠ)çwÞ ^°\0*EWˆ®„]\rVªI¬“‘/@Ž92íÞ½»ÏÃ–-[Z­²wï^a‡@AØÑƒbŒÜsëP¥<Ïkjjö×ÕÕý…\0 ìvÐOß\ZâÊqÇ\'ð\0€~:º2Ú²«aGá1Aµò;vlzê©§Ú½Ì¬Y³Z\nÓ§Oï·Ç:qâÄ–Ç1gÎa‡@AØÑƒjjj.¯´çymmíW”\0\0aÇ \n;öïßŸæÏŸŸ¾ÿýïgÈM˜0!û&Nþ\0ñšk®IS¦LIÿ÷Ÿ}(|ýõ×UAz)è,ßî€JoîjàÐ°#ÿÕö¥‡ü1c„K—.-z™˜6*¹yóæõÛc}ä‘Gút¡òþ;jkkçÚß\n;„}Ý¯bÚ¨J{ž[¨\0v’°ã÷¿ÿ}öA~Ô¨QYÈ±páÂ´nÝºl¸ñ|Ðr¹}ûöe‹8>ùä“Ù¨£GÎ>þÓ?ýSvN÷¾5Zª˜Ño•\0]:º4t7ì(ç¡RÃŽ|7nÜ1#=®¾úê–ý}µ8x1õõõ­Â™v|£}qMMÍg…ÂŽ¾êW¹ýÏTÚó<¯\0 ìècå~«\'ÂŽ˜Ç4><Ç¼øÆM„qäÈ‘´råÊ, ¹þúëÓ‚TGºXÄè(È0Â\0ª\'èè©°£ÚŽÚ†…aB>ô1bDËöÆÆÆ~{¬Û·ooyñ˜rØQÐž(ö9CØ!ìèé~•Û¶£Òžç¹Ö¨º\0;úéà±£o`u÷ƒóoûÛì›u¿þõ¯Ssss·$Ÿ{î¹ìÛ{1ÍUL‡EùÅ‹rGlTëüÝ\0P-ÊIQbôt«öc€RaGáHÂó‡ê·Ç\Z_Ú)|,ƒ$ìhùœQXœv;zº_Uêó\\u\0vôÿÁã%Fztù ïÇ?þq6ã…^èÑƒÉƒ¦3f¤«®º*mÛ¶MÅ¤¾¥)ð\0€ÞñÆodéóÎ;¯œ¢uŸ†!WGaBµµJ\ngSØQø9#¾\\%ìvôt¿ªÔç¹ê\n\0 ì¨ƒÇ\"Ó[u9è¸á†²õ8zK,^ëyÄºô\\ÐÑS×\0Š+gzÉ!Fv”UT,lcÆŒIsçÎÍŠ¶ƒudG%‡NÂŽÊoÕj\ZÙ\0 ìèðX]	;bêªÞ:ò-Z”®¸â\n#<JQºTTÛ‚¥\0P-¬ÙÑsýÂ#Ïšñ¹â¹Üç‰/\r:ô£q¹Þ;î¾ûîô™Ï|&pÂ	éãÿxö7Žõc_þyQ\r!C¥<Ö*ÙÑÒ¯¬Ù\0Ðõâÿ lýà.bŽµk×öÙÁåÃ?œ®»îºVp=÷­L#<\0 wî¼g÷DØQm_nÈ§ÖÕÕe#}‹Æñhþr7nì·ÇZ__ßjõAv´\n9òz:ìˆimã÷ýüç?Ÿ}«?¾çÏ9çaÇÀ;ŽéW¹mÏTÚó<fJP]\0¨œp§íAd§ôn¹å–l1ò¾6qâÄtï½÷*š´)š|øá‡ÙëøÙm¯g\r\0èÝ÷î®\rÝ\r;zè¡tÜqÇUÕ—\ZŠähë¦›nj9¾7o^¿=Ö¸ïüãˆÇ4ÀÃŽUµµµ_irôVØqî¹çf¿ï‚:öíÛ—®½öÚtÒI\'¥O<1?>8p Û!ÉÙgŸ‰ý_|qËè={öd£Èã:±oØ°aiçÎÇÜW{·Ÿq»çŸ~¶-\nóñøãò±aácmï>‹ÝÖ ;Jö«Ü¾û*íyIµ\0 ÿÃŽ¢ßÀêÌçßÿþ÷Y¼¹¹¹Ï0\Z\ZÒÈ‘#Ó®]»KŽ+\"¨8ãŒ3²Dñ³ÜÀ£Ôõ\0Ð;º3²¢;aGþ½}êÔ©îoúË_þ²å8wúôéýö8&OžÜò8~ó›ßÔ°£Ôçˆ^\r;\"œˆß7*´vD§cDx¦ãt±ï”SNÉÎoÝº5­^½:;bôPœñÅ³‘ëqú’K.9æ¾Ú»ýüãXºtiöY%¶åþV-AM~DJþ±¶wŸÅnk\0‡ö«ÚÚÚQ•ö<Ïµ¯©6\0\0ô_ØÑî7°:óÁ9>¨ÏŸ?¿ß2ï¹çžA;ÕR±o…FðTX\0)\'ð(:òíšk®é‘bÌÿßÞýÇX]Þ‰w1ÖkÜÄÖØ¤k6»ÙÓ³üa¼	Á4æ&ñ&½mo—2€€€ øT„Š?©ìX]mwµ 4-†²e\"•KÅ^pYXŠ¢T)™\n(0à:ÂŠÍsçó½žñÌáœ™3?Ï™9¯Wò„33gæÇùž™ó}Ÿçy\0€žý.ÈØ1œCGˆWæçþÞÄœ<yrÐïCÁ:þƒò¢œJÄŽrõwì8÷Üs³ÿÞ˜UÑ]ìˆYq9–»Š—ã}ñ±Q£FeoG<¹îºë²å±bvEþçåÜçå®¾~îóâý]]¿ð¾»Íb_k¸ÆŽr´ÛÙ~lª¢ãüTûsë¿p¶\0`ðcGY¯À*÷‰skkk\Z?~|öd£RbvGû—5·wG©\0Q,\\t<Ê½¾=<\0`à~§÷tI©ÞÄŽZyñBþ¾•xAÎâÅ‹;n?–\\µ;boŽsÊ\\Æ*–ƒ*Œ^xaö±x;îÛí·ßž.½ôÒŽ¿£DW÷¥«¯N‘ý8Ê‰ÅnóœÞÛc¨ÅŽ/ž×¾R-ÇyûXêL\0@u+ë¼øÃòþûï¯ø“Ú[o½5­[·nÈ=Y½¹ßÝmF^nÀèi±¤\0\\ðèÉïØžÆŽZúž¿”Õ-·Ü’<,¹%Vs·¿uëV±£ŸcÇ3Ï<“ý÷^ýõÙÿÛ^x!{ûoÿöoÏ\n¹¥¡ò—™ŠŸ‰øØÕW_½ÿböM\\þÚ×¾–}¬®®.{{É’%Ù²RqyôèÑgÝ—®¾~±@ËRåBMîú¹ëtu›bÇÙò—²ªôqÞþÿîïœ>\0\0±ãÑGMkÖ¬©ø“ÚE‹\rÉW)æþ@ŽèkðöçÉŠîBFOCGþíµ\rM`(èÉ,ÊžÄŽž†”¡.NÞN˜0¡ãï¬_|qÐn{Á‚·{7–ZŠ1\"ÄFßù›‹G´(¶Ayü³&bÄIñÜ^Hßþö·³Ï¯ûu¼úê«ÙÇš››³‘Ûx<\"E\\¿Øå¥¾~±@Ë¬ÅÌ”¸½ü¥g»»M±ãl±RAûqöûJçcÆŒùµS\0\0Ã$vÄ¬Ž]»vUüIml*KÕØ‘Ó¦Mër¦GO—’*4Îœ9Ó«ÐQxÒDð\0€ÊrcGo–È\ZògwÄ+°÷ïß?à·¹víÚN×Åß§bÇÀÄCìù³;*tœŸ3fÌN\0\0“Ø¯^jii©øÚx%TLýê±#¦GaôèížÅ‚ÇW¾ò•^‡Ž¾Þ\0 ï¿cË‰µþ»zúôé[Ýyç©­­mÀnkË–-–µyê©§õ¿Uì0j1v„öãmM¥Žóö1Ãi\0€a;â½Ï?ÿ¼jÂÁp‰ù3=by«¾Î¤(<ú:\nO¢ØÃ\0úW_—žªµ¥«Š‰%€ÆŽÛñwÕÂ…ÓgŸ}6 \'@cù¡ÁÞ”\\ì0ÄŽsÎùÞ÷¾÷Õöãîè`ç6%\0†±£šCwá`¨Žï|ç;ÙØ‘#GöéûKWÎèˆ·ãý}÷+¾Ö`L€Z=}±ƒ#|)^4’ÿwU¬µû,ô—XÒ&ÿ•ÞñB•ÖÖV±Cì;Ñ˜1cþ{ûh¬ã¼}¼ü½ï}ïÏ2\0\0f±ÃÌŽ	4\'NL\r\r\rÙ“þxu¦™\0_:xð`¶‘mœ<FåÇúõëÓ¦M›Ò¾}ûü€–ø][nð°ÌäÙV¬XÑéï¬xuö¶mÛúô5:”|ðÁ³fäV\"tˆF­ÇŽ0vìØÿÕ~ž\Zèã\\è\0\0Æ±£Zöì8zôè°Ø³£0rôÇÉ{v\0t›7oÎ~w9ÁU]#~—766¦½{÷úAíåïÜeË–e×›7ožoZÕ«WwZÒ*F}}}Ú³gOC/^\\ø*ïléªJ…±Ã;þ¿¿ÿû¿ÿíÇãÇuœÇÒUB\0À0Ž÷Ýw_zçw*þvûöíiòäÉC6vÄ+âU‡Å\"G±“åÎ¤(:âíXºªØûË\r}ÝC RbF‡ÐQÝÁ#fÜPúwo©¿âý#FŒ:º°sçÎìÅ1…/6¹í¶Û²¿Ã\"„Æ²œ¹õþãß8é¯_¹reš;wnÑ¹ƒ½¹Øaˆ¥;öòöãò½~>ÎÏØŒ\0 bÇ£>š­aZi‹-JóçÏrOº»šÉÑ×Ww–\n¹ ÑÝÇ»zÕhœL:€¡(N¤;±Uý\'ÝèÙß\0f[–/f_Ä÷©p–GoÆŒ3²ÜT±Ã;¾³/ÚñúÂY½cÆŒùuû¸Âé\0€\Zˆñê—…Vü	^,P\rÑe°_ÝYê¤F¹!£§Á#w2Å«F¡ÊI7±c¸¡£wšššŠ­Å_Öˆ¿;c–X5;±ãlãÆûËöcö‡ù›——9bï¥uuuç´\0\0@\rÅŽÃ‡g³ÚÚÚ*öä®¹¹9{u^%ïC5½º³§£Üë@­ÅŽ#~’î\\ñf6â²bbGµý\r0räH¡£âïÇØÏ#fÇã…Ë\\ÅÛS§NM÷ÜsOZºtiö·o5;±£´I“&ý·/öóx<6/²ÌÕ‘öç“ÿÖþïScÆŒù~ûå¿p:\0\0 cG¸÷Þ{³\rE+å™gžI³gÏ®É\'è¹õ¹óOrÄòsz¸4U±àqÓM7uº\'S€á;NŸþ¯tüä§ooúCsGìˆË¹÷·|Ô–>úøS\'ÈÄŽŠºùæ›cy•´`ÁßÄCì\0\0€þˆñj¸»ï¾;}þùçy5Þ¸qã²¥jUá†¥ùá¢\'›Ž—ú¼žnŠ0cG„Žå[ÞM?X¹+­ûýáÔ¸ûHºÕÛ±#.Çû_Úù~š×~\'ûŸéÄ\'‚‡ØQ9“&MÊ^‘b‡!v\0\0@?ÅŽ0sæÌ´yóæAbW__Ÿ-+Pë\n—´ŠP33Ê\rùÁ#ÿó\nC\nÀpÇN´¥¹\r»:âFwãî}+½wì¤“dbGEüüç?ïX~¥–_ðØaˆ\0\0Ðï±#6uŽ[[[íIÝÎ;Óøñãõ6‡Rðè«bKd×Øcí›‡ÊŽ\rÿqÀ	2±£\"r³Zs±Ã^Zˆ†Ø\0\0ý;B<ÙþÉO~2(ËYÅæñD?–Ð¢ÿƒG‡€¡;béª\\Ì˜óü[éWÿ¾?55”¸ïË}üå·9A&vTÄc=Öií±cÇ¦cÇŽùÆˆb‡!v\0\0@ÅŽøC96Ç^¶lÙ€>™kiiI7Þxczâ‰\'<³-¢¯KOYº\n¨µØqäÃO²\rÈó÷èˆ¸Qx½x_þñ9ñ¹N”‰ƒ%¢FÄüØãÇ?þ±oŽØQµ\'«7lØà±­ºÇ©öÇÝ3žþ\0 vˆ7ÜpCZµjÕ€<‘‹¯¡ÃŒƒò‚EO¿O6#j1v[¦*fs^/ÞWìºN”‰ƒ%fÑ†ŽuuuÙòVˆÕhÓ¦MGâÅJßªs:tè_Ûwÿàé/\0\0bG±Qf¥K—öë“¸Ø£#–®2££gá¢Üàaé*@ì;ÄŽêµk×®¢¡#7\Z\Z\Z|“ÄŽª´qãÆo566~ôÁ|ê1®ºftDèX¿~ýöñ¿=ý\0@ì(!f`Ü|óÍiæÌ™éÀ}úZñJÅúúúl3r{tLðˆ¥Çâz69j1vXÆJì\n¦M›Öeìˆ¥D;ªÕúõëÿgû±ý»X.)Žq£*Fü¿øƒÐ\0€ØQ¦XC:fcD¬øãÿØ£ÏmnnNK–,É>ÿî»ïN­­­žÉöBw{pÄûGŒ!t\05;¾Ü ¼¹ì\rÊãºÂ„Ø1XbÖì¤I“²¿‰b”\n›6mòÍ;\0\0\0ˆØ\"R<üðÃÙzÒ1Ûã\'?ùIzõÕWÓÁƒ;]ïøñãiûöíiÑ¢EiÖ¬YÙœ³gÏÎžàÓ7¥fxXº\n;¾¿Ýu¨è2UÅÆov¾/LˆËzÎ™3\'íÙ³\'ëÖ­ËþEì\0\0\0`€bG¾\r6dá#–b(|ebÄxÕâüùóÓÚµkm´9ÀÁCè\0ÄŽ/Ç±mé+w•;îix+µ|Ô&Nˆ³páB¿Ã;\0\0\0*;¨Žà1räH¡;òFÛ§§Óâû²¥ª~½ã`zewç=<ârãî#iÝïgQä›šÒ©Ó§Å	±£bâwx;\0\0\0ÄŽš{tÄLšR{x\0ÔbìÈæÖ/7\rÈs±#.çÞÿáÉO…±£âæÎ›-eb\0\0€ØQ³\"v\0ˆ]#~Ò;â²!vT“Ø×,ö9±\0\0@ì;\0†‰cÇŽõ{ì0ÄŽjvë­·¦¥K—úF v\0\0\0ˆbÀp1~üø4þün£‡Ø!vÓ§OO\r\r\r¾ˆ\0\0\0b‡Ø0\\Œ7.{l‹ñÈ#¤ÖÖV±CìÖ¦L™’~ó›ßøF v\0\0\0ˆbÀp1vìØŽØ‘Ï>ûlvò\\ì;†£I“&¥W^yÅ7±\0\0@ì;\0Êñ§?ýiH<®±¼ÕªU«Ä±cØ™0aBÚ¾}»ob\0\0€Ø!v\0”:ŠE„ºººlÄòQâÄë\r7Ü&Nœ˜&Ožœ-±3uêÔtÓM7¥3f¤™3g¦Ûn»-ÝqÇiöìÙiÎœ9iîÜ¹éÞ{ïM<ð@zè¡‡ÒøÃôÿðéñÇOO>ùdú§ú§´hÑ¢´dÉ’ô‹_ü\"-[¶,­X±\"­\\¹2½øâ‹Ù>ëÖ­Ë^Ý^*väFÜ·ø\\±Cì.âØÛ½{·ob\0\0€Ø!v\0”û˜{`|üñÇéøñã©¹¹98p íÛ·/;ÙºsçÎìæ[¶lIY€ˆA\"ÂDD†,\"\\DÀˆA#ÂFŽ<\"|D\0‰A$ÂH’%L\"œD@™6mZT\"¬Är>ÝÅŽÜ2Wb‡Ø1\\ÄÏôûï¿ïØ\0\0 vˆ\0å>f;v¬êïc±qË-·¤µk×v\\Oì¨þÑ]¸ªäˆÀ£pVS·o¼±c6SüÜÝzë­iÖ¬Yé®»îÊâÝ}÷Ý—|ðÁôÈ#¤G}4‹}O=õTZ¼xqÿå_þ%544¤Õ«W§—_~9›±´uëÖôúë¯gQ±©©)‹ÛÚÚ²ûqâÄ	Pˆ\0\0\0b‡ØPŽ8©\Z39ªUÌ:)<)=oÞ¼¢û”;âóFÎ?ÿütÁ¤Q£Fe³Vâc_œP,úy]}l8ŽåË—§K.¹${î¹éšk®éòº=ùÞTëÌŽS§Ne¡áðáÃYxˆ\0!\"‚D„‰*b6S|o–.]šž}öÙôôÓOga#G„Ž>\"€D‰ÙK1séæ›oNÓ§OÏ‚I„“(R\"¨DX‰À’›¡”ûw(ì§ƒØ\0\0 v v\0U¡Ú÷Ø³gOÇ	àˆq2º”rbÇe—]–8ÜµkWzã7²Ë—^ziM®Æyç—}/bvA„€á;ªÐØ\0\0 vˆbÐñêò;vTíý‹Y\'?üpYKm•;b6GüŒˆRê¤},S3?bfCìGRxB?w9^_ïÊ+¯,úõb&ÀW\\‘…ƒ¸^ÌˆYÅAþÛñßüo|#û¼Ë/¿<›]ÐÕû=šmÒž›­òÝï~7[©»ûPêcñur÷§ð¿¹Øý;@ì\0\0\0;;€Šš8qbzíµ×†ÅK9±ã±ÇËN^xá…YÔˆ…\'ð#D¼ˆË_|qÉ“û/¼ðBvÝ¸|íµ×žu[]tQö±wß}7[>+._uÕUÝÆƒë®».»1#þ˜ÒÕû#ºÄÛ1SåÍ7ßÌ.ó›ßìö>ôöþ‰ v\0\0\0ˆˆ@U™<yrZ·n]ÍÄŽ±GG‚ñ;1H©ú±gE©“û±¼SŒ¸³!\no\'ö‰ÅÌ‰?ýéO³YÝÅƒÜÌŠÂ¯×ÝûóGîþtuz{ÿÄ;\0\0\0ÄÄ ªÄ†É1;¡–bGn¼÷Þ{Â@¹\'ô‹ÅŽXªðëÇÇâ>Ý~ûíÙ¾ q½Ø3d bG±½5ºº½½bˆ\0\0\0bbPU¦OŸž\Z\Z\Zj&vÄ^ñ{0–mŠ½JÊ=Á_ìrìç±fÍšìòõ×_Öm]}õÕËNÅÆêqùk_ûZö±X+Þ~ûí·ÓK/½Tt«˜rN‘e¬\nß_WW—½½dÉ’ŽM×GÝí}èêc…ß‹®î¯Øb\0\0€ØØTÔÌ™3³“öµ;bO‹1\"–¨Š¥œr}÷4vÌ˜1#û\Z±ÏEì{Qx[±¡ø·¿ýílÖG,×{õÕW³=÷ÜsÙžñ±Y³fuúúñµ\"DÄçÄâfºzsssÇféñßûuÄmwwºúXá÷¢«û+v€Ø\0\0 v v\0Kýìg?«™ØÑ£\'\'÷\r±Ä\0\0\0±±`wÝuWzúé§ÅŽŒ˜=QlCrCì\0±\0\0@ì@ì\0*`îÜ¹éÉ\'Ÿ;±Ä\0\0\0±±šî»ï¾T__/vbˆ\0\0\0bbG%<x0Û`xÃ†\rÙ‰4cèõë×§M›6¥}ûö9¨ØÃ?œ,X vbˆ\0\0\0bbG%CÇæÍ›SKK‹‰Ãl=z4566¦½{÷:°PÌêˆÙb‡!v€Ø\0\0 v vTHÌè:†wðˆ;œ\'žx\"Í›7Oì0Ä;\0\0\0ÄÄŽJ‰áN :9Jï=ýôÓé®»î;Ç3ˆ\0\0\0bb‡“›†“£CÓ’%KÒwÜáñÀp<ƒØ\0\0 v vTûÉÍO>:’þø»¥éõ²—ã}N>:9Zë–-[–fÎœ)vŽg;\0\0\0ÄÄŽj>¹ùqë¡ôöÿ½?½õÒœN#ÞsÒÉÑZÖÐÐ¦OŸ.vŽg;\0\0\0ÄÄŽj>¹ùÞ;ÿç¬Ð‘ï¿³Æ	H\'GkÚêÕ«ÓÔ©SÅÃñb\0\0€ØØQÍ\'7ÿðÊJÆŽø˜NŽÖ²uëÖ¥É“\'‹†ãÄ\0\0\0±±£šOn¾ýo•Œñ1\' ­e¯½öZºá†ÄÃñb\0\0€ØØ!vNŽM;vìH&L;Ç3ˆ\0\0\0bbG5ŸÜ|gý‚’±#>æ¤“£µl÷îÝiÜ¸qÃâ¿eÃ†\rŽÇ3ˆ\0\0\0bbÇðŒû¶<]2vÄÇœ€tr´–8p ;vXü·lÞ¼9µ´´8nªt477gA\n;\0\0\0ÄÄŽ^ÄŽã‡v¥·×=xöVíï‹9	)vÔ²ˆÃ%v455¥ÆÆÆôÁ8vª4tìÝ»×Ab\0\0€ØØÑ›ØãÝËÎŠñ>\'!ÅŽZ×ÖÖ6¬7\"xlÜ¸1û¹1ªg v\0\0\0ˆˆ}§O§}ÿ¾øì%¬ÚßÄŽZ¶`Á‚4fÌ˜ôÃþÐ7@ì\0\0\0;;ª1v|Üz(íÝòTÉ=;âcqQAì¨E?úÑÒŸýÙŸ¥‘#Gfÿ>ðÀ¾)\0b\0\0€ØØQ5±ãôétdßÆôûßÞ[2täF\\\'®k–‡ØQ‹¡#8bfÇˆ#\0±\0\0@ì@ì¨†ØÑÝl³<Ä¡ãGEgr”z?\0b\0\0€ØØ1È±£œÙ]ÍòÄŽá,fpt4r·‡€Ø\0\0 v vT0vô6tä†À v÷ÐÑ]È0Ã@ì\0\0\0;;*;±ƒÒ£Ü=½>\0b\0\0€ØØ!vbÇ€‡ŽžÎÔ<\0Ä\0\0\0±±Cì0ÄŽ!:úëó;\0\0\0ÄÄ±Cì;z­»ÍÈûë\0 v\0\0\0ˆˆb‡ØAE-Ae†€Ø\0\0 v vˆ†Ø1h\n÷ÚøÓŸþ”¦NšýÛ…Ÿg\0±\0\0@ì@ì;±cÐBGnF„ŠË.»,;Yÿ–<J}žà v\0\0\0ˆˆb‡!vZè13ã‹eeüÐ‘7ÝtSÇÇíá v\0\0\0ˆˆeˆ“Üb‡!v”¯T€(.º\nå^ß\0b\0\0€ØØÑÉ“\'§ÿøÇ©­­Mì;jæøYëÖ­ëuè(µ´T¹£§aÄ’V\0b\0\0€ØØÑ…qãÆeÿ-uuué©§ž*=Ä±c¸¿1\"zlØ°¡¬Ï)78t2z\Z:òoÄˆfx\0ˆ\0\0\0bbG¡ˆ¹¿1\"~¬X±Bì;j\"väÆ´iÓºœéÑÓ¥¤J3gÎô*täØÃ@ì\0\0\0;;Ê8é›\'NL«V­;ÄŽšˆù3=\n£Go÷Ì(<¾ò•¯ô:tôõþ\0 v\0\0\0ˆty²tìØ±ÿÆˆÙ1CbüøñiÂ„	Ùˆx0iÒ¤lŒo¼1;©\Z¯&Ÿ>}zš1cFš9sfºõÖ[Óí·ßžfÏžîºë®t÷Ýw§¹sç¦{ï½7Ýwß}é¡‡J?üpzä‘GR}}}züñÇÓO<‘þùŸÿ9=ýôÓé™gžIK–,IK—.MË–-K¿úÕ¯RCCC-V¯^Ö®]›È}å•WÒk¯½–¶nÝZò¤onÜpÃ\rÙL±Cì¨…Ø‘?Ó#–·êëLŠbÁ£/¡£0xØÃ@ì\0\0\0;è³8A{\\´¶¶¦cÇŽ¥÷ß?8p íÛ·/íÞ½;½õÖ[iÇŽiÛ¶mióæÍYdˆØðòË/gñ!\"DÄˆˆ	\'\"Rüìg?K‹/ÎâEDŒ\'Ÿ|2‹\Z7\"r,X° ‹?\"‚Ì›7/‹\"GfÍš•î¸ãŽ,šD<¹ùæ›³˜\'n#®L™2%‹-]\"bÄèî¤onˆÃ”û³P+ã;ßùNvâkäÈ‘}zœˆ¥«\ngtÄÛñþ¾ˆû_kÿþýŒÄ\0\0\0±ƒÚVêDo„‘˜	’#v˜ÙQ?÷1+d|?BnfGogP˜Ù v\0\0\0ˆ0ÀbVJáÉÞXR«ØFÍƒ;¶oßžFÎ?ÿütÁ¤Q£F¥-[¶dË .öy]}¬Ò£šï›ØQ:röì\0;\0\0\0Ä¨B{öìé8Ùû„ÄÛ¥FìÈÞµkWzã7²Ë—^zé‹bÇÐ‰±¤[,#W,råÎ¤(:âíXºªØûË\r}ÝC\0±\0\0@ì`ØijjÊöùè*rfìˆÙqÜÄý)\rn¹å–læÇ%—\\’ísRr—ã$v|½+¯¼ò¬¯·Çubùx;ö.‰·—/_žŽ?žísŸ·3]Nœ8Q4\\ä¿{µ|ãßHçw^ºüòË³Íß»»ßGÍn;7“å»ßýn¶ïKþç]sÍ5éª«®;úYW39ºÝ…†R¡#4ºûx)ñs3bÄ¡@ì\0\0\0; ·#v<öØcÙ‰†/¼0‹1Ã£0,ÄÆî/âòÅ_\\2v¼ðÂÙuãòµ×^Ûév>œ½ÿ¯þê¯²·ÿú¯ÿ:{û½÷ÞËBG\\Ž ²råÊìrîbÇu×]—]ŽÈÿFdéî~G‰·cË›o¾™]þæ7¿Ùéó6lØÝ_±£:t7³¢ÜÑÓà‘-óæÍ«šïÅÁƒ³Ÿ÷øŸ£òcýúõiÓ¦Miß¾}V;\0\0\0Ä¨Tìˆ{tDˆàÇPR¡áÜsÏ-;N:•¸3\'\noçŠ+®È>öÊ+¯dÿ~ýë_ÏÞ×-õù]ÅŽÜçu·ŒUþýÎ}Nþ(¼­¸–±ª.¥fxô4`”{ýj\r›7oN---Cni¹á>bÆXcccÚ»w¯ƒÄ\0\0\0±*;r#fY”\Zº‹±DTá×™#ñ±o}ë[Ù¿1£#)­üÏðÒŸ±£ðsŠs*°×‡ØÑ³…KJM:µÇKS7ÝtSÙ3I*%ftÕ<bÆ\r v\0\0\0ˆPØ{]Äq³}ûö´cÇŽŽÆ½‰±¿Áš5k²Ë×_ýY·•[¢*öØˆŸþùNKKå/ca$>ËOÅÛo¿ývzé¥—Š.c3SÎ)²ŒU±û]WW—]^²dIÇ†ì£G;†PðÈß´<?\\ôdÓñRŸ×ÓMÑSœHª{8žAì\0\0\0; B±#ö­ˆ“ý1ã!–z\Z5jÔY}—;bŸø\Z±¹÷»ï¾{ÖmÅ¦ãññs¾XV*^	ï\rÊãúqbDèÈmPþÜsÏ¥‹.º(›ý»çßnÜÆÕW_Å“X\"+‚Mw÷»¹¹¹c#õ¸­Ø¯#6:;†ŽÂ%­\"TÄÌŒrCG~ðÈÿ¼ÂR‹†ãÄ\0\0\0±jöäf%\"“£‚G.5Ul‰¬¡üxpäÃOÒ+ÞÌF\\v¬9žAì\0\0\0;@ìèfäfd8ÙéäèPýN*ñxpúô¥ã\'?íx{Óš;bG\\Î½¿å£¶ôÑÇŸ:öÏ v\0\0\0ˆ vNŽV‹¾.=UíKW•óx¡cù–wÓVîJë~85î>’î_õvGìˆËñþ—v¾Ÿæµ_çÉßþg:ñ‰àáx±\0\0@ì\0±Ãpr´ê‚GOgfTófä=y<8v¢-ÍmØÕ7ºwÿë[é½c\'Žg;\0\0\0Ä;\'G«IO—¢\Z*KW•ûx°öÍCeÇŽ†ÿ8àØs<÷«Ã‡§¥K—¦ùóç§)S¦¤ºººôýï¿cÄÛ“&MJ³gÏN‹-J{öìñ …Ø\0\0 v vNŽÒ—€±lÙ²ìzóæÍ6±tU.fÌyþ­ô«ßŸšš?ÊF\\Ž÷å>þò[‡{Žç~±zõê4cÆŒNa£œ1vìØ,~<ûì³Ù÷\r±ÃÓ\0\0\0±±Ãpr”<ÝíÁï1bÄ¥Ž|øI¶yþ7\n¯ïËßÃ#>\'>×1èxîM›6¥‰\'ö8rãÇÏf{ v\0\0\0 v vNŽRÆ¡¸tUwÅ–©ŠÙ…×‹÷»®cÐñÜSqü‹qãÆ¥úúú´råÊôÎ;ï¤#GŽ¤S§Ne×ÿì³ÏRKKKÚ»woZµjUv½	&œõ5¦M›–ššš<€‰\0\0\0ˆˆ†“£”\nC=tˆŽçJkmmÍöãÈ±ÕòåË³˜ÑmmméÅ_L³fÍ:+z¬]»Ö˜Ø\0\0€ØØa89Jað9rä¥,cåx¬Ð1yòäNQâþûïÏfpôÅçŸžÅ˜’¿ŸÇ/ùK`b\0\0\0bb‡áä(9±GGœ@-µ‡Çpy<hÜÝ\\öåq]Çžã¹\'\ngtÄrU*úË¡C‡Òœ9s:ÝFCCƒ0±\0\0@ì\0±Ãpr”œ8q:Ü~»ëPÑeªŠßì|ß±çx.[áÛ¶mÛ‰=>b?ü;wîô\0&v\0\0\0ˆ vNŽR±ãØ‰¶ôƒ•»ÊŽ÷4¼•Z>jsü9ž»µiÓ¦³ft¤ØÌ|áÂ…·WWW—>ìALì\0\0\0;@ì0œe¸ÇŽ¶OO§Å÷eKUýzÇÁôÊîÎ{xÄåÆÝGÒºßÎ¢È/65¥S§O;þÏÝš0aB§=:úséªRNž<™¦M›Öq»óæÍó &v\0\0\0ˆ vNŽRËXEðhnýrÃñØ€<;ârîýžüTèp<—eõêÕÁaÒ¤I}ÞŒ¼\'^ýõNËYíÙ³Ç™Ø\0\0 v€Øa89*vÔÚãÁ‘?éˆqÙ±æxî©éÓ§w‡åË—úíÿã?þcÇíÏŸ?ß™Ø\0\0 v€Øa89*vx<0Ïå‹}2r¡aÜ¸q©¥¥eÐïCSSS§ýBŽ;æÁLì\0\0\0;ÀÉMÃÉQ±Ããáx.ÏÒ¥K;\"C}}}ÅîÇ¬Y³:îÇŠ+<˜‰\0\0\0b8¹i89*vT«©S§¦uëÖy<p<WÍÏ[,•‹+W®¬Ø}}þùçmT.v\0\0\0ˆ vNŽ2bGîdnœ„Þ°aƒÇÇsÅÞ¦L™Òq½Jn¾mÛ¶N÷±\0\0@ì\0±ÃprTì¨ò“Ï¹1mÚ´¢¯¼÷xàx¬Ÿ·ºººŽ9r¤b÷õàÁƒ÷#îb\0\0€Øb‡áä¨Ø1DN>ç¿’=ÿ$´ÇÇó`ý¼å¿ÿÔ©S»¯Ÿ}öY§û‚Ø\0\0 v€Øa89*v±“Ïù¯¼å†<8žëç­šƒØ!v\0\0\0ˆ0Ä	N\'e`Oî•!vTÿ.?kfv v\0\0\0ˆÐ¯6oÞœZZZœD¦£¹¹¹Ë\r©©í3qâÄÔÐÐý¬„JÇŽíÛ·§Ñ£G§óÏ??]pÁiÔ¨QiË–-ÙÇ¾8YYôóºúX©±|ùòtÉ%—¤sÏ=7]sÍ5%¯—ÿµ{s;fvÿy³gb\0\0€Øýª©©)566¦>ø@¦¡cïÞ½~ÐÅŽ.#GN¥cÇe—]–”ÜµkWzã7²Ë—^zé€„†óÎ;/ûz\'NœÈf”ó9bGÿý¼M™2¥ãã{öì©Ø}Ý¶m[§=E;\0\0\0ÄâÁcãÆÙI4cø¡ƒÂ“Ï“&MJ+V¬8+rTKìˆÙñ;6N~—\n\r·ÜrK6ó#fe,[¶¬äì‹øo¯wå•Wžõõâós×Ë}Þ«¯¾š¾þõ¯g$¾ösÏ=gfÇ\0þ¼ÝsÏ=×[¹reÅîkÜvî~Ä}Bì\0\0\0;\0 J•šÉQm±ã±ÇËNJ^xá…YÔˆ…±cõêÕY¼ˆË_|qÉ ñÂ/d×Ë×^{m·³4\"tÄ2Zï½÷^öþ‹.ºHìÀŸ·Ÿÿüç‘¡¾¾¾b÷uÎœ9÷ã—¿ü¥±\0\0@ì\0€¡®\Z6(=:bF@ø}¤XhˆË±ßF© KSÅˆË1“£»Øñî»ï¦¹sç¦«®ºªdà;úOÌ(ÌE†qãÆ¥“\'Oú}Èß¯#ÆáÃ‡=ˆ\0\0\0b\0ˆý7r3,r¡¢Xìè*HäÇŽXÎª»Øqùå—go¯Y³Fì$ùûv¬ZµjÐoñâÅ·?kÖ,\0b\0\0€Ø\0bGßG.8ÄrR;vìÈ.Ç¦å½‰±ŸG.\\\\ýõÝÆŽÜ>¹ÑÅŽ—¿”U,[qj°:t(›Q’»ý­[·z\0;\0\0\0Ä\0;ú>Þ|óÍ4zôè,<ÄU£FÊNB÷&vÌ˜1#û\Z±,U,QÕ]ìøéOšÝî7Þ(v’øï™0aBGpxñÅí¶,XÐq»ñ³‚Ø\0\0 v\0€ØQ5£\Z‚„ØQ¾üÙ1Óbÿþý~›k×®í´WGÌ$Bì\0\0\0;\0@ì¨š³3ŠmH.vT¯éÓ§w„‡;ï¼3µµµ\rØmmÙ²¥ÓòUO=õ”_ì\0\0\0;\0@ì0ÄŽ¾9pà@\Z;vlG€X¸paúì³Ï$tLš4É¦äb\0\0\0b\0b‡!vô¿\r6tZZ*öÔ8~üx¿}ýXº*FÇ´iÓRkk«ƒ^ì\0\0\0;\0@ì0ÄŽþ³bÅŠNÁ#falÛ¶­O_óÐ¡CéÁìôu…±\0\0\0±\0±Ã;ÌêÕ«;-i£¾¾>íÙ³§G_çàÁƒiñâÅfsä–®:Ä\0\0\0Ä\0ÄCìP;wîLuuu\"EŒÛn»-›ý±yóæ´ÿþŽ}=âßˆ1dåÊ•iîÜ¹g}®ÍÈÅO_\0\0\0Ä\0ÄCìT1ûâ8k–GoÆŒ3ÒöíÛàb\0\0\0b\0b‡!v¾¦¦¦³öÜ(wÄ’U[·nu`#v\0\0\0ˆ\0ˆ†ØQymmmÙ~óçÏÏ6/\\æ*Þž:ujºçž{ÒÒ¥KÓáÃ‡Ðˆ\0\0\0b\0b‡!v€Ø\0\0 v\0€Øaˆ v\0\0\0ˆ\0 vbˆ\0\0\0b\0ˆbˆ\0\0\0ˆ\0ˆ†Øb\0\0€Ø\0UmÃ†\r‚‚Øb\0\0€Ø\0C×æÍ›SKK‹¨P¥£¹¹9R€Ø\0\0 v\0@	MMM©±±1}ðÁâB•†Ž½{÷úA±\0\0@ì\0€î‚ÇÆ³å’ŒêBˆ\0\0\0b\0\0ˆ\0\0\0ˆ\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0b\0\0\0b\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0ˆ\0\0\0b\0\0 v\0\0\0Tcì8uê”gŽ\0\0PÅÎœ9Ó*v\0\0\0”ð7ó7ÿîw¿óì\0\0ªØë¯¿¾£ýÏ÷}žÁ\0\0\0qùå—?sÝu×ñô\0\0ªÖ™¯~õ«Úÿ|¯÷\0\0 ¸?o÷ÎèÑ£nÛ¶­õÌÝ\0\0ª¢pœ9Ó\Z3:¾ˆ¿Ý=}\0\0è\"x´‡¾x•Ã0Ã0Ã¨šKW=~ŽÐ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@_ü?cW/Å1UÏ\0\0\0\0IEND®B`‚',1),
('3',1,'E:\\works\\Fintechviet\\AdServer\\adserver\\target\\classes\\processes\\Order.OrderProcess.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0;\0\0õ\0\0\0 L€\0\0zIDATxÚìÝÔå/|¢ñx,“r­ŠÇS•äœM½[×ãñhÕzL½®µ•¼ÆJêMRÇá\"£‚\"šE=\Z—Ä˜˜]CˆæM0†#v¹¬ë%ŠÂ,^@E8ˆ\\†¹ˆ #5ÏÛ¿ÿ¡\'=C÷LÏ½{æó©zjºÿÿ¾ÍÌÓÝÿþ}ûyž!C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`I)}ôõ×_ŸW__ÿáÒ¥KÓâÅ‹µ\nhK–,IË—/ß›k£ôRýT?\0\0\0\0hGW¬X‘vïÞþøÇ?jÔöìÙ“ž}öÙK–,ùš~ªŸê§\0\0\0\0\0%Ä7å+ºüÇÅ‹¿ªŸê§ú)\0\0\0\0@	1%bme·Å‹¿¯Ÿê§ú)\0\0\0\0@	1ï¾BmÅ‘“~ªŸê§\0\0\0\0\0%t¦ˆÜøÖ»é[sÖf-N+ð*\"WZ?}÷íÆôús³Ò†%wd-NÇ6ýH?\0\0\0\0°öŠÈ‡ÿ1í;ø^Ëùå¯6µ„q:¿}÷ÛÍéíwÞSðUDî—~šoïìoHë7-½ôØäV-¶Å>}I?\0\0\0\0¨REä:f¯Üš¾3o]zêå]iÙ+iÚüõ-aGœŽí­Ù™¦æ.óã\'_KÞx(\"÷m?-l;6üË1AG¾íÜð¨¾¤Ÿ\0\0\0\0U©\"òÞÍiÊÜu-áFGmÒo_J;öTôUDîÓ~ZØ^}æ%ÃŽØ§/é§\0\0\0\0À\0Õ^ùñµ\re‡sÿm›‚¯\"r¿ôÓ|[¿øö’aGìÓ—ôÓî¨­­ýDMMÍå9?ÌµgrmG®¥‚Ö˜k«r—ùEî²cs§ÿÒ;\0\0\0\0ô‘öŠÈ1uU>Ì˜üÈKéá?¼‘¶4½µ8ÛòûŸxÉšŠÈýÓO…úioºì²Ë>WSS³àòË/?Ô&Üè¨½áG®Õ\r:ô£Þm\0\0\0\0 +\"7¾õn¶\0yá\Zn´½\\l+\\Ã#®×UøUDî‹~Ú¶mXrGÉ°#öéKúig\\~ùå“kÏu2à(Õ^ÑÞq\0\0\0\0 —+\"›¦*Fs´½\\l+vY…_Eä¾è§mÛæ•?-vÄ>}I?-Wmmíô£#3Z‹‘#G¦éÓ§§yóæ¥\r6¤ÆÆÆtèÐ¡Ž9’vïÞ6mÚ”æÏŸŸ]nôèÑÅB\'r·ó)ï<\0\0\0\0ÐÃ„ŠÈÕÚOÛ¶}\rëÒú§n;v\n«Ü¶Ø§/é§>|øÇŽ®ÇÑPÔÕÕ¥Ù³ggaFg477§…¦‰\'¶\n<jjjöç~õî\0\0\0\0=È4VŠÈÕÚO‹µ­Ï?tLØÛô#ý´#GƒŽ…ÁÄ´iÓ²ÝñÁ¤Ç<RpÛïäÚ×¼\0\0\0@iò¦²(Ë*ø*\"÷G?mi‡§Í˜yìV¹m±O_ÒOÛÓvDGLWAEOihhH“\'O.<ÕÔÔ|É»\0\0\0\0ô€öŠÈO®k(:MU±ö¯kv*ø*\"÷K?öÎþ†´iå}%×ìˆ}qýI?-æè\Z-AD}}}ê\r±ÆG¬çQ8Â#wßgz\'\0\0\0€n*UDÞ{ 9}gÞº²ÃŽ›æ¾”v¿Ý¬è«ˆÜ§ý4Fl4n~:½üäwKù—‰Ë\Zå¡ŸºüòËÿ¦p1òÑÑ›b1ó»îº«0ðh¬­­ý„w#\0\0\0\0è†REäæ÷§™OoÎ¦ªZðüöôÌ+­×ðˆÓË^iLO½¼+E~µ|K:¤ˆ¬ˆÜ‡ý´£ÑFyè§å¨©©YS¸FGON]UÊÁƒÓ¸qã\n-¿×»\0\0\0\0tC{ÓEàÑ´ÿÏŽÇäù°#Nç·¿uð=A‡\"rŸ÷ÓrFs´7ÊCßÒO/»ì²Ïå‡ºººn/FÞ/¼ðBÛËÿÒ;\0\0\0\0tQY?mo½ÛvÄi^Eäþì§]\r:òMßÒO/¿üòGóÃìÙ³S_»çž{\nzG\0\0\0€.êLØ¡)\"ë§Ú@é§±NÆå—_~(‚†‘#G¦Ý»w÷yØ±eË–Â©¬ö×ÕÕý…w%\0\0\0\0(P[[»8×þ¶£Ë)\"+\"WýT?íi555—çƒ†éÓ§§þ2qâÄ–À#÷šýï^\0\0\0\0P  x¶¸¦¦æ³¥.§ˆ¬ˆÜŸ„rúiõ«˜6*ÿ:9oÞ¼~;yä•\0\0\0@)óÀçÛÅŠŠÈŠÈ•ÐO…rúi_÷«Üþgò—Û¸qc¿…õõõ…#;{÷\0\0\0€EÂŽ–bZaè¡ˆ¬ˆ\\aýT(§ŸöI¿ÊmÛ‘ßßØØØoaÇöíÛg£w/\0\0\0\0(P*ì(,þÅ7ž‘‘+±Ÿ\nåôÓÞîW…Û:ÔoaÇ‘#GZ=Fï^\0\0\0\0ƒTE}­¦ˆ¬ˆ\\áÏ_¡œ~Ú+ýªð|v\0\0\0\00Dq¨ôß¥D{®¦¦æKC‡ýh\\N¹ò›PN(§Ÿön3²\0\0\0€~§8TúïÒ^È‘×“Eä»ï¾;}æ3ŸI\'œpBúøÇ?žFŒ‘¶lÙÒ§×Ü¯”µj¹]#;ú/”k¯¿öçÿ»šúfŽìhéWÖì\0\0\0\0 ¢;Jÿ]Ž¶Uµµµ_iräõTyÆŒYÁõóŸÿ|ö-éE‹eçÏ9ça‡°£œ~Úg¡\\9ýuˆ°c …Çô«Ü¶gòû7nÜØoaG}}}«5E¼{\0\0\0RÂŽ’—¢Eã¶zªˆ|î¹çf×Ýÿì³Ï¦³Î:+ûýé§Ÿž|ðÁV…ÚI“&¥“O>9vÚiéÈömÛ¶-åv3Ï<3­Zµ*Û¾gÏžtÅW¤O<1tÒIiØ°aiçÎí~÷íÛ—®½öÚìòq½ñãÇ§´ºÎÅ_œÎ?ÿül[?ãwŠË_uÕU­n·œû/¼-aGûÏß¾åÊí¯…ÿïöúN„$gŸ}vÖGcüßó£CÚë\'¥oVAØQ²_åöÝ—¿Ü¼yóú-ìˆû.x¼÷y÷\0\0\0¤„ÝÓSEä(öæn®¥HÛ¶EÐ±zõê´cÇŽìr§œrJ«l×¯_Ÿ>õÔS³}—^ziv>BŽ!ßº¯««ËÎ¿øâ‹iíÚµÙéK.¹¤Ý°#ŠÉ±ýá‡ÎŠ‹q:ŠÊ…×YºtiÚµkW¶-B–üãÊë?»åÜám	;Ú}þöi(Wn-ü·×w¢Çù­[·fý;Nçƒ„öúÉ@é›vtØ¯jkkGåC†éÓ§÷[Ø1yòäÂ°ãkÞ•\0\0\0\0)aG÷ôTùøãÏ\n©ñ-õbû£<eÊ”¬<¤ 8;¤M8§ã¶ât|;}H‘à\"¿½°Å¶öÂŽüubÊ¢hÅ®ÛÛ»|þvË¹ÿÂÛvTN?-·¿ûë;^xav>Â“çbz¬]ÑQ?(}³šûéÈ‘#?•{ÿ8ï!¹ÓéàÁƒý½^Ç¡ÚÚÚOxW\0\0\0¤„ÝÓSEäu1¤ib\ZªØÿè£vviS¸m¯8\\îú1¥Ï6â˜6«ÔuÊ)(wæþ…•ÑOËí¯…ÿÇöúNœÇöo|#}úÓŸÎöqÆö“Ò7«½Ÿ®Û1þü>;fÎœYvÌòŽ\0\0\00ˆ	;º§§ŠÈ?ÿùÏ³Bê¿øÅ¬ÐúÏÿüÏÙù¿ú«¿jU„éu†”vä§±Z¹re«i¬FŒ‘µ=ò·wÑEµ[ÐÍOïS8UÐ„	J^\'¦þr´ž¿|þ2]¹aGeôÓrûë\"SCë;\\pAËTk15Tœþä\'?Ùa?(}³ÚûiáTVñ7¾ÐW\Z\Z\Z²%ùûÏýïÎõŽ\0\0\00ˆ	;º§\'‹ÈQ`…“kÎ/*ÓûDàÑvAå!í„1õU“ãöbèX!¶755eâü‚ÎQüÅÌ;Z |ìØ±Ùå£Ea³í\"Ð…—E¦#\\‰ûŽë^¦+÷/ì¨œ~ZNÒfòR}\'þï_ýêW³ëÇíÄ4mÏ>ûl‡ýd ôÍjï§±¦Gî=äå|à°páÂ>;î¸ãŽ– £¦¦fw#\0\0\0€ANØÑ=½QDÖ‘õSý´ZŽîˆ‘o¼ñF¯?þxáôUï×ÔÔœíÝ\0\0\0`vt\"²\"²~ª\rö~š{y4>|ë[ßJÍÍÍ½tÄ´|…ÓWåÚxïD\0\0\0\0;ºIYY?Õ{?>|øÌ½—ìÉwÝuW:räH¯1Í˜EÉ\0\0\08†°£{‘‘õSM?2¤¦¦æ³¹¶?DÄš\Z±žJON]ÕfDÇÃ‡ÿ˜w!\0\0\0\02ÂŽîQDVDÖO5ýôÿ¨­­ýJî=åP>ˆQõõõÝ\n9\Z\Z\ZÒm·ÝVr:\0\0\0\08–°£{‘‘õSM?ý³Ë.»ìs¹÷•w\nÃ‰éÓ§§7v*äØ¾}{š9sfÛÑÙÔU‚\0\0\0\0Ž!ìèEdEdýTÓO[«­­=3÷Þ²£MH‘¾þõ¯§9sæ¤+V¤7Þx£e]øáFŒ™7o^š2eJÛ€#Úû#\0\0\0 $aG÷(\"+\"ë§š~z¬}Q[[;½í(®´ššš¹v¶w\0\0\0\0Jvt\"²\"²~ªé§¥9òS¹÷™;//³ÅÚ³FŒq®w\Z\0\0\0\0:$ìèEdEdýTÓO;VWW÷ï®çñÃX`¼È4Wµµµ‹s?ï«©©¹<wúÞa\0\0\0\0(›°£{‘‘õSM?\0\0\0€~&ìèEdEdýTÓO\0\0\0 Ÿ	;ºGYY?ÕôS\0\0\0\0ègÂŽîQDVDÖO5ý\0\0\0\0ú™°£{‘‘õSM?\0\0\0€~&ìèž¥K—*ÔVv;´xñâ÷õSýT?\0\0\0€LØÑ=Ë—/oÜ½{·bm…¶†††ß.^¼øUýT?ÕO\0\0\0`\0vtÏÓO?ýåeË–½ýæ›o¾§h[Yß”ò’%K¶åÚ×ôSýT?\0\0\0€LØÑ}K–,ùÒâÅ‹Ÿ‹ihbÞ}­\"Zü/^U@ÖOõS\0\0\0\0„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„¥­^½úÿž0aÂæ¿þë¿~?w6iš¦iš¦išVíSŸúÔ{gœqÆ¬Üéùä\0\0;Jˆ #çƒ/}éKé¹çžK‡J\0\0@ÿ{ÿý÷ÓË/¿œ†\rö§üã›\0\0€°£„ë¯¿~K\0\0@åúüç?¿\'wø>Ý\'\0\0v;Šˆ©«bD\0\0P¹6lØp0wø¾Ù\'\0\0v;Š3u\0\0T¸˜ÒjÈÿYÇ\0\0vP,ì\0\0\0*Ÿ°\0 ÷+¥}ýõ×çÕ××¸téÒ´xñb­Ú’%KÒòåË÷æÚ(½TØ!ì\0\0\0a\0\0íˆ cÅŠi÷îÝéü£VAmÏž=éÙgŸ=°dÉ’¯	;„Ý	;Ö¬Y“.¾øâtâ‰\'¦“N:)ýíßþmZ½zu¹ÈÊ¾\\´¸ÿþßÿ{vŸ\0\0€°\0 OÄˆAGE\\¼xñ«ÂaGwÂŽÿò_þKöáêÕW_M/¿ürvú?ý§ÿÔãaGøýïŸŽÀ\0\0v\0\0ô‰˜ºJ¨PÙmñâÅï;„Ý	;b4G\\vË–-\Z…çó§¯¹æšì6Î;ï¼²oã„NhµoèÐ¡éüÿ‘m{çwÒu×]—ÝfŒ¹þúë[ZßµkWú»¿û»ìúý×žþùlûR]]]Ëè”áÃ‡g#ÒÂc=–þÛûoÙub_Ü×öíÛ;Ü\0\0Â\0€\"Ö‡(T|Ø1èŠ…Ý;~ô£e®N>ùäôõ¯=áÑ™°#ƒhùÐ¢½°#?²#‚‘Â}Ë—/O{÷îÍ¶EÐÛæÎ›,XŽÀ#|ñ‹_ÌÎGÈ1¤`„ÈUW]•‘)6lÈN_zé¥Ù¾SN9%;¿sçÎlú¬8VÚÛ\0\0Â\0€Av¼ûvczý¹YiÃ’;²§c›0BØ!ì¨ü°#Ä\ZDà×‹\0¤Ü°ãÃ?ÌÚ£kr”\n;¢üñé¿þ×ÿšêëë¹¼¸R·›ß×V~û6ëƒ„XƒdÈÑÑ$–ÜÿýÙHŽö\0€°\0`…ïìoHë7-½ôØäV-¶Å>„°CØQùaG^SSS«  ³aGLU*ìhçC]«mùiµ\no7B˜rÂŽÂÐ$/¶-[¶,ÝxãÙZ$q¹X§¤£}\0\0 ì\0\0DaÇŽ\rÿrLÐ‘o;7<*vô¶/\r;¾àÛµ°#Ö¾ˆËÆ4N/½ôR«‚ÿøÿ!;ÿÚk¯¥ßýîwEÃŽßþö·é‰\'žÈNÇèˆî†ù)©\n§±ŠéµB~\Z«‰2¤`\Z«Q£Feçõ«_µ,²~ñÅgû>ûÙÏ¶L}SeÅéO}êSî rÅúJ«V­J±¾\\iýß–,Y’MK¹yóf„\0\0Õv¼úÌJ†±O !ìèEŸËµý¹vïÑŸ_ò¬í|Øk\\D0£#bš©˜Ú)¿ð÷ìÙ³³u-b´Å·¿ýí¢aG¬±Ó@EððÆot;ìˆÊcÑóx<Ñ\"èÈ/PkkD@÷‹G@Þzë­,$É/jëuÄbæ!~6,Û×‹59þð‡?t¸€Ê\r:V¬X‘vïÞíX°ÂÚž={²“›6mÒQAØ\0P}aÇúÅ·—;bŸ~ÂŽ^:òGŒìØ#ðè|Ø\0Õ$Ft:*;ðˆ7€°\0È¹ýöÛÿbÆŒß»óÎ;ŸŸ6mÚž	&9rdŠ©j¢]sÍ5ÜtÓMûï¸ãŽµ?ûÙÏî¿å–[þ/5a‡°cPmv\0À\0…tÇ€•|\n;\0`P»ë®».¹í¶ÛÖŒ\Z5êOÓ¦MK.LëÖ­Ë¾¹õÁ´ìÛ·/mÜ¸1=ùä“éž{î‰¹ÚÿtÓM7íÈ]çš¡C‡~Ô_²oÃŽ\rKî(vÄ>ø„=ì\ZùýÖðv\00\0•s|ª	;@Ø\0ô‹‰\'þåw¾óµcÇŽýÓ¼yó²0£3Ž9’V®\\™n¹å–?M˜0¡iÜ¸qÿ¯¿jß…›Wþ´dØû|àvôBÐÑQa„‡°\0aGj|ëÝô­9k³§;\n;@Ø\0ôšiÓ¦ÝpõÕW¿ÿë_ÿ:577wû\0á¹çžKãÆ;2~üø…Ã‡ÿ˜¿pï‡û\ZÖ¥õOÝvìV¹m±Ï>aGùÜÎØèìå…\0PåaÇáÃ¹cÓƒïµœ_þjSKØ§óÛw¿ÝœÞ~ç=Ç’Âv\0\0=cêÔ©÷_ýõ¼ðÂ=zpðàÁ4cÆŒ#uuu»†þý¥{7ìˆ¶õù‡Ž	;b›{ÂŽ:¾Ô…ë½3ˆŸ\Z4aG³WnMß™·.=õò®´ì•Æ4mþú–°#NÇöÇÖìLSs—ùñ“¯¥ï\n<„ ì\0\0z è¸á†>Œõ8zËÃ?üá¨Q£>ü¯üÅ{1ì8|8mþÃÌc§°Êm‹}>ð	;ú)èè©ë;\0 \nÂŽ½šÓ”¹ëZÂŽÚ¤ß¾”vì=èxRØÂ\0 ëbêªÑÑ›AGÞ¢E‹\Z5ªÁÞ	;ÞÙß6­¼¯äš±/.ãCŸ°£‹:ZŒ¼¯oGØ\0\ZvD{|mCÙaÇÜÛæXRØÑ£víÚ•fÍš•n¾ùætõÕW§#F¤Ë/¿¼¥Åùºººtã7¦ŸýìgiãÆžÐ;\0 šÅbä±FÇÚµkûì áý¯ÿµ+w`ù/C‡ý¨ÿ@…‡§ÆÍO§—ŸünÉ #ßâ2qY£<„](zj\nªÁ8ÂÃ§F\0UØSWåÃŒÉ¼”þÃiKÓÛY‹Ó±-¿ÿ‰—|!GØÑ3-Z”Æß*Ø(§ÕÖÖfáÇý÷ßŸýÝv¨@\0@•™:uêË±y_ûæ7¿¹«¦¦æÿî‡æ0ÊCØÑƒÁD>èøH®9ú³3Ú^o°-ZîS#\0ƒ\"ìh|ëÝlòÂ5:\"Üh{¹ØV¸†G\\\'®ë˜RØÑË—/OcÆŒétÈQ¬\Z5*í°\0¨wÝu×%cÇŽýSsssŸ8444|0bÄˆ·jkk?á?Ñ½°£œÑíòðPØQfÐñ¥‚Àâ—GþÙ‰À£ÔõSàáS#\0ƒ\"ì(6MUŒæh{¹ØVì²Ž)…uë­·XŒ92MŸ>=Í›7/mØ°!566¦C‡e—?räHŠiœ7mÚ”æÏŸŸ]nôèÑÇÜÆ¸qãÒ–-[<Ñ…\0@¥»í¶ÛÖÄ]ùþ÷¿¿¡¶¶vºÿD÷ÂŽ®ùæ °£AGsôÀ?u\"ð(:òíŠ‚ýƒe\rŸ\Zv;„=hÿþýÙz…ELE5{öìÔÙ5)ãK€.L\'N<&ôxüñÇ=Ù…\0@¥ºýöÛÿbÔ¨QÚ·o_¿<444ì®­­ÝkíŽî…š°£—”\n ŠíÅ.ÿÿ¹ü`XÃÃ§F\0EØa\Z+aG_W^ye«PbÚ´iÙŽîøàƒ²p#F†®çñ›ßüÆ^Ø\0T¢™3gNÁþvÝu×½–;pü[ÿa‡°£çåž[‹»øüêh1òrrƒŽ¶Ç@ÒÊ§F\0EØñçÊ›Ê^ <.ëXRØÑmGtÄtUTô”†††4yòäV÷1wî\\Oza\0Piî¼óÎç}ôÑ~?€øÉO~²ÒTVå¥…ÂŽÎ(ø&ÚâšššÏ–yµr‡ŽÎ…÷¿gÈÀááS#\0ƒ*ìxr]CÑiªŠµ]³Ó±¤°£lm×è¨¯¯ï•û‰5>b=ÂkÖ¬ñÄv\0\0•dÚ´i{Ö­[×ï¹ƒÒµ¹ƒÆgûÿ£Ü¢´°CØÑ•~UÐžè TëìTR¥ãºtä\rÔ5<|j`Ð„{4§ïÌ[WvØqÓÜ—Òî·›O\n;:´|ùòcFtô¦XÌü®»îj¹¿#F¤]»vyò;\0€J1aÂ„#]°­74555æ…å¥…ÂŽnö«–P­HÿêêšÅ×ºtt÷ñ;\0 ÂŽæ÷§™OoÎ¦ªZðüöôÌ+­×ðˆÓË^iLO½¼+E~µ|K:tø°ãIaG‡FÝjŽžœºª”ƒ¦qãÆµÜïÔ©S=ù…\0@¥ˆÅÖúâ °q°(ì(¯(-ìvôD¿*ÕŽŽ$êîHŠbGw‚Ž¶Ç@YÃÃ§F\0MØ‘<šöÿyÁñX€<vÄéüö·¾\'èv”eÑ¢E-Ç²uuuÝ^Œ¼3^xá…VÓYmÜ¸Ñ€°\0¨”\"h¥v”_”vT~+ãY‘-×\rïíf7Ž©«ÚŽèxíèöî¸÷èmý…°\0ª+ìhÛ\Zßz·%ìˆÓŽ…uíµ×¶¿Îž=»Ïïÿž{îi¹ÿ›o¾Ù€°\0¨•6²C+¯	;Œìè¡í¹ššš/\r:ô£G/šÙÑÕíì(\\´¼³Œì\0€vhÂŽîˆu2òÇ³ñy¶?¦eÞ²eK«ãê½{÷zv\0\0ý­RÖìØ³gÏ.kv”_”î­“…ÅéO<1sÎ9iõêÕÿÁ-ÿ˜…e÷«¶!GÛ`á!½³fGWkv\0€°Cv´˜5kVËqíôéÓûíqLœ8±åqÌ™3Ç‹€°\0èo7ß|óÞ\r6ôûD}}ýÚÜAâ\naGyEéÞ;âô3Ï<“ŽÀÃ‡Ãv¬ª­­ýJ‰£XÀPîHŠbAG¬Ñq\\‘í	<º»†ˆ°\0„Z…cÇŽMO=õT»—‰i£òÇ·óæÍë·ÇúÈ#X¨\\Ø\0T’;ï¼óùÇ¼ß ~ò“Ÿ¬Ì$þPØQ^Qº/ÂŽüùN8¡Õ¾‹/¾8þùÙ¶}ûöeóåžtÒIÙHñãÇ§dû¶mÛ–r?»þ™gž™V­Z•mß³gOºâŠ+²ËÇõ†\r–vîÜ™í‹…Ï>ûìì:±/î+†ˆw´¯ðqçOOš4)|òÉé´ÓNK<ð@¶/.=nã²Ë.ëÕ!v´7’££À££ ¡TÐñ‘vö—xüM®í€A‡°€ªÇN7ÞxcöSØ!ìèùÏCz,]º´èe®¾úê–Ëõçâàõõõ­/Â\0 ŸÍ˜1ãž»îº«ß n¸á†õ¹ƒÄ¡ÂŽòŠÒ}9²ãÜsÏmµ/>tÄ<¹±-‚ŽØöðÃgßªŠÓxÄ¾K/½4;!Ç‚\"uuuÙù_|1­]»6;}É%—dûN9å”ìüÖ­[³é³ât>Xio_±°cÁ‚iýúõÙéSO=5Û÷“ß—¼ƒ!ìè†ŽFVttébà‘ŸJë+ô©îS#\0U!\nÉùbn|‘¤½Â²°CØÑ“aG¾7î˜‘#FŒhÙßØØØouûöí-#Â\0 ŸMž<ù?Ž3æOÍÍÍývðÐÔÔ´»¶¶öÝºººï?Rž¾X³ãøãOguVZ±bE«}‡j¹|ŒÎÈo‹6äèZ…ûÚÞG~û6ëƒÄ¾/¼°e4I„%3fÌÈF‚t´¯XØQø;ÅïRêñ\n;:Tj„G¹AGgüý}e\0?…}j *Äg„¶ÅçX§ ¾Ì\"ìvôEØQ8r\"zncúþräÈ‘Va\0P¦L™ò¿—-[Öo?ýéOŸ¯©©ù…ÿDå„åî‹é¤Ú†1uT9aGah’o±-~·o|ãéÓŸþtv¹3Î8£Ã}…ùóÂŽ.‹m§”\ZÓ‰ £½ÀãŠ6÷3×èv\0PµÊ)>;„½Ýß\nGzTRÀ ìv\0\0fêÔ©µ“&Múðƒ>èo‹½?bÄˆ·FŽù)ÿ‰ê;òSRNc5aÂ„VÓX­\\¹²Õ4V1Ä;ÎÇ:\Z1•Uœ¾è¢‹²}\\pAËÔW1UVœþä\'?Ùá¾rÃŽ/ùË-ÓXÅ‚‚ÂŽN…‹–åC:¸^gEv\0@…ŸcšSaGå·Žþ—ÕØŒì@Ø\0cÂ„	M1]Q_»óÎ;×åïó¨Î°#(oõÅˆ‰htä(µ5\" ˆi§bañXg#¶755e!I~QóXG#3Ï/jþÕ¯~5Û×‹59ž}öÙ÷•vÄcŠ5HbZ«xÜC\n`v”¥í”VT\\Ñ‰ cH‰ë}aÂ€AèÃ?ÌŽÞyçìø)Ž‡vîÜ™-üýÚk¯¥uëÖ¥5kÖdÇKñE‘u½dÉ’ôÄO¤G}4ÍŸ??Í;7û‚ÉC=”~õ«_e_ùÙÏ~£¤Ó½÷Þ›~ô£¥ïÿûéïÿþïÓwÜ‘n¿ýötë­·¦›o¾9M:5Mž<9}ûÛßÎ¦¡úæ7¿kæ¥ë¯¿>[o-Öa‹c£hW]uUºòÊ+³ãµ+®¸¢ì¢s…ñ7‹/ÎÄqe\'ÆÔ§ñ7ì‹cäÙ³g§ÓO?=;¶¼øâ‹Ëº~o~Ùf ì3fLöÈyÊš;\0€’®¹æšÿgÜ¸qGöïßßg\r/¾øâæÚÚÚÿ=|øðùTFØ1ÐÛÇ?þñ¬óOGqaHÁˆaG—î*6E–°€tmsÇ¿--\n¤ÑF\Z•µÑ£GgCv#pˆà!ˆ=Äu×]—_ÿú×³ÀâÆoÌŒ›nº)4n¹å–4mÚ´,è¸óÎ;³àãî»ïÎ‚Ÿüä\'Y0òóŸÿ<JfÍš•\'sæÌÉŠÈ.Ì‚•X\"h‰À%BƒRÅçxœ¿þõ¯S|~ÈûôÇñ]Lk\Zï­åG\rÇ”§}vÄ—fb{|Ù§Ø­ýr‘°#µrä]}õÕ-û7nÜØoµ¾¾¾Õ´n;\0€\n2~üøÊ}z¿/¦³ÚµkWsL_uÙe—}Î_^ØÑW-¦¯Šp£ð›1-–°£ßžN„\0Tl7¾lQ\n¿EŸÿûý÷ßßªøúëø4¿†\\½ÛîÛ³gOÊäý†\r–¨)&Mš”­9wÚi§e!Pì‹ÛŠÑÀqœŠùµà\n÷Å¨ã³Î:+AbÄÇƒ>hdGÃŽYA\\Û~\"ÜË_.¦Òí/qßùÇ	a\0PA†úÑ+¯¼rëC=t¤7vïÞýAîàuWmmíDuaÇ@^\0r€wÃîN=5Ø¦®v\0b1Š#w\\•}äÈ‘-!GL—Uj$xŸÆÈ•xoÀ\"¦Tm×—‹k×®ÍNÇª…¡C|fýúõÙéSO=5Û—û\\Ô²oÑ¢E%Š¶Û#èˆiµvìØ‘m?å”S„Tl$G[¿üå/[B†éÓ§÷Ûc©áòã7¿ù:a\0PirÄ>1zôè}óçÏÿco(ÄˆŽ£AÇtma‡°cÀ™1˜#v\0±vX5Šé´b\Z¬ŽF¦ôçñiL·ÁFñ>H±ÑÑb[©uÞbíÂëÅÔTÑÊ\r;â<eÊ”lm¹R‡°£ûb:Ú|ÈaÜÁƒûü1®×-÷9×°\0¨D¹ÆO\Z5ªáW¿úUSO$Ä\Z1u•ÂaÇ€ÒÙ©¨ëÔUÂ€A,\n²1z \Zµ÷\rûJ	;ò-?¢\"h†…ç»\Zvœyæ™ÙùXûDØÑ»\n×í˜?~ŸßÿÌ™3[îâÄ‰^ä„\0@%‹#FŒø—	&4mÛ¶ípwš››ß¿óÎ;×ÅbäÖèv;uàñ7¹öN®}e?…}jdbáñçŸ~@ÿŽýu|šbú¨øÇéX´<öÅˆš8kqä/¿è¢‹:;bª«!G§±ŠuÊ\r;ò!Iþ¾„½§p*«˜¾,B©¾ÒÐÐÐ2½[´Xa\0PjjjnÈ}Hxó{ßûÞË[¶léÔH¦¦¦Ý3fÌx.Fsäg>ücþ¢ÂaÇ€õ…£AÆÚÙ¿GÐ!ì\0Œb‚åË—;z¡ÅZ`DÐÓP]xá…Yñ9öå>dÓ[ÅBã±?BŒmÛ¶uvÄ4IçœsN¶ÐøØ±cË;rŸ}²ûi»¨¹°£çÅï!b>pX¸paŸÝ÷wÜÑr¿ãÇ÷\'ì\0\0ªI„¹¹ÛsmÇ5×\\óÚÝwß½ê™gžyqûöíÛ\nöíÛ÷f}}ýÚŸüä\'+o¸á†õµµµïÖÔÔü\"¦ÅòWv;…R#<L]%ì\0Ô¢øý»ßýNØ¡õûñé@R8º#FZ¼ñÆ½~Ÿ?þx«µ:bDÂ\0 JÕÔÔ|öhðñD®mÍµ÷ö\ZsmU®ý0×†ÖÕÕý{1a‡°cÐ‚aÀ 7nÜ¸>ýæ¹°CaG¸öÚk[‚‡o}ë[1…r¯Ý×Ê•+[M_uß}÷yqv\0\0 ìv’Àã^A‡°€”Mu3gÎa‡&ìèa1-YmmmK\0q×]w¥#GŽôJÐS¢Y”\\Ø\0€°CØ1ø|!>)½†‡°€Aãúë¯O³fÍvhÂŽ^°téÒVSKÅš\Zûöíë±Û©«\nGtÄH­ýû÷{av\0\0 ìvGÃ„\0ƒ^|üþûïvhÂŽ^#§\n…Q__ß­ÛlhhH·Ýv[«Ût;\0\0v;„;\0­É“\'§ø‡vhÂŽ^´hÑ¢VSZE›>}zÚ¸qc§ngûöíiæÌ™­Fsä§®t;\0\0v;„;\0­ï~÷»é‡?ü¡°Cvô²5kÖ¤#F´\n)¢}ýë_ÏF¬X±\"½ñÆ-ëzÄÏ7bÈ¼yóÒ”)SŽ¹®ÅÈ…>¾\0\0;„Â„Q$ZµjU6gz¼öiÕß–,Y’–/_ž6oÞ¬ƒ÷Ûo¿=}ï{ßvhÂŽ>£/n½õÖcFyt¥?>­^½Ú‹˜°\0€Þ%Ø*ºÊ}˜|_Ø!ìv0‚Žø–ìîÝ»½ö°¶gÏž´lÙ²´iÓ&½DÐ‡°Cvô-[¶³æF¹-¦¬Š „\0\0½lùòå\nK•Û\Z\Z\Z~›û0ùª°CØ!ì` ‹B÷£xÄ,è¾˜Â*¦²vhÂŽ¾×ÜÜœ­çqóÍ7gŒ·æ*Î;6ÝtÓMiÖ¬Yi×®]^´v\0\0ô•§Ÿ~úËË–-{ûÍ7ß|Ï·Ê\ZÑAÇ’%K¶åÚ×„Âa‘†Š£”çÿñÓ¤I“„šç3;\0\0hkÉ’%_Ê}`y.¦K2¿xÅ´ø_¼*èv;,7G)ÏÌ™3Ó7Þèõ@ó|a\0\0 ìv@57ßz7}kÎÚ¬Åi…GÅÑÁ$¦Æ¹á†¼hžÏ ì\0\0\0„Â¨¦âæáÃLû¾×r~ù«M-aGœÎoßývszû÷\"G´9sæ¤ñãÇ;4Ïgv\0\0\0ÂaTKq3‚ŽÙ+·¦ïÌ[—žzyWZöJcš6}KØ§cûckv¦©¹ËüøÉ×ÒwŠ£×Â…³…‘…šç3;\0\0\0a‡°ª¤¸¹÷@sš2w]K¸ÑQ›ôÛ—ÒŽ½#G¬\'žx\"]uÕUúw\\ºt©çŒç3;\0\0\0a‡°Ö7¹_ÛPvØ1÷ß¶)D*ŽhË–-Kuuuúw\\±bEÚ½{·çM…¶¦¦¦,„\0\0€°CØ;bêª|˜1ù‘—ÒÃx#miz;kq:¶å÷?ñRƒb¤°c@[½zu\Z=zô€þ·lÙ’…:o¾ù¦çN…›6mòda\0\0 ìv@9aGã[ïf®ÑáFÛËÅ¶Â5<â:q]…IaÇ@´~ýú4räÈÿ{FàñôÓOgýF«œ&è\0a\0\0 ìv@\'ÃŽbÓTÅhŽ¶—‹mÅ.+`vD[·nM#FŒð‡\0v\0\0\0Âa;4aGuŠµ,jkký!\0„\0\0€°CØÕv˜ÆJØÁ±Þyçï‹\0;\0\0\0a‡°ª ìøóåMe/P—,;²;î¸#ÕÔÔ¤;ï¼Ó@Ø\0\0;„P-aÇ“ë\ZŠNSU¬ýëš‚aÇ€õƒü }ä#Içw^öóÖ[oõGv\0\0\0ÂaTzØ±÷@súÎ¼ue‡7Í})í~»Y¸ ì°AG>àˆ‘ÇwœÀ@Ø\0\0;„PéaGó{‡ÓÌ§7gSU-x~{zæ•ÖkxÄée¯4¦§^Þ•…\"¿Z¾%:|X¸ ìÐAGGÛv\0\0\0ÂaTPØ‘<šöÿyÁñX€<vÄéüö·¾\'èv81‚£½@#¿ß\Z\0Â\0\0@Ø!ì€\n;Ú¶Æ·Þm	;â´ AØ1ÐƒŽŽ‚#<\0„\0\0€°CØUvhÂŽÁ `”;b£³—@Ø\0\0;„ ìÐ„½ttv¤†À@Ø\0\0;„ ìÐ„UtôÔõv\0\0\0Âa;4aG—u´y_ß\0Â\0\0@Ø!ì\0a‡&ìèt@ÑSSPá ì\0\0\0„ÂvhÂŽ>Óv­?ü0;6ûÙm¯g\r\0a\0\0 ìv€°CvôYÐ‘AÅgœ‘Åâg¹G©ë	<\0„\0\0€°CØÂMØÑgAGˆ‘Gbe…AG¾]sÍ5-û­á ì\0\0\0„Âè†(r;4aÇ±JÅ‚‹ör/o\r\0a\0\0 ìv@]yå•éÞ{ïMÍÍÍÂaÇ€ëß1\nã©§žêrÐQjj©rŒÎ#¦´v\0\0\0ÂatÁÈ‘#S<‡GŒ‘î»ï¾’¡GwÃŽÕ«W§‹.º(xâ‰é¤“NJ^xaZ¹reëóÅäj*ñ±Ä°#úv´=–.]ZÖuÊ\r:\n2:tÞÿqÇg„€°\0\0v; \\räÂÑ\"ü˜3gN‡ù¢ïºuëÒ‹/¾˜þô§?-ìvôIØ‘oãÆkw¤Gg§’*h¼ÿþû]\n:ò¬á ì\0\0\0„ÂèF18ßÆŒ“æÏŸßcaGŒæˆçÄÆÙ·gÏžtÅW´Œú6lXÚ¹sg«P`Ò¤Iéä“ON§vZzà²}q[çž{nv«®ºªd€ÐÞí¶‡~8»þ¨Q£²óq8?{öì´oß¾tíµ×f×Û?~|:pà@Ñà¢ðü¶mÛÒÐ¡CÓ	\'œÎ<óÌ´jÕªV—™0aBv{§Ÿ~zzè¡‡Êþ{\\|ñÅéüóÏvt±›Þª«kf<þÝ¿ûw]:ºûx\0v\0\0\0Âa]*¢ÖÖÖ¶üŒ£%b„DÍGµêêê²52¢0ÅÖø–yÐ£p~ýõ×§n¸!}ãßH7Þxcúö·¿ø§L™’¾ûÝï¦[n¹%Ý~ûíéþÏÿ™¾÷½ï¥éÓ§§þð‡éG?úQúÇüÇôÓŸþ4ýüç?Ï‚€Y³fe…ó(ÞÏ;7--Z”üñ¬ÀûÌ3Ï¤ßÿþ÷Yá½T18ß¢è#=ºvÜ}÷ÝY!‹(ðÇü¾ø»Ä¾ñ±víÚìô%—\\Òª¸¿`Á‚´~ýúìô©§žší‹!¿/~¿RaG{·_ØvíÚ•íûÏÿù?gç?ó™ÏdçwìØ‘ýŸâtüMçÍ›—Žÿ[GaÇ¥—^šŽ¿uü<çœsZ]&w„6q:‚œrÿ1%S<^aG×ÂŽÂ‘ñ·ìîHŠbGw‚Ž¶‡5<\0„\0\0€°CØA¯Q£@k\\ìß¿?íÝ»7ûö}|“óæÍé•W^I/½ôRzþùçS}}}Z±bE2DØðÄOdEî!\"Œˆ0!Â‰)~ñ‹_¤™3gfáE„?þñ³P#Â9î¸ãŽ,ôˆð#B©S§f¡H„#\'NLßüæ7³Ð$Â“ë®».+ÒGA7Â•«¯¾:[¢˜!F´ŽŠÁùÖ”Ç\ZqßxÄó#Ø#Úˆc[© áøãou½C‡e­TØÑÞí·mgŸ}v¶?þWñó¬³Î*y_í=Æüùüõ:šÆªØïÕÞß#COOcUn_¨í¼óÎëÖkBL]ÕvDGœíÝ+në7ÞðÂ ì\0\0\0„Âz>ì(¿G±ÁHŒÉë‰°#ßb¤Da¿0H(\'h$”v´wûùëÅ¨“8ýå/9ûaQá4\\…÷¡MO†Å~¯¾\\ëc0ìˆ‘V4Æïò#;º:‚ÂÈ\0a\0\0 ìv ìè\'1*¥m8¦f*¶€swÃŽX¯\"ž«W¯ÎF»ä‹À±/¦ýŠó1W~ñò‹.º¨ÃP ¦v\Zrt\Z«üÔRÅ‚€ön¿mËßN¬±?yä‘VSKNcÁHì‹é§â|L³õØcÆ*Fµ)2U±ß«3ž@CØÑ6ä(,X³@Ø\0\0;v;ªH¬‘/Ç:!q¾”î†±öDìcÔBL×tá…¶,ÖÝÔÔ”…	ùÅ¿#ÄˆéÀ:\n¶lÙ’…LÄ4]¥ŠþíÝ~Û‹ŽÇãrtZ©X,<¶Çåqqýhtä(ðÁÓ)§œ’Ý~L%Vø8¶nÝš.¸à‚ì1ÆYötô{uæïÑv\n,aGñ°#þž1]\\±£XÀPîHŠbAGœ©«Šm/7ðèî\Z\"\0;\0\0\0a‡°ƒAvDXÅùöBŽž\n;´Þk\ZåGÉ;Zko$GGGGAC© #ht´¿”X¿ç¸ãŽt\0;\0\0\0a‡°aGOvTnûâ¿˜-¨.ìè9¬(7Èèlà‘Z¦NêŸ\0 ì\0\0\0„Â„ÂMØÑ=¥Fxt6À(÷ò‚\0a\0\0 ìv ìvhÂŽ#<ÚN)U¸>Ì2§¦*x\\sÍ5­îÇ\Z\0Â\0\0@Ø!ì@Ø1ÃŽ!%$¯ÖÖß¿°£tàQ¸hyapÑ™EÇK]¯³‹¢ ì\0\0\0„Â„Âa‡°£ÓÚNiAEŒÌ(7è(<\n¯×6H@Ø\0\0;„;`Ø‘\0êêêÒI\'”Î9çœ´qãÆVû&L˜N<ñÄtúé§§‡z(Û·oß¾tíµ×f×‰}ãÇOhu½I“&¥“O>9vÚiéÈöíÙ³\']qÅÙuâºÃ†\rK;wî<æqmÛ¶-\r:4pÂ	éÌ3ÏL«V­Ê¶?ûì³é¬³ÎÊ¶ÇãyðÁ[ÝçÅ_œÎ?ÿül[üçž{nv?W]u•°£Êî*6E\0Â\0\0@Ø!ì@Ø1€ÃŽþçN‹-ÊNÿÝßý]«}±=‚ƒ8ÁEì‹ #Î?üðÃiÞ¼yÙé<\n¯·`Á‚´~ýúìô©§žší‹P%Î¿øâ‹iíÚµÙéK.¹ä˜Çué¥—fû\"äˆŸÂÄö:V¯^vìØ‘m?å”SZÝçÒ¥KÓ®]»²m–äGþwvŽÀ£§ƒ\0„\0\0€°CØ°£\nÂŽC‡e-NÇ¨‹bÓ>Åéã?>;—éÎõ\n[þz…-¹¶Û·nÝš¦L™’Þ(¼ŸÂß£ím>FaGåëîÔS¦®v\0\0\0ÂaÂaG6íS©Ð\">.Óöz1eUG×+ Ú{\\¥ÂŽ˜Ò*¶?úè£EÃŽb·!ì¨ÞÀ£³#3,F ì\0\0\0„Â„ƒ8ìˆµ8òÂ¿øÅC‹ütT…ÓXÅÚ]oÄˆÙéXÃ#¦²ŠÓ]tQÉi¬V®\\Ùj\Z«|€‘¿n{aGL5äè4VùÇ(ì¨ŠÊÔU\0Â\0\0@Ø!ì@Ø1ÈÃŽXo#¦šŠé¡bª¨ŽB‹X |ìØ±Yø-‚Ž¶”»^SSSËbèq½$b1òbÓU]pÁÙBägŸ}v¶NGlŸ1cFv½¶Ž2¶lÙ’…$qñX…7ðˆ°..7uêT4\0a\0\0 ìv ì¬aG\0ƒ©	;º¦£58bûqÇ\'è\0v\0\0\0ÂaÂŽÁ\ZväGf#„•¬ÔSW;\0\0\0a‡°a‡°CvTmà!è\0v\0\0\0ÂaÂa‡&ì¨ÚÀã¼óÎt\0;\0\0\0a‡°a‡°CvT§X£#^J­á1Plß¾=­Zµ*-]º4ë;Zÿ·%K–¤åË—§Í›7{\"‚°\0\0v;v;„x}è(èX±bEÚ½{·çN…µ={ö¤eË–¥M›6y\"‚°\0\0v;PÌv;ðúPJŒètTvà#n\0a\0\0 ìv ìv;ðúPBÒ=g<ŸAØ\0\0;„(f\n;4ÅQ¯^4Ïgv\0\0\0ÂaŠ™Š›šâ¨×‡J=h|ëÝô­9k³§=×<ŸAØ\0\0;„(f\n;4ÅQ¯ýzpøðÓ¾ƒïµœ_þjSKØ§óÛw¿ÝœÞ~ç=Ï=Ïgv\0\0\0ÂaŠ™ÂMqÔëCå¼DÐ1{åÖôyëÒS/ïJË^iLÓæ¯o	;âtllÍÎ45w™?ùZ:ð®ÀÃó„\0\0€°CØb¦°CSõúP!¯{4§)s×µ„µI¿})íØ{ÐóÏó„\0\0€°CØb¦°CSõúP9¯¯m(;ì˜ûoÛ<÷<ŸAØ\0\0;„(f\n;4ÅQ¯•õzSWåÃŒÉ¼”þÃiKÓÛY‹Ó±-¿ÿ‰—\Z<÷<ŸAØ\0\0;„(f\n;4ÅQ¯•ñzÐøÖ»Ùä…ktD¸Ñör±­p\r¸N\\×sÐó„\0\0€°CØb¦°CSõúÐ¯¯Å¦©ŠÑm/ÛŠ]ÖsÐó„\0\0€°CØbf¯[ºt©¢â(^„žÏ ì\0\0\0„Â3«×Š+ÒîÝ»hkjjÊ-¼>t5ì0•°„\0\0€°CØbfÅÛ²eKZ¶lYzóÍ7hÐ±iÓ&Ol¯];þ¼@ySÙ”Çe=… ì\0\0\0„Â3û<ðxúé§³\"š6pš ÃëCO†O®k(:MU±ö¯kv\n&„ ì\0\0\0„Â3¯•vì=Ðœ¾3o]ÙaÇMs_J»ßnN;@Ø\0\0;„(f^*#ìh~ïpšùôælªªÏoOÏ¼Òz\r8½ì•ÆôÔË»²PäWË·¤C‡\'„ ì\0\0\0„Â3¯•vä¦ý^p< Ï‡q:¿ý­ƒï	:„ ì\0\0\0„Â3¯•v´mo½ÛvÄiA„°„\0\0€°CØb&àõ¡ªÂMØÂ\0\0@Ø!ì@1ðúÐgÆŽ›žzê)a‡°„\0\0€°a‡b&àõáòª}ÜÑ\"ôXºt©°CØÂ\0\0@Ø°C1ðúPaG¾7®èHa‡°„\0\0€°CØb&àõ¡*ÂŽÂ‘…¡‡°CØÂ\0\0@Ø!ì@1ðúPUaGáH˜ÞJØ!ì\0a\0\0 ìv ˜	‚×‡Ü„•ßzìéÂ\0\0@Ø!ìv\0ðfÌ˜1iîÜ¹Y=;Œìð~Ž°\0\0v;P¨Š°£mÈ‘×^Ø±zõêtÑE¥O<1tÒIéÂ/L+W®ìÑBþÑ‚ä€\n\'fÏžN?ýôtüñÇ§‹/¾¸Û¿¿°Ãû9Â\0\0@Ø!ì@qÔaG]]]š3gÎ1!G9aÇgœ‘×­[—^|ñÅìô§?ýiaGí„NÈ~§¤C‡	;¼Ÿ#ì\0\0\0„ÂG\0º¢ÔHŽÎ„1š#Þÿ6nÜxÌ¾={ö¤+®¸¢eÔÇ°aÃÒÎ;[ð\'Mš”N>ùätÚi§¥x Û·uî¹çf×¹êª«Jû-Z”Î>ûì,8ˆËÆ‰-[¶\r\nÏoÛ¶-\r:4»Þ™gž™V­ZÕîöö~öC©}q;ùÇ“Lí=^a‡÷s„\0\0€°CØâ@7µvÜ}÷ÝYÁ0‹	&d#<òûbÄHì‹k×®ÍN_rÉ%­\nø,Hë×¯ÏNŸzê©Ù¾òû\"0(Uì?å”S²í[·nÍ¦ÓŠÓçŸ~‡áÁ¥—^šŽ0#~žsÎ9ínoï÷hï1tõñ	;¼Ÿ#ì\0\0\0„ÂG\0ú0ìˆktD G¼F\0ÛÛŽ`ˆÛJ÷cýŠÂëÅôNÑJûc}Ø#\'\"¨˜1cF6\n££ð ûmo¯£íÅ~öCWŸ°Ãû9Â\0\0@Ø!ì@q ÃŽ|Û±cG«  0´èhŠbaDGaGì‹Çöo|#[\'$.kˆôVØQì÷hï1tõñ	;¼Ÿ#ì\0\0\0„ÂG\0ú0ìˆµ-âý/¦izþùç[ôGŒ‘µ8ò‹—_tÑE÷cŠ¨!G§±š7o^Ébÿ\\Ð2íÔ®]»²ÓŸüä\'³}±Hœ)²{ì±¢ÓXÅˆ”!E¦±j»½½ß£½ÇÐÞ¾¶¿S{WØáýa\0\0 ìv 8Ð‹aG¬a…ÿýÓPÅÔMù…½›šš²é­bqîØ!F,ÞQØ‹xGÐÓ?;¶d±?në«_ýjvûqÙXãÙgŸÍö=øàƒÙš±oâÄ‰­n#ÖÐˆ \"®ˆGPÓÞöö~öC{ûÚþNí=^a‡÷s„\0\0€°CØâ@/†Ze4a‡÷s„\0\0€°CØâ€°CØáýa\0\0 ì@Ø¡8 ìÐ„ÞÏv\0\0\0ÂaŠ#\0ÂMØáýa\0\0 ìv 8 ìv®½öÚìý»½6fÌ(a\0\0 ì@Ø!ì\0vhÂŽÊ´|ùòÃŽ¹sçúC	;\0\0\0aÂa€°CvT®qãÆ•:êêê²¿Â\0\0@Ø°CØ ìÐ„«½ÑsæÌñvTê‡Š¾þúëóêëë?\\ºtiö×ú¿-Y²$^SöæÚ(}\0„Â„\0ÂMØÑ§Š­ÝkuÕ!ì¨Ôt¬X±\"íÞ½Ûk\\…µ={ö¤gŸ}öÀ’%K¾æã/\0€°CØ°@Ø¡	;úL±ÑÖê ’ÃŽÑ!è¨èÀã¹×ÝW}ü\0v;v\0;4aGŸ\Z?~¼QTMØSWym«ø×Ý÷}ü\0v;v\0;4aGŸŠâq>ì˜?¾?vxÝ­Ž×]\0„Â„\0ÂMØÑçòkwÕÁ@	;Þ}»1½þÜ¬´aÉY‹Ó±Íë¢°\0\0a‡°a€°CØ1@å×î€v¼³¿!­ÿÝ´ôÒc“[µØû¼6\n;\0\0v;v\0;„ÐwÞ™½ŸÇO¨ö°cÇ†9&èÈ·õÚ(ì\0\0@Ø!ì@ØPÈB¹ÂŽà?øAúÈG>’Î;ï¼ìç­·Þê\"ì¨ê°ãÕg~P2ìˆ}^…\0\0;„;\0\n¬X±\"íÞ½[q«B[SSSHÑqÐ‘8bdÇqÇ\'ðè¢]»v¥Y³f¥›o¾9]}õÕiÄˆ-‹¿G‹óuuuéÆoL?ûÙÏÒÆ…½v¬_|{É°#öy}vtGmmí\'jjjrOéË˜kÏäÚŽÂçy®5æÚªÜe~‘»ìØÜé¿T\0\0„Â„\0mË–-iÙ²eéÍ7ßTàªÐ cÓ¦M:j™AGGÛ)mÑ¢Eiüøñ©MÁ³ÃV[[›…÷ßE-/ìÐ„Çºì²Ë>WSS³ ÷Ü=ÔÉçúû~äZÝÐ¡C?ª4\0\0;„;\0*6ðxúé§³âŽV9MÐÑ¾ÁÑ^ ‘ßo\röÅÂîcÆŒétÈQ¬\Z5*í!ìè~Ø±aÉ%ÃŽØ\'vtò3þßäÚs=ñ<ÏµWc´‡ò\0\0 ìv ì\0\0z(èè(È0Â£}ñwi[È9rdš>}zš7o^Ú°aCjllL‡Ê.äÈ‘lÚ»áæÏŸŸ]nôèÑÇÜÆ¸qã²UØÑõ°cóÊŸ–;bŸ@BØQ®ÚÚÚéGGfôèó<×žÈÝÎ§”	\0\0a‡°a\0Ðù\0£Ü½ü`°ÿþl=ŽÂÂeLE5{öì¬ÈÙÍÍÍiáÂ…iâÄ‰ÇCüqaGÃŽ}\rëÒú§n;v\n«Ü¶Ø\'vtdøðá;ºG¯=Ïkjjöç~U*\0\0„Â„\0@‚ŽÎŽÔx´:®¼òÊVËiÓ¦eßìîŽ>ø 7âã…ëyüæ7¿vt!ìˆ¶õù‡Ž	;b›0BØQfÐ±¢/žç¹öN®}M¹\0\0v;v\0\0½tôÔõŠ¶#:b\Z›(`ö”†††4yòäV÷1wî\\aGgÃŽÃ‡Óæ?Ì<v\n«Ü¶Ø\'vtð™þ™>~žª©©ù’’\0 ìv ì\0\0ÚÑÑbäÅíÔÞ1[9·3µ]££¾¾¾Wî\'æþyþGx¬Y³FØQfØñÎþ†´iå}%×ìˆ}q¡„°£˜£ktôùó<FxäîûLe\0@Ø!ì@Ø\0´Pt4U9aG¬#<–/_~ÌˆŽÞ‹ßu×]-÷7bÄˆ´k×.aG{aÇáÃ©qóÓéå\'¿[2èÈ·¸L\\Ö(aG›ÏòS¸y_?Ïs­±¶¶öJ\0€°CØ°\0(L”³ÖF¹aGgow =zt«¹û{rJ›R<˜Æ×r¿S§Nv”;:\ZÍa”‡°£555kúûyž{÷*\0\0ÂaÂ\0 M QîŒÎ„ƒ-ðX´hQK!²®®®Û‹wÆ/¼Ðj:«7\n;Š„åŒæho”‡€BØqÙe—}®žçG,ÿKå\0@Ø!ì D‘#úý`úv\'\0¤ £+aGþ`0Liuíµ×¶\"gÏžÝç÷Ï=÷´ÜÿÍ7ß,ì(vt5èÈ7…°#÷üz´Ržç¹öCå\0@Ø!ì ŸŠ)çwÞ ^°\0*EWˆ®„]\rVªI¬“‘/@Ž92íÞ½»ÏÃ–-[Z­²wï^a‡@AØÑƒbŒÜsëP¥<Ïkjjö×ÕÕý…\0 ìvÐOß\ZâÊqÇ\'ð\0€~:º2Ú²«aGá1Aµò;vlzê©§Ú½Ì¬Y³Z\nÓ§Oï·Ç:qâÄ–Ç1gÎa‡@AØÑƒjjj.¯´çymmíW”\0\0aÇ \n;öïßŸæÏŸŸ¾ÿýïgÈM˜0!û&Nþ\0ñšk®IS¦LIÿ÷Ÿ}(|ýõ×UAz)è,ßî€JoîjàÐ°#ÿÕö¥‡ü1c„K—.-z™˜6*¹yóæõÛc}ä‘Gút¡òþ;jkkçÚß\n;„}Ý¯bÚ¨J{ž[¨\0v’°ã÷¿ÿ}öA~Ô¨QYÈ±páÂ´nÝºl¸ñ|Ðr¹}ûöe‹8>ùä“Ù¨£GÎ>þÓ?ýSvN÷¾5Zª˜Ño•\0]:º4t7ì(ç¡RÃŽ|7nÜ1#=®¾úê–ý}µ8x1õõõ­Â™v|£}qMMÍg…ÂŽ¾êW¹ýÏTÚó<¯\0 ìècå~«\'ÂŽ˜Ç4><Ç¼øÆM„qäÈ‘´råÊ, ¹þúëÓ‚TGºXÄè(È0Â\0ª\'èè©°£ÚŽÚ†…aB>ô1bDËöÆÆÆ~{¬Û·ooyñ˜rØQÐž(ö9CØ!ìèé~•Û¶£Òžç¹Ö¨º\0;úéà±£o`u÷ƒóoûÛì›u¿þõ¯Ssss·$Ÿ{î¹ìÛ{1ÍUL‡EùÅ‹rGlTëüÝ\0P-ÊIQbôt«öc€RaGáHÂó‡ê·Ç\Z_Ú)|,ƒ$ìhùœQXœv;zº_Uêó\\u\0vôÿÁã%Fztù ïÇ?þq6ã…^èÑƒÉƒ¦3f¤«®º*mÛ¶MÅ¤¾¥)ð\0€ÞñÆodéóÎ;¯œ¢uŸ†!WGaBµµJ\ngSØQø9#¾\\%ìvôt¿ªÔç¹ê\n\0 ì¨ƒÇ\"Ó[u9è¸á†²õ8zK,^ëyÄºô\\ÐÑS×\0Š+gzÉ!Fv”UT,lcÆŒIsçÎÍŠ¶ƒudG%‡NÂŽÊoÕj\ZÙ\0 ìèðX]	;bêªÞ:ò-Z”®¸â\n#<JQºTTÛ‚¥\0P-¬ÙÑsýÂ#Ïšñ¹â¹Üç‰/\r:ô£q¹Þ;î¾ûîô™Ï|&pÂ	éãÿxö7Žõc_þyQ\r!C¥<Ö*ÙÑÒ¯¬Ù\0Ðõâÿ lýà.bŽµk×öÙÁåÃ?œ®»îºVp=÷­L#<\0 wî¼g÷DØQm_nÈ§ÖÕÕe#}‹Æñhþr7nì·ÇZ__ßjõAv´\n9òz:ìˆimã÷ýüç?Ÿ}«?¾çÏ9çaÇÀ;ŽéW¹mÏTÚó<fJP]\0¨œp§íAd§ôn¹å–l1ò¾6qâÄtï½÷*š´)š|øá‡ÙëøÙm¯g\r\0èÝ÷î®\rÝ\r;zè¡tÜqÇUÕ—\ZŠähë¦›nj9¾7o^¿=Ö¸ïüãˆÇ4ÀÃŽUµµµ_irôVØqî¹çf¿ï‚:öíÛ—®½öÚtÒI\'¥O<1?>8p Û!ÉÙgŸ‰ý_|qËè={öd£Èã:±oØ°aiçÎÇÜW{·Ÿq»çŸ~¶-\nóñøãò±aácmï>‹ÝÖ ;Jö«Ü¾û*íyIµ\0 ÿÃŽ¢ßÀêÌçßÿþ÷Y¼¹¹¹Ï0\Z\ZÒÈ‘#Ó®]»KŽ+\"¨8ãŒ3²Dñ³ÜÀ£Ôõ\0Ð;º3²¢;aGþ½}êÔ©îoúË_þ²å8wúôéýö8&OžÜò8~ó›ßÔ°£Ôçˆ^\r;\"œˆß7*´vD§cDx¦ãt±ï”SNÉÎoÝº5­^½:;bôPœñÅ³‘ëqú’K.9æ¾Ú»ýüãXºtiöY%¶åþV-AM~DJþ±¶wŸÅnk\0‡ö«ÚÚÚQ•ö<Ïµ¯©6\0\0ô_ØÑî7°:óÁ9>¨ÏŸ?¿ß2ï¹çžA;ÕR±o…FðTX\0)\'ð(:òíšk®é‘bÌÿßÞýÇX]Þ‰w1ÖkÜÄÖØ¤k6»ÙÓ³üa¼	Á4æ&ñ&½mo—2€€€ øT„Š?©ìX]mwµ 4-†²e\"•KÅ^pYXŠ¢T)™\n(0à:ÂŠÍsçó½žñÌáœ™3?Ï™9¯Wò„33gæÇùž™ó}Ÿçy\0€žý.ÈØ1œCGˆWæçþÞÄœ<yrÐïCÁ:þƒò¢œJÄŽrõwì8÷Üs³ÿÞ˜UÑ]ìˆYq9–»Š—ã}ñ±Q£FeoG<¹îºë²å±bvEþçåÜçå®¾~îóâý]]¿ð¾»Íb_k¸ÆŽr´ÛÙ~lª¢ãüTûsë¿p¶\0`ðcGY¯À*÷‰skkk\Z?~|öd£RbvGû—5·wG©\0Q,\\t<Ê½¾=<\0`à~§÷tI©ÞÄŽZyñBþ¾•xAÎâÅ‹;n?–\\µ;boŽsÊ\\Æ*–ƒ*Œ^xaö±x;îÛí·ßž.½ôÒŽ¿£DW÷¥«¯N‘ý8Ê‰ÅnóœÞÛc¨ÅŽ/ž×¾R-ÇyûXêL\0@u+ë¼øÃòþûï¯ø“Ú[o½5­[·nÈ=Y½¹ßÝmF^nÀèi±¤\0\\ðèÉïØžÆŽZúž¿”Õ-·Ü’<,¹%Vs·¿uëV±£ŸcÇ3Ï<“ý÷^ýõÙÿÛ^x!{ûoÿöoÏ\n¹¥¡ò—™ŠŸ‰øØÕW_½ÿböM\\þÚ×¾–}¬®®.{{É’%Ù²RqyôèÑgÝ—®¾~±@ËRåBMîú¹ëtu›bÇÙò—²ªôqÞþÿîïœ>\0\0±ãÑGMkÖ¬©ø“ÚE‹\rÉW)æþ@ŽèkðöçÉŠîBFOCGþíµ\rM`(èÉ,ÊžÄŽž†”¡.NÞN˜0¡ãï¬_|qÐn{Á‚·{7–ZŠ1\"ÄFßù›‹G´(¶Ayü³&bÄIñÜ^Hßþö·³Ï¯ûu¼úê«ÙÇš››³‘Ûx<\"E\\¿Øå¥¾~±@Ë¬ÅÌ”¸½ü¥g»»M±ãl±RAûqöûJçcÆŒùµS\0\0Ã$vÄ¬Ž]»vUüIml*KÕØ‘Ó¦Mër¦GO—’*4Îœ9Ó«ÐQxÒDð\0€ÊrcGo–È\ZògwÄ+°÷ïß?à·¹víÚN×Åß§bÇÀÄCìù³;*tœŸ3fÌN\0\0“Ø¯^jii©øÚx%TLýê±#¦GaôèížÅ‚ÇW¾ò•^‡Ž¾Þ\0 ï¿cË‰µþ»zúôé[Ýyç©­­mÀnkË–-–µyê©§õ¿Uì0j1v„öãmM¥Žóö1Ãi\0€a;â½Ï?ÿ¼jÂÁp‰ù3=by«¾Î¤(<ú:\nO¢ØÃ\0úW_—žªµ¥«Š‰%€ÆŽÛñwÕÂ…ÓgŸ}6 \'@cù¡ÁÞ”\\ì0ÄŽsÎùÞ÷¾÷Õöãîè`ç6%\0†±£šCwá`¨Žï|ç;ÙØ‘#GöéûKWÎèˆ·ãý}÷+¾Ö`L€Z=}±ƒ#|)^4’ÿwU¬µû,ô—XÒ&ÿ•ÞñB•ÖÖV±Cì;Ñ˜1cþ{ûh¬ã¼}¼ü½ï}ïÏ2\0\0f±ÃÌŽ	4\'NL\r\r\rÙ“þxu¦™\0_:xð`¶‘mœ<FåÇúõëÓ¦M›Ò¾}ûü€–ø][nð°ÌäÙV¬XÑéï¬xuö¶mÛúô5:”|ðÁ³fäV\"tˆF­ÇŽ0vìØÿÕ~ž\Zèã\\è\0\0Æ±£Zöì8zôè°Ø³£0rôÇÉ{v\0t›7oÎ~w9ÁU]#~—766¦½{÷úAíåïÜeË–e×›7ožoZÕ«WwZÒ*F}}}Ú³gOC/^\\ø*ïléªJ…±Ã;þ¿¿ÿû¿ÿíÇãÇuœÇÒUB\0À0Ž÷Ýw_zçw*þvûöíiòäÉC6vÄ+âU‡Å\"G±“åÎ¤(:âíXºªØûË\r}ÝC RbF‡ÐQÝÁ#fÜPúwo©¿âý#FŒ:º°sçÎìÅ1…/6¹í¶Û²¿Ã\"„Æ²œ¹õþãß8é¯_¹reš;wnÑ¹ƒ½¹Øaˆ¥;öòöãò½~>ÎÏØŒ\0 bÇ£>š­aZi‹-JóçÏrOº»šÉÑ×Ww–\n¹ ÑÝÇ»zÕhœL:€¡(N¤;±Uý\'ÝèÙß\0f[–/f_Ä÷©p–GoÆŒ3²ÜT±Ã;¾³/ÚñúÂY½cÆŒùuû¸Âé\0€\Zˆñê—…Vü	^,P\rÑe°_ÝYê¤F¹!£§Á#w2Å«F¡ÊI7±c¸¡£wšššŠ­Å_Öˆ¿;c–X5;±ãlãÆûËöcö‡ù›——9bï¥uuuç´\0\0@\rÅŽÃ‡g³ÚÚÚ*öä®¹¹9{u^%ïC5½º³§£Üë@­ÅŽ#~’î\\ñf6â²bbGµý\r0räH¡£âïÇØÏ#fÇã…Ë\\ÅÛS§NM÷ÜsOZºtiö·o5;±£´I“&ý·/öóx<6/²ÌÕ‘öç“ÿÖþïScÆŒù~ûå¿p:\0\0 cG¸÷Þ{³\rE+å™gžI³gÏ®É\'è¹õ¹óOrÄòsz¸4U±àqÓM7uº\'S€á;NŸþ¯tüä§ooúCsGìˆË¹÷·|Ô–>úøS\'ÈÄŽŠºùæ›cy•´`ÁßÄCì\0\0€þˆñj¸»ï¾;}þùçy5Þ¸qã²¥jUá†¥ùá¢\'›Ž—ú¼žnŠ0cG„Žå[ÞM?X¹+­ûýáÔ¸ûHºÕÛ±#.Çû_Úù~š×~\'ûŸéÄ\'‚‡ØQ9“&MÊ^‘b‡!v\0\0@?ÅŽ0sæÌ´yóæAbW__Ÿ-+Pë\n—´ŠP33Ê\rùÁ#ÿó\nC\nÀpÇN´¥¹\r»:âFwãî}+½wì¤“dbGEüüç?ïX~¥–_ðØaˆ\0\0Ðï±#6uŽ[[[íIÝÎ;Óøñãõ6‡Rðè«bKd×Øcí›‡ÊŽ\rÿqÀ	2±£\"r³Zs±Ã^Zˆ†Ø\0\0ý;B<ÙþÉO~2(ËYÅæñD?–Ð¢ÿƒG‡€¡;béª\\Ì˜óü[éWÿ¾?55”¸ïË}üå·9A&vTÄc=Öií±cÇ¦cÇŽùÆˆb‡!v\0\0@ÅŽøC96Ç^¶lÙ€>™kiiI7Þxczâ‰\'<³-¢¯KOYº\n¨µØqäÃO²\rÈó÷èˆ¸Qx½x_þñ9ñ¹N”‰ƒ%¢FÄüØãÇ?þ±oŽØQµ\'«7lØà±­ºÇ©öÇÝ3žþ\0 vˆ7ÜpCZµjÕ€<‘‹¯¡ÃŒƒò‚EO¿O6#j1v[¦*fs^/ÞWìºN”‰ƒ%fÑ†ŽuuuÙòVˆÕhÓ¦MGâÅJßªs:tè_Ûwÿàé/\0\0bG±Qf¥K—öë“¸Ø£#–®2££gá¢Üàaé*@ì;ÄŽêµk×®¢¡#7\Z\Z\Z|“ÄŽª´qãÆo566~ôÁ|ê1®ºftDèX¿~ýöñ¿=ý\0@ì(!f`Ü|óÍiæÌ™éÀ}úZñJÅúúúl3r{tLðˆ¥Çâz69j1vXÆJì\n¦M›Öeìˆ¥D;ªÕúõëÿgû±ý»X.)Žq£*Fü¿øƒÐ\0€ØQ¦XC:fcD¬øãÿØ£ÏmnnNK–,É>ÿî»ïN­­­žÉöBw{pÄûGŒ!t\05;¾Ü ¼¹ì\rÊãºÂ„Ø1XbÖì¤I“²¿‰b”\n›6mòÍ;\0\0\0ˆØ\"R<üðÃÙzÒ1Ûã\'?ùIzõÕWÓÁƒ;]ïøñãiûöíiÑ¢EiÖ¬YÙœ³gÏÎžàÓ7¥fxXº\n;¾¿Ýu¨è2UÅÆov¾/LˆËzÎ™3\'íÙ³\'ëÖ­ËþEì\0\0\0`€bG¾\r6dá#–b(|ebÄxÕâüùóÓÚµkm´9ÀÁCè\0ÄŽ/Ç±mé+w•;îix+µ|Ô&Nˆ³páB¿Ã;\0\0\0*;¨Žà1räH¡;òFÛ§§Óâû²¥ª~½ã`zewç=<ârãî#iÝïgQä›šÒ©Ó§Å	±£bâwx;\0\0\0ÄŽš{tÄLšR{x\0ÔbìÈæÖ/7\rÈs±#.çÞÿáÉO…±£âæÎ›-eb\0\0€ØQ³\"v\0ˆ]#~Ò;â²!vT“Ø×,ö9±\0\0@ì;\0†‰cÇŽõ{ì0ÄŽjvë­·¦¥K—úF v\0\0\0ˆbÀp1~üø4þün£‡Ø!vÓ§OO\r\r\r¾ˆ\0\0\0b‡Ø0\\Œ7.{l‹ñÈ#¤ÖÖV±CìÖ¦L™’~ó›ßøF v\0\0\0ˆbÀp1vìØŽØ‘Ï>ûlvò\\ì;†£I“&¥W^yÅ7±\0\0@ì;\0Êñ§?ýiH<®±¼ÕªU«Ä±cØ™0aBÚ¾}»ob\0\0€Ø!v\0”:ŠE„ºººlÄòQâÄë\r7Ü&Nœ˜&Ožœ-±3uêÔtÓM7¥3f¤™3g¦Ûn»-ÝqÇiöìÙiÎœ9iîÜ¹éÞ{ïM<ð@zè¡‡ÒøÃôÿðéñÇOO>ùdú§ú§´hÑ¢´dÉ’ô‹_ü\"-[¶,­X±\"­\\¹2½øâ‹Ù>ëÖ­Ë^Ý^*väFÜ·ø\\±Cì.âØÛ½{·ob\0\0€Ø!v\0”û˜{`|üñÇéøñã©¹¹98p íÛ·/;ÙºsçÎìæ[¶lIY€ˆA\"ÂDD†,\"\\DÀˆA#ÂFŽ<\"|D\0‰A$ÂH’%L\"œD@™6mZT\"¬Är>ÝÅŽÜ2Wb‡Ø1\\ÄÏôûï¿ïØ\0\0 vˆ\0å>f;v¬êïc±qË-·¤µk×v\\Oì¨þÑ]¸ªäˆÀ£pVS·o¼±c6SüÜÝzë­iÖ¬Yé®»îÊâÝ}÷Ý—|ðÁôÈ#¤G}4‹}O=õTZ¼xqÿå_þ%544¤Õ«W§—_~9›±´uëÖôúë¯gQ±©©)‹ÛÚÚ²ûqâÄ	Pˆ\0\0\0b‡ØPŽ8©\Z39ªUÌ:)<)=oÞ¼¢û”;âóFÎ?ÿütÁ¤Q£Fe³Vâc_œP,úy]}l8ŽåË—§K.¹${î¹éšk®éòº=ùÞTëÌŽS§Ne¡áðáÃYxˆ\0!\"‚D„‰*b6S|o–.]šž}öÙôôÓOga#G„Ž>\"€D‰ÙK1séæ›oNÓ§OÏ‚I„“(R\"¨DX‰À’›¡”ûw(ì§ƒØ\0\0 v v\0U¡Ú÷Ø³gOÇ	àˆq2º”rbÇe—]–8ÜµkWzã7²Ë—^ziM®Æyç—}/bvA„€á;ªÐØ\0\0 vˆbÐñêò;vTíý‹Y\'?üpYKm•;b6GüŒˆRê¤},S3?bfCìGRxB?w9^_ïÊ+¯,úõb&ÀW\\‘…ƒ¸^ÌˆYÅAþÛñßüo|#û¼Ë/¿<›]ÐÕû=šmÒž›­òÝï~7[©»ûPêcñur÷§ð¿¹Øý;@ì\0\0\0;;€Šš8qbzíµ×†ÅK9±ã±ÇËN^xá…YÔˆ…\'ð#D¼ˆË_|qÉ“û/¼ðBvÝ¸|íµ×žu[]tQö±wß}7[>+._uÕUÝÆƒë®».»1#þ˜ÒÕû#ºÄÛ1SåÍ7ßÌ.ó›ßìö>ôöþ‰ v\0\0\0ˆˆ@U™<yrZ·n]ÍÄŽ±GG‚ñ;1H©ú±gE©“û±¼SŒ¸³!\no\'ö‰ÅÌ‰?ýéO³YÝÅƒÜÌŠÂ¯×ÝûóGîþtuz{ÿÄ;\0\0\0ÄÄ ªÄ†É1;¡–bGn¼÷Þ{Â@¹\'ô‹ÅŽXªðëÇÇâ>Ý~ûíÙ¾ q½Ø3d bG±½5ºº½½bˆ\0\0\0bbPU¦OŸž\Z\Z\Zj&vÄ^ñ{0–mŠ½JÊ=Á_ìrìç±fÍšìòõ×_Öm]}õÕËNÅÆêqùk_ûZö±X+Þ~ûí·ÓK/½Tt«˜rN‘e¬\nß_WW—½½dÉ’ŽM×GÝí}èêc…ß‹®î¯Øb\0\0€ØØTÔÌ™3³“öµ;bO‹1\"–¨Š¥œr}÷4vÌ˜1#û\Z±ÏEì{Qx[±¡ø·¿ýílÖG,×{õÕW³=÷ÜsÙžñ±Y³fuúúñµ\"DÄçÄâfºzsssÇféñßûuÄmwwºúXá÷¢«û+v€Ø\0\0 v v\0Kýìg?«™ØÑ£\'\'÷\r±Ä\0\0\0±±`wÝuWzúé§ÅŽŒ˜=QlCrCì\0±\0\0@ì@ì\0*`îÜ¹éÉ\'Ÿ;±Ä\0\0\0±±šî»ï¾T__/vbˆ\0\0\0bbG%<x0Û`xÃ†\rÙ‰4cèõë×§M›6¥}ûö9¨ØÃ?œ,X vbˆ\0\0\0bbG%CÇæÍ›SKK‹‰Ãl=z4566¦½{÷:°PÌêˆÙb‡!v€Ø\0\0 v vTHÌè:†wðˆ;œ\'žx\"Í›7Oì0Ä;\0\0\0ÄÄŽJ‰áN :9Jï=ýôÓé®»î;Ç3ˆ\0\0\0bb‡“›†“£CÓ’%KÒwÜáñÀp<ƒØ\0\0 v vTûÉÍO>:’þø»¥éõ²—ã}N>:9Zë–-[–fÎœ)vŽg;\0\0\0ÄÄŽj>¹ùqë¡ôöÿ½?½õÒœN#ÞsÒÉÑZÖÐÐ¦OŸ.vŽg;\0\0\0ÄÄŽj>¹ùÞ;ÿç¬Ð‘ï¿³Æ	H\'GkÚêÕ«ÓÔ©SÅÃñb\0\0€ØØQÍ\'7ÿðÊJÆŽø˜NŽÖ²uëÖ¥É“\'‹†ãÄ\0\0\0±±£šOn¾ýo•Œñ1\' ­e¯½öZºá†ÄÃñb\0\0€ØØ!vNŽM;vìH&L;Ç3ˆ\0\0\0bbG5ŸÜ|gý‚’±#>æ¤“£µl÷îÝiÜ¸qÃâ¿eÃ†\rŽÇ3ˆ\0\0\0bbÇðŒû¶<]2vÄÇœ€tr´–8p ;vXü·lÞ¼9µ´´8nªt477gA\n;\0\0\0ÄÄŽ^ÄŽã‡v¥·×=xöVíï‹9	)vÔ²ˆÃ%v455¥ÆÆÆôÁ8vª4tìÝ»×Ab\0\0€ØØÑ›ØãÝËÎŠñ>\'!ÅŽZ×ÖÖ6¬7\"xlÜ¸1û¹1ªg v\0\0\0ˆˆ}§O§}ÿ¾øì%¬ÚßÄŽZ¶`Á‚4fÌ˜ôÃþÐ7@ì\0\0\0;;ª1v|Üz(íÝòTÉ=;âcqQAì¨E?úÑÒŸýÙŸ¥‘#Gfÿ>ðÀ¾)\0b\0\0€ØØQ5±ãôétdßÆôûßÞ[2täF\\\'®k–‡ØQ‹¡#8bfÇˆ#\0±\0\0@ì@ì¨†ØÑÝl³<Ä¡ãGEgr”z?\0b\0\0€ØØ1È±£œÙ]ÍòÄŽá,fpt4r·‡€Ø\0\0 v vT0vô6tä†À v÷ÐÑ]È0Ã@ì\0\0\0;;*;±ƒÒ£Ü=½>\0b\0\0€ØØ!vbÇ€‡ŽžÎÔ<\0Ä\0\0\0±±Cì0ÄŽ!:úëó;\0\0\0ÄÄ±Cì;z­»ÍÈûë\0 v\0\0\0ˆˆb‡ØAE-Ae†€Ø\0\0 v vˆ†Ø1h\n÷ÚøÓŸþ”¦NšýÛ…Ÿg\0±\0\0@ì@ì;±cÐBGnF„ŠË.»,;Yÿ–<J}žà v\0\0\0ˆˆb‡!vZè13ã‹eeüÐ‘7ÝtSÇÇíá v\0\0\0ˆˆeˆ“Üb‡!v”¯T€(.º\nå^ß\0b\0\0€ØØÑÉ“\'§ÿøÇ©­­Mì;jæøYëÖ­ëuè(µ´T¹£§aÄ’V\0b\0\0€ØØÑ…qãÆeÿ-uuué©§ž*=Ä±c¸¿1\"zlØ°¡¬Ï)78t2z\Z:òoÄˆfx\0ˆ\0\0\0bbG¡ˆ¹¿1\"~¬X±Bì;j\"väÆ´iÓºœéÑÓ¥¤J3gÎô*täØÃ@ì\0\0\0;;Ê8é›\'NL«V­;ÄŽšˆù3=\n£Go÷Ì(<¾ò•¯ô:tôõþ\0 v\0\0\0ˆty²tìØ±ÿÆˆÙ1CbüøñiÂ„	Ùˆx0iÒ¤lŒo¼1;©\Z¯&Ÿ>}zš1cFš9sfºõÖ[Óí·ßžfÏžîºë®t÷Ýw§¹sç¦{ï½7Ýwß}é¡‡J?üpzä‘GR}}}züñÇÓO<‘þùŸÿ9=ýôÓé™gžIK–,IK—.MË–-K¿úÕ¯RCCC-V¯^Ö®]›È}å•WÒk¯½–¶nÝZò¤onÜpÃ\rÙL±Cì¨…Ø‘?Ó#–·êëLŠbÁ£/¡£0xØÃ@ì\0\0\0;è³8A{\\´¶¶¦cÇŽ¥÷ß?8p íÛ·/íÞ½;½õÖ[iÇŽiÛ¶mióæÍYdˆØðòË/gñ!\"DÄˆˆ	\'\"Rüìg?K‹/ÎâEDŒ\'Ÿ|2‹\Z7\"r,X° ‹?\"‚Ì›7/‹\"GfÍš•î¸ãŽ,šD<¹ùæ›³˜\'n#®L™2%‹-]\"bÄèî¤onˆÃ”û³P+ã;ßùNvâkäÈ‘}zœˆ¥«\ngtÄÛñþ¾ˆû_kÿþýŒÄ\0\0\0±ƒÚVêDo„‘˜	’#v˜ÙQ?÷1+d|?BnfGogP˜Ù v\0\0\0ˆ0ÀbVJáÉÞXR«ØFÍƒ;¶oßžFÎ?ÿütÁ¤Q£F¥-[¶dË .öy]}¬Ò£šï›ØQ:röì\0;\0\0\0Ä¨B{öìé8Ùû„ÄÛ¥FìÈÞµkWzã7²Ë—^zé‹bÇÐ‰±¤[,#W,råÎ¤(:âíXºªØûË\r}ÝC\0±\0\0@ì`ØijjÊöùè*rfìˆÙqÜÄý)\rn¹å–læÇ%—\\’ísRr—ã$v|½+¯¼ò¬¯·Çubùx;ö.‰·—/_žŽ?žísŸ·3]Nœ8Q4\\ä¿{µ|ãßHçw^ºüòË³Íß»»ßGÍn;7“å»ßýn¶ïKþç]sÍ5éª«®;úYW39ºÝ…†R¡#4ºûx)ñs3bÄ¡@ì\0\0\0; ·#v<öØcÙ‰†/¼0‹1Ã£0,ÄÆî/âòÅ_\\2v¼ðÂÙuãòµ×^Ûév>œ½ÿ¯þê¯²·ÿú¯ÿ:{û½÷ÞËBG\\Ž ²råÊìrîbÇu×]—]ŽÈÿFdéî~G‰·cË›o¾™]þæ7¿Ùéó6lØÝ_±£:t7³¢ÜÑÓà‘-óæÍ«šïÅÁƒ³Ÿ÷øŸ£òcýúõiÓ¦Miß¾}V;\0\0\0Ä¨Tìˆ{tDˆàÇPR¡áÜsÏ-;N:•¸3\'\noçŠ+®È>öÊ+¯dÿ~ýë_ÏÞ×-õù]ÅŽÜçu·ŒUþýÎ}Nþ(¼­¸–±ª.¥fxô4`”{ýj\r›7oN---Cni¹á>bÆXcccÚ»w¯ƒÄ\0\0\0±*;r#fY”\Zº‹±DTá×™#ñ±o}ë[Ù¿1£#)­üÏðÒŸ±£ðsŠs*°×‡ØÑ³…KJM:µÇKS7ÝtSÙ3I*%ftÕ<bÆ\r v\0\0\0ˆPØ{]Äq³}ûö´cÇŽŽÆ½‰±¿Áš5k²Ë×_ýY·•[¢*öØˆŸþùNKKå/ca$>ËOÅÛo¿ývzé¥—Š.c3SÎ)²ŒU±û]WW—]^²dIÇ†ì£G;†PðÈß´<?\\ôdÓñRŸ×ÓMÑSœHª{8žAì\0\0\0; B±#ö­ˆ“ý1ã!–z\Z5jÔY}—;bŸø\Z±¹÷»ï¾{ÖmÅ¦ãññs¾XV*^	ï\rÊãúqbDèÈmPþÜsÏ¥‹.º(›ý»çßnÜÆÕW_Å“X\"+‚Mw÷»¹¹¹c#õ¸­Ø¯#6:;†ŽÂ%­\"TÄÌŒrCG~ðÈÿ¼ÂR‹†ãÄ\0\0\0±jöäf%\"“£‚G.5Ul‰¬¡üxpäÃOÒ+ÞÌF\\v¬9žAì\0\0\0;@ìèfäfd8ÙéäèPýN*ñxpúô¥ã\'?íx{Óš;bG\\Î½¿å£¶ôÑÇŸ:öÏ v\0\0\0ˆ vNŽV‹¾.=UíKW•óx¡cù–wÓVîJë~85î>’î_õvGìˆËñþ—v¾Ÿæµ_çÉßþg:ñ‰àáx±\0\0@ì\0±Ãpr´ê‚GOgfTófä=y<8v¢-ÍmØÕ7ºwÿë[é½c\'Žg;\0\0\0Ä;\'G«IO—¢\Z*KW•ûx°öÍCeÇŽ†ÿ8àØs<÷«Ã‡§¥K—¦ùóç§)S¦¤ºººôýï¿cÄÛ“&MJ³gÏN‹-J{öìñ …Ø\0\0 v vNŽÒ—€±lÙ²ìzóæÍ6±tU.fÌyþ­ô«ßŸšš?ÊF\\Ž÷å>þò[‡{Žç~±zõê4cÆŒNa£œ1vìØ,~<ûì³Ù÷\r±ÃÓ\0\0\0±±Ãpr”<ÝíÁï1bÄ¥Ž|øI¶yþ7\n¯ïËßÃ#>\'>×1èxîM›6¥‰\'ö8rãÇÏf{ v\0\0\0 v vNŽRÆ¡¸tUwÅ–©ŠÙ…×‹÷»®cÐñÜSqü‹qãÆ¥úúú´råÊôÎ;ï¤#GŽ¤S§Ne×ÿì³ÏRKKKÚ»woZµjUv½	&œõ5¦M›–ššš<€‰\0\0\0ˆˆ†“£”\nC=tˆŽçJkmmÍöãÈ±ÕòåË³˜ÑmmméÅ_L³fÍ:+z¬]»Ö˜Ø\0\0€ØØa89Jað9rä¥,cåx¬Ð1yòäNQâþûïÏfpôÅçŸžÅ˜’¿ŸÇ/ùK`b\0\0\0bb‡áä(9±GGœ@-µ‡Çpy<hÜÝ\\öåq]Çžã¹\'\ngtÄrU*úË¡C‡Òœ9s:ÝFCCƒ0±\0\0@ì\0±Ãpr”œ8q:Ü~»ëPÑeªŠßì|ß±çx.[áÛ¶mÛ‰=>b?ü;wîô\0&v\0\0\0ˆ vNŽR±ãØ‰¶ôƒ•»ÊŽ÷4¼•Z>jsü9ž»µiÓ¦³ft¤ØÌ|áÂ…·WWW—>ìALì\0\0\0;@ì0œe¸ÇŽ¶OO§Å÷eKUýzÇÁôÊîÎ{xÄåÆÝGÒºßÎ¢È/65¥S§O;þÏÝš0aB§=:úséªRNž<™¦M›Öq»óæÍó &v\0\0\0ˆ vNŽRËXEðhnýrÃñØ€<;ârîýžüTèp<—eõêÕÁaÒ¤I}ÞŒ¼\'^ýõNËYíÙ³Ç™Ø\0\0 v€Øa89*vÔÚãÁ‘?éˆqÙ±æxî©éÓ§w‡åË—úíÿã?þcÇíÏŸ?ß™Ø\0\0 v€Øa89*vx<0Ïå‹}2r¡aÜ¸q©¥¥eÐïCSSS§ýBŽ;æÁLì\0\0\0;ÀÉMÃÉQ±Ããáx.ÏÒ¥K;\"C}}}ÅîÇ¬Y³:îÇŠ+<˜‰\0\0\0b8¹i89*vT«©S§¦uëÖy<p<WÍÏ[,•‹+W®¬Ø}}þùçmT.v\0\0\0ˆ vNŽ2bGîdnœ„Þ°aƒÇÇsÅÞ¦L™Òq½Jn¾mÛ¶N÷±\0\0@ì\0±ÃprTì¨ò“Ï¹1mÚ´¢¯¼÷xàx¬Ÿ·ºººŽ9r¤b÷õàÁƒ÷#îb\0\0€Øb‡áä¨Ø1DN>ç¿’=ÿ$´ÇÇó`ý¼å¿ÿÔ©S»¯Ÿ}öY§û‚Ø\0\0 v€Øa89*v±“Ïù¯¼å†<8žëç­šƒØ!v\0\0\0ˆ0Ä	N\'e`Oî•!vTÿ.?kfv v\0\0\0ˆÐ¯6oÞœZZZœD¦£¹¹¹Ë\r©©í3qâÄÔÐÐý¬„JÇŽíÛ·§Ñ£G§óÏ??]pÁiÔ¨QiË–-ÙÇ¾8YYôóºúX©±|ùòtÉ%—¤sÏ=7]sÍ5%¯—ÿµ{s;fvÿy³gb\0\0€Øýª©©)566¦>ø@¦¡cïÞ½~ÐÅŽ.#GN¥cÇe—]–”ÜµkWzã7²Ë—^zé€„†óÎ;/ûz\'NœÈf”ó9bGÿý¼M™2¥ãã{öì©Ø}Ý¶m[§=E;\0\0\0ÄâÁcãÆÙI4cø¡ƒÂ“Ï“&MJ+V¬8+rTKìˆÙñ;6N~—\n\r·ÜrK6ó#fe,[¶¬äì‹øo¯wå•Wžõõâós×Ë}Þ«¯¾š¾þõ¯g$¾ösÏ=gfÇ\0þ¼ÝsÏ=×[¹reÅîkÜvî~Ä}Bì\0\0\0;\0 J•šÉQm±ã±ÇËNJ^xá…YÔˆ…±cõêÕY¼ˆË_|qÉ ñÂ/d×Ë×^{m·³4\"tÄ2Zï½÷^öþ‹.ºHìÀŸ·Ÿÿüç‘¡¾¾¾b÷uÎœ9÷ã—¿ü¥±\0\0@ì\0€¡®\Z6(=:bF@ø}¤XhˆË±ßF© KSÅˆË1“£»Øñî»ï¦¹sç¦«®ºªdà;úOÌ(ÌE†qãÆ¥“\'Oú}Èß¯#ÆáÃ‡=ˆ\0\0\0b\0ˆý7r3,r¡¢Xìè*HäÇŽXÎª»Øqùå—go¯Y³Fì$ùûv¬ZµjÐoñâÅ·?kÖ,\0b\0\0€Ø\0bGßG.8ÄrR;vìÈ.Ç¦å½‰±ŸG.\\\\ýõÝÆŽÜ>¹ÑÅŽ—¿”U,[qj°:t(›Q’»ý­[·z\0;\0\0\0Ä\0;ú>Þ|óÍ4zôè,<ÄU£FÊNB÷&vÌ˜1#û\Z±,U,QÕ]ìøéOšÝî7Þ(v’øï™0aBGpxñÅí¶,XÐq»ñ³‚Ø\0\0 v\0€ØQ5£\Z‚„ØQ¾üÙ1Óbÿþý~›k×®í´WGÌ$Bì\0\0\0;\0@ì¨š³3ŠmH.vT¯éÓ§w„‡;ï¼3µµµ\rØmmÙ²¥ÓòUO=õ”_ì\0\0\0;\0@ì0ÄŽ¾9pà@\Z;vlG€X¸paúì³Ï$tLš4É¦äb\0\0\0b\0b‡!vô¿\r6tZZ*öÔ8~üx¿}ýXº*FÇ´iÓRkk«ƒ^ì\0\0\0;\0@ì0ÄŽþ³bÅŠNÁ#falÛ¶­O_óÐ¡CéÁìôu…±\0\0\0±\0±Ã;ÌêÕ«;-i£¾¾>íÙ³§G_çàÁƒiñâÅfsä–®:Ä\0\0\0Ä\0ÄCìP;wîLuuu\"EŒÛn»-›ý±yóæ´ÿþŽ}=âßˆ1dåÊ•iîÜ¹g}®ÍÈÅO_\0\0\0Ä\0ÄCìT1ûâ8k–GoÆŒ3ÒöíÛàb\0\0\0b\0b‡!v¾¦¦¦³öÜ(wÄ’U[·nu`#v\0\0\0ˆ\0ˆ†ØQymmmÙ~óçÏÏ6/\\æ*Þž:ujºçž{ÒÒ¥KÓáÃ‡Ðˆ\0\0\0b\0b‡!v€Ø\0\0 v\0€Øaˆ v\0\0\0ˆ\0 vbˆ\0\0\0b\0ˆbˆ\0\0\0ˆ\0ˆ†Øb\0\0€Ø\0UmÃ†\r‚‚Øb\0\0€Ø\0C×æÍ›SKK‹¨P¥£¹¹9R€Ø\0\0 v\0@	MMM©±±1}ðÁâB•†Ž½{÷úA±\0\0@ì\0€î‚ÇÆ³å’ŒêBˆ\0\0\0b\0\0ˆ\0\0\0ˆ\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0b\0\0\0b\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0ˆ\0\0\0b\0\0 v\0\0\0Tcì8uê”gŽ\0\0PÅÎœ9Ó*v\0\0\0”ð7ó7ÿîw¿óì\0\0ªØë¯¿¾£ýÏ÷}žÁ\0\0\0qùå—?sÝu×ñô\0\0ªÖ™¯~õ«Úÿ|¯÷\0\0 ¸?o÷ÎèÑ£nÛ¶­õÌÝ\0\0ª¢pœ9Ó\Z3:¾ˆ¿Ý=}\0\0è\"x´‡¾x•Ã0Ã0Ã¨šKW=~ŽÐ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@_ü?cW/Å1UÏ\0\0\0\0IEND®B`‚',1),
('30002',1,'E:\\works\\Fintechviet\\AdServer\\adserver\\target\\classes\\processes\\Order.bpmn20.xml','30001','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"OrderProcess\" name=\"Order process\" isExecutable=\"true\">\n    <startEvent id=\"task1\" name=\"Start\"></startEvent>\n    <exclusiveGateway id=\"exclusivegateway1\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow5\" sourceRef=\"exclusivegateway1\" targetRef=\"CancelOrder\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${cancelOrder == true}]]></conditionExpression>\n    </sequenceFlow>\n    <subProcess id=\"subprocess1\" name=\"Sub Process\">\n      <startEvent id=\"startevent2\" name=\"Start\"></startEvent>\n      <exclusiveGateway id=\"exclusivegateway2\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow8\" sourceRef=\"startevent2\" targetRef=\"exclusivegateway2\"></sequenceFlow>\n      <endEvent id=\"endevent2\"></endEvent>\n      <userTask id=\"ShipVoucher\" name=\"Ship voucher\"></userTask>\n      <exclusiveGateway id=\"exclusivegateway3\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow17\" sourceRef=\"SendEVoucher\" targetRef=\"exclusivegateway3\"></sequenceFlow>\n      <sequenceFlow id=\"flow18\" sourceRef=\"exclusivegateway3\" targetRef=\"SendFail\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${sendFail == true}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"flow19\" sourceRef=\"exclusivegateway3\" targetRef=\"SendSuccessful\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${sendFail == false}]]></conditionExpression>\n      </sequenceFlow>\n      <endEvent id=\"endevent3\"></endEvent>\n      <sequenceFlow id=\"flow20\" sourceRef=\"SendFail\" targetRef=\"endevent3\"></sequenceFlow>\n      <sequenceFlow id=\"flow21\" sourceRef=\"exclusivegateway2\" targetRef=\"SendEVoucher\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${eVoucher == true}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"flow22\" sourceRef=\"exclusivegateway2\" targetRef=\"ShipVoucher\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${eVoucher == false}]]></conditionExpression>\n      </sequenceFlow>\n      <exclusiveGateway id=\"exclusivegateway4\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow23\" sourceRef=\"ShipVoucher\" targetRef=\"exclusivegateway4\"></sequenceFlow>\n      <sequenceFlow id=\"flow24\" sourceRef=\"exclusivegateway4\" targetRef=\"ShipSuccessful\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${shipFail == false}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"flow25\" sourceRef=\"exclusivegateway4\" targetRef=\"ShipFail\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${shipFail == true}]]></conditionExpression>\n      </sequenceFlow>\n      <parallelGateway id=\"parallelgateway1\" name=\"Parallel Gateway\"></parallelGateway>\n      <sequenceFlow id=\"flow26\" sourceRef=\"SendSuccessful\" targetRef=\"parallelgateway1\"></sequenceFlow>\n      <sequenceFlow id=\"flow27\" sourceRef=\"ShipSuccessful\" targetRef=\"parallelgateway1\"></sequenceFlow>\n      <endEvent id=\"endevent4\"></endEvent>\n      <sequenceFlow id=\"flow29\" sourceRef=\"ShipFail\" targetRef=\"endevent4\"></sequenceFlow>\n      <serviceTask id=\"SendEVoucher\" name=\"Send e-voucher, phone card\" activiti:delegateExpression=\"${sendVoucherDelegate}\"></serviceTask>\n      <serviceTask id=\"SendFail\" name=\"Send fail\" activiti:delegateExpression=\"${sendFailDelegate}\"></serviceTask>\n      <serviceTask id=\"SendSuccessful\" name=\"Send successful\" activiti:delegateExpression=\"${sendSuccessfulDelegate}\"></serviceTask>\n      <serviceTask id=\"ShipSuccessful\" name=\"Ship successful\" activiti:delegateExpression=\"${shipSuccessfulDelegate}\"></serviceTask>\n      <serviceTask id=\"ShipFail\" name=\"Ship fail\" activiti:delegateExpression=\"${shipFailDelegate}\"></serviceTask>\n      <sequenceFlow id=\"flow36\" sourceRef=\"parallelgateway1\" targetRef=\"endevent2\"></sequenceFlow>\n    </subProcess>\n    <sequenceFlow id=\"flow6\" sourceRef=\"exclusivegateway1\" targetRef=\"subprocess1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${cancelOrder == false}]]></conditionExpression>\n    </sequenceFlow>\n    <endEvent id=\"endevent1\"></endEvent>\n    <endEvent id=\"endevent5\"></endEvent>\n    <userTask id=\"Processing\" name=\"Processing\"></userTask>\n    <sequenceFlow id=\"flow32\" sourceRef=\"Processing\" targetRef=\"exclusivegateway1\"></sequenceFlow>\n    <sequenceFlow id=\"flow33\" sourceRef=\"task1\" targetRef=\"Processing\"></sequenceFlow>\n    <serviceTask id=\"CancelOrder\" name=\"Cancel order\" activiti:delegateExpression=\"${cancelOrderDelegate}\"></serviceTask>\n    <userTask id=\"CloseOrder1\" name=\"Close order\"></userTask>\n    <sequenceFlow id=\"flow34\" sourceRef=\"CancelOrder\" targetRef=\"CloseOrder1\"></sequenceFlow>\n    <sequenceFlow id=\"flow35\" sourceRef=\"CloseOrder1\" targetRef=\"endevent1\"></sequenceFlow>\n    <userTask id=\"CloseOrder2\" name=\"Close order\"></userTask>\n    <sequenceFlow id=\"flow37\" sourceRef=\"subprocess1\" targetRef=\"CloseOrder2\"></sequenceFlow>\n    <sequenceFlow id=\"flow38\" sourceRef=\"CloseOrder2\" targetRef=\"endevent5\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_OrderProcess\">\n    <bpmndi:BPMNPlane bpmnElement=\"OrderProcess\" id=\"BPMNPlane_OrderProcess\">\n      <bpmndi:BPMNShape bpmnElement=\"task1\" id=\"BPMNShape_task1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"260.0\" y=\"140.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"BPMNShape_exclusivegateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"520.0\" y=\"137.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subprocess1\" id=\"BPMNShape_subprocess1\">\n        <omgdc:Bounds height=\"367.0\" width=\"751.0\" x=\"610.0\" y=\"124.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"startevent2\" id=\"BPMNShape_startevent2\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"620.0\" y=\"303.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway2\" id=\"BPMNShape_exclusivegateway2\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"710.0\" y=\"300.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent2\" id=\"BPMNShape_endevent2\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1300.0\" y=\"290.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"ShipVoucher\" id=\"BPMNShape_ShipVoucher\">\n        <omgdc:Bounds height=\"71.0\" width=\"121.0\" x=\"790.0\" y=\"362.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway3\" id=\"BPMNShape_exclusivegateway3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"974.0\" y=\"196.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent3\" id=\"BPMNShape_endevent3\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1206.0\" y=\"147.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway4\" id=\"BPMNShape_exclusivegateway4\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"980.0\" y=\"377.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"parallelgateway1\" id=\"BPMNShape_parallelgateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"1210.0\" y=\"287.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent4\" id=\"BPMNShape_endevent4\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1206.0\" y=\"412.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SendEVoucher\" id=\"BPMNShape_SendEVoucher\">\n        <omgdc:Bounds height=\"71.0\" width=\"121.0\" x=\"790.0\" y=\"181.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SendFail\" id=\"BPMNShape_SendFail\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"137.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SendSuccessful\" id=\"BPMNShape_SendSuccessful\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"236.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"ShipSuccessful\" id=\"BPMNShape_ShipSuccessful\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"321.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"ShipFail\" id=\"BPMNShape_ShipFail\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"402.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"940.0\" y=\"50.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent5\" id=\"BPMNShape_endevent5\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1550.0\" y=\"290.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"Processing\" id=\"BPMNShape_Processing\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"370.0\" y=\"130.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"CancelOrder\" id=\"BPMNShape_CancelOrder\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"620.0\" y=\"40.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"CloseOrder1\" id=\"BPMNShape_CloseOrder1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"790.0\" y=\"40.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"CloseOrder2\" id=\"BPMNShape_CloseOrder2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1400.0\" y=\"280.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"540.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"540.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"620.0\" y=\"67.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"655.0\" y=\"320.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"710.0\" y=\"320.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow17\" id=\"BPMNEdge_flow17\">\n        <omgdi:waypoint x=\"911.0\" y=\"216.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"974.0\" y=\"216.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow18\" id=\"BPMNEdge_flow18\">\n        <omgdi:waypoint x=\"994.0\" y=\"196.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"993.0\" y=\"167.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"164.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow19\" id=\"BPMNEdge_flow19\">\n        <omgdi:waypoint x=\"994.0\" y=\"236.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"994.0\" y=\"263.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"263.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow20\" id=\"BPMNEdge_flow20\">\n        <omgdi:waypoint x=\"1155.0\" y=\"164.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1206.0\" y=\"164.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow21\" id=\"BPMNEdge_flow21\">\n        <omgdi:waypoint x=\"730.0\" y=\"300.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"730.0\" y=\"215.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"790.0\" y=\"216.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow22\" id=\"BPMNEdge_flow22\">\n        <omgdi:waypoint x=\"730.0\" y=\"340.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"730.0\" y=\"396.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"790.0\" y=\"397.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow23\" id=\"BPMNEdge_flow23\">\n        <omgdi:waypoint x=\"911.0\" y=\"397.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"980.0\" y=\"397.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow24\" id=\"BPMNEdge_flow24\">\n        <omgdi:waypoint x=\"1000.0\" y=\"377.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"999.0\" y=\"347.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"348.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow25\" id=\"BPMNEdge_flow25\">\n        <omgdi:waypoint x=\"1000.0\" y=\"417.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1000.0\" y=\"430.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"429.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow26\" id=\"BPMNEdge_flow26\">\n        <omgdi:waypoint x=\"1155.0\" y=\"263.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1230.0\" y=\"263.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1230.0\" y=\"287.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow27\" id=\"BPMNEdge_flow27\">\n        <omgdi:waypoint x=\"1155.0\" y=\"348.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1192.0\" y=\"349.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1229.0\" y=\"350.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1230.0\" y=\"327.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow29\" id=\"BPMNEdge_flow29\">\n        <omgdi:waypoint x=\"1155.0\" y=\"429.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1206.0\" y=\"429.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow36\" id=\"BPMNEdge_flow36\">\n        <omgdi:waypoint x=\"1250.0\" y=\"307.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1300.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"540.0\" y=\"177.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"540.0\" y=\"231.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"540.0\" y=\"310.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow32\" id=\"BPMNEdge_flow32\">\n        <omgdi:waypoint x=\"475.0\" y=\"157.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"520.0\" y=\"157.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow33\" id=\"BPMNEdge_flow33\">\n        <omgdi:waypoint x=\"295.0\" y=\"157.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"370.0\" y=\"157.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow34\" id=\"BPMNEdge_flow34\">\n        <omgdi:waypoint x=\"725.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"790.0\" y=\"67.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow35\" id=\"BPMNEdge_flow35\">\n        <omgdi:waypoint x=\"895.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"940.0\" y=\"67.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow37\" id=\"BPMNEdge_flow37\">\n        <omgdi:waypoint x=\"1361.0\" y=\"307.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1400.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow38\" id=\"BPMNEdge_flow38\">\n        <omgdi:waypoint x=\"1505.0\" y=\"307.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1550.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('30003',1,'E:\\works\\Fintechviet\\AdServer\\adserver\\target\\classes\\processes\\Order.OrderProcess.png','30001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0;\0\0õ\0\0\0 L€\0\0zIDATxÚìÝÔå/|¢ñx,“r­ŠÇS•äœM½[×ãñhÕzL½®µ•¼ÆJêMRÇá\"£‚\"šE=\Z—Ä˜˜]CˆæM0†#v¹¬ë%ŠÂ,^@E8ˆ\\†¹ˆ #5ÏÛ¿ÿ¡\'=C÷LÏ½{æó©zjºÿÿ¾ÍÌÓÝÿþ}ûyž!C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`I)}ôõ×_ŸW__ÿáÒ¥KÓâÅ‹µ\nhK–,IË—/ß›k£ôRýT?\0\0\0\0hGW¬X‘vïÞþøÇ?jÔöìÙ“ž}öÙK–,ùš~ªŸê§\0\0\0\0\0%Ä7å+ºüÇÅ‹¿ªŸê§ú)\0\0\0\0@	1%bme·Å‹¿¯Ÿê§ú)\0\0\0\0@	1ï¾BmÅ‘“~ªŸê§\0\0\0\0\0%t¦ˆÜøÖ»é[sÖf-N+ð*\"WZ?}÷íÆôús³Ò†%wd-NÇ6ýH?\0\0\0\0°öŠÈ‡ÿ1í;ø^Ëùå¯6µ„q:¿}÷ÛÍéíwÞSðUDî—~šoïìoHë7-½ôØäV-¶Å>}I?\0\0\0\0¨REä:f¯Üš¾3o]zêå]iÙ+iÚüõ-aGœŽí­Ù™¦æ.óã\'_KÞx(\"÷m?-l;6üË1AG¾íÜð¨¾¤Ÿ\0\0\0\0U©\"òÞÍiÊÜu-áFGmÒo_J;öTôUDîÓ~ZØ^}æ%ÃŽØ§/é§\0\0\0\0À\0Õ^ùñµ\re‡sÿm›‚¯\"r¿ôÓ|[¿øö’aGìÓ—ôÓî¨­­ýDMMÍå9?ÌµgrmG®¥‚Ö˜k«r—ùEî²cs§ÿÒ;\0\0\0\0ô‘öŠÈ1uU>Ì˜üÈKéá?¼‘¶4½µ8ÛòûŸxÉšŠÈýÓO…úioºì²Ë>WSS³àòË/?Ô&Üè¨½áG®Õ\r:ô£Þm\0\0\0\0 +\"7¾õn¶\0yá\Zn´½\\l+\\Ã#®×UøUDî‹~Ú¶mXrGÉ°#öéKúig\\~ùå“kÏu2à(Õ^ÑÞq\0\0\0\0 —+\"›¦*Fs´½\\l+vY…_Eä¾è§mÛæ•?-vÄ>}I?-Wmmíô£#3Z‹‘#G¦éÓ§§yóæ¥\r6¤ÆÆÆtèÐ¡Ž9’vïÞ6mÚ”æÏŸŸ]nôèÑÅB\'r·ó)ï<\0\0\0\0ÐÃ„ŠÈÕÚOÛ¶}\rëÒú§n;v\n«Ü¶Ø§/é§>|øÇŽ®ÇÑPÔÕÕ¥Ù³ggaFg477§…¦‰\'¶\n<jjjöç~õî\0\0\0\0=È4VŠÈÕÚO‹µ­Ï?tLØÛô#ý´#GƒŽ…ÁÄ´iÓ²ÝñÁ¤Ç<RpÛïäÚ×¼\0\0\0@iò¦²(Ë*ø*\"÷G?mi‡§Í˜yìV¹m±O_ÒOÛÓvDGLWAEOihhH“\'O.<ÕÔÔ|É»\0\0\0\0ô€öŠÈO®k(:MU±ö¯kv*ø*\"÷K?öÎþ†´iå}%×ìˆ}qýI?-æè\Z-AD}}}ê\r±ÆG¬çQ8Â#wßgz\'\0\0\0€n*UDÞ{ 9}gÞº²ÃŽ›æ¾”v¿Ý¬è«ˆÜ§ý4Fl4n~:½üäwKù—‰Ë\Zå¡ŸºüòËÿ¦p1òÑÑ›b1ó»îº«0ðh¬­­ý„w#\0\0\0\0è†REäæ÷§™OoÎ¦ªZðüöôÌ+­×ðˆÓË^iLO½¼+E~µ|K:¤ˆ¬ˆÜ‡ý´£ÑFyè§å¨©©YS¸FGON]UÊÁƒÓ¸qã\n-¿×»\0\0\0\0tC{ÓEàÑ´ÿÏŽÇäù°#Nç·¿uð=A‡\"rŸ÷ÓrFs´7ÊCßÒO/»ì²Ïå‡ºººn/FÞ/¼ðBÛËÿÒ;\0\0\0\0tQY?mo½ÛvÄi^Eäþì§]\r:òMßÒO/¿üòGóÃìÙ³S_»çž{\nzG\0\0\0€.êLØ¡)\"ë§Ú@é§±NÆå—_~(‚†‘#G¦Ý»w÷yØ±eË–Â©¬ö×ÕÕý…w%\0\0\0\0(P[[»8×þ¶£Ë)\"+\"WýT?íi555—çƒ†éÓ§§þ2qâÄ–À#÷šýï^\0\0\0\0P  x¶¸¦¦æ³¥.§ˆ¬ˆÜŸ„rúiõ«˜6*ÿ:9oÞ¼~;yä•\0\0\0@)óÀçÛÅŠŠÈŠÈ•ÐO…rúi_÷«Üþgò—Û¸qc¿…õõõ…#;{÷\0\0\0€EÂŽ–bZaè¡ˆ¬ˆ\\aýT(§ŸöI¿ÊmÛ‘ßßØØØoaÇöíÛg£w/\0\0\0\0(P*ì(,þÅ7ž‘‘+±Ÿ\nåôÓÞîW…Û:ÔoaÇ‘#GZ=Fï^\0\0\0\0ƒTE}­¦ˆ¬ˆ\\áÏ_¡œ~Ú+ýªð|v\0\0\0\00Dq¨ôß¥D{®¦¦æKC‡ýh\\N¹ò›PN(§Ÿön3²\0\0\0€~§8TúïÒ^È‘×“Eä»ï¾;}æ3ŸI\'œpBúøÇ?žFŒ‘¶lÙÒ§×Ü¯”µj¹]#;ú/”k¯¿öçÿ»šúfŽìhéWÖì\0\0\0\0 ¢;Jÿ]Ž¶Uµµµ_iräõTyÆŒYÁõóŸÿ|ö-éE‹eçÏ9ça‡°£œ~Úg¡\\9ýuˆ°c …Çô«Ü¶gòû7nÜØoaG}}}«5E¼{\0\0\0RÂŽ’—¢Eã¶zªˆ|î¹çf×Ýÿì³Ï¦³Î:+ûýé§Ÿž|ðÁV…ÚI“&¥“O>9vÚiéÈömÛ¶-åv3Ï<3­Zµ*Û¾gÏžtÅW¤O<1tÒIiØ°aiçÎí~÷íÛ—®½öÚìòq½ñãÇ§´ºÎÅ_œÎ?ÿül[?ãwŠË_uÕU­n·œû/¼-aGûÏß¾åÊí¯…ÿïöúN„$gŸ}vÖGcüßó£CÚë\'¥oVAØQ²_åöÝ—¿Ü¼yóú-ìˆû.x¼÷y÷\0\0\0¤„ÝÓSEä(öæn®¥HÛ¶EÐ±zõê´cÇŽìr§œrJ«l×¯_Ÿ>õÔS³}—^ziv>BŽ!ßº¯««ËÎ¿øâ‹iíÚµÙéK.¹¤Ý°#ŠÉ±ýá‡ÎŠ‹q:ŠÊ…×YºtiÚµkW¶-B–üãÊë?»åÜám	;Ú}þöi(Wn-ü·×w¢Çù­[·fý;Nçƒ„öúÉ@é›vtØ¯jkkGåC†éÓ§÷[Ø1yòäÂ°ãkÞ•\0\0\0\0)aG÷ôTùøãÏ\n©ñ-õbû£<eÊ”¬<¤ 8;¤M8§ã¶ât|;}H‘à\"¿½°Å¶öÂŽüubÊ¢hÅ®ÛÛ»|þvË¹ÿÂÛvTN?-·¿ûë;^xav>Â“çbz¬]ÑQ?(}³šûéÈ‘#?•{ÿ8ï!¹ÓéàÁƒý½^Ç¡ÚÚÚOxW\0\0\0¤„ÝÓSEäu1¤ib\ZªØÿè£vviS¸m¯8\\îú1¥Ï6â˜6«ÔuÊ)(wæþ…•ÑOËí¯…ÿÇöúNœÇöo|#}úÓŸÎöqÆö“Ò7«½Ÿ®Û1þü>;fÎœYvÌòŽ\0\0\00ˆ	;º§§ŠÈ?ÿùÏ³Bê¿øÅ¬ÐúÏÿüÏÙù¿ú«¿jU„éu†”vä§±Z¹re«i¬FŒ‘µ=ò·wÑEµ[ÐÍOïS8UÐ„	J^\'¦þr´ž¿|þ2]¹aGeôÓrûë\"SCë;\\pAËTk15Tœþä\'?Ùa?(}³ÚûiáTVñ7¾ÐW\Z\Z\Z²%ùûÏýïÎõŽ\0\0\00ˆ	;º§\'‹ÈQ`…“kÎ/*ÓûDàÑvAå!í„1õU“ãöbèX!¶755eâü‚ÎQüÅÌ;Z |ìØ±Ùå£Ea³í\"Ð…—E¦#\\‰ûŽë^¦+÷/ì¨œ~ZNÒfòR}\'þï_ýêW³ëÇíÄ4mÏ>ûl‡ýd ôÍjï§±¦Gî=äå|à°páÂ>;î¸ãŽ– £¦¦fw#\0\0\0€ANØÑ=½QDÖ‘õSý´ZŽîˆ‘o¼ñF¯?þxáôUï×ÔÔœíÝ\0\0\0`vt\"²\"²~ª\rö~š{y4>|ë[ßJÍÍÍ½tÄ´|…ÓWåÚxïD\0\0\0\0;ºIYY?Õ{?>|øÌ½—ìÉwÝuW:räH¯1Í˜EÉ\0\0\08†°£{‘‘õSM?2¤¦¦æ³¹¶?DÄš\Z±žJON]ÕfDÇÃ‡ÿ˜w!\0\0\0\02ÂŽîQDVDÖO5ýôÿ¨­­ýJî=åP>ˆQõõõÝ\n9\Z\Z\ZÒm·ÝVr:\0\0\0\08–°£{‘‘õSM?ý³Ë.»ìs¹÷•w\nÃ‰éÓ§§7v*äØ¾}{š9sfÛÑÙÔU‚\0\0\0\0Ž!ìèEdEdýTÓO[«­­=3÷Þ²£MH‘¾þõ¯§9sæ¤+V¤7Þx£e]øáFŒ™7o^š2eJÛ€#Úû#\0\0\0 $aG÷(\"+\"ë§š~z¬}Q[[;½í(®´ššš¹v¶w\0\0\0\0Jvt\"²\"²~ªé§¥9òS¹÷™;//³ÅÚ³FŒq®w\Z\0\0\0\0:$ìèEdEdýTÓO;VWW÷ï®çñÃX`¼È4Wµµµ‹s?ï«©©¹<wúÞa\0\0\0\0(›°£{‘‘õSM?\0\0\0€~&ìèEdEdýTÓO\0\0\0 Ÿ	;ºGYY?ÕôS\0\0\0\0ègÂŽîQDVDÖO5ý\0\0\0\0ú™°£{‘‘õSM?\0\0\0€~&ìèž¥K—*ÔVv;´xñâ÷õSýT?\0\0\0€LØÑ=Ë—/oÜ½{·bm…¶†††ß.^¼øUýT?ÕO\0\0\0`\0vtÏÓO?ýåeË–½ýæ›o¾§h[Yß”ò’%K¶åÚ×ôSýT?\0\0\0€LØÑ}K–,ùÒâÅ‹Ÿ‹ihbÞ}­\"Zü/^U@ÖOõS\0\0\0\0„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„¥­^½úÿž0aÂæ¿þë¿~?w6iš¦iš¦išVíSŸúÔ{gœqÆ¬Üéùä\0\0;Jˆ #çƒ/}éKé¹çžK‡J\0\0@ÿ{ÿý÷ÓË/¿œ†\rö§üã›\0\0€°£„ë¯¿~K\0\0@åúüç?¿\'wø>Ý\'\0\0v;Šˆ©«bD\0\0P¹6lØp0wø¾Ù\'\0\0v;Š3u\0\0T¸˜ÒjÈÿYÇ\0\0vP,ì\0\0\0*Ÿ°\0 ÷+¥}ýõ×çÕ××¸téÒ´xñb­Ú’%KÒòåË÷æÚ(½TØ!ì\0\0\0a\0\0íˆ cÅŠi÷îÝéü£VAmÏž=éÙgŸ=°dÉ’¯	;„Ý	;Ö¬Y“.¾øâtâ‰\'¦“N:)ýíßþmZ½zu¹ÈÊ¾\\´¸ÿþßÿ{vŸ\0\0€°\0 OÄˆAGE\\¼xñ«ÂaGwÂŽÿò_þKöáêÕW_M/¿ürvú?ý§ÿÔãaGøýïŸŽÀ\0\0v\0\0ô‰˜ºJ¨PÙmñâÅï;„Ý	;b4G\\vË–-\Z…çó§¯¹æšì6Î;ï¼²oã„NhµoèÐ¡éüÿ‘m{çwÒu×]—ÝfŒ¹þúë[ZßµkWú»¿û»ìúý×žþùlûR]]]Ëè”áÃ‡g#ÒÂc=–þÛûoÙub_Ü×öíÛ;Ü\0\0Â\0€\"Ö‡(T|Ø1èŠ…Ý;~ô£e®N>ùäôõ¯=áÑ™°#ƒhùÐ¢½°#?²#‚‘Â}Ë—/O{÷îÍ¶EÐÛæÎ›,XŽÀ#|ñ‹_ÌÎGÈ1¤`„ÈUW]•‘)6lÈN_zé¥Ù¾SN9%;¿sçÎlú¬8VÚÛ\0\0Â\0€Av¼ûvczý¹YiÃ’;²§c›0BØ!ì¨ü°#Ä\ZDà×‹\0¤Ü°ãÃ?ÌÚ£kr”\n;¢üñé¿þ×ÿšêëë¹¼¸R·›ß×V~û6ëƒ„XƒdÈÑÑ$–ÜÿýÙHŽö\0€°\0`…ïìoHë7-½ôØäV-¶Å>„°CØQùaG^SSS«  ³aGLU*ìhçC]«mùiµ\no7B˜rÂŽÂÐ$/¶-[¶,ÝxãÙZ$q¹X§¤£}\0\0 ì\0\0DaÇŽ\rÿrLÐ‘o;7<*vô¶/\r;¾àÛµ°#Ö¾ˆËÆ4N/½ôR«‚ÿøÿ!;ÿÚk¯¥ßýîwEÃŽßþö·é‰\'žÈNÇèˆî†ù)©\n§±ŠéµB~\Z«‰2¤`\Z«Q£Feçõ«_µ,²~ñÅgû>ûÙÏ¶L}SeÅéO}êSî rÅúJ«V­J±¾\\iýß–,Y’MK¹yóf„\0\0Õv¼úÌJ†±O !ìèEŸËµý¹vïÑŸ_ò¬í|Øk\\D0£#bš©˜Ú)¿ð÷ìÙ³³u-b´Å·¿ýí¢aG¬±Ó@EððÆot;ìˆÊcÑóx<Ñ\"èÈ/PkkD@÷‹G@Þzë­,$É/jëuÄbæ!~6,Û×‹59þð‡?t¸€Ê\r:V¬X‘vïÞíX°ÂÚž={²“›6mÒQAØ\0P}aÇúÅ·—;bŸ~ÂŽ^:òGŒìØ#ðè|Ø\0Õ$Ft:*;ðˆ7€°\0È¹ýöÛÿbÆŒß»óÎ;ŸŸ6mÚž	&9rdŠ©j¢]sÍ5ÜtÓMûï¸ãŽµ?ûÙÏî¿å–[þ/5a‡°cPmv\0À\0…tÇ€•|\n;\0`P»ë®».¹í¶ÛÖŒ\Z5êOÓ¦MK.LëÖ­Ë¾¹õÁ´ìÛ·/mÜ¸1=ùä“éž{î‰¹ÚÿtÓM7íÈ]çš¡C‡~Ô_²oÃŽ\rKî(vÄ>ø„=ì\ZùýÖðv\00\0•s|ª	;@Ø\0ô‹‰\'þåw¾óµcÇŽýÓ¼yó²0£3Ž9’V®\\™n¹å–?M˜0¡iÜ¸qÿ¯¿jß…›Wþ´dØû|àvôBÐÑQa„‡°\0aGj|ëÝô­9k³§;\n;@Ø\0ôšiÓ¦ÝpõÕW¿ÿë_ÿ:577wû\0á¹çžKãÆ;2~üø…Ã‡ÿ˜¿pï‡û\ZÖ¥õOÝvìV¹m±Ï>aGùÜÎØèìå…\0PåaÇáÃ¹cÓƒïµœ_þjSKØ§óÛw¿ÝœÞ~ç=Ç’Âv\0\0=cêÔ©÷_ýõ¼ðÂ=zpðàÁ4cÆŒ#uuu»†þý¥{7ìˆ¶õù‡Ž	;b›{ÂŽ:¾Ô…ë½3ˆŸ\Z4aG³WnMß™·.=õò®´ì•Æ4mþú–°#NÇöÇÖìLSs—ùñ“¯¥ï\n<„ ì\0\0z è¸á†>Œõ8zËÃ?üá¨Q£>ü¯üÅ{1ì8|8mþÃÌc§°Êm‹}>ð	;ú)èè©ë;\0 \nÂŽ½šÓ”¹ëZÂŽÚ¤ß¾”vì=èxRØÂ\0 ëbêªÑÑ›AGÞ¢E‹\Z5ªÁÞ	;ÞÙß6­¼¯äš±/.ãCŸ°£‹:ZŒ¼¯oGØ\0\ZvD{|mCÙaÇÜÛæXRØÑ£víÚ•fÍš•n¾ùætõÕW§#F¤Ë/¿¼¥Åùºººtã7¦ŸýìgiãÆžÐ;\0 šÅbä±FÇÚµkûì áý¯ÿµ+w`ù/C‡ý¨ÿ@…‡§ÆÍO§—ŸünÉ #ßâ2qY£<„](zj\nªÁ8ÂÃ§F\0UØSWåÃŒÉ¼”þÃiKÓÛY‹Ó±-¿ÿ‰—|!GØÑ3-Z”Æß*Ø(§ÕÖÖfáÇý÷ßŸýÝv¨@\0@•™:uêË±y_ûæ7¿¹«¦¦æÿî‡æ0ÊCØÑƒÁD>èøH®9ú³3Ú^o°-ZîS#\0ƒ\"ìh|ëÝlòÂ5:\"Üh{¹ØV¸†G\\\'®ë˜RØÑË—/OcÆŒétÈQ¬\Z5*í°\0¨wÝu×%cÇŽýSsssŸ8444|0bÄˆ·jkk?á?Ñ½°£œÑíòðPØQfÐñ¥‚Àâ—GþÙ‰À£ÔõSàáS#\0ƒ\"ì(6MUŒæh{¹ØVì²Ž)…uë­·XŒ92MŸ>=Í›7/mØ°!566¦C‡e—?räHŠiœ7mÚ”æÏŸŸ]nôèÑÇÜÆ¸qãÒ–-[<Ñ…\0@¥»í¶ÛÖÄ]ùþ÷¿¿¡¶¶vºÿD÷ÂŽ®ùæ °£AGsôÀ?u\"ð(:òíŠ‚ýƒe\rŸ\Zv;„=hÿþýÙz…ELE5{öìÔÙ5)ãK€.L\'N<&ôxüñÇ=Ù…\0@¥ºýöÛÿbÔ¨QÚ·o_¿<444ì®­­ÝkíŽî…š°£—”\n ŠíÅ.ÿÿ¹ü`XÃÃ§F\0EØa\Z+aG_W^ye«PbÚ´iÙŽîøàƒ²p#F†®çñ›ßüÆ^Ø\0T¢™3gNÁþvÝu×½–;pü[ÿa‡°£çåž[‹»øüêh1òrrƒŽ¶Ç@ÒÊ§F\0EØñçÊ›Ê^ <.ëXRØÑmGtÄtUTô”†††4yòäV÷1wî\\Oza\0Piî¼óÎç}ôÑ~?€øÉO~²ÒTVå¥…ÂŽÎ(ø&ÚâšššÏ–yµr‡ŽÎ…÷¿gÈÀááS#\0ƒ*ìxr]CÑiªŠµ]³Ó±¤°£lm×è¨¯¯ï•û‰5>b=ÂkÖ¬ñÄv\0\0•dÚ´i{Ö­[×ï¹ƒÒµ¹ƒÆgûÿ£Ü¢´°CØÑ•~UÐžè TëìTR¥ãºtä\rÔ5<|j`Ð„{4§ïÌ[WvØqÓÜ—Òî·›O\n;:´|ùòcFtô¦XÌü®»îj¹¿#F¤]»vyò;\0€J1aÂ„#]°­74555æ…å¥…ÂŽnö«–P­HÿêêšÅ×ºtt÷ñ;\0 ÂŽæ÷§™OoÎ¦ªZðüöôÌ+­×ðˆÓË^iLO½¼+E~µ|K:tø°ãIaG‡FÝjŽžœºª”ƒ¦qãÆµÜïÔ©S=ù…\0@¥ˆÅÖúâ °q°(ì(¯(-ìvôD¿*ÕŽŽ$êîHŠbGw‚Ž¶Ç@YÃÃ§F\0MØ‘<šöÿyÁñX€<vÄéüö·¾\'èv”eÑ¢E-Ç²uuuÝ^Œ¼3^xá…VÓYmÜ¸Ñ€°\0¨”\"h¥v”_”vT~+ãY‘-×\rïíf7Ž©«ÚŽèxíèöî¸÷èmý…°\0ª+ìhÛ\Zßz·%ìˆÓŽ…uíµ×¶¿Îž=»Ïïÿž{îi¹ÿ›o¾Ù€°\0¨•6²C+¯	;Œìè¡í¹ššš/\r:ô£G/šÙÑÕíì(\\´¼³Œì\0€vhÂŽîˆu2òÇ³ñy¶?¦eÞ²eK«ãê½{÷zv\0\0ý­RÖìØ³gÏ.kv”_”î­“…ÅéO<1sÎ9iõêÕÿÁ-ÿ˜…e÷«¶!GÛ`á!½³fGWkv\0€°Cv´˜5kVËqíôéÓûíqLœ8±åqÌ™3Ç‹€°\0èo7ß|óÞ\r6ôûD}}ýÚÜAâ\naGyEéÞ;âô3Ï<“ŽÀÃ‡Ãv¬ª­­ýJ‰£XÀPîHŠbAG¬Ñq\\‘í	<º»†ˆ°\0„Z…cÇŽMO=õT»—‰i£òÇ·óæÍë·ÇúÈ#X¨\\Ø\0T’;ï¼óùÇ¼ß ~ò“Ÿ¬Ì$þPØQ^Qº/ÂŽüùN8¡Õ¾‹/¾8þùÙ¶}ûöeóåžtÒIÙHñãÇ§dû¶mÛ–r?»þ™gž™V­Z•mß³gOºâŠ+²ËÇõ†\r–vîÜ™í‹…Ï>ûìì:±/î+†ˆw´¯ðqçOOš4)|òÉé´ÓNK<ð@¶/.=nã²Ë.ëÕ!v´7’££À££ ¡TÐñ‘vö—xüM®í€A‡°€ªÇN7ÞxcöSØ!ìèùÏCz,]º´èe®¾úê–Ëõçâàõõõ­/Â\0 ŸÍ˜1ãž»îº«ß n¸á†õ¹ƒÄ¡ÂŽòŠÒ}9²ãÜsÏmµ/>tÄ<¹±-‚ŽØöðÃgßªŠÓxÄ¾K/½4;!Ç‚\"uuuÙù_|1­]»6;}É%—dûN9å”ìüÖ­[³é³ât>Xio_±°cÁ‚iýúõÙéSO=5Û÷“ß—¼ƒ!ìè†ŽFVttébà‘ŸJë+ô©îS#\0U!\nÉùbn|‘¤½Â²°CØÑ“aG¾7î˜‘#FŒhÙßØØØouûöí-#Â\0 ŸMž<ù?Ž3æOÍÍÍývðÐÔÔ´»¶¶öÝºººï?Rž¾X³ãøãOguVZ±bE«}‡j¹|ŒÎÈo‹6äèZ…ûÚÞG~û6ëƒÄ¾/¼°e4I„%3fÌÈF‚t´¯XØQø;ÅïRêñ\n;:Tj„G¹AGgüý}e\0?…}j *Äg„¶ÅçX§ ¾Ì\"ìvôEØQ8r\"zncúþräÈ‘Va\0P¦L™ò¿—-[Öo?ýéOŸ¯©©ù…ÿDå„åî‹é¤Ú†1uT9aGah’o±-~·o|ãéÓŸþtv¹3Î8£Ã}…ùóÂŽ.‹m§”\ZÓ‰ £½ÀãŠ6÷3×èv\0PµÊ)>;„½Ýß\nGzTRÀ ìv\0\0fêÔ©µ“&Múðƒ>èo‹½?bÄˆ·FŽù)ÿ‰ê;òSRNc5aÂ„VÓX­\\¹²Õ4V1Ä;ÎÇ:\Z1•Uœ¾è¢‹²}\\pAËÔW1UVœþä\'?Ùá¾rÃŽ/ùË-ÓXÅ‚‚ÂŽN…‹–åC:¸^gEv\0@…ŸcšSaGå·Žþ—ÕØŒì@Ø\0cÂ„	M1]Q_»óÎ;×åïó¨Î°#(oõÅˆ‰htä(µ5\" ˆi§bañXg#¶755e!I~QóXG#3Ï/jþÕ¯~5Û×‹59ž}öÙ÷•vÄcŠ5HbZ«xÜC\n`v”¥í”VT\\Ñ‰ cH‰ë}aÂ€AèÃ?ÌŽÞyçìø)Ž‡vîÜ™-üýÚk¯¥uëÖ¥5kÖdÇKñE‘u½dÉ’ôÄO¤G}4ÍŸ??Í;7û‚ÉC=”~õ«_e_ùÙÏ~£¤Ó½÷Þ›~ô£¥ïÿûéïÿþïÓwÜ‘n¿ýötë­·¦›o¾9M:5Mž<9}ûÛßÎ¦¡úæ7¿kæ¥ë¯¿>[o-Öa‹c£hW]uUºòÊ+³ãµ+®¸¢ì¢s…ñ7‹/ÎÄqe\'ÆÔ§ñ7ì‹cäÙ³g§ÓO?=;¶¼øâ‹Ëº~o~Ùf ì3fLöÈyÊš;\0€’®¹æšÿgÜ¸qGöïßßg\r/¾øâæÚÚÚÿ=|øðùTFØ1ÐÛÇ?þñ¬óOGqaHÁˆaG—î*6E–°€tmsÇ¿--\n¤ÑF\Z•µÑ£GgCv#pˆà!ˆ=Äu×]—_ÿú×³ÀâÆoÌŒ›nº)4n¹å–4mÚ´,è¸óÎ;³àãî»ïÎ‚Ÿüä\'Y0òóŸÿ<JfÍš•\'sæÌÉŠÈ.Ì‚•X\"h‰À%BƒRÅçxœ¿þõ¯S|~ÈûôÇñ]Lk\Zï­åG\rÇ”§}vÄ—fb{|Ù§Ø­ýr‘°#µrä]}õÕ-û7nÜØoµ¾¾¾Õ´n;\0€\n2~üøÊ}z¿/¦³ÚµkWsL_uÙe—}Î_^ØÑW-¦¯Šp£ð›1-–°£ßžN„\0Tl7¾lQ\n¿EŸÿûý÷ßßªøúëø4¿†\\½ÛîÛ³gOÊäý†\r–¨)&Mš”­9wÚi§e!Pì‹ÛŠÑÀqœŠùµà\n÷Å¨ã³Î:+AbÄÇƒ>hdGÃŽYA\\Û~\"ÜË_.¦Òí/qßùÇ	a\0PA†úÑ+¯¼rëC=t¤7vïÞýAîàuWmmíDuaÇ@^\0r€wÃîN=5Ø¦®v\0b1Š#w\\•}äÈ‘-!GL—Uj$xŸÆÈ•xoÀ\"¦Tm×—‹k×®ÍNÇª…¡C|fýúõÙéSO=5Û—û\\Ô²oÑ¢E%Š¶Û#èˆiµvìØ‘m?å”S„Tl$G[¿üå/[B†éÓ§÷Ûc©áòã7¿ù:a\0PirÄ>1zôè}óçÏÿco(ÄˆŽ£AÇtma‡°cÀ™1˜#v\0±vX5Šé´b\Z¬ŽF¦ôçñiL·ÁFñ>H±ÑÑb[©uÞbíÂëÅÔTÑÊ\r;â<eÊ”lm¹R‡°£ûb:Ú|ÈaÜÁƒûü1®×-÷9×°\0¨D¹ÆO\Z5ªáW¿úUSO$Ä\Z1u•ÂaÇ€ÒÙ©¨ëÔUÂ€A,\n²1z \Zµ÷\rûJ	;ò-?¢\"h†…ç»\Zvœyæ™ÙùXûDØÑ»\n×í˜?~ŸßÿÌ™3[îâÄ‰^ä„\0@%‹#FŒø—	&4mÛ¶ípwš››ß¿óÎ;×ÅbäÖèv;uàñ7¹öN®}e?…}jdbáñçŸ~@ÿŽýu|šbú¨øÇéX´<öÅˆš8kqä/¿è¢‹:;bª«!G§±ŠuÊ\r;ò!Iþ¾„½§p*«˜¾,B©¾ÒÐÐÐ2½[´Xa\0PjjjnÈ}Hxó{ßûÞË[¶léÔH¦¦¦Ý3fÌx.Fsäg>ücþ¢ÂaÇ€õ…£AÆÚÙ¿GÐ!ì\0Œb‚åË—;z¡ÅZ`DÐÓP]xá…Yñ9öå>dÓ[ÅBã±?BŒmÛ¶uvÄ4IçœsN¶ÐøØ±cË;rŸ}²ûi»¨¹°£çÅï!b>pX¸paŸÝ÷wÜÑr¿ãÇ÷\'ì\0\0ªI„¹¹ÛsmÇ5×\\óÚÝwß½ê™gžyqûöíÛ\nöíÛ÷f}}ýÚŸüä\'+o¸á†õµµµïÖÔÔü\"¦ÅòWv;…R#<L]%ì\0Ô¢øý»ßýNØ¡õûñé@R8º#FZ¼ñÆ½~Ÿ?þx«µ:bDÂ\0 JÕÔÔ|öhðñD®mÍµ÷ö\ZsmU®ý0×†ÖÕÕý{1a‡°cÐ‚aÀ 7nÜ¸>ýæ¹°CaG¸öÚk[‚‡o}ë[1…r¯Ý×Ê•+[M_uß}÷yqv\0\0 ìv’Àã^A‡°€”Mu3gÎa‡&ìèa1-YmmmK\0q×]w¥#GŽôJÐS¢Y”\\Ø\0€°CØ1ø|!>)½†‡°€Aãúë¯O³fÍvhÂŽ^°téÒVSKÅš\Zûöíë±Û©«\nGtÄH­ýû÷{av\0\0 ìvGÃ„\0ƒ^|üþûïvhÂŽ^#§\n…Q__ß­ÛlhhH·Ýv[«Ût;\0\0v;„;\0­É“\'§ø‡vhÂŽ^´hÑ¢VSZE›>}zÚ¸qc§ngûöíiæÌ™­Fsä§®t;\0\0v;„;\0­ï~÷»é‡?ü¡°Cvô²5kÖ¤#F´\n)¢}ýë_ÏF¬X±\"½ñÆ-ëzÄÏ7bÈ¼yóÒ”)SŽ¹®ÅÈ…>¾\0\0;„Â„Q$ZµjU6gz¼öiÕß–,Y’–/_ž6oÞ¬ƒ÷Ûo¿=}ï{ßvhÂŽ>£/n½õÖcFyt¥?>­^½Ú‹˜°\0€Þ%Ø*ºÊ}˜|_Ø!ìv0‚Žø–ìîÝ»½ö°¶gÏž´lÙ²´iÓ&½DÐ‡°Cvô-[¶³æF¹-¦¬Š „\0\0½lùòå\nK•Û\Z\Z\Z~›û0ùª°CØ!ì` ‹B÷£xÄ,è¾˜Â*¦²vhÂŽ¾×ÜÜœ­çqóÍ7gŒ·æ*Î;6ÝtÓMiÖ¬Yi×®]^´v\0\0ô•§Ÿ~úËË–-{ûÍ7ß|Ï·Ê\ZÑAÇ’%K¶åÚ×„Âa‘†Š£”çÿñÓ¤I“„šç3;\0\0hkÉ’%_Ê}`y.¦K2¿xÅ´ø_¼*èv;,7G)ÏÌ™3Ó7Þèõ@ó|a\0\0 ìv@57ßz7}kÎÚ¬Åi…GÅÑÁ$¦Æ¹á†¼hžÏ ì\0\0\0„Â¨¦âæáÃLû¾×r~ù«M-aGœÎoßývszû÷\"G´9sæ¤ñãÇ;4Ïgv\0\0\0ÂaTKq3‚ŽÙ+·¦ïÌ[—žzyWZöJcš6}KØ§cûckv¦©¹ËüøÉ×ÒwŠ£×Â…³…‘…šç3;\0\0\0a‡°ª¤¸¹÷@sš2w]K¸ÑQ›ôÛ—ÒŽ½#G¬\'žx\"]uÕUúw\\ºt©çŒç3;\0\0\0a‡°Ö7¹_ÛPvØ1÷ß¶)D*ŽhË–-Kuuuúw\\±bEÚ½{·çM…¶¦¦¦,„\0\0€°CØ;bêª|˜1ù‘—ÒÃx#miz;kq:¶å÷?ñRƒb¤°c@[½zu\Z=zô€þ·lÙ’…:o¾ù¦çN…›6mòda\0\0 ìv@9aGã[ïf®ÑáFÛËÅ¶Â5<â:q]…IaÇ@´~ýú4räÈÿ{FàñôÓOgýF«œ&è\0a\0\0 ìv@\'ÃŽbÓTÅhŽ¶—‹mÅ.+`vD[·nM#FŒð‡\0v\0\0\0Âa;4aGuŠµ,jkký!\0„\0\0€°CØÕv˜ÆJØÁ±Þyçï‹\0;\0\0\0a‡°ª ìøóåMe/P—,;²;î¸#ÕÔÔ¤;ï¼Ó@Ø\0\0;„P-aÇ“ë\ZŠNSU¬ýëš‚aÇ€õƒü }ä#Içw^öóÖ[oõGv\0\0\0ÂaTzØ±÷@súÎ¼ue‡7Í})í~»Y¸ ì°AG>àˆ‘ÇwœÀ@Ø\0\0;„PéaGó{‡ÓÌ§7gSU-x~{zæ•ÖkxÄée¯4¦§^Þ•…\"¿Z¾%:|X¸ ìÐAGGÛv\0\0\0ÂaTPØ‘<šöÿyÁñX€<vÄéüö·¾\'èv81‚£½@#¿ß\Z\0Â\0\0@Ø!ì€\n;Ú¶Æ·Þm	;â´ AØ1ÐƒŽŽ‚#<\0„\0\0€°CØUvhÂŽÁ `”;b£³—@Ø\0\0;„ ìÐ„½ttv¤†À@Ø\0\0;„ ìÐ„UtôÔõv\0\0\0Âa;4aG—u´y_ß\0Â\0\0@Ø!ì\0a‡&ìèt@ÑSSPá ì\0\0\0„ÂvhÂŽ>Óv­?ü0;6ûÙm¯g\r\0a\0\0 ìv€°CvôYÐ‘AÅgœ‘Åâg¹G©ë	<\0„\0\0€°CØÂMØÑgAGˆ‘Gbe…AG¾]sÍ5-û­á ì\0\0\0„Âè†(r;4aÇ±JÅ‚‹ör/o\r\0a\0\0 ìv@]yå•éÞ{ïMÍÍÍÂaÇ€ëß1\nã©§žêrÐQjj©rŒÎ#¦´v\0\0\0ÂatÁÈ‘#S<‡GŒ‘î»ï¾’¡GwÃŽÕ«W§‹.º(xâ‰é¤“NJ^xaZ¹reëóÅäj*ñ±Ä°#úv´=–.]ZÖuÊ\r:\n2:tÞÿqÇg„€°\0\0v; \\räÂÑ\"ü˜3gN‡ù¢ïºuëÒ‹/¾˜þô§?-ìvôIØ‘oãÆkw¤Gg§’*h¼ÿþû]\n:ò¬á ì\0\0\0„ÂèF18ßÆŒ“æÏŸßcaGŒæˆçÄÆÙ·gÏžtÅW´Œú6lXÚ¹sg«P`Ò¤Iéä“ON§vZzà²}q[çž{nv«®ºªd€ÐÞí¶‡~8»þ¨Q£²óq8?{öì´oß¾tíµ×f×Û?~|:pà@Ñà¢ðü¶mÛÒÐ¡CÓ	\'œÎ<óÌ´jÕªV—™0aBv{§Ÿ~zzè¡‡Êþ{\\|ñÅéüóÏvt±›Þª«kf<þÝ¿ûw]:ºûx\0v\0\0\0Âa]*¢ÖÖÖ¶üŒ£%b„DÍGµêêê²52¢0ÅÖø–yÐ£p~ýõ×§n¸!}ãßH7Þxcúö·¿ø§L™’¾ûÝï¦[n¹%Ý~ûíéþÏÿ™¾÷½ï¥éÓ§§þð‡éG?úQúÇüÇôÓŸþ4ýüç?Ï‚€Y³fe…ó(ÞÏ;7--Z”üñ¬ÀûÌ3Ï¤ßÿþ÷Yá½T18ß¢è#=ºvÜ}÷ÝY!‹(ðÇü¾ø»Ä¾ñ±víÚìô%—\\Òª¸¿`Á‚´~ýúìô©§žší‹!¿/~¿RaG{·_ØvíÚ•íûÏÿù?gç?ó™ÏdçwìØ‘ýŸâtüMçÍ›—Žÿ[GaÇ¥—^šŽ¿uü<çœsZ]&w„6q:‚œrÿ1%S<^aG×ÂŽÂ‘ñ·ìîHŠbGw‚Ž¶‡5<\0„\0\0€°CØA¯Q£@k\\ìß¿?íÝ»7ûö}|“óæÍé•W^I/½ôRzþùçS}}}Z±bE2DØðÄOdEî!\"Œˆ0!Â‰)~ñ‹_¤™3gfáE„?þñ³P#Â9î¸ãŽ,ôˆð#B©S§f¡H„#\'NLßüæ7³Ð$Â“ë®».+ÒGA7Â•«¯¾:[¢˜!F´ŽŠÁùÖ”Ç\ZqßxÄó#Ø#Úˆc[© áøãou½C‡e­TØÑÞí·mgŸ}v¶?þWñó¬³Î*y_í=Æüùüõ:šÆªØïÕÞß#COOcUn_¨í¼óÎëÖkBL]ÕvDGœíÝ+në7ÞðÂ ì\0\0\0„Âz>ì(¿G±ÁHŒÉë‰°#ßb¤Da¿0H(\'h$”v´wûùëÅ¨“8ýå/9ûaQá4\\…÷¡MO†Å~¯¾\\ëc0ìˆ‘V4Æïò#;º:‚ÂÈ\0a\0\0 ìv ìè\'1*¥m8¦f*¶€swÃŽX¯\"ž«W¯ÎF»ä‹À±/¦ýŠó1W~ñò‹.º¨ÃP ¦v\Zrt\Z«üÔRÅ‚€ön¿mËßN¬±?yä‘VSKNcÁHì‹é§â|L³õØcÆ*Fµ)2U±ß«3ž@CØÑ6ä(,X³@Ø\0\0;v;ªH¬‘/Ç:!q¾”î†±öDìcÔBL×tá…¶,ÖÝÔÔ”…	ùÅ¿#ÄˆéÀ:\n¶lÙ’…LÄ4]¥ŠþíÝ~Û‹ŽÇãrtZ©X,<¶Çåqqýhtä(ðÁÓ)§œ’Ý~L%Vø8¶nÝš.¸à‚ì1ÆYötô{uæïÑv\n,aGñ°#þž1]\\±£XÀPîHŠbAGœ©«Šm/7ðèî\Z\"\0;\0\0\0a‡°ƒAvDXÅùöBŽž\n;´Þk\ZåGÉ;Zko$GGGGAC© #ht´¿”X¿ç¸ãŽt\0;\0\0\0a‡°aGOvTnûâ¿˜-¨.ìè9¬(7Èèlà‘Z¦NêŸ\0 ì\0\0\0„Â„ÂMØÑ=¥Fxt6À(÷ò‚\0a\0\0 ìv ìvhÂŽ#<ÚN)U¸>Ì2§¦*x\\sÍ5­îÇ\Z\0Â\0\0@Ø!ì@Ø1ÃŽ!%$¯ÖÖß¿°£tàQ¸hyapÑ™EÇK]¯³‹¢ ì\0\0\0„Â„Âa‡°£ÓÚNiAEŒÌ(7è(<\n¯×6H@Ø\0\0;„;`Ø‘\0êêêÒI\'”Î9çœ´qãÆVû&L˜N<ñÄtúé§§‡z(Û·oß¾tíµ×f×‰}ãÇOhu½I“&¥“O>9vÚiéÈöíÙ³\']qÅÙuâºÃ†\rK;wî<æqmÛ¶-\r:4pÂ	éÌ3ÏL«V­Ê¶?ûì³é¬³ÎÊ¶ÇãyðÁ[ÝçÅ_œÎ?ÿül[üçž{nv?W]u•°£Êî*6E\0Â\0\0@Ø!ì@Ø1€ÃŽþçN‹-ÊNÿÝßý]«}±=‚ƒ8ÁEì‹ #Î?üðÃiÞ¼yÙé<\n¯·`Á‚´~ýúìô©§žší‹P%Î¿øâ‹iíÚµÙéK.¹ä˜Çué¥—fû\"äˆŸÂÄö:V¯^vìØ‘m?å”SZÝçÒ¥KÓ®]»²m–äGþwvŽÀ£§ƒ\0„\0\0€°CØ°£\nÂŽC‡e-NÇ¨‹bÓ>Åéã?>;—éÎõ\n[þz…-¹¶Û·nÝš¦L™’Þ(¼ŸÂß£ím>FaGåëîÔS¦®v\0\0\0ÂaÂaG6íS©Ð\">.Óöz1eUG×+ Ú{\\¥ÂŽ˜Ò*¶?úè£EÃŽb·!ì¨ÞÀ£³#3,F ì\0\0\0„Â„ƒ8ìˆµ8òÂ¿øÅC‹ütT…ÓXÅÚ]oÄˆÙéXÃ#¦²ŠÓ]tQÉi¬V®\\Ùj\Z«|€‘¿n{aGL5äè4VùÇ(ì¨ŠÊÔU\0Â\0\0@Ø!ì@Ø1ÈÃŽXo#¦šŠé¡bª¨ŽB‹X |ìØ±Yø-‚Ž¶”»^SSSËbèq½$b1òbÓU]pÁÙBägŸ}v¶NGlŸ1cFv½¶Ž2¶lÙ’…$qñX…7ðˆ°..7uêT4\0a\0\0 ìv ì¬aG\0ƒ©	;º¦£58bûqÇ\'è\0v\0\0\0ÂaÂŽÁ\ZväGf#„•¬ÔSW;\0\0\0a‡°a‡°CvTmà!è\0v\0\0\0ÂaÂa‡&ì¨ÚÀã¼óÎt\0;\0\0\0a‡°a‡°CvT§X£#^J­á1Plß¾=­Zµ*-]º4ë;Zÿ·%K–¤åË—§Í›7{\"‚°\0\0v;v;„x}è(èX±bEÚ½{·çN…µ={ö¤eË–¥M›6y\"‚°\0\0v;PÌv;ðúPJŒètTvà#n\0a\0\0 ìv ìv;ðúPBÒ=g<ŸAØ\0\0;„(f\n;4ÅQ¯^4Ïgv\0\0\0ÂaŠ™Š›šâ¨×‡J=h|ëÝô­9k³§=×<ŸAØ\0\0;„(f\n;4ÅQ¯ýzpøðÓ¾ƒïµœ_þjSKØ§óÛw¿ÝœÞ~ç=Ï=Ïgv\0\0\0ÂaŠ™ÂMqÔëCå¼DÐ1{åÖôyëÒS/ïJË^iLÓæ¯o	;âtllÍÎ45w™?ùZ:ð®ÀÃó„\0\0€°CØb¦°CSõúP!¯{4§)s×µ„µI¿})íØ{ÐóÏó„\0\0€°CØb¦°CSõúP9¯¯m(;ì˜ûoÛ<÷<ŸAØ\0\0;„(f\n;4ÅQ¯•õzSWåÃŒÉ¼”þÃiKÓÛY‹Ó±-¿ÿ‰—\Z<÷<ŸAØ\0\0;„(f\n;4ÅQ¯•ñzÐøÖ»Ùä…ktD¸Ñör±­p\r¸N\\×sÐó„\0\0€°CØb¦°CSõúÐ¯¯Å¦©ŠÑm/ÛŠ]ÖsÐó„\0\0€°CØbf¯[ºt©¢â(^„žÏ ì\0\0\0„Â3«×Š+ÒîÝ»hkjjÊ-¼>t5ì0•°„\0\0€°CØbfÅÛ²eKZ¶lYzóÍ7hÐ±iÓ&Ol¯];þ¼@ySÙ”Çe=… ì\0\0\0„Â3û<ðxúé§³\"š6pš ÃëCO†O®k(:MU±ö¯kv\n&„ ì\0\0\0„Â3¯•vì=Ðœ¾3o]ÙaÇMs_J»ßnN;@Ø\0\0;„(f^*#ìh~ïpšùôælªªÏoOÏ¼Òz\r8½ì•ÆôÔË»²PäWË·¤C‡\'„ ì\0\0\0„Â3¯•vä¦ý^p< Ï‡q:¿ý­ƒï	:„ ì\0\0\0„Â3¯•v´mo½ÛvÄiA„°„\0\0€°CØb&àõ¡ªÂMØÂ\0\0@Ø!ì@1ðúÐgÆŽ›žzê)a‡°„\0\0€°a‡b&àõáòª}ÜÑ\"ôXºt©°CØÂ\0\0@Ø°C1ðúPaG¾7®èHa‡°„\0\0€°CØb&àõ¡*ÂŽÂ‘…¡‡°CØÂ\0\0@Ø!ì@1ðúPUaGáH˜ÞJØ!ì\0a\0\0 ìv ˜	‚×‡Ü„•ßzìéÂ\0\0@Ø!ìv\0ðfÌ˜1iîÜ¹Y=;Œìð~Ž°\0\0v;P¨Š°£mÈ‘×^Ø±zõêtÑE¥O<1tÒIéÂ/L+W®ìÑBþÑ‚ä€\n\'fÏžN?ýôtüñÇ§‹/¾¸Û¿¿°Ãû9Â\0\0@Ø!ì@qÔaG]]]š3gÎ1!G9aÇgœ‘×­[—^|ñÅìô§?ýiaGí„NÈ~§¤C‡	;¼Ÿ#ì\0\0\0„ÂG\0º¢ÔHŽÎ„1š#Þÿ6nÜxÌ¾={ö¤+®¸¢eÔÇ°aÃÒÎ;[ð\'Mš”N>ùätÚi§¥x Û·uî¹çf×¹êª«Jû-Z”Î>ûì,8ˆËÆ‰-[¶\r\nÏoÛ¶-\r:4»Þ™gž™V­ZÕîöö~öC©}q;ùÇ“Lí=^a‡÷s„\0\0€°CØâ@7µvÜ}÷ÝYÁ0‹	&d#<òûbÄHì‹k×®ÍN_rÉ%­\nø,Hë×¯ÏNŸzê©Ù¾òû\"0(Uì?å”S²í[·nÍ¦ÓŠÓçŸ~‡áÁ¥—^šŽ0#~žsÎ9ínoï÷hï1tõñ	;¼Ÿ#ì\0\0\0„ÂG\0ú0ìˆktD G¼F\0ÛÛŽ`ˆÛJ÷cýŠÂëÅôNÑJûc}Ø#\'\"¨˜1cF6\n££ð ûmo¯£íÅ~öCWŸ°Ãû9Â\0\0@Ø!ì@q ÃŽ|Û±cG«  0´èhŠbaDGaGì‹Çöo|#[\'$.kˆôVØQì÷hï1tõñ	;¼Ÿ#ì\0\0\0„ÂG\0ú0ìˆµ-âý/¦izþùç[ôGŒ‘µ8ò‹—_tÑE÷cŠ¨!G§±š7o^Ébÿ\\Ð2íÔ®]»²ÓŸüä\'³}±Hœ)²{ì±¢ÓXÅˆ”!E¦±j»½½ß£½ÇÐÞ¾¶¿S{WØáýa\0\0 ìv 8Ð‹aG¬a…ÿýÓPÅÔMù…½›šš²é­bqîØ!F,ÞQØ‹xGÐÓ?;¶d±?në«_ýjvûqÙXãÙgŸÍö=øàƒÙš±oâÄ‰­n#ÖÐˆ \"®ˆGPÓÞöö~öC{ûÚþNí=^a‡÷s„\0\0€°CØâ@/†Ze4a‡÷s„\0\0€°CØâ€°CØáýa\0\0 ì@Ø¡8 ìÐ„ÞÏv\0\0\0ÂaŠ#\0ÂMØáýa\0\0 ìv 8 ìv®½öÚìý»½6fÌ(a\0\0 ì@Ø!ì\0vhÂŽÊ´|ùòÃŽ¹sçúC	;\0\0\0aÂa€°CvT®qãÆ•:êêê²¿Â\0\0@Ø°CØ ìÐ„«½ÑsæÌñvTê‡Š¾þúëóêëë?\\ºtiö×ú¿-Y²$^SöæÚ(}\0„Â„\0ÂMØÑ§Š­ÝkuÕ!ì¨Ôt¬X±\"íÞ½Ûk\\…µ={ö¤gŸ}öÀ’%K¾æã/\0€°CØ°@Ø¡	;úL±ÑÖê ’ÃŽÑ!è¨èÀã¹×ÝW}ü\0v;v\0;4aGŸ\Z?~¼QTMØSWym«ø×Ý÷}ü\0v;v\0;4aGŸŠâq>ì˜?¾?vxÝ­Ž×]\0„Â„\0ÂMØÑçòkwÕÁ@	;Þ}»1½þÜ¬´aÉY‹Ó±Íë¢°\0\0a‡°a€°CØ1@å×î€v¼³¿!­ÿÝ´ôÒc“[µØû¼6\n;\0\0v;v\0;„ÐwÞ™½ŸÇO¨ö°cÇ†9&èÈ·õÚ(ì\0\0@Ø!ì@ØPÈB¹ÂŽà?øAúÈG>’Î;ï¼ìç­·Þê\"ì¨ê°ãÕg~P2ìˆ}^…\0\0;„;\0\n¬X±\"íÞ½[q«B[SSSHÑqÐ‘8bdÇqÇ\'ðè¢]»v¥Y³f¥›o¾9]}õÕiÄˆ-‹¿G‹óuuuéÆoL?ûÙÏÒÆ…½v¬_|{É°#öy}vtGmmí\'jjjrOéË˜kÏäÚŽÂçy®5æÚªÜe~‘»ìØÜé¿T\0\0„Â„\0mË–-iÙ²eéÍ7ßTàªÐ cÓ¦M:j™AGGÛ)mÑ¢Eiüøñ©MÁ³ÃV[[›…÷ßE-/ìÐ„Çºì²Ë>WSS³ ÷Ü=ÔÉçúû~äZÝÐ¡C?ª4\0\0;„;\0*6ðxúé§³âŽV9MÐÑ¾ÁÑ^ ‘ßo\röÅÂîcÆŒétÈQ¬\Z5*í!ìè~Ø±aÉ%ÃŽØ\'vtò3þßäÚs=ñ<ÏµWc´‡ò\0\0 ìv ì\0\0z(èè(È0Â£}ñwi[È9rdš>}zš7o^Ú°aCjllL‡Ê.äÈ‘lÚ»áæÏŸŸ]nôèÑÇÜÆ¸qã²UØÑõ°cóÊŸ–;bŸ@BØQ®ÚÚÚéGGfôèó<×žÈÝÎ§”	\0\0a‡°a\0Ðù\0£Ü½ü`°ÿþl=ŽÂÂeLE5{öì¬ÈÙÍÍÍiáÂ…iâÄ‰ÇCüqaGÃŽ}\rëÒú§n;v\n«Ü¶Ø\'vtdøðá;ºG¯=Ïkjjöç~U*\0\0„Â„\0@‚ŽÎŽÔx´:®¼òÊVËiÓ¦eßìîŽ>ø 7âã…ëyüæ7¿vt!ìˆ¶õù‡Ž	;b›0BØQfÐ±¢/žç¹öN®}M¹\0\0v;v\0\0½tôÔõŠ¶#:b\Z›(`ö”†††4yòäV÷1wî\\aGgÃŽÃ‡Óæ?Ì<v\n«Ü¶Ø\'vtð™þ™>~žª©©ù’’\0 ìv ì\0\0ÚÑÑbäÅíÔÞ1[9·3µ]££¾¾¾Wî\'æþyþGx¬Y³FØQfØñÎþ†´iå}%×ìˆ}q¡„°£˜£ktôùó<FxäîûLe\0@Ø!ì@Ø\0´Pt4U9aG¬#<–/_~ÌˆŽÞ‹ßu×]-÷7bÄˆ´k×.aG{aÇáÃ©qóÓéå\'¿[2èÈ·¸L\\Ö(aG›ÏòS¸y_?Ïs­±¶¶öJ\0€°CØ°\0(L”³ÖF¹aGgow =zt«¹û{rJ›R<˜Æ×r¿S§Nv”;:\ZÍa”‡°£555kúûyž{÷*\0\0ÂaÂ\0 M QîŒÎ„ƒ-ðX´hQK!²®®®Û‹wÆ/¼Ðj:«7\n;Š„åŒæho”‡€BØqÙe—}®žçG,ÿKå\0@Ø!ì D‘#úý`úv\'\0¤ £+aGþ`0Liuíµ×¶\"gÏžÝç÷Ï=÷´ÜÿÍ7ß,ì(vt5èÈ7…°#÷üz´Ržç¹öCå\0@Ø!ì ŸŠ)çwÞ ^°\0*EWˆ®„]\rVªI¬“‘/@Ž92íÞ½»ÏÃ–-[Z­²wï^a‡@AØÑƒbŒÜsëP¥<Ïkjjö×ÕÕý…\0 ìvÐOß\ZâÊqÇ\'ð\0€~:º2Ú²«aGá1Aµò;vlzê©§Ú½Ì¬Y³Z\nÓ§Oï·Ç:qâÄ–Ç1gÎa‡@AØÑƒjjj.¯´çymmíW”\0\0aÇ \n;öïßŸæÏŸŸ¾ÿýïgÈM˜0!û&Nþ\0ñšk®IS¦LIÿ÷Ÿ}(|ýõ×UAz)è,ßî€JoîjàÐ°#ÿÕö¥‡ü1c„K—.-z™˜6*¹yóæõÛc}ä‘Gút¡òþ;jkkçÚß\n;„}Ý¯bÚ¨J{ž[¨\0v’°ã÷¿ÿ}öA~Ô¨QYÈ±páÂ´nÝºl¸ñ|Ðr¹}ûöe‹8>ùä“Ù¨£GÎ>þÓ?ýSvN÷¾5Zª˜Ño•\0]:º4t7ì(ç¡RÃŽ|7nÜ1#=®¾úê–ý}µ8x1õõõ­Â™v|£}qMMÍg…ÂŽ¾êW¹ýÏTÚó<¯\0 ìècå~«\'ÂŽ˜Ç4><Ç¼øÆM„qäÈ‘´råÊ, ¹þúëÓ‚TGºXÄè(È0Â\0ª\'èè©°£ÚŽÚ†…aB>ô1bDËöÆÆÆ~{¬Û·ooyñ˜rØQÐž(ö9CØ!ìèé~•Û¶£Òžç¹Ö¨º\0;úéà±£o`u÷ƒóoûÛì›u¿þõ¯Ssss·$Ÿ{î¹ìÛ{1ÍUL‡EùÅ‹rGlTëüÝ\0P-ÊIQbôt«öc€RaGáHÂó‡ê·Ç\Z_Ú)|,ƒ$ìhùœQXœv;zº_Uêó\\u\0vôÿÁã%Fztù ïÇ?þq6ã…^èÑƒÉƒ¦3f¤«®º*mÛ¶MÅ¤¾¥)ð\0€ÞñÆodéóÎ;¯œ¢uŸ†!WGaBµµJ\ngSØQø9#¾\\%ìvôt¿ªÔç¹ê\n\0 ì¨ƒÇ\"Ó[u9è¸á†²õ8zK,^ëyÄºô\\ÐÑS×\0Š+gzÉ!Fv”UT,lcÆŒIsçÎÍŠ¶ƒudG%‡NÂŽÊoÕj\ZÙ\0 ìèðX]	;bêªÞ:ò-Z”®¸â\n#<JQºTTÛ‚¥\0P-¬ÙÑsýÂ#Ïšñ¹â¹Üç‰/\r:ô£q¹Þ;î¾ûîô™Ï|&pÂ	éãÿxö7Žõc_þyQ\r!C¥<Ö*ÙÑÒ¯¬Ù\0Ðõâÿ lýà.bŽµk×öÙÁåÃ?œ®»îºVp=÷­L#<\0 wî¼g÷DØQm_nÈ§ÖÕÕe#}‹Æñhþr7nì·ÇZ__ßjõAv´\n9òz:ìˆimã÷ýüç?Ÿ}«?¾çÏ9çaÇÀ;ŽéW¹mÏTÚó<fJP]\0¨œp§íAd§ôn¹å–l1ò¾6qâÄtï½÷*š´)š|øá‡ÙëøÙm¯g\r\0èÝ÷î®\rÝ\r;zè¡tÜqÇUÕ—\ZŠähë¦›nj9¾7o^¿=Ö¸ïüãˆÇ4ÀÃŽUµµµ_irôVØqî¹çf¿ï‚:öíÛ—®½öÚtÒI\'¥O<1?>8p Û!ÉÙgŸ‰ý_|qËè={öd£Èã:±oØ°aiçÎÇÜW{·Ÿq»çŸ~¶-\nóñøãò±aácmï>‹ÝÖ ;Jö«Ü¾û*íyIµ\0 ÿÃŽ¢ßÀêÌçßÿþ÷Y¼¹¹¹Ï0\Z\ZÒÈ‘#Ó®]»KŽ+\"¨8ãŒ3²Dñ³ÜÀ£Ôõ\0Ð;º3²¢;aGþ½}êÔ©îoúË_þ²å8wúôéýö8&OžÜò8~ó›ßÔ°£Ôçˆ^\r;\"œˆß7*´vD§cDx¦ãt±ï”SNÉÎoÝº5­^½:;bôPœñÅ³‘ëqú’K.9æ¾Ú»ýüãXºtiöY%¶åþV-AM~DJþ±¶wŸÅnk\0‡ö«ÚÚÚQ•ö<Ïµ¯©6\0\0ô_ØÑî7°:óÁ9>¨ÏŸ?¿ß2ï¹çžA;ÕR±o…FðTX\0)\'ð(:òíšk®é‘bÌÿßÞýÇX]Þ‰w1ÖkÜÄÖØ¤k6»ÙÓ³üa¼	Á4æ&ñ&½mo—2€€€ øT„Š?©ìX]mwµ 4-†²e\"•KÅ^pYXŠ¢T)™\n(0à:ÂŠÍsçó½žñÌáœ™3?Ï™9¯Wò„33gæÇùž™ó}Ÿçy\0€žý.ÈØ1œCGˆWæçþÞÄœ<yrÐïCÁ:þƒò¢œJÄŽrõwì8÷Üs³ÿÞ˜UÑ]ìˆYq9–»Š—ã}ñ±Q£FeoG<¹îºë²å±bvEþçåÜçå®¾~îóâý]]¿ð¾»Íb_k¸ÆŽr´ÛÙ~lª¢ãüTûsë¿p¶\0`ðcGY¯À*÷‰skkk\Z?~|öd£RbvGû—5·wG©\0Q,\\t<Ê½¾=<\0`à~§÷tI©ÞÄŽZyñBþ¾•xAÎâÅ‹;n?–\\µ;boŽsÊ\\Æ*–ƒ*Œ^xaö±x;îÛí·ßž.½ôÒŽ¿£DW÷¥«¯N‘ý8Ê‰ÅnóœÞÛc¨ÅŽ/ž×¾R-ÇyûXêL\0@u+ë¼øÃòþûï¯ø“Ú[o½5­[·nÈ=Y½¹ßÝmF^nÀèi±¤\0\\ðèÉïØžÆŽZúž¿”Õ-·Ü’<,¹%Vs·¿uëV±£ŸcÇ3Ï<“ý÷^ýõÙÿÛ^x!{ûoÿöoÏ\n¹¥¡ò—™ŠŸ‰øØÕW_½ÿböM\\þÚ×¾–}¬®®.{{É’%Ù²RqyôèÑgÝ—®¾~±@ËRåBMîú¹ëtu›bÇÙò—²ªôqÞþÿîïœ>\0\0±ãÑGMkÖ¬©ø“ÚE‹\rÉW)æþ@ŽèkðöçÉŠîBFOCGþíµ\rM`(èÉ,ÊžÄŽž†”¡.NÞN˜0¡ãï¬_|qÐn{Á‚·{7–ZŠ1\"ÄFßù›‹G´(¶Ayü³&bÄIñÜ^Hßþö·³Ï¯ûu¼úê«ÙÇš››³‘Ûx<\"E\\¿Øå¥¾~±@Ë¬ÅÌ”¸½ü¥g»»M±ãl±RAûqöûJçcÆŒùµS\0\0Ã$vÄ¬Ž]»vUüIml*KÕØ‘Ó¦Mër¦GO—’*4Îœ9Ó«ÐQxÒDð\0€ÊrcGo–È\ZògwÄ+°÷ïß?à·¹víÚN×Åß§bÇÀÄCìù³;*tœŸ3fÌN\0\0“Ø¯^jii©øÚx%TLýê±#¦GaôèížÅ‚ÇW¾ò•^‡Ž¾Þ\0 ï¿cË‰µþ»zúôé[Ýyç©­­mÀnkË–-–µyê©§õ¿Uì0j1v„öãmM¥Žóö1Ãi\0€a;â½Ï?ÿ¼jÂÁp‰ù3=by«¾Î¤(<ú:\nO¢ØÃ\0úW_—žªµ¥«Š‰%€ÆŽÛñwÕÂ…ÓgŸ}6 \'@cù¡ÁÞ”\\ì0ÄŽsÎùÞ÷¾÷Õöãîè`ç6%\0†±£šCwá`¨Žï|ç;ÙØ‘#GöéûKWÎèˆ·ãý}÷+¾Ö`L€Z=}±ƒ#|)^4’ÿwU¬µû,ô—XÒ&ÿ•ÞñB•ÖÖV±Cì;Ñ˜1cþ{ûh¬ã¼}¼ü½ï}ïÏ2\0\0f±ÃÌŽ	4\'NL\r\r\rÙ“þxu¦™\0_:xð`¶‘mœ<FåÇúõëÓ¦M›Ò¾}ûü€–ø][nð°ÌäÙV¬XÑéï¬xuö¶mÛúô5:”|ðÁ³fäV\"tˆF­ÇŽ0vìØÿÕ~ž\Zèã\\è\0\0Æ±£Zöì8zôè°Ø³£0rôÇÉ{v\0t›7oÎ~w9ÁU]#~—766¦½{÷úAíåïÜeË–e×›7ožoZÕ«WwZÒ*F}}}Ú³gOC/^\\ø*ïléªJ…±Ã;þ¿¿ÿû¿ÿíÇãÇuœÇÒUB\0À0Ž÷Ýw_zçw*þvûöíiòäÉC6vÄ+âU‡Å\"G±“åÎ¤(:âíXºªØûË\r}ÝC RbF‡ÐQÝÁ#fÜPúwo©¿âý#FŒ:º°sçÎìÅ1…/6¹í¶Û²¿Ã\"„Æ²œ¹õþãß8é¯_¹reš;wnÑ¹ƒ½¹Øaˆ¥;öòöãò½~>ÎÏØŒ\0 bÇ£>š­aZi‹-JóçÏrOº»šÉÑ×Ww–\n¹ ÑÝÇ»zÕhœL:€¡(N¤;±Uý\'ÝèÙß\0f[–/f_Ä÷©p–GoÆŒ3²ÜT±Ã;¾³/ÚñúÂY½cÆŒùuû¸Âé\0€\Zˆñê—…Vü	^,P\rÑe°_ÝYê¤F¹!£§Á#w2Å«F¡ÊI7±c¸¡£wšššŠ­Å_Öˆ¿;c–X5;±ãlãÆûËöcö‡ù›——9bï¥uuuç´\0\0@\rÅŽÃ‡g³ÚÚÚ*öä®¹¹9{u^%ïC5½º³§£Üë@­ÅŽ#~’î\\ñf6â²bbGµý\r0räH¡£âïÇØÏ#fÇã…Ë\\ÅÛS§NM÷ÜsOZºtiö·o5;±£´I“&ý·/öóx<6/²ÌÕ‘öç“ÿÖþïScÆŒù~ûå¿p:\0\0 cG¸÷Þ{³\rE+å™gžI³gÏ®É\'è¹õ¹óOrÄòsz¸4U±àqÓM7uº\'S€á;NŸþ¯tüä§ooúCsGìˆË¹÷·|Ô–>úøS\'ÈÄŽŠºùæ›cy•´`ÁßÄCì\0\0€þˆñj¸»ï¾;}þùçy5Þ¸qã²¥jUá†¥ùá¢\'›Ž—ú¼žnŠ0cG„Žå[ÞM?X¹+­ûýáÔ¸ûHºÕÛ±#.Çû_Úù~š×~\'ûŸéÄ\'‚‡ØQ9“&MÊ^‘b‡!v\0\0@?ÅŽ0sæÌ´yóæAbW__Ÿ-+Pë\n—´ŠP33Ê\rùÁ#ÿó\nC\nÀpÇN´¥¹\r»:âFwãî}+½wì¤“dbGEüüç?ïX~¥–_ðØaˆ\0\0Ðï±#6uŽ[[[íIÝÎ;Óøñãõ6‡Rðè«bKd×Øcí›‡ÊŽ\rÿqÀ	2±£\"r³Zs±Ã^Zˆ†Ø\0\0ý;B<ÙþÉO~2(ËYÅæñD?–Ð¢ÿƒG‡€¡;béª\\Ì˜óü[éWÿ¾?55”¸ïË}üå·9A&vTÄc=Öií±cÇ¦cÇŽùÆˆb‡!v\0\0@ÅŽøC96Ç^¶lÙ€>™kiiI7Þxczâ‰\'<³-¢¯KOYº\n¨µØqäÃO²\rÈó÷èˆ¸Qx½x_þñ9ñ¹N”‰ƒ%¢FÄüØãÇ?þ±oŽØQµ\'«7lØà±­ºÇ©öÇÝ3žþ\0 vˆ7ÜpCZµjÕ€<‘‹¯¡ÃŒƒò‚EO¿O6#j1v[¦*fs^/ÞWìºN”‰ƒ%fÑ†ŽuuuÙòVˆÕhÓ¦MGâÅJßªs:tè_Ûwÿàé/\0\0bG±Qf¥K—öë“¸Ø£#–®2££gá¢Üàaé*@ì;ÄŽêµk×®¢¡#7\Z\Z\Z|“ÄŽª´qãÆo566~ôÁ|ê1®ºftDèX¿~ýöñ¿=ý\0@ì(!f`Ü|óÍiæÌ™éÀ}úZñJÅúúúl3r{tLðˆ¥Çâz69j1vXÆJì\n¦M›Öeìˆ¥D;ªÕúõëÿgû±ý»X.)Žq£*Fü¿øƒÐ\0€ØQ¦XC:fcD¬øãÿØ£ÏmnnNK–,É>ÿî»ïN­­­žÉöBw{pÄûGŒ!t\05;¾Ü ¼¹ì\rÊãºÂ„Ø1XbÖì¤I“²¿‰b”\n›6mòÍ;\0\0\0ˆØ\"R<üðÃÙzÒ1Ûã\'?ùIzõÕWÓÁƒ;]ïøñãiûöíiÑ¢EiÖ¬YÙœ³gÏÎžàÓ7¥fxXº\n;¾¿Ýu¨è2UÅÆov¾/LˆËzÎ™3\'íÙ³\'ëÖ­ËþEì\0\0\0`€bG¾\r6dá#–b(|ebÄxÕâüùóÓÚµkm´9ÀÁCè\0ÄŽ/Ç±mé+w•;îix+µ|Ô&Nˆ³páB¿Ã;\0\0\0*;¨Žà1räH¡;òFÛ§§Óâû²¥ª~½ã`zewç=<ârãî#iÝïgQä›šÒ©Ó§Å	±£bâwx;\0\0\0ÄŽš{tÄLšR{x\0ÔbìÈæÖ/7\rÈs±#.çÞÿáÉO…±£âæÎ›-eb\0\0€ØQ³\"v\0ˆ]#~Ò;â²!vT“Ø×,ö9±\0\0@ì;\0†‰cÇŽõ{ì0ÄŽjvë­·¦¥K—úF v\0\0\0ˆbÀp1~üø4þün£‡Ø!vÓ§OO\r\r\r¾ˆ\0\0\0b‡Ø0\\Œ7.{l‹ñÈ#¤ÖÖV±CìÖ¦L™’~ó›ßøF v\0\0\0ˆbÀp1vìØŽØ‘Ï>ûlvò\\ì;†£I“&¥W^yÅ7±\0\0@ì;\0Êñ§?ýiH<®±¼ÕªU«Ä±cØ™0aBÚ¾}»ob\0\0€Ø!v\0”:ŠE„ºººlÄòQâÄë\r7Ü&Nœ˜&Ožœ-±3uêÔtÓM7¥3f¤™3g¦Ûn»-ÝqÇiöìÙiÎœ9iîÜ¹éÞ{ïM<ð@zè¡‡ÒøÃôÿðéñÇOO>ùdú§ú§´hÑ¢´dÉ’ô‹_ü\"-[¶,­X±\"­\\¹2½øâ‹Ù>ëÖ­Ë^Ý^*väFÜ·ø\\±Cì.âØÛ½{·ob\0\0€Ø!v\0”û˜{`|üñÇéøñã©¹¹98p íÛ·/;ÙºsçÎìæ[¶lIY€ˆA\"ÂDD†,\"\\DÀˆA#ÂFŽ<\"|D\0‰A$ÂH’%L\"œD@™6mZT\"¬Är>ÝÅŽÜ2Wb‡Ø1\\ÄÏôûï¿ïØ\0\0 vˆ\0å>f;v¬êïc±qË-·¤µk×v\\Oì¨þÑ]¸ªäˆÀ£pVS·o¼±c6SüÜÝzë­iÖ¬Yé®»îÊâÝ}÷Ý—|ðÁôÈ#¤G}4‹}O=õTZ¼xqÿå_þ%544¤Õ«W§—_~9›±´uëÖôúë¯gQ±©©)‹ÛÚÚ²ûqâÄ	Pˆ\0\0\0b‡ØPŽ8©\Z39ªUÌ:)<)=oÞ¼¢û”;âóFÎ?ÿütÁ¤Q£Fe³Vâc_œP,úy]}l8ŽåË—§K.¹${î¹éšk®éòº=ùÞTëÌŽS§Ne¡áðáÃYxˆ\0!\"‚D„‰*b6S|o–.]šž}öÙôôÓOga#G„Ž>\"€D‰ÙK1séæ›oNÓ§OÏ‚I„“(R\"¨DX‰À’›¡”ûw(ì§ƒØ\0\0 v v\0U¡Ú÷Ø³gOÇ	àˆq2º”rbÇe—]–8ÜµkWzã7²Ë—^ziM®Æyç—}/bvA„€á;ªÐØ\0\0 vˆbÐñêò;vTíý‹Y\'?üpYKm•;b6GüŒˆRê¤},S3?bfCìGRxB?w9^_ïÊ+¯,úõb&ÀW\\‘…ƒ¸^ÌˆYÅAþÛñßüo|#û¼Ë/¿<›]ÐÕû=šmÒž›­òÝï~7[©»ûPêcñur÷§ð¿¹Øý;@ì\0\0\0;;€Šš8qbzíµ×†ÅK9±ã±ÇËN^xá…YÔˆ…\'ð#D¼ˆË_|qÉ“û/¼ðBvÝ¸|íµ×žu[]tQö±wß}7[>+._uÕUÝÆƒë®».»1#þ˜ÒÕû#ºÄÛ1SåÍ7ßÌ.ó›ßìö>ôöþ‰ v\0\0\0ˆˆ@U™<yrZ·n]ÍÄŽ±GG‚ñ;1H©ú±gE©“û±¼SŒ¸³!\no\'ö‰ÅÌ‰?ýéO³YÝÅƒÜÌŠÂ¯×ÝûóGîþtuz{ÿÄ;\0\0\0ÄÄ ªÄ†É1;¡–bGn¼÷Þ{Â@¹\'ô‹ÅŽXªðëÇÇâ>Ý~ûíÙ¾ q½Ø3d bG±½5ºº½½bˆ\0\0\0bbPU¦OŸž\Z\Z\Zj&vÄ^ñ{0–mŠ½JÊ=Á_ìrìç±fÍšìòõ×_Öm]}õÕËNÅÆêqùk_ûZö±X+Þ~ûí·ÓK/½Tt«˜rN‘e¬\nß_WW—½½dÉ’ŽM×GÝí}èêc…ß‹®î¯Øb\0\0€ØØTÔÌ™3³“öµ;bO‹1\"–¨Š¥œr}÷4vÌ˜1#û\Z±ÏEì{Qx[±¡ø·¿ýílÖG,×{õÕW³=÷ÜsÙžñ±Y³fuúúñµ\"DÄçÄâfºzsssÇféñßûuÄmwwºúXá÷¢«û+v€Ø\0\0 v v\0Kýìg?«™ØÑ£\'\'÷\r±Ä\0\0\0±±`wÝuWzúé§ÅŽŒ˜=QlCrCì\0±\0\0@ì@ì\0*`îÜ¹éÉ\'Ÿ;±Ä\0\0\0±±šî»ï¾T__/vbˆ\0\0\0bbG%<x0Û`xÃ†\rÙ‰4cèõë×§M›6¥}ûö9¨ØÃ?œ,X vbˆ\0\0\0bbG%CÇæÍ›SKK‹‰Ãl=z4566¦½{÷:°PÌêˆÙb‡!v€Ø\0\0 v vTHÌè:†wðˆ;œ\'žx\"Í›7Oì0Ä;\0\0\0ÄÄŽJ‰áN :9Jï=ýôÓé®»î;Ç3ˆ\0\0\0bb‡“›†“£CÓ’%KÒwÜáñÀp<ƒØ\0\0 v vTûÉÍO>:’þø»¥éõ²—ã}N>:9Zë–-[–fÎœ)vŽg;\0\0\0ÄÄŽj>¹ùqë¡ôöÿ½?½õÒœN#ÞsÒÉÑZÖÐÐ¦OŸ.vŽg;\0\0\0ÄÄŽj>¹ùÞ;ÿç¬Ð‘ï¿³Æ	H\'GkÚêÕ«ÓÔ©SÅÃñb\0\0€ØØQÍ\'7ÿðÊJÆŽø˜NŽÖ²uëÖ¥É“\'‹†ãÄ\0\0\0±±£šOn¾ýo•Œñ1\' ­e¯½öZºá†ÄÃñb\0\0€ØØ!vNŽM;vìH&L;Ç3ˆ\0\0\0bbG5ŸÜ|gý‚’±#>æ¤“£µl÷îÝiÜ¸qÃâ¿eÃ†\rŽÇ3ˆ\0\0\0bbÇðŒû¶<]2vÄÇœ€tr´–8p ;vXü·lÞ¼9µ´´8nªt477gA\n;\0\0\0ÄÄŽ^ÄŽã‡v¥·×=xöVíï‹9	)vÔ²ˆÃ%v455¥ÆÆÆôÁ8vª4tìÝ»×Ab\0\0€ØØÑ›ØãÝËÎŠñ>\'!ÅŽZ×ÖÖ6¬7\"xlÜ¸1û¹1ªg v\0\0\0ˆˆ}§O§}ÿ¾øì%¬ÚßÄŽZ¶`Á‚4fÌ˜ôÃþÐ7@ì\0\0\0;;ª1v|Üz(íÝòTÉ=;âcqQAì¨E?úÑÒŸýÙŸ¥‘#Gfÿ>ðÀ¾)\0b\0\0€ØØQ5±ãôétdßÆôûßÞ[2täF\\\'®k–‡ØQ‹¡#8bfÇˆ#\0±\0\0@ì@ì¨†ØÑÝl³<Ä¡ãGEgr”z?\0b\0\0€ØØ1È±£œÙ]ÍòÄŽá,fpt4r·‡€Ø\0\0 v vT0vô6tä†À v÷ÐÑ]È0Ã@ì\0\0\0;;*;±ƒÒ£Ü=½>\0b\0\0€ØØ!vbÇ€‡ŽžÎÔ<\0Ä\0\0\0±±Cì0ÄŽ!:úëó;\0\0\0ÄÄ±Cì;z­»ÍÈûë\0 v\0\0\0ˆˆb‡ØAE-Ae†€Ø\0\0 v vˆ†Ø1h\n÷ÚøÓŸþ”¦NšýÛ…Ÿg\0±\0\0@ì@ì;±cÐBGnF„ŠË.»,;Yÿ–<J}žà v\0\0\0ˆˆb‡!vZè13ã‹eeüÐ‘7ÝtSÇÇíá v\0\0\0ˆˆeˆ“Üb‡!v”¯T€(.º\nå^ß\0b\0\0€ØØÑÉ“\'§ÿøÇ©­­Mì;jæøYëÖ­ëuè(µ´T¹£§aÄ’V\0b\0\0€ØØÑ…qãÆeÿ-uuué©§ž*=Ä±c¸¿1\"zlØ°¡¬Ï)78t2z\Z:òoÄˆfx\0ˆ\0\0\0bbG¡ˆ¹¿1\"~¬X±Bì;j\"väÆ´iÓºœéÑÓ¥¤J3gÎô*täØÃ@ì\0\0\0;;Ê8é›\'NL«V­;ÄŽšˆù3=\n£Go÷Ì(<¾ò•¯ô:tôõþ\0 v\0\0\0ˆty²tìØ±ÿÆˆÙ1CbüøñiÂ„	Ùˆx0iÒ¤lŒo¼1;©\Z¯&Ÿ>}zš1cFš9sfºõÖ[Óí·ßžfÏžîºë®t÷Ýw§¹sç¦{ï½7Ýwß}é¡‡J?üpzä‘GR}}}züñÇÓO<‘þùŸÿ9=ýôÓé™gžIK–,IK—.MË–-K¿úÕ¯RCCC-V¯^Ö®]›È}å•WÒk¯½–¶nÝZò¤onÜpÃ\rÙL±Cì¨…Ø‘?Ó#–·êëLŠbÁ£/¡£0xØÃ@ì\0\0\0;è³8A{\\´¶¶¦cÇŽ¥÷ß?8p íÛ·/íÞ½;½õÖ[iÇŽiÛ¶mióæÍYdˆØðòË/gñ!\"DÄˆˆ	\'\"Rüìg?K‹/ÎâEDŒ\'Ÿ|2‹\Z7\"r,X° ‹?\"‚Ì›7/‹\"GfÍš•î¸ãŽ,šD<¹ùæ›³˜\'n#®L™2%‹-]\"bÄèî¤onˆÃ”û³P+ã;ßùNvâkäÈ‘}zœˆ¥«\ngtÄÛñþ¾ˆû_kÿþýŒÄ\0\0\0±ƒÚVêDo„‘˜	’#v˜ÙQ?÷1+d|?BnfGogP˜Ù v\0\0\0ˆ0ÀbVJáÉÞXR«ØFÍƒ;¶oßžFÎ?ÿütÁ¤Q£F¥-[¶dË .öy]}¬Ò£šï›ØQ:röì\0;\0\0\0Ä¨B{öìé8Ùû„ÄÛ¥FìÈÞµkWzã7²Ë—^zé‹bÇÐ‰±¤[,#W,råÎ¤(:âíXºªØûË\r}ÝC\0±\0\0@ì`ØijjÊöùè*rfìˆÙqÜÄý)\rn¹å–læÇ%—\\’ísRr—ã$v|½+¯¼ò¬¯·Çubùx;ö.‰·—/_žŽ?žísŸ·3]Nœ8Q4\\ä¿{µ|ãßHçw^ºüòË³Íß»»ßGÍn;7“å»ßýn¶ïKþç]sÍ5éª«®;úYW39ºÝ…†R¡#4ºûx)ñs3bÄ¡@ì\0\0\0; ·#v<öØcÙ‰†/¼0‹1Ã£0,ÄÆî/âòÅ_\\2v¼ðÂÙuãòµ×^Ûév>œ½ÿ¯þê¯²·ÿú¯ÿ:{û½÷ÞËBG\\Ž ²råÊìrîbÇu×]—]ŽÈÿFdéî~G‰·cË›o¾™]þæ7¿Ùéó6lØÝ_±£:t7³¢ÜÑÓà‘-óæÍ«šïÅÁƒ³Ÿ÷øŸ£òcýúõiÓ¦Miß¾}V;\0\0\0Ä¨Tìˆ{tDˆàÇPR¡áÜsÏ-;N:•¸3\'\noçŠ+®È>öÊ+¯dÿ~ýë_ÏÞ×-õù]ÅŽÜçu·ŒUþýÎ}Nþ(¼­¸–±ª.¥fxô4`”{ýj\r›7oN---Cni¹á>bÆXcccÚ»w¯ƒÄ\0\0\0±*;r#fY”\Zº‹±DTá×™#ñ±o}ë[Ù¿1£#)­üÏðÒŸ±£ðsŠs*°×‡ØÑ³…KJM:µÇKS7ÝtSÙ3I*%ftÕ<bÆ\r v\0\0\0ˆPØ{]Äq³}ûö´cÇŽŽÆ½‰±¿Áš5k²Ë×_ýY·•[¢*öØˆŸþùNKKå/ca$>ËOÅÛo¿ývzé¥—Š.c3SÎ)²ŒU±û]WW—]^²dIÇ†ì£G;†PðÈß´<?\\ôdÓñRŸ×ÓMÑSœHª{8žAì\0\0\0; B±#ö­ˆ“ý1ã!–z\Z5jÔY}—;bŸø\Z±¹÷»ï¾{ÖmÅ¦ãññs¾XV*^	ï\rÊãúqbDèÈmPþÜsÏ¥‹.º(›ý»çßnÜÆÕW_Å“X\"+‚Mw÷»¹¹¹c#õ¸­Ø¯#6:;†ŽÂ%­\"TÄÌŒrCG~ðÈÿ¼ÂR‹†ãÄ\0\0\0±jöäf%\"“£‚G.5Ul‰¬¡üxpäÃOÒ+ÞÌF\\v¬9žAì\0\0\0;@ìèfäfd8ÙéäèPýN*ñxpúô¥ã\'?íx{Óš;bG\\Î½¿å£¶ôÑÇŸ:öÏ v\0\0\0ˆ vNŽV‹¾.=UíKW•óx¡cù–wÓVîJë~85î>’î_õvGìˆËñþ—v¾Ÿæµ_çÉßþg:ñ‰àáx±\0\0@ì\0±Ãpr´ê‚GOgfTófä=y<8v¢-ÍmØÕ7ºwÿë[é½c\'Žg;\0\0\0Ä;\'G«IO—¢\Z*KW•ûx°öÍCeÇŽ†ÿ8àØs<÷«Ã‡§¥K—¦ùóç§)S¦¤ºººôýï¿cÄÛ“&MJ³gÏN‹-J{öìñ …Ø\0\0 v vNŽÒ—€±lÙ²ìzóæÍ6±tU.fÌyþ­ô«ßŸšš?ÊF\\Ž÷å>þò[‡{Žç~±zõê4cÆŒNa£œ1vìØ,~<ûì³Ù÷\r±ÃÓ\0\0\0±±Ãpr”<ÝíÁï1bÄ¥Ž|øI¶yþ7\n¯ïËßÃ#>\'>×1èxîM›6¥‰\'ö8rãÇÏf{ v\0\0\0 v vNŽRÆ¡¸tUwÅ–©ŠÙ…×‹÷»®cÐñÜSqü‹qãÆ¥úúú´råÊôÎ;ï¤#GŽ¤S§Ne×ÿì³ÏRKKKÚ»woZµjUv½	&œõ5¦M›–ššš<€‰\0\0\0ˆˆ†“£”\nC=tˆŽçJkmmÍöãÈ±ÕòåË³˜ÑmmméÅ_L³fÍ:+z¬]»Ö˜Ø\0\0€ØØa89Jað9rä¥,cåx¬Ð1yòäNQâþûïÏfpôÅçŸžÅ˜’¿ŸÇ/ùK`b\0\0\0bb‡áä(9±GGœ@-µ‡Çpy<hÜÝ\\öåq]Çžã¹\'\ngtÄrU*úË¡C‡Òœ9s:ÝFCCƒ0±\0\0@ì\0±Ãpr”œ8q:Ü~»ëPÑeªŠßì|ß±çx.[áÛ¶mÛ‰=>b?ü;wîô\0&v\0\0\0ˆ vNŽR±ãØ‰¶ôƒ•»ÊŽ÷4¼•Z>jsü9ž»µiÓ¦³ft¤ØÌ|áÂ…·WWW—>ìALì\0\0\0;@ì0œe¸ÇŽ¶OO§Å÷eKUýzÇÁôÊîÎ{xÄåÆÝGÒºßÎ¢È/65¥S§O;þÏÝš0aB§=:úséªRNž<™¦M›Öq»óæÍó &v\0\0\0ˆ vNŽRËXEðhnýrÃñØ€<;ârîýžüTèp<—eõêÕÁaÒ¤I}ÞŒ¼\'^ýõNËYíÙ³Ç™Ø\0\0 v€Øa89*vÔÚãÁ‘?éˆqÙ±æxî©éÓ§w‡åË—úíÿã?þcÇíÏŸ?ß™Ø\0\0 v€Øa89*vx<0Ïå‹}2r¡aÜ¸q©¥¥eÐïCSSS§ýBŽ;æÁLì\0\0\0;ÀÉMÃÉQ±Ããáx.ÏÒ¥K;\"C}}}ÅîÇ¬Y³:îÇŠ+<˜‰\0\0\0b8¹i89*vT«©S§¦uëÖy<p<WÍÏ[,•‹+W®¬Ø}}þùçmT.v\0\0\0ˆ vNŽ2bGîdnœ„Þ°aƒÇÇsÅÞ¦L™Òq½Jn¾mÛ¶N÷±\0\0@ì\0±ÃprTì¨ò“Ï¹1mÚ´¢¯¼÷xàx¬Ÿ·ºººŽ9r¤b÷õàÁƒ÷#îb\0\0€Øb‡áä¨Ø1DN>ç¿’=ÿ$´ÇÇó`ý¼å¿ÿÔ©S»¯Ÿ}öY§û‚Ø\0\0 v€Øa89*v±“Ïù¯¼å†<8žëç­šƒØ!v\0\0\0ˆ0Ä	N\'e`Oî•!vTÿ.?kfv v\0\0\0ˆÐ¯6oÞœZZZœD¦£¹¹¹Ë\r©©í3qâÄÔÐÐý¬„JÇŽíÛ·§Ñ£G§óÏ??]pÁiÔ¨QiË–-ÙÇ¾8YYôóºúX©±|ùòtÉ%—¤sÏ=7]sÍ5%¯—ÿµ{s;fvÿy³gb\0\0€Øýª©©)566¦>ø@¦¡cïÞ½~ÐÅŽ.#GN¥cÇe—]–”ÜµkWzã7²Ë—^zé€„†óÎ;/ûz\'NœÈf”ó9bGÿý¼M™2¥ãã{öì©Ø}Ý¶m[§=E;\0\0\0ÄâÁcãÆÙI4cø¡ƒÂ“Ï“&MJ+V¬8+rTKìˆÙñ;6N~—\n\r·ÜrK6ó#fe,[¶¬äì‹øo¯wå•Wžõõâós×Ë}Þ«¯¾š¾þõ¯g$¾ösÏ=gfÇ\0þ¼ÝsÏ=×[¹reÅîkÜvî~Ä}Bì\0\0\0;\0 J•šÉQm±ã±ÇËNJ^xá…YÔˆ…±cõêÕY¼ˆË_|qÉ ñÂ/d×Ë×^{m·³4\"tÄ2Zï½÷^öþ‹.ºHìÀŸ·Ÿÿüç‘¡¾¾¾b÷uÎœ9÷ã—¿ü¥±\0\0@ì\0€¡®\Z6(=:bF@ø}¤XhˆË±ßF© KSÅˆË1“£»Øñî»ï¦¹sç¦«®ºªdà;úOÌ(ÌE†qãÆ¥“\'Oú}Èß¯#ÆáÃ‡=ˆ\0\0\0b\0ˆý7r3,r¡¢Xìè*HäÇŽXÎª»Øqùå—go¯Y³Fì$ùûv¬ZµjÐoñâÅ·?kÖ,\0b\0\0€Ø\0bGßG.8ÄrR;vìÈ.Ç¦å½‰±ŸG.\\\\ýõÝÆŽÜ>¹ÑÅŽ—¿”U,[qj°:t(›Q’»ý­[·z\0;\0\0\0Ä\0;ú>Þ|óÍ4zôè,<ÄU£FÊNB÷&vÌ˜1#û\Z±,U,QÕ]ìøéOšÝî7Þ(v’øï™0aBGpxñÅí¶,XÐq»ñ³‚Ø\0\0 v\0€ØQ5£\Z‚„ØQ¾üÙ1Óbÿþý~›k×®í´WGÌ$Bì\0\0\0;\0@ì¨š³3ŠmH.vT¯éÓ§w„‡;ï¼3µµµ\rØmmÙ²¥ÓòUO=õ”_ì\0\0\0;\0@ì0ÄŽ¾9pà@\Z;vlG€X¸paúì³Ï$tLš4É¦äb\0\0\0b\0b‡!vô¿\r6tZZ*öÔ8~üx¿}ýXº*FÇ´iÓRkk«ƒ^ì\0\0\0;\0@ì0ÄŽþ³bÅŠNÁ#falÛ¶­O_óÐ¡CéÁìôu…±\0\0\0±\0±Ã;ÌêÕ«;-i£¾¾>íÙ³§G_çàÁƒiñâÅfsä–®:Ä\0\0\0Ä\0ÄCìP;wîLuuu\"EŒÛn»-›ý±yóæ´ÿþŽ}=âßˆ1dåÊ•iîÜ¹g}®ÍÈÅO_\0\0\0Ä\0ÄCìT1ûâ8k–GoÆŒ3ÒöíÛàb\0\0\0b\0b‡!v¾¦¦¦³öÜ(wÄ’U[·nu`#v\0\0\0ˆ\0ˆ†ØQymmmÙ~óçÏÏ6/\\æ*Þž:ujºçž{ÒÒ¥KÓáÃ‡Ðˆ\0\0\0b\0b‡!v€Ø\0\0 v\0€Øaˆ v\0\0\0ˆ\0 vbˆ\0\0\0b\0ˆbˆ\0\0\0ˆ\0ˆ†Øb\0\0€Ø\0UmÃ†\r‚‚Øb\0\0€Ø\0C×æÍ›SKK‹¨P¥£¹¹9R€Ø\0\0 v\0@	MMM©±±1}ðÁâB•†Ž½{÷úA±\0\0@ì\0€î‚ÇÆ³å’ŒêBˆ\0\0\0b\0\0ˆ\0\0\0ˆ\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0b\0\0\0b\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0ˆ\0\0\0b\0\0 v\0\0\0Tcì8uê”gŽ\0\0PÅÎœ9Ó*v\0\0\0”ð7ó7ÿîw¿óì\0\0ªØë¯¿¾£ýÏ÷}žÁ\0\0\0qùå—?sÝu×ñô\0\0ªÖ™¯~õ«Úÿ|¯÷\0\0 ¸?o÷ÎèÑ£nÛ¶­õÌÝ\0\0ª¢pœ9Ó\Z3:¾ˆ¿Ý=}\0\0è\"x´‡¾x•Ã0Ã0Ã¨šKW=~ŽÐ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@_ü?cW/Å1UÏ\0\0\0\0IEND®B`‚',1),
('7502',1,'E:\\works\\Fintechviet\\AdServer\\adserver_msb\\target\\classes\\processes\\Order.bpmn20.xml','7501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"OrderProcess\" name=\"Order process\" isExecutable=\"true\">\n    <startEvent id=\"task1\" name=\"Start\"></startEvent>\n    <exclusiveGateway id=\"exclusivegateway1\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow5\" sourceRef=\"exclusivegateway1\" targetRef=\"CancelOrder\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${cancelOrder == true}]]></conditionExpression>\n    </sequenceFlow>\n    <subProcess id=\"subprocess1\" name=\"Sub Process\">\n      <startEvent id=\"startevent2\" name=\"Start\"></startEvent>\n      <exclusiveGateway id=\"exclusivegateway2\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow8\" sourceRef=\"startevent2\" targetRef=\"exclusivegateway2\"></sequenceFlow>\n      <endEvent id=\"endevent2\"></endEvent>\n      <userTask id=\"ShipVoucher\" name=\"Ship voucher\"></userTask>\n      <exclusiveGateway id=\"exclusivegateway3\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow17\" sourceRef=\"SendEVoucher\" targetRef=\"exclusivegateway3\"></sequenceFlow>\n      <sequenceFlow id=\"flow18\" sourceRef=\"exclusivegateway3\" targetRef=\"SendFail\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${sendFail == true}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"flow19\" sourceRef=\"exclusivegateway3\" targetRef=\"SendSuccessful\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${sendFail == false}]]></conditionExpression>\n      </sequenceFlow>\n      <endEvent id=\"endevent3\"></endEvent>\n      <sequenceFlow id=\"flow20\" sourceRef=\"SendFail\" targetRef=\"endevent3\"></sequenceFlow>\n      <sequenceFlow id=\"flow21\" sourceRef=\"exclusivegateway2\" targetRef=\"SendEVoucher\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${eVoucher == true}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"flow22\" sourceRef=\"exclusivegateway2\" targetRef=\"ShipVoucher\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${eVoucher == false}]]></conditionExpression>\n      </sequenceFlow>\n      <exclusiveGateway id=\"exclusivegateway4\" name=\"Exclusive Gateway\"></exclusiveGateway>\n      <sequenceFlow id=\"flow23\" sourceRef=\"ShipVoucher\" targetRef=\"exclusivegateway4\"></sequenceFlow>\n      <sequenceFlow id=\"flow24\" sourceRef=\"exclusivegateway4\" targetRef=\"ShipSuccessful\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${shipFail == false}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"flow25\" sourceRef=\"exclusivegateway4\" targetRef=\"ShipFail\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${shipFail == true}]]></conditionExpression>\n      </sequenceFlow>\n      <parallelGateway id=\"parallelgateway1\" name=\"Parallel Gateway\"></parallelGateway>\n      <sequenceFlow id=\"flow26\" sourceRef=\"SendSuccessful\" targetRef=\"parallelgateway1\"></sequenceFlow>\n      <sequenceFlow id=\"flow27\" sourceRef=\"ShipSuccessful\" targetRef=\"parallelgateway1\"></sequenceFlow>\n      <endEvent id=\"endevent4\"></endEvent>\n      <sequenceFlow id=\"flow29\" sourceRef=\"ShipFail\" targetRef=\"endevent4\"></sequenceFlow>\n      <serviceTask id=\"SendEVoucher\" name=\"Send e-voucher, phone card\" activiti:delegateExpression=\"${sendVoucherDelegate}\"></serviceTask>\n      <serviceTask id=\"SendFail\" name=\"Send fail\" activiti:delegateExpression=\"${sendFailDelegate}\"></serviceTask>\n      <serviceTask id=\"SendSuccessful\" name=\"Send successful\" activiti:delegateExpression=\"${sendSuccessfulDelegate}\"></serviceTask>\n      <serviceTask id=\"ShipSuccessful\" name=\"Ship successful\" activiti:delegateExpression=\"${shipSuccessfulDelegate}\"></serviceTask>\n      <serviceTask id=\"ShipFail\" name=\"Ship fail\" activiti:delegateExpression=\"${shipFailDelegate}\"></serviceTask>\n      <sequenceFlow id=\"flow36\" sourceRef=\"parallelgateway1\" targetRef=\"endevent2\"></sequenceFlow>\n    </subProcess>\n    <sequenceFlow id=\"flow6\" sourceRef=\"exclusivegateway1\" targetRef=\"subprocess1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${cancelOrder == false}]]></conditionExpression>\n    </sequenceFlow>\n    <endEvent id=\"endevent1\"></endEvent>\n    <endEvent id=\"endevent5\"></endEvent>\n    <userTask id=\"Processing\" name=\"Processing\"></userTask>\n    <sequenceFlow id=\"flow32\" sourceRef=\"Processing\" targetRef=\"exclusivegateway1\"></sequenceFlow>\n    <sequenceFlow id=\"flow33\" sourceRef=\"task1\" targetRef=\"Processing\"></sequenceFlow>\n    <serviceTask id=\"CancelOrder\" name=\"Cancel order\" activiti:delegateExpression=\"${cancelOrderDelegate}\"></serviceTask>\n    <userTask id=\"CloseOrder1\" name=\"Close order\"></userTask>\n    <sequenceFlow id=\"flow34\" sourceRef=\"CancelOrder\" targetRef=\"CloseOrder1\"></sequenceFlow>\n    <sequenceFlow id=\"flow35\" sourceRef=\"CloseOrder1\" targetRef=\"endevent1\"></sequenceFlow>\n    <userTask id=\"CloseOrder2\" name=\"Close order\"></userTask>\n    <sequenceFlow id=\"flow37\" sourceRef=\"subprocess1\" targetRef=\"CloseOrder2\"></sequenceFlow>\n    <sequenceFlow id=\"flow38\" sourceRef=\"CloseOrder2\" targetRef=\"endevent5\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_OrderProcess\">\n    <bpmndi:BPMNPlane bpmnElement=\"OrderProcess\" id=\"BPMNPlane_OrderProcess\">\n      <bpmndi:BPMNShape bpmnElement=\"task1\" id=\"BPMNShape_task1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"260.0\" y=\"140.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"BPMNShape_exclusivegateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"520.0\" y=\"137.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subprocess1\" id=\"BPMNShape_subprocess1\">\n        <omgdc:Bounds height=\"367.0\" width=\"751.0\" x=\"610.0\" y=\"124.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"startevent2\" id=\"BPMNShape_startevent2\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"620.0\" y=\"303.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway2\" id=\"BPMNShape_exclusivegateway2\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"710.0\" y=\"300.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent2\" id=\"BPMNShape_endevent2\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1300.0\" y=\"290.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"ShipVoucher\" id=\"BPMNShape_ShipVoucher\">\n        <omgdc:Bounds height=\"71.0\" width=\"121.0\" x=\"790.0\" y=\"362.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway3\" id=\"BPMNShape_exclusivegateway3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"974.0\" y=\"196.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent3\" id=\"BPMNShape_endevent3\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1206.0\" y=\"147.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway4\" id=\"BPMNShape_exclusivegateway4\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"980.0\" y=\"377.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"parallelgateway1\" id=\"BPMNShape_parallelgateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"1210.0\" y=\"287.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent4\" id=\"BPMNShape_endevent4\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1206.0\" y=\"412.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SendEVoucher\" id=\"BPMNShape_SendEVoucher\">\n        <omgdc:Bounds height=\"71.0\" width=\"121.0\" x=\"790.0\" y=\"181.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SendFail\" id=\"BPMNShape_SendFail\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"137.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SendSuccessful\" id=\"BPMNShape_SendSuccessful\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"236.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"ShipSuccessful\" id=\"BPMNShape_ShipSuccessful\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"321.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"ShipFail\" id=\"BPMNShape_ShipFail\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1050.0\" y=\"402.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"940.0\" y=\"50.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent5\" id=\"BPMNShape_endevent5\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"1550.0\" y=\"290.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"Processing\" id=\"BPMNShape_Processing\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"370.0\" y=\"130.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"CancelOrder\" id=\"BPMNShape_CancelOrder\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"620.0\" y=\"40.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"CloseOrder1\" id=\"BPMNShape_CloseOrder1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"790.0\" y=\"40.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"CloseOrder2\" id=\"BPMNShape_CloseOrder2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"1400.0\" y=\"280.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"540.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"540.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"620.0\" y=\"67.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"655.0\" y=\"320.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"710.0\" y=\"320.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow17\" id=\"BPMNEdge_flow17\">\n        <omgdi:waypoint x=\"911.0\" y=\"216.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"974.0\" y=\"216.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow18\" id=\"BPMNEdge_flow18\">\n        <omgdi:waypoint x=\"994.0\" y=\"196.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"993.0\" y=\"167.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"164.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow19\" id=\"BPMNEdge_flow19\">\n        <omgdi:waypoint x=\"994.0\" y=\"236.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"994.0\" y=\"263.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"263.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow20\" id=\"BPMNEdge_flow20\">\n        <omgdi:waypoint x=\"1155.0\" y=\"164.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1206.0\" y=\"164.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow21\" id=\"BPMNEdge_flow21\">\n        <omgdi:waypoint x=\"730.0\" y=\"300.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"730.0\" y=\"215.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"790.0\" y=\"216.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow22\" id=\"BPMNEdge_flow22\">\n        <omgdi:waypoint x=\"730.0\" y=\"340.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"730.0\" y=\"396.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"790.0\" y=\"397.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow23\" id=\"BPMNEdge_flow23\">\n        <omgdi:waypoint x=\"911.0\" y=\"397.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"980.0\" y=\"397.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow24\" id=\"BPMNEdge_flow24\">\n        <omgdi:waypoint x=\"1000.0\" y=\"377.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"999.0\" y=\"347.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"348.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow25\" id=\"BPMNEdge_flow25\">\n        <omgdi:waypoint x=\"1000.0\" y=\"417.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1000.0\" y=\"430.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1050.0\" y=\"429.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow26\" id=\"BPMNEdge_flow26\">\n        <omgdi:waypoint x=\"1155.0\" y=\"263.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1230.0\" y=\"263.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1230.0\" y=\"287.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow27\" id=\"BPMNEdge_flow27\">\n        <omgdi:waypoint x=\"1155.0\" y=\"348.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1192.0\" y=\"349.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1229.0\" y=\"350.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1230.0\" y=\"327.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow29\" id=\"BPMNEdge_flow29\">\n        <omgdi:waypoint x=\"1155.0\" y=\"429.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1206.0\" y=\"429.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow36\" id=\"BPMNEdge_flow36\">\n        <omgdi:waypoint x=\"1250.0\" y=\"307.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1300.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"540.0\" y=\"177.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"540.0\" y=\"231.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"540.0\" y=\"310.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow32\" id=\"BPMNEdge_flow32\">\n        <omgdi:waypoint x=\"475.0\" y=\"157.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"520.0\" y=\"157.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow33\" id=\"BPMNEdge_flow33\">\n        <omgdi:waypoint x=\"295.0\" y=\"157.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"370.0\" y=\"157.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow34\" id=\"BPMNEdge_flow34\">\n        <omgdi:waypoint x=\"725.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"790.0\" y=\"67.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow35\" id=\"BPMNEdge_flow35\">\n        <omgdi:waypoint x=\"895.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"940.0\" y=\"67.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow37\" id=\"BPMNEdge_flow37\">\n        <omgdi:waypoint x=\"1361.0\" y=\"307.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1400.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow38\" id=\"BPMNEdge_flow38\">\n        <omgdi:waypoint x=\"1505.0\" y=\"307.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1550.0\" y=\"307.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),
('7503',1,'E:\\works\\Fintechviet\\AdServer\\adserver_msb\\target\\classes\\processes\\Order.OrderProcess.png','7501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0;\0\0õ\0\0\0 L€\0\0zIDATxÚìÝÔå/|¢ñx,“r­ŠÇS•äœM½[×ãñhÕzL½®µ•¼ÆJêMRÇá\"£‚\"šE=\Z—Ä˜˜]CˆæM0†#v¹¬ë%ŠÂ,^@E8ˆ\\†¹ˆ #5ÏÛ¿ÿ¡\'=C÷LÏ½{æó©zjºÿÿ¾ÍÌÓÝÿþ}ûyž!C\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`I)}ôõ×_ŸW__ÿáÒ¥KÓâÅ‹µ\nhK–,IË—/ß›k£ôRýT?\0\0\0\0hGW¬X‘vïÞþøÇ?jÔöìÙ“ž}öÙK–,ùš~ªŸê§\0\0\0\0\0%Ä7å+ºüÇÅ‹¿ªŸê§ú)\0\0\0\0@	1%bme·Å‹¿¯Ÿê§ú)\0\0\0\0@	1ï¾BmÅ‘“~ªŸê§\0\0\0\0\0%t¦ˆÜøÖ»é[sÖf-N+ð*\"WZ?}÷íÆôús³Ò†%wd-NÇ6ýH?\0\0\0\0°öŠÈ‡ÿ1í;ø^Ëùå¯6µ„q:¿}÷ÛÍéíwÞSðUDî—~šoïìoHë7-½ôØäV-¶Å>}I?\0\0\0\0¨REä:f¯Üš¾3o]zêå]iÙ+iÚüõ-aGœŽí­Ù™¦æ.óã\'_KÞx(\"÷m?-l;6üË1AG¾íÜð¨¾¤Ÿ\0\0\0\0U©\"òÞÍiÊÜu-áFGmÒo_J;öTôUDîÓ~ZØ^}æ%ÃŽØ§/é§\0\0\0\0À\0Õ^ùñµ\re‡sÿm›‚¯\"r¿ôÓ|[¿øö’aGìÓ—ôÓî¨­­ýDMMÍå9?ÌµgrmG®¥‚Ö˜k«r—ùEî²cs§ÿÒ;\0\0\0\0ô‘öŠÈ1uU>Ì˜üÈKéá?¼‘¶4½µ8ÛòûŸxÉšŠÈýÓO…úioºì²Ë>WSS³àòË/?Ô&Üè¨½áG®Õ\r:ô£Þm\0\0\0\0 +\"7¾õn¶\0yá\Zn´½\\l+\\Ã#®×UøUDî‹~Ú¶mXrGÉ°#öéKúig\\~ùå“kÏu2à(Õ^ÑÞq\0\0\0\0 —+\"›¦*Fs´½\\l+vY…_Eä¾è§mÛæ•?-vÄ>}I?-Wmmíô£#3Z‹‘#G¦éÓ§§yóæ¥\r6¤ÆÆÆtèÐ¡Ž9’vïÞ6mÚ”æÏŸŸ]nôèÑÅB\'r·ó)ï<\0\0\0\0ÐÃ„ŠÈÕÚOÛ¶}\rëÒú§n;v\n«Ü¶Ø§/é§>|øÇŽ®ÇÑPÔÕÕ¥Ù³ggaFg477§…¦‰\'¶\n<jjjöç~õî\0\0\0\0=È4VŠÈÕÚO‹µ­Ï?tLØÛô#ý´#GƒŽ…ÁÄ´iÓ²ÝñÁ¤Ç<RpÛïäÚ×¼\0\0\0@iò¦²(Ë*ø*\"÷G?mi‡§Í˜yìV¹m±O_ÒOÛÓvDGLWAEOihhH“\'O.<ÕÔÔ|É»\0\0\0\0ô€öŠÈO®k(:MU±ö¯kv*ø*\"÷K?öÎþ†´iå}%×ìˆ}qýI?-æè\Z-AD}}}ê\r±ÆG¬çQ8Â#wßgz\'\0\0\0€n*UDÞ{ 9}gÞº²ÃŽ›æ¾”v¿Ý¬è«ˆÜ§ý4Fl4n~:½üäwKù—‰Ë\Zå¡ŸºüòËÿ¦p1òÑÑ›b1ó»îº«0ðh¬­­ý„w#\0\0\0\0è†REäæ÷§™OoÎ¦ªZðüöôÌ+­×ðˆÓË^iLO½¼+E~µ|K:¤ˆ¬ˆÜ‡ý´£ÑFyè§å¨©©YS¸FGON]UÊÁƒÓ¸qã\n-¿×»\0\0\0\0tC{ÓEàÑ´ÿÏŽÇäù°#Nç·¿uð=A‡\"rŸ÷ÓrFs´7ÊCßÒO/»ì²Ïå‡ºººn/FÞ/¼ðBÛËÿÒ;\0\0\0\0tQY?mo½ÛvÄi^Eäþì§]\r:òMßÒO/¿üòGóÃìÙ³S_»çž{\nzG\0\0\0€.êLØ¡)\"ë§Ú@é§±NÆå—_~(‚†‘#G¦Ý»w÷yØ±eË–Â©¬ö×ÕÕý…w%\0\0\0\0(P[[»8×þ¶£Ë)\"+\"WýT?íi555—çƒ†éÓ§§þ2qâÄ–À#÷šýï^\0\0\0\0P  x¶¸¦¦æ³¥.§ˆ¬ˆÜŸ„rúiõ«˜6*ÿ:9oÞ¼~;yä•\0\0\0@)óÀçÛÅŠŠÈŠÈ•ÐO…rúi_÷«Üþgò—Û¸qc¿…õõõ…#;{÷\0\0\0€EÂŽ–bZaè¡ˆ¬ˆ\\aýT(§ŸöI¿ÊmÛ‘ßßØØØoaÇöíÛg£w/\0\0\0\0(P*ì(,þÅ7ž‘‘+±Ÿ\nåôÓÞîW…Û:ÔoaÇ‘#GZ=Fï^\0\0\0\0ƒTE}­¦ˆ¬ˆ\\áÏ_¡œ~Ú+ýªð|v\0\0\0\00Dq¨ôß¥D{®¦¦æKC‡ýh\\N¹ò›PN(§Ÿön3²\0\0\0€~§8TúïÒ^È‘×“Eä»ï¾;}æ3ŸI\'œpBúøÇ?žFŒ‘¶lÙÒ§×Ü¯”µj¹]#;ú/”k¯¿öçÿ»šúfŽìhéWÖì\0\0\0\0 ¢;Jÿ]Ž¶Uµµµ_iräõTyÆŒYÁõóŸÿ|ö-éE‹eçÏ9ça‡°£œ~Úg¡\\9ýuˆ°c …Çô«Ü¶gòû7nÜØoaG}}}«5E¼{\0\0\0RÂŽ’—¢Eã¶zªˆ|î¹çf×Ýÿì³Ï¦³Î:+ûýé§Ÿž|ðÁV…ÚI“&¥“O>9vÚiéÈömÛ¶-åv3Ï<3­Zµ*Û¾gÏžtÅW¤O<1tÒIiØ°aiçÎí~÷íÛ—®½öÚìòq½ñãÇ§´ºÎÅ_œÎ?ÿül[?ãwŠË_uÕU­n·œû/¼-aGûÏß¾åÊí¯…ÿïöúN„$gŸ}vÖGcüßó£CÚë\'¥oVAØQ²_åöÝ—¿Ü¼yóú-ìˆû.x¼÷y÷\0\0\0¤„ÝÓSEä(öæn®¥HÛ¶EÐ±zõê´cÇŽìr§œrJ«l×¯_Ÿ>õÔS³}—^ziv>BŽ!ßº¯««ËÎ¿øâ‹iíÚµÙéK.¹¤Ý°#ŠÉ±ýá‡ÎŠ‹q:ŠÊ…×YºtiÚµkW¶-B–üãÊë?»åÜám	;Ú}þöi(Wn-ü·×w¢Çù­[·fý;Nçƒ„öúÉ@é›vtØ¯jkkGåC†éÓ§÷[Ø1yòäÂ°ãkÞ•\0\0\0\0)aG÷ôTùøãÏ\n©ñ-õbû£<eÊ”¬<¤ 8;¤M8§ã¶ât|;}H‘à\"¿½°Å¶öÂŽüubÊ¢hÅ®ÛÛ»|þvË¹ÿÂÛvTN?-·¿ûë;^xav>Â“çbz¬]ÑQ?(}³šûéÈ‘#?•{ÿ8ï!¹ÓéàÁƒý½^Ç¡ÚÚÚOxW\0\0\0¤„ÝÓSEäu1¤ib\ZªØÿè£vviS¸m¯8\\îú1¥Ï6â˜6«ÔuÊ)(wæþ…•ÑOËí¯…ÿÇöúNœÇöo|#}úÓŸÎöqÆö“Ò7«½Ÿ®Û1þü>;fÎœYvÌòŽ\0\0\00ˆ	;º§§ŠÈ?ÿùÏ³Bê¿øÅ¬ÐúÏÿüÏÙù¿ú«¿jU„éu†”vä§±Z¹re«i¬FŒ‘µ=ò·wÑEµ[ÐÍOïS8UÐ„	J^\'¦þr´ž¿|þ2]¹aGeôÓrûë\"SCë;\\pAËTk15Tœþä\'?Ùa?(}³ÚûiáTVñ7¾ÐW\Z\Z\Z²%ùûÏýïÎõŽ\0\0\00ˆ	;º§\'‹ÈQ`…“kÎ/*ÓûDàÑvAå!í„1õU“ãöbèX!¶755eâü‚ÎQüÅÌ;Z |ìØ±Ùå£Ea³í\"Ð…—E¦#\\‰ûŽë^¦+÷/ì¨œ~ZNÒfòR}\'þï_ýêW³ëÇíÄ4mÏ>ûl‡ýd ôÍjï§±¦Gî=äå|à°páÂ>;î¸ãŽ– £¦¦fw#\0\0\0€ANØÑ=½QDÖ‘õSý´ZŽîˆ‘o¼ñF¯?þxáôUï×ÔÔœíÝ\0\0\0`vt\"²\"²~ª\rö~š{y4>|ë[ßJÍÍÍ½tÄ´|…ÓWåÚxïD\0\0\0\0;ºIYY?Õ{?>|øÌ½—ìÉwÝuW:räH¯1Í˜EÉ\0\0\08†°£{‘‘õSM?2¤¦¦æ³¹¶?DÄš\Z±žJON]ÕfDÇÃ‡ÿ˜w!\0\0\0\02ÂŽîQDVDÖO5ýôÿ¨­­ýJî=åP>ˆQõõõÝ\n9\Z\Z\ZÒm·ÝVr:\0\0\0\08–°£{‘‘õSM?ý³Ë.»ìs¹÷•w\nÃ‰éÓ§§7v*äØ¾}{š9sfÛÑÙÔU‚\0\0\0\0Ž!ìèEdEdýTÓO[«­­=3÷Þ²£MH‘¾þõ¯§9sæ¤+V¤7Þx£e]øáFŒ™7o^š2eJÛ€#Úû#\0\0\0 $aG÷(\"+\"ë§š~z¬}Q[[;½í(®´ššš¹v¶w\0\0\0\0Jvt\"²\"²~ªé§¥9òS¹÷™;//³ÅÚ³FŒq®w\Z\0\0\0\0:$ìèEdEdýTÓO;VWW÷ï®çñÃX`¼È4Wµµµ‹s?ï«©©¹<wúÞa\0\0\0\0(›°£{‘‘õSM?\0\0\0€~&ìèEdEdýTÓO\0\0\0 Ÿ	;ºGYY?ÕôS\0\0\0\0ègÂŽîQDVDÖO5ý\0\0\0\0ú™°£{‘‘õSM?\0\0\0€~&ìèž¥K—*ÔVv;´xñâ÷õSýT?\0\0\0€LØÑ=Ë—/oÜ½{·bm…¶†††ß.^¼øUýT?ÕO\0\0\0`\0vtÏÓO?ýåeË–½ýæ›o¾§h[Yß”ò’%K¶åÚ×ôSýT?\0\0\0€LØÑ}K–,ùÒâÅ‹Ÿ‹ihbÞ}­\"Zü/^U@ÖOõS\0\0\0\0„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„\0\0\0\0\0@Uv\0\0\0\0\0\0UMØ\0\0\0\0\0T5a\0\0\0\0\0PÕ„¥­^½úÿž0aÂæ¿þë¿~?w6iš¦iš¦išVíSŸúÔ{gœqÆ¬Üéùä\0\0;Jˆ #çƒ/}éKé¹çžK‡J\0\0@ÿ{ÿý÷ÓË/¿œ†\rö§üã›\0\0€°£„ë¯¿~K\0\0@åúüç?¿\'wø>Ý\'\0\0v;Šˆ©«bD\0\0P¹6lØp0wø¾Ù\'\0\0v;Š3u\0\0T¸˜ÒjÈÿYÇ\0\0vP,ì\0\0\0*Ÿ°\0 ÷+¥}ýõ×çÕ××¸téÒ´xñb­Ú’%KÒòåË÷æÚ(½TØ!ì\0\0\0a\0\0íˆ cÅŠi÷îÝéü£VAmÏž=éÙgŸ=°dÉ’¯	;„Ý	;Ö¬Y“.¾øâtâ‰\'¦“N:)ýíßþmZ½zu¹ÈÊ¾\\´¸ÿþßÿ{vŸ\0\0€°\0 OÄˆAGE\\¼xñ«ÂaGwÂŽÿò_þKöáêÕW_M/¿ürvú?ý§ÿÔãaGøýïŸŽÀ\0\0v\0\0ô‰˜ºJ¨PÙmñâÅï;„Ý	;b4G\\vË–-\Z…çó§¯¹æšì6Î;ï¼²oã„NhµoèÐ¡éüÿ‘m{çwÒu×]—ÝfŒ¹þúë[ZßµkWú»¿û»ìúý×žþùlûR]]]Ëè”áÃ‡g#ÒÂc=–þÛûoÙub_Ü×öíÛ;Ü\0\0Â\0€\"Ö‡(T|Ø1èŠ…Ý;~ô£e®N>ùäôõ¯=áÑ™°#ƒhùÐ¢½°#?²#‚‘Â}Ë—/O{÷îÍ¶EÐÛæÎ›,XŽÀ#|ñ‹_ÌÎGÈ1¤`„ÈUW]•‘)6lÈN_zé¥Ù¾SN9%;¿sçÎlú¬8VÚÛ\0\0Â\0€Av¼ûvczý¹YiÃ’;²§c›0BØ!ì¨ü°#Ä\ZDà×‹\0¤Ü°ãÃ?ÌÚ£kr”\n;¢üñé¿þ×ÿšêëë¹¼¸R·›ß×V~û6ëƒ„XƒdÈÑÑ$–ÜÿýÙHŽö\0€°\0`…ïìoHë7-½ôØäV-¶Å>„°CØQùaG^SSS«  ³aGLU*ìhçC]«mùiµ\no7B˜rÂŽÂÐ$/¶-[¶,ÝxãÙZ$q¹X§¤£}\0\0 ì\0\0DaÇŽ\rÿrLÐ‘o;7<*vô¶/\r;¾àÛµ°#Ö¾ˆËÆ4N/½ôR«‚ÿøÿ!;ÿÚk¯¥ßýîwEÃŽßþö·é‰\'žÈNÇèˆî†ù)©\n§±ŠéµB~\Z«‰2¤`\Z«Q£Feçõ«_µ,²~ñÅgû>ûÙÏ¶L}SeÅéO}êSî rÅúJ«V­J±¾\\iýß–,Y’MK¹yóf„\0\0Õv¼úÌJ†±O !ìèEŸËµý¹vïÑŸ_ò¬í|Øk\\D0£#bš©˜Ú)¿ð÷ìÙ³³u-b´Å·¿ýí¢aG¬±Ó@EððÆot;ìˆÊcÑóx<Ñ\"èÈ/PkkD@÷‹G@Þzë­,$É/jëuÄbæ!~6,Û×‹59þð‡?t¸€Ê\r:V¬X‘vïÞíX°ÂÚž={²“›6mÒQAØ\0P}aÇúÅ·—;bŸ~ÂŽ^:òGŒìØ#ðè|Ø\0Õ$Ft:*;ðˆ7€°\0È¹ýöÛÿbÆŒß»óÎ;ŸŸ6mÚž	&9rdŠ©j¢]sÍ5ÜtÓMûï¸ãŽµ?ûÙÏî¿å–[þ/5a‡°cPmv\0À\0…tÇ€•|\n;\0`P»ë®».¹í¶ÛÖŒ\Z5êOÓ¦MK.LëÖ­Ë¾¹õÁ´ìÛ·/mÜ¸1=ùä“éž{î‰¹ÚÿtÓM7íÈ]çš¡C‡~Ô_²oÃŽ\rKî(vÄ>ø„=ì\ZùýÖðv\00\0•s|ª	;@Ø\0ô‹‰\'þåw¾óµcÇŽýÓ¼yó²0£3Ž9’V®\\™n¹å–?M˜0¡iÜ¸qÿ¯¿jß…›Wþ´dØû|àvôBÐÑQa„‡°\0aGj|ëÝô­9k³§;\n;@Ø\0ôšiÓ¦ÝpõÕW¿ÿë_ÿ:577wû\0á¹çžKãÆ;2~üø…Ã‡ÿ˜¿pï‡û\ZÖ¥õOÝvìV¹m±Ï>aGùÜÎØèìå…\0PåaÇáÃ¹cÓƒïµœ_þjSKØ§óÛw¿ÝœÞ~ç=Ç’Âv\0\0=cêÔ©÷_ýõ¼ðÂ=zpðàÁ4cÆŒ#uuu»†þý¥{7ìˆ¶õù‡Ž	;b›{ÂŽ:¾Ô…ë½3ˆŸ\Z4aG³WnMß™·.=õò®´ì•Æ4mþú–°#NÇöÇÖìLSs—ùñ“¯¥ï\n<„ ì\0\0z è¸á†>Œõ8zËÃ?üá¨Q£>ü¯üÅ{1ì8|8mþÃÌc§°Êm‹}>ð	;ú)èè©ë;\0 \nÂŽ½šÓ”¹ëZÂŽÚ¤ß¾”vì=èxRØÂ\0 ëbêªÑÑ›AGÞ¢E‹\Z5ªÁÞ	;ÞÙß6­¼¯äš±/.ãCŸ°£‹:ZŒ¼¯oGØ\0\ZvD{|mCÙaÇÜÛæXRØÑ£víÚ•fÍš•n¾ùætõÕW§#F¤Ë/¿¼¥Åùºººtã7¦ŸýìgiãÆžÐ;\0 šÅbä±FÇÚµkûì áý¯ÿµ+w`ù/C‡ý¨ÿ@…‡§ÆÍO§—ŸünÉ #ßâ2qY£<„](zj\nªÁ8ÂÃ§F\0UØSWåÃŒÉ¼”þÃiKÓÛY‹Ó±-¿ÿ‰—|!GØÑ3-Z”Æß*Ø(§ÕÖÖfáÇý÷ßŸýÝv¨@\0@•™:uêË±y_ûæ7¿¹«¦¦æÿî‡æ0ÊCØÑƒÁD>èøH®9ú³3Ú^o°-ZîS#\0ƒ\"ìh|ëÝlòÂ5:\"Üh{¹ØV¸†G\\\'®ë˜RØÑË—/OcÆŒétÈQ¬\Z5*í°\0¨wÝu×%cÇŽýSsssŸ8444|0bÄˆ·jkk?á?Ñ½°£œÑíòðPØQfÐñ¥‚Àâ—GþÙ‰À£ÔõSàáS#\0ƒ\"ì(6MUŒæh{¹ØVì²Ž)…uë­·XŒ92MŸ>=Í›7/mØ°!566¦C‡e—?räHŠiœ7mÚ”æÏŸŸ]nôèÑÇÜÆ¸qãÒ–-[<Ñ…\0@¥»í¶ÛÖÄ]ùþ÷¿¿¡¶¶vºÿD÷ÂŽ®ùæ °£AGsôÀ?u\"ð(:òíŠ‚ýƒe\rŸ\Zv;„=hÿþýÙz…ELE5{öìÔÙ5)ãK€.L\'N<&ôxüñÇ=Ù…\0@¥ºýöÛÿbÔ¨QÚ·o_¿<444ì®­­ÝkíŽî…š°£—”\n ŠíÅ.ÿÿ¹ü`XÃÃ§F\0EØa\Z+aG_W^ye«PbÚ´iÙŽîøàƒ²p#F†®çñ›ßüÆ^Ø\0T¢™3gNÁþvÝu×½–;pü[ÿa‡°£çåž[‹»øüêh1òrrƒŽ¶Ç@ÒÊ§F\0EØñçÊ›Ê^ <.ëXRØÑmGtÄtUTô”†††4yòäV÷1wî\\Oza\0Piî¼óÎç}ôÑ~?€øÉO~²ÒTVå¥…ÂŽÎ(ø&ÚâšššÏ–yµr‡ŽÎ…÷¿gÈÀááS#\0ƒ*ìxr]CÑiªŠµ]³Ó±¤°£lm×è¨¯¯ï•û‰5>b=ÂkÖ¬ñÄv\0\0•dÚ´i{Ö­[×ï¹ƒÒµ¹ƒÆgûÿ£Ü¢´°CØÑ•~UÐžè TëìTR¥ãºtä\rÔ5<|j`Ð„{4§ïÌ[WvØqÓÜ—Òî·›O\n;:´|ùòcFtô¦XÌü®»îj¹¿#F¤]»vyò;\0€J1aÂ„#]°­74555æ…å¥…ÂŽnö«–P­HÿêêšÅ×ºtt÷ñ;\0 ÂŽæ÷§™OoÎ¦ªZðüöôÌ+­×ðˆÓË^iLO½¼+E~µ|K:tø°ãIaG‡FÝjŽžœºª”ƒ¦qãÆµÜïÔ©S=ù…\0@¥ˆÅÖúâ °q°(ì(¯(-ìvôD¿*ÕŽŽ$êîHŠbGw‚Ž¶Ç@YÃÃ§F\0MØ‘<šöÿyÁñX€<vÄéüö·¾\'èv”eÑ¢E-Ç²uuuÝ^Œ¼3^xá…VÓYmÜ¸Ñ€°\0¨”\"h¥v”_”vT~+ãY‘-×\rïíf7Ž©«ÚŽèxíèöî¸÷èmý…°\0ª+ìhÛ\Zßz·%ìˆÓŽ…uíµ×¶¿Îž=»Ïïÿž{îi¹ÿ›o¾Ù€°\0¨•6²C+¯	;Œìè¡í¹ššš/\r:ô£G/šÙÑÕíì(\\´¼³Œì\0€vhÂŽîˆu2òÇ³ñy¶?¦eÞ²eK«ãê½{÷zv\0\0ý­RÖìØ³gÏ.kv”_”î­“…ÅéO<1sÎ9iõêÕÿÁ-ÿ˜…e÷«¶!GÛ`á!½³fGWkv\0€°Cv´˜5kVËqíôéÓûíqLœ8±åqÌ™3Ç‹€°\0èo7ß|óÞ\r6ôûD}}ýÚÜAâ\naGyEéÞ;âô3Ï<“ŽÀÃ‡Ãv¬ª­­ýJ‰£XÀPîHŠbAG¬Ñq\\‘í	<º»†ˆ°\0„Z…cÇŽMO=õT»—‰i£òÇ·óæÍë·ÇúÈ#X¨\\Ø\0T’;ï¼óùÇ¼ß ~ò“Ÿ¬Ì$þPØQ^Qº/ÂŽüùN8¡Õ¾‹/¾8þùÙ¶}ûöeóåžtÒIÙHñãÇ§dû¶mÛ–r?»þ™gž™V­Z•mß³gOºâŠ+²ËÇõ†\r–vîÜ™í‹…Ï>ûìì:±/î+†ˆw´¯ðqçOOš4)|òÉé´ÓNK<ð@¶/.=nã²Ë.ëÕ!v´7’££À££ ¡TÐñ‘vö—xüM®í€A‡°€ªÇN7ÞxcöSØ!ìèùÏCz,]º´èe®¾úê–Ëõçâàõõõ­/Â\0 ŸÍ˜1ãž»îº«ß n¸á†õ¹ƒÄ¡ÂŽòŠÒ}9²ãÜsÏmµ/>tÄ<¹±-‚ŽØöðÃgßªŠÓxÄ¾K/½4;!Ç‚\"uuuÙù_|1­]»6;}É%—dûN9å”ìüÖ­[³é³ât>Xio_±°cÁ‚iýúõÙéSO=5Û÷“ß—¼ƒ!ìè†ŽFVttébà‘ŸJë+ô©îS#\0U!\nÉùbn|‘¤½Â²°CØÑ“aG¾7î˜‘#FŒhÙßØØØouûöí-#Â\0 ŸMž<ù?Ž3æOÍÍÍývðÐÔÔ´»¶¶öÝºººï?Rž¾X³ãøãOguVZ±bE«}‡j¹|ŒÎÈo‹6äèZ…ûÚÞG~û6ëƒÄ¾/¼°e4I„%3fÌÈF‚t´¯XØQø;ÅïRêñ\n;:Tj„G¹AGgüý}e\0?…}j *Äg„¶ÅçX§ ¾Ì\"ìvôEØQ8r\"zncúþräÈ‘Va\0P¦L™ò¿—-[Öo?ýéOŸ¯©©ù…ÿDå„åî‹é¤Ú†1uT9aGah’o±-~·o|ãéÓŸþtv¹3Î8£Ã}…ùóÂŽ.‹m§”\ZÓ‰ £½ÀãŠ6÷3×èv\0PµÊ)>;„½Ýß\nGzTRÀ ìv\0\0fêÔ©µ“&Múðƒ>èo‹½?bÄˆ·FŽù)ÿ‰ê;òSRNc5aÂ„VÓX­\\¹²Õ4V1Ä;ÎÇ:\Z1•Uœ¾è¢‹²}\\pAËÔW1UVœþä\'?Ùá¾rÃŽ/ùË-ÓXÅ‚‚ÂŽN…‹–åC:¸^gEv\0@…ŸcšSaGå·Žþ—ÕØŒì@Ø\0cÂ„	M1]Q_»óÎ;×åïó¨Î°#(oõÅˆ‰htä(µ5\" ˆi§bañXg#¶755e!I~QóXG#3Ï/jþÕ¯~5Û×‹59ž}öÙ÷•vÄcŠ5HbZ«xÜC\n`v”¥í”VT\\Ñ‰ cH‰ë}aÂ€AèÃ?ÌŽÞyçìø)Ž‡vîÜ™-üýÚk¯¥uëÖ¥5kÖdÇKñE‘u½dÉ’ôÄO¤G}4ÍŸ??Í;7û‚ÉC=”~õ«_e_ùÙÏ~£¤Ó½÷Þ›~ô£¥ïÿûéïÿþïÓwÜ‘n¿ýötë­·¦›o¾9M:5Mž<9}ûÛßÎ¦¡úæ7¿kæ¥ë¯¿>[o-Öa‹c£hW]uUºòÊ+³ãµ+®¸¢ì¢s…ñ7‹/ÎÄqe\'ÆÔ§ñ7ì‹cäÙ³g§ÓO?=;¶¼øâ‹Ëº~o~Ùf ì3fLöÈyÊš;\0€’®¹æšÿgÜ¸qGöïßßg\r/¾øâæÚÚÚÿ=|øðùTFØ1ÐÛÇ?þñ¬óOGqaHÁˆaG—î*6E–°€tmsÇ¿--\n¤ÑF\Z•µÑ£GgCv#pˆà!ˆ=Äu×]—_ÿú×³ÀâÆoÌŒ›nº)4n¹å–4mÚ´,è¸óÎ;³àãî»ïÎ‚Ÿüä\'Y0òóŸÿ<JfÍš•\'sæÌÉŠÈ.Ì‚•X\"h‰À%BƒRÅçxœ¿þõ¯S|~ÈûôÇñ]Lk\Zï­åG\rÇ”§}vÄ—fb{|Ù§Ø­ýr‘°#µrä]}õÕ-û7nÜØoµ¾¾¾Õ´n;\0€\n2~üøÊ}z¿/¦³ÚµkWsL_uÙe—}Î_^ØÑW-¦¯Šp£ð›1-–°£ßžN„\0Tl7¾lQ\n¿EŸÿûý÷ßßªøúëø4¿†\\½ÛîÛ³gOÊäý†\r–¨)&Mš”­9wÚi§e!Pì‹ÛŠÑÀqœŠùµà\n÷Å¨ã³Î:+AbÄÇƒ>hdGÃŽYA\\Û~\"ÜË_.¦Òí/qßùÇ	a\0PA†úÑ+¯¼rëC=t¤7vïÞýAîàuWmmíDuaÇ@^\0r€wÃîN=5Ø¦®v\0b1Š#w\\•}äÈ‘-!GL—Uj$xŸÆÈ•xoÀ\"¦Tm×—‹k×®ÍNÇª…¡C|fýúõÙéSO=5Û—û\\Ô²oÑ¢E%Š¶Û#èˆiµvìØ‘m?å”S„Tl$G[¿üå/[B†éÓ§÷Ûc©áòã7¿ù:a\0PirÄ>1zôè}óçÏÿco(ÄˆŽ£AÇtma‡°cÀ™1˜#v\0±vX5Šé´b\Z¬ŽF¦ôçñiL·ÁFñ>H±ÑÑb[©uÞbíÂëÅÔTÑÊ\r;â<eÊ”lm¹R‡°£ûb:Ú|ÈaÜÁƒûü1®×-÷9×°\0¨D¹ÆO\Z5ªáW¿úUSO$Ä\Z1u•ÂaÇ€ÒÙ©¨ëÔUÂ€A,\n²1z \Zµ÷\rûJ	;ò-?¢\"h†…ç»\Zvœyæ™ÙùXûDØÑ»\n×í˜?~ŸßÿÌ™3[îâÄ‰^ä„\0@%‹#FŒø—	&4mÛ¶ípwš››ß¿óÎ;×ÅbäÖèv;uàñ7¹öN®}e?…}jdbáñçŸ~@ÿŽýu|šbú¨øÇéX´<öÅˆš8kqä/¿è¢‹:;bª«!G§±ŠuÊ\r;ò!Iþ¾„½§p*«˜¾,B©¾ÒÐÐÐ2½[´Xa\0PjjjnÈ}Hxó{ßûÞË[¶léÔH¦¦¦Ý3fÌx.Fsäg>ücþ¢ÂaÇ€õ…£AÆÚÙ¿GÐ!ì\0Œb‚åË—;z¡ÅZ`DÐÓP]xá…Yñ9öå>dÓ[ÅBã±?BŒmÛ¶uvÄ4IçœsN¶ÐøØ±cË;rŸ}²ûi»¨¹°£çÅï!b>pX¸paŸÝ÷wÜÑr¿ãÇ÷\'ì\0\0ªI„¹¹ÛsmÇ5×\\óÚÝwß½ê™gžyqûöíÛ\nöíÛ÷f}}ýÚŸüä\'+o¸á†õµµµïÖÔÔü\"¦ÅòWv;…R#<L]%ì\0Ô¢øý»ßýNØ¡õûñé@R8º#FZ¼ñÆ½~Ÿ?þx«µ:bDÂ\0 JÕÔÔ|öhðñD®mÍµ÷ö\ZsmU®ý0×†ÖÕÕý{1a‡°cÐ‚aÀ 7nÜ¸>ýæ¹°CaG¸öÚk[‚‡o}ë[1…r¯Ý×Ê•+[M_uß}÷yqv\0\0 ìv’Àã^A‡°€”Mu3gÎa‡&ìèa1-YmmmK\0q×]w¥#GŽôJÐS¢Y”\\Ø\0€°CØ1ø|!>)½†‡°€Aãúë¯O³fÍvhÂŽ^°téÒVSKÅš\Zûöíë±Û©«\nGtÄH­ýû÷{av\0\0 ìvGÃ„\0ƒ^|üþûïvhÂŽ^#§\n…Q__ß­ÛlhhH·Ýv[«Ût;\0\0v;„;\0­É“\'§ø‡vhÂŽ^´hÑ¢VSZE›>}zÚ¸qc§ngûöíiæÌ™­Fsä§®t;\0\0v;„;\0­ï~÷»é‡?ü¡°Cvô²5kÖ¤#F´\n)¢}ýë_ÏF¬X±\"½ñÆ-ëzÄÏ7bÈ¼yóÒ”)SŽ¹®ÅÈ…>¾\0\0;„Â„Q$ZµjU6gz¼öiÕß–,Y’–/_ž6oÞ¬ƒ÷Ûo¿=}ï{ßvhÂŽ>£/n½õÖcFyt¥?>­^½Ú‹˜°\0€Þ%Ø*ºÊ}˜|_Ø!ìv0‚Žø–ìîÝ»½ö°¶gÏž´lÙ²´iÓ&½DÐ‡°Cvô-[¶³æF¹-¦¬Š „\0\0½lùòå\nK•Û\Z\Z\Z~›û0ùª°CØ!ì` ‹B÷£xÄ,è¾˜Â*¦²vhÂŽ¾×ÜÜœ­çqóÍ7gŒ·æ*Î;6ÝtÓMiÖ¬Yi×®]^´v\0\0ô•§Ÿ~úËË–-{ûÍ7ß|Ï·Ê\ZÑAÇ’%K¶åÚ×„Âa‘†Š£”çÿñÓ¤I“„šç3;\0\0hkÉ’%_Ê}`y.¦K2¿xÅ´ø_¼*èv;,7G)ÏÌ™3Ó7Þèõ@ó|a\0\0 ìv@57ßz7}kÎÚ¬Åi…GÅÑÁ$¦Æ¹á†¼hžÏ ì\0\0\0„Â¨¦âæáÃLû¾×r~ù«M-aGœÎoßývszû÷\"G´9sæ¤ñãÇ;4Ïgv\0\0\0ÂaTKq3‚ŽÙ+·¦ïÌ[—žzyWZöJcš6}KØ§cûckv¦©¹ËüøÉ×ÒwŠ£×Â…³…‘…šç3;\0\0\0a‡°ª¤¸¹÷@sš2w]K¸ÑQ›ôÛ—ÒŽ½#G¬\'žx\"]uÕUúw\\ºt©çŒç3;\0\0\0a‡°Ö7¹_ÛPvØ1÷ß¶)D*ŽhË–-Kuuuúw\\±bEÚ½{·çM…¶¦¦¦,„\0\0€°CØ;bêª|˜1ù‘—ÒÃx#miz;kq:¶å÷?ñRƒb¤°c@[½zu\Z=zô€þ·lÙ’…:o¾ù¦çN…›6mòda\0\0 ìv@9aGã[ïf®ÑáFÛËÅ¶Â5<â:q]…IaÇ@´~ýú4räÈÿ{FàñôÓOgýF«œ&è\0a\0\0 ìv@\'ÃŽbÓTÅhŽ¶—‹mÅ.+`vD[·nM#FŒð‡\0v\0\0\0Âa;4aGuŠµ,jkký!\0„\0\0€°CØÕv˜ÆJØÁ±Þyçï‹\0;\0\0\0a‡°ª ìøóåMe/P—,;²;î¸#ÕÔÔ¤;ï¼Ó@Ø\0\0;„P-aÇ“ë\ZŠNSU¬ýëš‚aÇ€õƒü }ä#Içw^öóÖ[oõGv\0\0\0ÂaTzØ±÷@súÎ¼ue‡7Í})í~»Y¸ ì°AG>àˆ‘ÇwœÀ@Ø\0\0;„PéaGó{‡ÓÌ§7gSU-x~{zæ•ÖkxÄée¯4¦§^Þ•…\"¿Z¾%:|X¸ ìÐAGGÛv\0\0\0ÂaTPØ‘<šöÿyÁñX€<vÄéüö·¾\'èv81‚£½@#¿ß\Z\0Â\0\0@Ø!ì€\n;Ú¶Æ·Þm	;â´ AØ1ÐƒŽŽ‚#<\0„\0\0€°CØUvhÂŽÁ `”;b£³—@Ø\0\0;„ ìÐ„½ttv¤†À@Ø\0\0;„ ìÐ„UtôÔõv\0\0\0Âa;4aG—u´y_ß\0Â\0\0@Ø!ì\0a‡&ìèt@ÑSSPá ì\0\0\0„ÂvhÂŽ>Óv­?ü0;6ûÙm¯g\r\0a\0\0 ìv€°CvôYÐ‘AÅgœ‘Åâg¹G©ë	<\0„\0\0€°CØÂMØÑgAGˆ‘Gbe…AG¾]sÍ5-û­á ì\0\0\0„Âè†(r;4aÇ±JÅ‚‹ör/o\r\0a\0\0 ìv@]yå•éÞ{ïMÍÍÍÂaÇ€ëß1\nã©§žêrÐQjj©rŒÎ#¦´v\0\0\0ÂatÁÈ‘#S<‡GŒ‘î»ï¾’¡GwÃŽÕ«W§‹.º(xâ‰é¤“NJ^xaZ¹reëóÅäj*ñ±Ä°#úv´=–.]ZÖuÊ\r:\n2:tÞÿqÇg„€°\0\0v; \\räÂÑ\"ü˜3gN‡ù¢ïºuëÒ‹/¾˜þô§?-ìvôIØ‘oãÆkw¤Gg§’*h¼ÿþû]\n:ò¬á ì\0\0\0„ÂèF18ßÆŒ“æÏŸßcaGŒæˆçÄÆÙ·gÏžtÅW´Œú6lXÚ¹sg«P`Ò¤Iéä“ON§vZzà²}q[çž{nv«®ºªd€ÐÞí¶‡~8»þ¨Q£²óq8?{öì´oß¾tíµ×f×Û?~|:pà@Ñà¢ðü¶mÛÒÐ¡CÓ	\'œÎ<óÌ´jÕªV—™0aBv{§Ÿ~zzè¡‡Êþ{\\|ñÅéüóÏvt±›Þª«kf<þÝ¿ûw]:ºûx\0v\0\0\0Âa]*¢ÖÖÖ¶üŒ£%b„DÍGµêêê²52¢0ÅÖø–yÐ£p~ýõ×§n¸!}ãßH7Þxcúö·¿ø§L™’¾ûÝï¦[n¹%Ý~ûíéþÏÿ™¾÷½ï¥éÓ§§þð‡éG?úQúÇüÇôÓŸþ4ýüç?Ï‚€Y³fe…ó(ÞÏ;7--Z”üñ¬ÀûÌ3Ï¤ßÿþ÷Yá½T18ß¢è#=ºvÜ}÷ÝY!‹(ðÇü¾ø»Ä¾ñ±víÚìô%—\\Òª¸¿`Á‚´~ýúìô©§žší‹!¿/~¿RaG{·_ØvíÚ•íûÏÿù?gç?ó™ÏdçwìØ‘ýŸâtüMçÍ›—Žÿ[GaÇ¥—^šŽ¿uü<çœsZ]&w„6q:‚œrÿ1%S<^aG×ÂŽÂ‘ñ·ìîHŠbGw‚Ž¶‡5<\0„\0\0€°CØA¯Q£@k\\ìß¿?íÝ»7ûö}|“óæÍé•W^I/½ôRzþùçS}}}Z±bE2DØðÄOdEî!\"Œˆ0!Â‰)~ñ‹_¤™3gfáE„?þñ³P#Â9î¸ãŽ,ôˆð#B©S§f¡H„#\'NLßüæ7³Ð$Â“ë®».+ÒGA7Â•«¯¾:[¢˜!F´ŽŠÁùÖ”Ç\ZqßxÄó#Ø#Úˆc[© áøãou½C‡e­TØÑÞí·mgŸ}v¶?þWñó¬³Î*y_í=Æüùüõ:šÆªØïÕÞß#COOcUn_¨í¼óÎëÖkBL]ÕvDGœíÝ+në7ÞðÂ ì\0\0\0„Âz>ì(¿G±ÁHŒÉë‰°#ßb¤Da¿0H(\'h$”v´wûùëÅ¨“8ýå/9ûaQá4\\…÷¡MO†Å~¯¾\\ëc0ìˆ‘V4Æïò#;º:‚ÂÈ\0a\0\0 ìv ìè\'1*¥m8¦f*¶€swÃŽX¯\"ž«W¯ÎF»ä‹À±/¦ýŠó1W~ñò‹.º¨ÃP ¦v\Zrt\Z«üÔRÅ‚€ön¿mËßN¬±?yä‘VSKNcÁHì‹é§â|L³õØcÆ*Fµ)2U±ß«3ž@CØÑ6ä(,X³@Ø\0\0;v;ªH¬‘/Ç:!q¾”î†±öDìcÔBL×tá…¶,ÖÝÔÔ”…	ùÅ¿#ÄˆéÀ:\n¶lÙ’…LÄ4]¥ŠþíÝ~Û‹ŽÇãrtZ©X,<¶Çåqqýhtä(ðÁÓ)§œ’Ý~L%Vø8¶nÝš.¸à‚ì1ÆYötô{uæïÑv\n,aGñ°#þž1]\\±£XÀPîHŠbAGœ©«Šm/7ðèî\Z\"\0;\0\0\0a‡°ƒAvDXÅùöBŽž\n;´Þk\ZåGÉ;Zko$GGGGAC© #ht´¿”X¿ç¸ãŽt\0;\0\0\0a‡°aGOvTnûâ¿˜-¨.ìè9¬(7Èèlà‘Z¦NêŸ\0 ì\0\0\0„Â„ÂMØÑ=¥Fxt6À(÷ò‚\0a\0\0 ìv ìvhÂŽ#<ÚN)U¸>Ì2§¦*x\\sÍ5­îÇ\Z\0Â\0\0@Ø!ì@Ø1ÃŽ!%$¯ÖÖß¿°£tàQ¸hyapÑ™EÇK]¯³‹¢ ì\0\0\0„Â„Âa‡°£ÓÚNiAEŒÌ(7è(<\n¯×6H@Ø\0\0;„;`Ø‘\0êêêÒI\'”Î9çœ´qãÆVû&L˜N<ñÄtúé§§‡z(Û·oß¾tíµ×f×‰}ãÇOhu½I“&¥“O>9vÚiéÈöíÙ³\']qÅÙuâºÃ†\rK;wî<æqmÛ¶-\r:4pÂ	éÌ3ÏL«V­Ê¶?ûì³é¬³ÎÊ¶ÇãyðÁ[ÝçÅ_œÎ?ÿül[üçž{nv?W]u•°£Êî*6E\0Â\0\0@Ø!ì@Ø1€ÃŽþçN‹-ÊNÿÝßý]«}±=‚ƒ8ÁEì‹ #Î?üðÃiÞ¼yÙé<\n¯·`Á‚´~ýúìô©§žší‹P%Î¿øâ‹iíÚµÙéK.¹ä˜Çué¥—fû\"äˆŸÂÄö:V¯^vìØ‘m?å”SZÝçÒ¥KÓ®]»²m–äGþwvŽÀ£§ƒ\0„\0\0€°CØ°£\nÂŽC‡e-NÇ¨‹bÓ>Åéã?>;—éÎõ\n[þz…-¹¶Û·nÝš¦L™’Þ(¼ŸÂß£ím>FaGåëîÔS¦®v\0\0\0ÂaÂaG6íS©Ð\">.Óöz1eUG×+ Ú{\\¥ÂŽ˜Ò*¶?úè£EÃŽb·!ì¨ÞÀ£³#3,F ì\0\0\0„Â„ƒ8ìˆµ8òÂ¿øÅC‹ütT…ÓXÅÚ]oÄˆÙéXÃ#¦²ŠÓ]tQÉi¬V®\\Ùj\Z«|€‘¿n{aGL5äè4VùÇ(ì¨ŠÊÔU\0Â\0\0@Ø!ì@Ø1ÈÃŽXo#¦šŠé¡bª¨ŽB‹X |ìØ±Yø-‚Ž¶”»^SSSËbèq½$b1òbÓU]pÁÙBägŸ}v¶NGlŸ1cFv½¶Ž2¶lÙ’…$qñX…7ðˆ°..7uêT4\0a\0\0 ìv ì¬aG\0ƒ©	;º¦£58bûqÇ\'è\0v\0\0\0ÂaÂŽÁ\ZväGf#„•¬ÔSW;\0\0\0a‡°a‡°CvTmà!è\0v\0\0\0ÂaÂa‡&ì¨ÚÀã¼óÎt\0;\0\0\0a‡°a‡°CvT§X£#^J­á1Plß¾=­Zµ*-]º4ë;Zÿ·%K–¤åË—§Í›7{\"‚°\0\0v;v;„x}è(èX±bEÚ½{·çN…µ={ö¤eË–¥M›6y\"‚°\0\0v;PÌv;ðúPJŒètTvà#n\0a\0\0 ìv ìv;ðúPBÒ=g<ŸAØ\0\0;„(f\n;4ÅQ¯^4Ïgv\0\0\0ÂaŠ™Š›šâ¨×‡J=h|ëÝô­9k³§=×<ŸAØ\0\0;„(f\n;4ÅQ¯ýzpøðÓ¾ƒïµœ_þjSKØ§óÛw¿ÝœÞ~ç=Ï=Ïgv\0\0\0ÂaŠ™ÂMqÔëCå¼DÐ1{åÖôyëÒS/ïJË^iLÓæ¯o	;âtllÍÎ45w™?ùZ:ð®ÀÃó„\0\0€°CØb¦°CSõúP!¯{4§)s×µ„µI¿})íØ{ÐóÏó„\0\0€°CØb¦°CSõúP9¯¯m(;ì˜ûoÛ<÷<ŸAØ\0\0;„(f\n;4ÅQ¯•õzSWåÃŒÉ¼”þÃiKÓÛY‹Ó±-¿ÿ‰—\Z<÷<ŸAØ\0\0;„(f\n;4ÅQ¯•ñzÐøÖ»Ùä…ktD¸Ñör±­p\r¸N\\×sÐó„\0\0€°CØb¦°CSõúÐ¯¯Å¦©ŠÑm/ÛŠ]ÖsÐó„\0\0€°CØbf¯[ºt©¢â(^„žÏ ì\0\0\0„Â3«×Š+ÒîÝ»hkjjÊ-¼>t5ì0•°„\0\0€°CØbfÅÛ²eKZ¶lYzóÍ7hÐ±iÓ&Ol¯];þ¼@ySÙ”Çe=… ì\0\0\0„Â3û<ðxúé§³\"š6pš ÃëCO†O®k(:MU±ö¯kv\n&„ ì\0\0\0„Â3¯•vì=Ðœ¾3o]ÙaÇMs_J»ßnN;@Ø\0\0;„(f^*#ìh~ïpšùôælªªÏoOÏ¼Òz\r8½ì•ÆôÔË»²PäWË·¤C‡\'„ ì\0\0\0„Â3¯•vä¦ý^p< Ï‡q:¿ý­ƒï	:„ ì\0\0\0„Â3¯•v´mo½ÛvÄiA„°„\0\0€°CØb&àõ¡ªÂMØÂ\0\0@Ø!ì@1ðúÐgÆŽ›žzê)a‡°„\0\0€°a‡b&àõáòª}ÜÑ\"ôXºt©°CØÂ\0\0@Ø°C1ðúPaG¾7®èHa‡°„\0\0€°CØb&àõ¡*ÂŽÂ‘…¡‡°CØÂ\0\0@Ø!ì@1ðúPUaGáH˜ÞJØ!ì\0a\0\0 ìv ˜	‚×‡Ü„•ßzìéÂ\0\0@Ø!ìv\0ðfÌ˜1iîÜ¹Y=;Œìð~Ž°\0\0v;P¨Š°£mÈ‘×^Ø±zõêtÑE¥O<1tÒIéÂ/L+W®ìÑBþÑ‚ä€\n\'fÏžN?ýôtüñÇ§‹/¾¸Û¿¿°Ãû9Â\0\0@Ø!ì@qÔaG]]]š3gÎ1!G9aÇgœ‘×­[—^|ñÅìô§?ýiaGí„NÈ~§¤C‡	;¼Ÿ#ì\0\0\0„ÂG\0º¢ÔHŽÎ„1š#Þÿ6nÜxÌ¾={ö¤+®¸¢eÔÇ°aÃÒÎ;[ð\'Mš”N>ùätÚi§¥x Û·uî¹çf×¹êª«Jû-Z”Î>ûì,8ˆËÆ‰-[¶\r\nÏoÛ¶-\r:4»Þ™gž™V­ZÕîöö~öC©}q;ùÇ“Lí=^a‡÷s„\0\0€°CØâ@7µvÜ}÷ÝYÁ0‹	&d#<òûbÄHì‹k×®ÍN_rÉ%­\nø,Hë×¯ÏNŸzê©Ù¾òû\"0(Uì?å”S²í[·nÍ¦ÓŠÓçŸ~‡áÁ¥—^šŽ0#~žsÎ9ínoï÷hï1tõñ	;¼Ÿ#ì\0\0\0„ÂG\0ú0ìˆktD G¼F\0ÛÛŽ`ˆÛJ÷cýŠÂëÅôNÑJûc}Ø#\'\"¨˜1cF6\n££ð ûmo¯£íÅ~öCWŸ°Ãû9Â\0\0@Ø!ì@q ÃŽ|Û±cG«  0´èhŠbaDGaGì‹Çöo|#[\'$.kˆôVØQì÷hï1tõñ	;¼Ÿ#ì\0\0\0„ÂG\0ú0ìˆµ-âý/¦izþùç[ôGŒ‘µ8ò‹—_tÑE÷cŠ¨!G§±š7o^Ébÿ\\Ð2íÔ®]»²ÓŸüä\'³}±Hœ)²{ì±¢ÓXÅˆ”!E¦±j»½½ß£½ÇÐÞ¾¶¿S{WØáýa\0\0 ìv 8Ð‹aG¬a…ÿýÓPÅÔMù…½›šš²é­bqîØ!F,ÞQØ‹xGÐÓ?;¶d±?në«_ýjvûqÙXãÙgŸÍö=øàƒÙš±oâÄ‰­n#ÖÐˆ \"®ˆGPÓÞöö~öC{ûÚþNí=^a‡÷s„\0\0€°CØâ@/†Ze4a‡÷s„\0\0€°CØâ€°CØáýa\0\0 ì@Ø¡8 ìÐ„ÞÏv\0\0\0ÂaŠ#\0ÂMØáýa\0\0 ìv 8 ìv®½öÚìý»½6fÌ(a\0\0 ì@Ø!ì\0vhÂŽÊ´|ùòÃŽ¹sçúC	;\0\0\0aÂa€°CvT®qãÆ•:êêê²¿Â\0\0@Ø°CØ ìÐ„«½ÑsæÌñvTê‡Š¾þúëóêëë?\\ºtiö×ú¿-Y²$^SöæÚ(}\0„Â„\0ÂMØÑ§Š­ÝkuÕ!ì¨Ôt¬X±\"íÞ½Ûk\\…µ={ö¤gŸ}öÀ’%K¾æã/\0€°CØ°@Ø¡	;úL±ÑÖê ’ÃŽÑ!è¨èÀã¹×ÝW}ü\0v;v\0;4aGŸ\Z?~¼QTMØSWym«ø×Ý÷}ü\0v;v\0;4aGŸŠâq>ì˜?¾?vxÝ­Ž×]\0„Â„\0ÂMØÑçòkwÕÁ@	;Þ}»1½þÜ¬´aÉY‹Ó±Íë¢°\0\0a‡°a€°CØ1@å×î€v¼³¿!­ÿÝ´ôÒc“[µØû¼6\n;\0\0v;v\0;„ÐwÞ™½ŸÇO¨ö°cÇ†9&èÈ·õÚ(ì\0\0@Ø!ì@ØPÈB¹ÂŽà?øAúÈG>’Î;ï¼ìç­·Þê\"ì¨ê°ãÕg~P2ìˆ}^…\0\0;„;\0\n¬X±\"íÞ½[q«B[SSSHÑqÐ‘8bdÇqÇ\'ðè¢]»v¥Y³f¥›o¾9]}õÕiÄˆ-‹¿G‹óuuuéÆoL?ûÙÏÒÆ…½v¬_|{É°#öy}vtGmmí\'jjjrOéË˜kÏäÚŽÂçy®5æÚªÜe~‘»ìØÜé¿T\0\0„Â„\0mË–-iÙ²eéÍ7ßTàªÐ cÓ¦M:j™AGGÛ)mÑ¢Eiüøñ©MÁ³ÃV[[›…÷ßE-/ìÐ„Çºì²Ë>WSS³ ÷Ü=ÔÉçúû~äZÝÐ¡C?ª4\0\0;„;\0*6ðxúé§³âŽV9MÐÑ¾ÁÑ^ ‘ßo\röÅÂîcÆŒétÈQ¬\Z5*í!ìè~Ø±aÉ%ÃŽØ\'vtò3þßäÚs=ñ<ÏµWc´‡ò\0\0 ìv ì\0\0z(èè(È0Â£}ñwi[È9rdš>}zš7o^Ú°aCjllL‡Ê.äÈ‘lÚ»áæÏŸŸ]nôèÑÇÜÆ¸qã²UØÑõ°cóÊŸ–;bŸ@BØQ®ÚÚÚéGGfôèó<×žÈÝÎ§”	\0\0a‡°a\0Ðù\0£Ü½ü`°ÿþl=ŽÂÂeLE5{öì¬ÈÙÍÍÍiáÂ…iâÄ‰ÇCüqaGÃŽ}\rëÒú§n;v\n«Ü¶Ø\'vtdøðá;ºG¯=Ïkjjöç~U*\0\0„Â„\0@‚ŽÎŽÔx´:®¼òÊVËiÓ¦eßìîŽ>ø 7âã…ëyüæ7¿vt!ìˆ¶õù‡Ž	;b›0BØQfÐ±¢/žç¹öN®}M¹\0\0v;v\0\0½tôÔõŠ¶#:b\Z›(`ö”†††4yòäV÷1wî\\aGgÃŽÃ‡Óæ?Ì<v\n«Ü¶Ø\'vtð™þ™>~žª©©ù’’\0 ìv ì\0\0ÚÑÑbäÅíÔÞ1[9·3µ]££¾¾¾Wî\'æþyþGx¬Y³FØQfØñÎþ†´iå}%×ìˆ}q¡„°£˜£ktôùó<FxäîûLe\0@Ø!ì@Ø\0´Pt4U9aG¬#<–/_~ÌˆŽÞ‹ßu×]-÷7bÄˆ´k×.aG{aÇáÃ©qóÓéå\'¿[2èÈ·¸L\\Ö(aG›ÏòS¸y_?Ïs­±¶¶öJ\0€°CØ°\0(L”³ÖF¹aGgow =zt«¹û{rJ›R<˜Æ×r¿S§Nv”;:\ZÍa”‡°£555kúûyž{÷*\0\0ÂaÂ\0 M QîŒÎ„ƒ-ðX´hQK!²®®®Û‹wÆ/¼Ðj:«7\n;Š„åŒæho”‡€BØqÙe—}®žçG,ÿKå\0@Ø!ì D‘#úý`úv\'\0¤ £+aGþ`0Liuíµ×¶\"gÏžÝç÷Ï=÷´ÜÿÍ7ß,ì(vt5èÈ7…°#÷üz´Ržç¹öCå\0@Ø!ì ŸŠ)çwÞ ^°\0*EWˆ®„]\rVªI¬“‘/@Ž92íÞ½»ÏÃ–-[Z­²wï^a‡@AØÑƒbŒÜsëP¥<Ïkjjö×ÕÕý…\0 ìvÐOß\ZâÊqÇ\'ð\0€~:º2Ú²«aGá1Aµò;vlzê©§Ú½Ì¬Y³Z\nÓ§Oï·Ç:qâÄ–Ç1gÎa‡@AØÑƒjjj.¯´çymmíW”\0\0aÇ \n;öïßŸæÏŸŸ¾ÿýïgÈM˜0!û&Nþ\0ñšk®IS¦LIÿ÷Ÿ}(|ýõ×UAz)è,ßî€JoîjàÐ°#ÿÕö¥‡ü1c„K—.-z™˜6*¹yóæõÛc}ä‘Gút¡òþ;jkkçÚß\n;„}Ý¯bÚ¨J{ž[¨\0v’°ã÷¿ÿ}öA~Ô¨QYÈ±páÂ´nÝºl¸ñ|Ðr¹}ûöe‹8>ùä“Ù¨£GÎ>þÓ?ýSvN÷¾5Zª˜Ño•\0]:º4t7ì(ç¡RÃŽ|7nÜ1#=®¾úê–ý}µ8x1õõõ­Â™v|£}qMMÍg…ÂŽ¾êW¹ýÏTÚó<¯\0 ìècå~«\'ÂŽ˜Ç4><Ç¼øÆM„qäÈ‘´råÊ, ¹þúëÓ‚TGºXÄè(È0Â\0ª\'èè©°£ÚŽÚ†…aB>ô1bDËöÆÆÆ~{¬Û·ooyñ˜rØQÐž(ö9CØ!ìèé~•Û¶£Òžç¹Ö¨º\0;úéà±£o`u÷ƒóoûÛì›u¿þõ¯Ssss·$Ÿ{î¹ìÛ{1ÍUL‡EùÅ‹rGlTëüÝ\0P-ÊIQbôt«öc€RaGáHÂó‡ê·Ç\Z_Ú)|,ƒ$ìhùœQXœv;zº_Uêó\\u\0vôÿÁã%Fztù ïÇ?þq6ã…^èÑƒÉƒ¦3f¤«®º*mÛ¶MÅ¤¾¥)ð\0€ÞñÆodéóÎ;¯œ¢uŸ†!WGaBµµJ\ngSØQø9#¾\\%ìvôt¿ªÔç¹ê\n\0 ì¨ƒÇ\"Ó[u9è¸á†²õ8zK,^ëyÄºô\\ÐÑS×\0Š+gzÉ!Fv”UT,lcÆŒIsçÎÍŠ¶ƒudG%‡NÂŽÊoÕj\ZÙ\0 ìèðX]	;bêªÞ:ò-Z”®¸â\n#<JQºTTÛ‚¥\0P-¬ÙÑsýÂ#Ïšñ¹â¹Üç‰/\r:ô£q¹Þ;î¾ûîô™Ï|&pÂ	éãÿxö7Žõc_þyQ\r!C¥<Ö*ÙÑÒ¯¬Ù\0Ðõâÿ lýà.bŽµk×öÙÁåÃ?œ®»îºVp=÷­L#<\0 wî¼g÷DØQm_nÈ§ÖÕÕe#}‹Æñhþr7nì·ÇZ__ßjõAv´\n9òz:ìˆimã÷ýüç?Ÿ}«?¾çÏ9çaÇÀ;ŽéW¹mÏTÚó<fJP]\0¨œp§íAd§ôn¹å–l1ò¾6qâÄtï½÷*š´)š|øá‡ÙëøÙm¯g\r\0èÝ÷î®\rÝ\r;zè¡tÜqÇUÕ—\ZŠähë¦›nj9¾7o^¿=Ö¸ïüãˆÇ4ÀÃŽUµµµ_irôVØqî¹çf¿ï‚:öíÛ—®½öÚtÒI\'¥O<1?>8p Û!ÉÙgŸ‰ý_|qËè={öd£Èã:±oØ°aiçÎÇÜW{·Ÿq»çŸ~¶-\nóñøãò±aácmï>‹ÝÖ ;Jö«Ü¾û*íyIµ\0 ÿÃŽ¢ßÀêÌçßÿþ÷Y¼¹¹¹Ï0\Z\ZÒÈ‘#Ó®]»KŽ+\"¨8ãŒ3²Dñ³ÜÀ£Ôõ\0Ð;º3²¢;aGþ½}êÔ©îoúË_þ²å8wúôéýö8&OžÜò8~ó›ßÔ°£Ôçˆ^\r;\"œˆß7*´vD§cDx¦ãt±ï”SNÉÎoÝº5­^½:;bôPœñÅ³‘ëqú’K.9æ¾Ú»ýüãXºtiöY%¶åþV-AM~DJþ±¶wŸÅnk\0‡ö«ÚÚÚQ•ö<Ïµ¯©6\0\0ô_ØÑî7°:óÁ9>¨ÏŸ?¿ß2ï¹çžA;ÕR±o…FðTX\0)\'ð(:òíšk®é‘bÌÿßÞýÇX]Þ‰w1ÖkÜÄÖØ¤k6»ÙÓ³üa¼	Á4æ&ñ&½mo—2€€€ øT„Š?©ìX]mwµ 4-†²e\"•KÅ^pYXŠ¢T)™\n(0à:ÂŠÍsçó½žñÌáœ™3?Ï™9¯Wò„33gæÇùž™ó}Ÿçy\0€žý.ÈØ1œCGˆWæçþÞÄœ<yrÐïCÁ:þƒò¢œJÄŽrõwì8÷Üs³ÿÞ˜UÑ]ìˆYq9–»Š—ã}ñ±Q£FeoG<¹îºë²å±bvEþçåÜçå®¾~îóâý]]¿ð¾»Íb_k¸ÆŽr´ÛÙ~lª¢ãüTûsë¿p¶\0`ðcGY¯À*÷‰skkk\Z?~|öd£RbvGû—5·wG©\0Q,\\t<Ê½¾=<\0`à~§÷tI©ÞÄŽZyñBþ¾•xAÎâÅ‹;n?–\\µ;boŽsÊ\\Æ*–ƒ*Œ^xaö±x;îÛí·ßž.½ôÒŽ¿£DW÷¥«¯N‘ý8Ê‰ÅnóœÞÛc¨ÅŽ/ž×¾R-ÇyûXêL\0@u+ë¼øÃòþûï¯ø“Ú[o½5­[·nÈ=Y½¹ßÝmF^nÀèi±¤\0\\ðèÉïØžÆŽZúž¿”Õ-·Ü’<,¹%Vs·¿uëV±£ŸcÇ3Ï<“ý÷^ýõÙÿÛ^x!{ûoÿöoÏ\n¹¥¡ò—™ŠŸ‰øØÕW_½ÿböM\\þÚ×¾–}¬®®.{{É’%Ù²RqyôèÑgÝ—®¾~±@ËRåBMîú¹ëtu›bÇÙò—²ªôqÞþÿîïœ>\0\0±ãÑGMkÖ¬©ø“ÚE‹\rÉW)æþ@ŽèkðöçÉŠîBFOCGþíµ\rM`(èÉ,ÊžÄŽž†”¡.NÞN˜0¡ãï¬_|qÐn{Á‚·{7–ZŠ1\"ÄFßù›‹G´(¶Ayü³&bÄIñÜ^Hßþö·³Ï¯ûu¼úê«ÙÇš››³‘Ûx<\"E\\¿Øå¥¾~±@Ë¬ÅÌ”¸½ü¥g»»M±ãl±RAûqöûJçcÆŒùµS\0\0Ã$vÄ¬Ž]»vUüIml*KÕØ‘Ó¦Mër¦GO—’*4Îœ9Ó«ÐQxÒDð\0€ÊrcGo–È\ZògwÄ+°÷ïß?à·¹víÚN×Åß§bÇÀÄCìù³;*tœŸ3fÌN\0\0“Ø¯^jii©øÚx%TLýê±#¦GaôèížÅ‚ÇW¾ò•^‡Ž¾Þ\0 ï¿cË‰µþ»zúôé[Ýyç©­­mÀnkË–-–µyê©§õ¿Uì0j1v„öãmM¥Žóö1Ãi\0€a;â½Ï?ÿ¼jÂÁp‰ù3=by«¾Î¤(<ú:\nO¢ØÃ\0úW_—žªµ¥«Š‰%€ÆŽÛñwÕÂ…ÓgŸ}6 \'@cù¡ÁÞ”\\ì0ÄŽsÎùÞ÷¾÷Õöãîè`ç6%\0†±£šCwá`¨Žï|ç;ÙØ‘#GöéûKWÎèˆ·ãý}÷+¾Ö`L€Z=}±ƒ#|)^4’ÿwU¬µû,ô—XÒ&ÿ•ÞñB•ÖÖV±Cì;Ñ˜1cþ{ûh¬ã¼}¼ü½ï}ïÏ2\0\0f±ÃÌŽ	4\'NL\r\r\rÙ“þxu¦™\0_:xð`¶‘mœ<FåÇúõëÓ¦M›Ò¾}ûü€–ø][nð°ÌäÙV¬XÑéï¬xuö¶mÛúô5:”|ðÁ³fäV\"tˆF­ÇŽ0vìØÿÕ~ž\Zèã\\è\0\0Æ±£Zöì8zôè°Ø³£0rôÇÉ{v\0t›7oÎ~w9ÁU]#~—766¦½{÷úAíåïÜeË–e×›7ožoZÕ«WwZÒ*F}}}Ú³gOC/^\\ø*ïléªJ…±Ã;þ¿¿ÿû¿ÿíÇãÇuœÇÒUB\0À0Ž÷Ýw_zçw*þvûöíiòäÉC6vÄ+âU‡Å\"G±“åÎ¤(:âíXºªØûË\r}ÝC RbF‡ÐQÝÁ#fÜPúwo©¿âý#FŒ:º°sçÎìÅ1…/6¹í¶Û²¿Ã\"„Æ²œ¹õþãß8é¯_¹reš;wnÑ¹ƒ½¹Øaˆ¥;öòöãò½~>ÎÏØŒ\0 bÇ£>š­aZi‹-JóçÏrOº»šÉÑ×Ww–\n¹ ÑÝÇ»zÕhœL:€¡(N¤;±Uý\'ÝèÙß\0f[–/f_Ä÷©p–GoÆŒ3²ÜT±Ã;¾³/ÚñúÂY½cÆŒùuû¸Âé\0€\Zˆñê—…Vü	^,P\rÑe°_ÝYê¤F¹!£§Á#w2Å«F¡ÊI7±c¸¡£wšššŠ­Å_Öˆ¿;c–X5;±ãlãÆûËöcö‡ù›——9bï¥uuuç´\0\0@\rÅŽÃ‡g³ÚÚÚ*öä®¹¹9{u^%ïC5½º³§£Üë@­ÅŽ#~’î\\ñf6â²bbGµý\r0räH¡£âïÇØÏ#fÇã…Ë\\ÅÛS§NM÷ÜsOZºtiö·o5;±£´I“&ý·/öóx<6/²ÌÕ‘öç“ÿÖþïScÆŒù~ûå¿p:\0\0 cG¸÷Þ{³\rE+å™gžI³gÏ®É\'è¹õ¹óOrÄòsz¸4U±àqÓM7uº\'S€á;NŸþ¯tüä§ooúCsGìˆË¹÷·|Ô–>úøS\'ÈÄŽŠºùæ›cy•´`ÁßÄCì\0\0€þˆñj¸»ï¾;}þùçy5Þ¸qã²¥jUá†¥ùá¢\'›Ž—ú¼žnŠ0cG„Žå[ÞM?X¹+­ûýáÔ¸ûHºÕÛ±#.Çû_Úù~š×~\'ûŸéÄ\'‚‡ØQ9“&MÊ^‘b‡!v\0\0@?ÅŽ0sæÌ´yóæAbW__Ÿ-+Pë\n—´ŠP33Ê\rùÁ#ÿó\nC\nÀpÇN´¥¹\r»:âFwãî}+½wì¤“dbGEüüç?ïX~¥–_ðØaˆ\0\0Ðï±#6uŽ[[[íIÝÎ;Óøñãõ6‡Rðè«bKd×Øcí›‡ÊŽ\rÿqÀ	2±£\"r³Zs±Ã^Zˆ†Ø\0\0ý;B<ÙþÉO~2(ËYÅæñD?–Ð¢ÿƒG‡€¡;béª\\Ì˜óü[éWÿ¾?55”¸ïË}üå·9A&vTÄc=Öií±cÇ¦cÇŽùÆˆb‡!v\0\0@ÅŽøC96Ç^¶lÙ€>™kiiI7Þxczâ‰\'<³-¢¯KOYº\n¨µØqäÃO²\rÈó÷èˆ¸Qx½x_þñ9ñ¹N”‰ƒ%¢FÄüØãÇ?þ±oŽØQµ\'«7lØà±­ºÇ©öÇÝ3žþ\0 vˆ7ÜpCZµjÕ€<‘‹¯¡ÃŒƒò‚EO¿O6#j1v[¦*fs^/ÞWìºN”‰ƒ%fÑ†ŽuuuÙòVˆÕhÓ¦MGâÅJßªs:tè_Ûwÿàé/\0\0bG±Qf¥K—öë“¸Ø£#–®2££gá¢Üàaé*@ì;ÄŽêµk×®¢¡#7\Z\Z\Z|“ÄŽª´qãÆo566~ôÁ|ê1®ºftDèX¿~ýöñ¿=ý\0@ì(!f`Ü|óÍiæÌ™éÀ}úZñJÅúúúl3r{tLðˆ¥Çâz69j1vXÆJì\n¦M›Öeìˆ¥D;ªÕúõëÿgû±ý»X.)Žq£*Fü¿øƒÐ\0€ØQ¦XC:fcD¬øãÿØ£ÏmnnNK–,É>ÿî»ïN­­­žÉöBw{pÄûGŒ!t\05;¾Ü ¼¹ì\rÊãºÂ„Ø1XbÖì¤I“²¿‰b”\n›6mòÍ;\0\0\0ˆØ\"R<üðÃÙzÒ1Ûã\'?ùIzõÕWÓÁƒ;]ïøñãiûöíiÑ¢EiÖ¬YÙœ³gÏÎžàÓ7¥fxXº\n;¾¿Ýu¨è2UÅÆov¾/LˆËzÎ™3\'íÙ³\'ëÖ­ËþEì\0\0\0`€bG¾\r6dá#–b(|ebÄxÕâüùóÓÚµkm´9ÀÁCè\0ÄŽ/Ç±mé+w•;îix+µ|Ô&Nˆ³páB¿Ã;\0\0\0*;¨Žà1räH¡;òFÛ§§Óâû²¥ª~½ã`zewç=<ârãî#iÝïgQä›šÒ©Ó§Å	±£bâwx;\0\0\0ÄŽš{tÄLšR{x\0ÔbìÈæÖ/7\rÈs±#.çÞÿáÉO…±£âæÎ›-eb\0\0€ØQ³\"v\0ˆ]#~Ò;â²!vT“Ø×,ö9±\0\0@ì;\0†‰cÇŽõ{ì0ÄŽjvë­·¦¥K—úF v\0\0\0ˆbÀp1~üø4þün£‡Ø!vÓ§OO\r\r\r¾ˆ\0\0\0b‡Ø0\\Œ7.{l‹ñÈ#¤ÖÖV±CìÖ¦L™’~ó›ßøF v\0\0\0ˆbÀp1vìØŽØ‘Ï>ûlvò\\ì;†£I“&¥W^yÅ7±\0\0@ì;\0Êñ§?ýiH<®±¼ÕªU«Ä±cØ™0aBÚ¾}»ob\0\0€Ø!v\0”:ŠE„ºººlÄòQâÄë\r7Ü&Nœ˜&Ožœ-±3uêÔtÓM7¥3f¤™3g¦Ûn»-ÝqÇiöìÙiÎœ9iîÜ¹éÞ{ïM<ð@zè¡‡ÒøÃôÿðéñÇOO>ùdú§ú§´hÑ¢´dÉ’ô‹_ü\"-[¶,­X±\"­\\¹2½øâ‹Ù>ëÖ­Ë^Ý^*väFÜ·ø\\±Cì.âØÛ½{·ob\0\0€Ø!v\0”û˜{`|üñÇéøñã©¹¹98p íÛ·/;ÙºsçÎìæ[¶lIY€ˆA\"ÂDD†,\"\\DÀˆA#ÂFŽ<\"|D\0‰A$ÂH’%L\"œD@™6mZT\"¬Är>ÝÅŽÜ2Wb‡Ø1\\ÄÏôûï¿ïØ\0\0 vˆ\0å>f;v¬êïc±qË-·¤µk×v\\Oì¨þÑ]¸ªäˆÀ£pVS·o¼±c6SüÜÝzë­iÖ¬Yé®»îÊâÝ}÷Ý—|ðÁôÈ#¤G}4‹}O=õTZ¼xqÿå_þ%544¤Õ«W§—_~9›±´uëÖôúë¯gQ±©©)‹ÛÚÚ²ûqâÄ	Pˆ\0\0\0b‡ØPŽ8©\Z39ªUÌ:)<)=oÞ¼¢û”;âóFÎ?ÿütÁ¤Q£Fe³Vâc_œP,úy]}l8ŽåË—§K.¹${î¹éšk®éòº=ùÞTëÌŽS§Ne¡áðáÃYxˆ\0!\"‚D„‰*b6S|o–.]šž}öÙôôÓOga#G„Ž>\"€D‰ÙK1séæ›oNÓ§OÏ‚I„“(R\"¨DX‰À’›¡”ûw(ì§ƒØ\0\0 v v\0U¡Ú÷Ø³gOÇ	àˆq2º”rbÇe—]–8ÜµkWzã7²Ë—^ziM®Æyç—}/bvA„€á;ªÐØ\0\0 vˆbÐñêò;vTíý‹Y\'?üpYKm•;b6GüŒˆRê¤},S3?bfCìGRxB?w9^_ïÊ+¯,úõb&ÀW\\‘…ƒ¸^ÌˆYÅAþÛñßüo|#û¼Ë/¿<›]ÐÕû=šmÒž›­òÝï~7[©»ûPêcñur÷§ð¿¹Øý;@ì\0\0\0;;€Šš8qbzíµ×†ÅK9±ã±ÇËN^xá…YÔˆ…\'ð#D¼ˆË_|qÉ“û/¼ðBvÝ¸|íµ×žu[]tQö±wß}7[>+._uÕUÝÆƒë®».»1#þ˜ÒÕû#ºÄÛ1SåÍ7ßÌ.ó›ßìö>ôöþ‰ v\0\0\0ˆˆ@U™<yrZ·n]ÍÄŽ±GG‚ñ;1H©ú±gE©“û±¼SŒ¸³!\no\'ö‰ÅÌ‰?ýéO³YÝÅƒÜÌŠÂ¯×ÝûóGîþtuz{ÿÄ;\0\0\0ÄÄ ªÄ†É1;¡–bGn¼÷Þ{Â@¹\'ô‹ÅŽXªðëÇÇâ>Ý~ûíÙ¾ q½Ø3d bG±½5ºº½½bˆ\0\0\0bbPU¦OŸž\Z\Z\Zj&vÄ^ñ{0–mŠ½JÊ=Á_ìrìç±fÍšìòõ×_Öm]}õÕËNÅÆêqùk_ûZö±X+Þ~ûí·ÓK/½Tt«˜rN‘e¬\nß_WW—½½dÉ’ŽM×GÝí}èêc…ß‹®î¯Øb\0\0€ØØTÔÌ™3³“öµ;bO‹1\"–¨Š¥œr}÷4vÌ˜1#û\Z±ÏEì{Qx[±¡ø·¿ýílÖG,×{õÕW³=÷ÜsÙžñ±Y³fuúúñµ\"DÄçÄâfºzsssÇféñßûuÄmwwºúXá÷¢«û+v€Ø\0\0 v v\0Kýìg?«™ØÑ£\'\'÷\r±Ä\0\0\0±±`wÝuWzúé§ÅŽŒ˜=QlCrCì\0±\0\0@ì@ì\0*`îÜ¹éÉ\'Ÿ;±Ä\0\0\0±±šî»ï¾T__/vbˆ\0\0\0bbG%<x0Û`xÃ†\rÙ‰4cèõë×§M›6¥}ûö9¨ØÃ?œ,X vbˆ\0\0\0bbG%CÇæÍ›SKK‹‰Ãl=z4566¦½{÷:°PÌêˆÙb‡!v€Ø\0\0 v vTHÌè:†wðˆ;œ\'žx\"Í›7Oì0Ä;\0\0\0ÄÄŽJ‰áN :9Jï=ýôÓé®»î;Ç3ˆ\0\0\0bb‡“›†“£CÓ’%KÒwÜáñÀp<ƒØ\0\0 v vTûÉÍO>:’þø»¥éõ²—ã}N>:9Zë–-[–fÎœ)vŽg;\0\0\0ÄÄŽj>¹ùqë¡ôöÿ½?½õÒœN#ÞsÒÉÑZÖÐÐ¦OŸ.vŽg;\0\0\0ÄÄŽj>¹ùÞ;ÿç¬Ð‘ï¿³Æ	H\'GkÚêÕ«ÓÔ©SÅÃñb\0\0€ØØQÍ\'7ÿðÊJÆŽø˜NŽÖ²uëÖ¥É“\'‹†ãÄ\0\0\0±±£šOn¾ýo•Œñ1\' ­e¯½öZºá†ÄÃñb\0\0€ØØ!vNŽM;vìH&L;Ç3ˆ\0\0\0bbG5ŸÜ|gý‚’±#>æ¤“£µl÷îÝiÜ¸qÃâ¿eÃ†\rŽÇ3ˆ\0\0\0bbÇðŒû¶<]2vÄÇœ€tr´–8p ;vXü·lÞ¼9µ´´8nªt477gA\n;\0\0\0ÄÄŽ^ÄŽã‡v¥·×=xöVíï‹9	)vÔ²ˆÃ%v455¥ÆÆÆôÁ8vª4tìÝ»×Ab\0\0€ØØÑ›ØãÝËÎŠñ>\'!ÅŽZ×ÖÖ6¬7\"xlÜ¸1û¹1ªg v\0\0\0ˆˆ}§O§}ÿ¾øì%¬ÚßÄŽZ¶`Á‚4fÌ˜ôÃþÐ7@ì\0\0\0;;ª1v|Üz(íÝòTÉ=;âcqQAì¨E?úÑÒŸýÙŸ¥‘#Gfÿ>ðÀ¾)\0b\0\0€ØØQ5±ãôétdßÆôûßÞ[2täF\\\'®k–‡ØQ‹¡#8bfÇˆ#\0±\0\0@ì@ì¨†ØÑÝl³<Ä¡ãGEgr”z?\0b\0\0€ØØ1È±£œÙ]ÍòÄŽá,fpt4r·‡€Ø\0\0 v vT0vô6tä†À v÷ÐÑ]È0Ã@ì\0\0\0;;*;±ƒÒ£Ü=½>\0b\0\0€ØØ!vbÇ€‡ŽžÎÔ<\0Ä\0\0\0±±Cì0ÄŽ!:úëó;\0\0\0ÄÄ±Cì;z­»ÍÈûë\0 v\0\0\0ˆˆb‡ØAE-Ae†€Ø\0\0 v vˆ†Ø1h\n÷ÚøÓŸþ”¦NšýÛ…Ÿg\0±\0\0@ì@ì;±cÐBGnF„ŠË.»,;Yÿ–<J}žà v\0\0\0ˆˆb‡!vZè13ã‹eeüÐ‘7ÝtSÇÇíá v\0\0\0ˆˆeˆ“Üb‡!v”¯T€(.º\nå^ß\0b\0\0€ØØÑÉ“\'§ÿøÇ©­­Mì;jæøYëÖ­ëuè(µ´T¹£§aÄ’V\0b\0\0€ØØÑ…qãÆeÿ-uuué©§ž*=Ä±c¸¿1\"zlØ°¡¬Ï)78t2z\Z:òoÄˆfx\0ˆ\0\0\0bbG¡ˆ¹¿1\"~¬X±Bì;j\"väÆ´iÓºœéÑÓ¥¤J3gÎô*täØÃ@ì\0\0\0;;Ê8é›\'NL«V­;ÄŽšˆù3=\n£Go÷Ì(<¾ò•¯ô:tôõþ\0 v\0\0\0ˆty²tìØ±ÿÆˆÙ1CbüøñiÂ„	Ùˆx0iÒ¤lŒo¼1;©\Z¯&Ÿ>}zš1cFš9sfºõÖ[Óí·ßžfÏžîºë®t÷Ýw§¹sç¦{ï½7Ýwß}é¡‡J?üpzä‘GR}}}züñÇÓO<‘þùŸÿ9=ýôÓé™gžIK–,IK—.MË–-K¿úÕ¯RCCC-V¯^Ö®]›È}å•WÒk¯½–¶nÝZò¤onÜpÃ\rÙL±Cì¨…Ø‘?Ó#–·êëLŠbÁ£/¡£0xØÃ@ì\0\0\0;è³8A{\\´¶¶¦cÇŽ¥÷ß?8p íÛ·/íÞ½;½õÖ[iÇŽiÛ¶mióæÍYdˆØðòË/gñ!\"DÄˆˆ	\'\"Rüìg?K‹/ÎâEDŒ\'Ÿ|2‹\Z7\"r,X° ‹?\"‚Ì›7/‹\"GfÍš•î¸ãŽ,šD<¹ùæ›³˜\'n#®L™2%‹-]\"bÄèî¤onˆÃ”û³P+ã;ßùNvâkäÈ‘}zœˆ¥«\ngtÄÛñþ¾ˆû_kÿþýŒÄ\0\0\0±ƒÚVêDo„‘˜	’#v˜ÙQ?÷1+d|?BnfGogP˜Ù v\0\0\0ˆ0ÀbVJáÉÞXR«ØFÍƒ;¶oßžFÎ?ÿütÁ¤Q£F¥-[¶dË .öy]}¬Ò£šï›ØQ:röì\0;\0\0\0Ä¨B{öìé8Ùû„ÄÛ¥FìÈÞµkWzã7²Ë—^zé‹bÇÐ‰±¤[,#W,råÎ¤(:âíXºªØûË\r}ÝC\0±\0\0@ì`ØijjÊöùè*rfìˆÙqÜÄý)\rn¹å–læÇ%—\\’ísRr—ã$v|½+¯¼ò¬¯·Çubùx;ö.‰·—/_žŽ?žísŸ·3]Nœ8Q4\\ä¿{µ|ãßHçw^ºüòË³Íß»»ßGÍn;7“å»ßýn¶ïKþç]sÍ5éª«®;úYW39ºÝ…†R¡#4ºûx)ñs3bÄ¡@ì\0\0\0; ·#v<öØcÙ‰†/¼0‹1Ã£0,ÄÆî/âòÅ_\\2v¼ðÂÙuãòµ×^Ûév>œ½ÿ¯þê¯²·ÿú¯ÿ:{û½÷ÞËBG\\Ž ²råÊìrîbÇu×]—]ŽÈÿFdéî~G‰·cË›o¾™]þæ7¿Ùéó6lØÝ_±£:t7³¢ÜÑÓà‘-óæÍ«šïÅÁƒ³Ÿ÷øŸ£òcýúõiÓ¦Miß¾}V;\0\0\0Ä¨Tìˆ{tDˆàÇPR¡áÜsÏ-;N:•¸3\'\noçŠ+®È>öÊ+¯dÿ~ýë_ÏÞ×-õù]ÅŽÜçu·ŒUþýÎ}Nþ(¼­¸–±ª.¥fxô4`”{ýj\r›7oN---Cni¹á>bÆXcccÚ»w¯ƒÄ\0\0\0±*;r#fY”\Zº‹±DTá×™#ñ±o}ë[Ù¿1£#)­üÏðÒŸ±£ðsŠs*°×‡ØÑ³…KJM:µÇKS7ÝtSÙ3I*%ftÕ<bÆ\r v\0\0\0ˆPØ{]Äq³}ûö´cÇŽŽÆ½‰±¿Áš5k²Ë×_ýY·•[¢*öØˆŸþùNKKå/ca$>ËOÅÛo¿ývzé¥—Š.c3SÎ)²ŒU±û]WW—]^²dIÇ†ì£G;†PðÈß´<?\\ôdÓñRŸ×ÓMÑSœHª{8žAì\0\0\0; B±#ö­ˆ“ý1ã!–z\Z5jÔY}—;bŸø\Z±¹÷»ï¾{ÖmÅ¦ãññs¾XV*^	ï\rÊãúqbDèÈmPþÜsÏ¥‹.º(›ý»çßnÜÆÕW_Å“X\"+‚Mw÷»¹¹¹c#õ¸­Ø¯#6:;†ŽÂ%­\"TÄÌŒrCG~ðÈÿ¼ÂR‹†ãÄ\0\0\0±jöäf%\"“£‚G.5Ul‰¬¡üxpäÃOÒ+ÞÌF\\v¬9žAì\0\0\0;@ìèfäfd8ÙéäèPýN*ñxpúô¥ã\'?íx{Óš;bG\\Î½¿å£¶ôÑÇŸ:öÏ v\0\0\0ˆ vNŽV‹¾.=UíKW•óx¡cù–wÓVîJë~85î>’î_õvGìˆËñþ—v¾Ÿæµ_çÉßþg:ñ‰àáx±\0\0@ì\0±Ãpr´ê‚GOgfTófä=y<8v¢-ÍmØÕ7ºwÿë[é½c\'Žg;\0\0\0Ä;\'G«IO—¢\Z*KW•ûx°öÍCeÇŽ†ÿ8àØs<÷«Ã‡§¥K—¦ùóç§)S¦¤ºººôýï¿cÄÛ“&MJ³gÏN‹-J{öìñ …Ø\0\0 v vNŽÒ—€±lÙ²ìzóæÍ6±tU.fÌyþ­ô«ßŸšš?ÊF\\Ž÷å>þò[‡{Žç~±zõê4cÆŒNa£œ1vìØ,~<ûì³Ù÷\r±ÃÓ\0\0\0±±Ãpr”<ÝíÁï1bÄ¥Ž|øI¶yþ7\n¯ïËßÃ#>\'>×1èxîM›6¥‰\'ö8rãÇÏf{ v\0\0\0 v vNŽRÆ¡¸tUwÅ–©ŠÙ…×‹÷»®cÐñÜSqü‹qãÆ¥úúú´råÊôÎ;ï¤#GŽ¤S§Ne×ÿì³ÏRKKKÚ»woZµjUv½	&œõ5¦M›–ššš<€‰\0\0\0ˆˆ†“£”\nC=tˆŽçJkmmÍöãÈ±ÕòåË³˜ÑmmméÅ_L³fÍ:+z¬]»Ö˜Ø\0\0€ØØa89Jað9rä¥,cåx¬Ð1yòäNQâþûïÏfpôÅçŸžÅ˜’¿ŸÇ/ùK`b\0\0\0bb‡áä(9±GGœ@-µ‡Çpy<hÜÝ\\öåq]Çžã¹\'\ngtÄrU*úË¡C‡Òœ9s:ÝFCCƒ0±\0\0@ì\0±Ãpr”œ8q:Ü~»ëPÑeªŠßì|ß±çx.[áÛ¶mÛ‰=>b?ü;wîô\0&v\0\0\0ˆ vNŽR±ãØ‰¶ôƒ•»ÊŽ÷4¼•Z>jsü9ž»µiÓ¦³ft¤ØÌ|áÂ…·WWW—>ìALì\0\0\0;@ì0œe¸ÇŽ¶OO§Å÷eKUýzÇÁôÊîÎ{xÄåÆÝGÒºßÎ¢È/65¥S§O;þÏÝš0aB§=:úséªRNž<™¦M›Öq»óæÍó &v\0\0\0ˆ vNŽRËXEðhnýrÃñØ€<;ârîýžüTèp<—eõêÕÁaÒ¤I}ÞŒ¼\'^ýõNËYíÙ³Ç™Ø\0\0 v€Øa89*vÔÚãÁ‘?éˆqÙ±æxî©éÓ§w‡åË—úíÿã?þcÇíÏŸ?ß™Ø\0\0 v€Øa89*vx<0Ïå‹}2r¡aÜ¸q©¥¥eÐïCSSS§ýBŽ;æÁLì\0\0\0;ÀÉMÃÉQ±Ããáx.ÏÒ¥K;\"C}}}ÅîÇ¬Y³:îÇŠ+<˜‰\0\0\0b8¹i89*vT«©S§¦uëÖy<p<WÍÏ[,•‹+W®¬Ø}}þùçmT.v\0\0\0ˆ vNŽ2bGîdnœ„Þ°aƒÇÇsÅÞ¦L™Òq½Jn¾mÛ¶N÷±\0\0@ì\0±ÃprTì¨ò“Ï¹1mÚ´¢¯¼÷xàx¬Ÿ·ºººŽ9r¤b÷õàÁƒ÷#îb\0\0€Øb‡áä¨Ø1DN>ç¿’=ÿ$´ÇÇó`ý¼å¿ÿÔ©S»¯Ÿ}öY§û‚Ø\0\0 v€Øa89*v±“Ïù¯¼å†<8žëç­šƒØ!v\0\0\0ˆ0Ä	N\'e`Oî•!vTÿ.?kfv v\0\0\0ˆÐ¯6oÞœZZZœD¦£¹¹¹Ë\r©©í3qâÄÔÐÐý¬„JÇŽíÛ·§Ñ£G§óÏ??]pÁiÔ¨QiË–-ÙÇ¾8YYôóºúX©±|ùòtÉ%—¤sÏ=7]sÍ5%¯—ÿµ{s;fvÿy³gb\0\0€Øýª©©)566¦>ø@¦¡cïÞ½~ÐÅŽ.#GN¥cÇe—]–”ÜµkWzã7²Ë—^zé€„†óÎ;/ûz\'NœÈf”ó9bGÿý¼M™2¥ãã{öì©Ø}Ý¶m[§=E;\0\0\0ÄâÁcãÆÙI4cø¡ƒÂ“Ï“&MJ+V¬8+rTKìˆÙñ;6N~—\n\r·ÜrK6ó#fe,[¶¬äì‹øo¯wå•Wžõõâós×Ë}Þ«¯¾š¾þõ¯g$¾ösÏ=gfÇ\0þ¼ÝsÏ=×[¹reÅîkÜvî~Ä}Bì\0\0\0;\0 J•šÉQm±ã±ÇËNJ^xá…YÔˆ…±cõêÕY¼ˆË_|qÉ ñÂ/d×Ë×^{m·³4\"tÄ2Zï½÷^öþ‹.ºHìÀŸ·Ÿÿüç‘¡¾¾¾b÷uÎœ9÷ã—¿ü¥±\0\0@ì\0€¡®\Z6(=:bF@ø}¤XhˆË±ßF© KSÅˆË1“£»Øñî»ï¦¹sç¦«®ºªdà;úOÌ(ÌE†qãÆ¥“\'Oú}Èß¯#ÆáÃ‡=ˆ\0\0\0b\0ˆý7r3,r¡¢Xìè*HäÇŽXÎª»Øqùå—go¯Y³Fì$ùûv¬ZµjÐoñâÅ·?kÖ,\0b\0\0€Ø\0bGßG.8ÄrR;vìÈ.Ç¦å½‰±ŸG.\\\\ýõÝÆŽÜ>¹ÑÅŽ—¿”U,[qj°:t(›Q’»ý­[·z\0;\0\0\0Ä\0;ú>Þ|óÍ4zôè,<ÄU£FÊNB÷&vÌ˜1#û\Z±,U,QÕ]ìøéOšÝî7Þ(v’øï™0aBGpxñÅí¶,XÐq»ñ³‚Ø\0\0 v\0€ØQ5£\Z‚„ØQ¾üÙ1Óbÿþý~›k×®í´WGÌ$Bì\0\0\0;\0@ì¨š³3ŠmH.vT¯éÓ§w„‡;ï¼3µµµ\rØmmÙ²¥ÓòUO=õ”_ì\0\0\0;\0@ì0ÄŽ¾9pà@\Z;vlG€X¸paúì³Ï$tLš4É¦äb\0\0\0b\0b‡!vô¿\r6tZZ*öÔ8~üx¿}ýXº*FÇ´iÓRkk«ƒ^ì\0\0\0;\0@ì0ÄŽþ³bÅŠNÁ#falÛ¶­O_óÐ¡CéÁìôu…±\0\0\0±\0±Ã;ÌêÕ«;-i£¾¾>íÙ³§G_çàÁƒiñâÅfsä–®:Ä\0\0\0Ä\0ÄCìP;wîLuuu\"EŒÛn»-›ý±yóæ´ÿþŽ}=âßˆ1dåÊ•iîÜ¹g}®ÍÈÅO_\0\0\0Ä\0ÄCìT1ûâ8k–GoÆŒ3ÒöíÛàb\0\0\0b\0b‡!v¾¦¦¦³öÜ(wÄ’U[·nu`#v\0\0\0ˆ\0ˆ†ØQymmmÙ~óçÏÏ6/\\æ*Þž:ujºçž{ÒÒ¥KÓáÃ‡Ðˆ\0\0\0b\0b‡!v€Ø\0\0 v\0€Øaˆ v\0\0\0ˆ\0 vbˆ\0\0\0b\0ˆbˆ\0\0\0ˆ\0ˆ†Øb\0\0€Ø\0UmÃ†\r‚‚Øb\0\0€Ø\0C×æÍ›SKK‹¨P¥£¹¹9R€Ø\0\0 v\0@	MMM©±±1}ðÁâB•†Ž½{÷úA±\0\0@ì\0€î‚ÇÆ³å’ŒêBˆ\0\0\0b\0\0ˆ\0\0\0ˆ\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0b\0\0\0b\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0 v\0\0\0ˆ\0\0 v\0\0\0ˆ\0\0€Ø\0\0 v\0\0\0b\0\0€Ø\0\0ˆ\0\0\0b\0\0ˆ\0\0\0b\0\0 v\0\0\0Tcì8uê”gŽ\0\0PÅÎœ9Ó*v\0\0\0”ð7ó7ÿîw¿óì\0\0ªØë¯¿¾£ýÏ÷}žÁ\0\0\0qùå—?sÝu×ñô\0\0ªÖ™¯~õ«Úÿ|¯÷\0\0 ¸?o÷ÎèÑ£nÛ¶­õÌÝ\0\0ª¢pœ9Ó\Z3:¾ˆ¿Ý=}\0\0è\"x´‡¾x•Ã0Ã0Ã¨šKW=~ŽÐ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@_ü?cW/Å1UÏ\0\0\0\0IEND®B`‚',1);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values 
('next.dbid','32501',14),
('schema.history','create(5.22.0.0)',1),
('schema.version','5.22.0.0',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values 
('12','OrderProcess:1:4','5','5','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2017-12-01 11:26:22','2017-12-01 11:26:22',16,''),
('12502','OrderProcess:3:10004','12501','12501','task1',NULL,NULL,'Start','startEvent',NULL,'2017-12-07 14:18:18','2017-12-07 14:18:18',18,''),
('12504','OrderProcess:3:10004','12501','12501','Processing','12505',NULL,'Processing','userTask',NULL,'2017-12-07 14:18:18',NULL,NULL,''),
('14','OrderProcess:1:4','5','13','subprocess1',NULL,NULL,'Sub Process','subProcess',NULL,'2017-12-01 11:26:22','2017-12-01 11:26:24',2718,''),
('15','OrderProcess:1:4','5','13','startevent2',NULL,NULL,'Start','startEvent',NULL,'2017-12-01 11:26:22','2017-12-01 11:26:22',0,''),
('15002','OrderProcess:3:10004','15001','15001','task1',NULL,NULL,'Start','startEvent',NULL,'2017-12-07 14:34:51','2017-12-07 14:34:51',20,''),
('15004','OrderProcess:3:10004','15001','15001','Processing','15005',NULL,'Processing','userTask',NULL,'2017-12-07 14:34:51',NULL,NULL,''),
('15007','OrderProcess:3:10004','15006','15006','task1',NULL,NULL,'Start','startEvent',NULL,'2017-12-07 14:36:48','2017-12-07 14:36:48',2,''),
('15009','OrderProcess:3:10004','15006','15006','Processing','15010',NULL,'Processing','userTask',NULL,'2017-12-07 14:36:48',NULL,NULL,''),
('16','OrderProcess:1:4','5','13','exclusivegateway2',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2017-12-01 11:26:22','2017-12-01 11:26:22',0,''),
('17','OrderProcess:1:4','5','13','SendEVoucher',NULL,NULL,'Send e-voucher, phone card','serviceTask',NULL,'2017-12-01 11:26:22','2017-12-01 11:26:24',2702,''),
('17502','OrderProcess:3:10004','17501','17501','task1',NULL,NULL,'Start','startEvent',NULL,'2017-12-07 14:40:06','2017-12-07 14:40:06',14,''),
('17504','OrderProcess:3:10004','17501','17501','Processing','17505',NULL,'Processing','userTask',NULL,'2017-12-07 14:40:06',NULL,NULL,''),
('19','OrderProcess:1:4','5','13','exclusivegateway3',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2017-12-01 11:26:24','2017-12-01 11:26:24',0,''),
('20','OrderProcess:1:4','5','13','SendFail',NULL,NULL,'Send fail','serviceTask',NULL,'2017-12-01 11:26:24','2017-12-01 11:26:24',0,''),
('20002','OrderProcess:3:10004','20001','20001','task1',NULL,NULL,'Start','startEvent',NULL,'2017-12-07 15:08:18','2017-12-07 15:08:18',13,''),
('20004','OrderProcess:3:10004','20001','20001','Processing','20005',NULL,'Processing','userTask',NULL,'2017-12-07 15:08:18','2017-12-07 15:08:44',26837,''),
('20007','OrderProcess:3:10004','20001','20001','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2017-12-07 15:08:44','2017-12-07 15:08:44',10,''),
('20008','OrderProcess:3:10004','20001','20001','CancelOrder',NULL,NULL,'Cancel order','serviceTask',NULL,'2017-12-07 15:08:44','2017-12-07 15:08:47',2154,''),
('20009','OrderProcess:3:10004','20001','20001','CloseOrder1','20010',NULL,'Close order','userTask',NULL,'2017-12-07 15:08:47','2017-12-07 15:08:56',9911,''),
('20011','OrderProcess:3:10004','20001','20001','endevent1',NULL,NULL,NULL,'endEvent',NULL,'2017-12-07 15:08:56','2017-12-07 15:08:56',0,''),
('21','OrderProcess:1:4','5','13','endevent3',NULL,NULL,NULL,'endEvent',NULL,'2017-12-01 11:26:24','2017-12-01 11:26:24',0,''),
('22','OrderProcess:1:4','5','5','CloseOrder2','23',NULL,'Close order','userTask',NULL,'2017-12-01 11:26:24',NULL,NULL,''),
('2502','OrderProcess:1:4','2501','2501','task1',NULL,NULL,'Start','startEvent',NULL,'2017-12-04 14:17:35','2017-12-04 14:17:35',13,''),
('2504','OrderProcess:1:4','2501','2501','Processing','2505',NULL,'Processing','userTask',NULL,'2017-12-04 14:17:35','2017-12-04 14:18:57',82576,''),
('2508','OrderProcess:1:4','2501','2501','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2017-12-04 14:18:57','2017-12-04 14:18:57',11,''),
('2510','OrderProcess:1:4','2501','2509','subprocess1',NULL,NULL,'Sub Process','subProcess',NULL,'2017-12-04 14:18:57',NULL,NULL,''),
('2511','OrderProcess:1:4','2501','2509','startevent2',NULL,NULL,'Start','startEvent',NULL,'2017-12-04 14:18:57','2017-12-04 14:18:57',1,''),
('2512','OrderProcess:1:4','2501','2509','exclusivegateway2',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2017-12-04 14:18:57','2017-12-04 14:18:57',0,''),
('2513','OrderProcess:1:4','2501','2509','ShipVoucher','2514',NULL,'Ship voucher','userTask',NULL,'2017-12-04 14:18:57','2017-12-04 14:19:09',12873,''),
('2516','OrderProcess:1:4','2501','2509','exclusivegateway4',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2017-12-04 14:19:09','2017-12-04 14:19:09',0,''),
('2517','OrderProcess:1:4','2501','2509','ShipSuccessful',NULL,NULL,'Ship successful','serviceTask',NULL,'2017-12-04 14:19:09','2017-12-04 14:19:09',3,''),
('2518','OrderProcess:1:4','2501','2509','parallelgateway1',NULL,NULL,'Parallel Gateway','parallelGateway',NULL,'2017-12-04 14:19:09','2017-12-04 14:19:09',0,''),
('5002','OrderProcess:1:4','5001','5001','task1',NULL,NULL,'Start','startEvent',NULL,'2017-12-04 14:23:04','2017-12-04 14:23:04',14,''),
('5004','OrderProcess:1:4','5001','5001','Processing','5005',NULL,'Processing','userTask',NULL,'2017-12-04 14:23:04','2017-12-04 14:23:18',14693,''),
('5008','OrderProcess:1:4','5001','5001','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2017-12-04 14:23:18','2017-12-04 14:23:18',21,''),
('5010','OrderProcess:1:4','5001','5009','subprocess1',NULL,NULL,'Sub Process','subProcess',NULL,'2017-12-04 14:23:18',NULL,NULL,''),
('5011','OrderProcess:1:4','5001','5009','startevent2',NULL,NULL,'Start','startEvent',NULL,'2017-12-04 14:23:18','2017-12-04 14:23:18',1,''),
('5012','OrderProcess:1:4','5001','5009','exclusivegateway2',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2017-12-04 14:23:18','2017-12-04 14:23:18',0,''),
('5013','OrderProcess:1:4','5001','5009','ShipVoucher','5014',NULL,'Ship voucher','userTask',NULL,'2017-12-04 14:23:18','2017-12-04 14:23:23',5388,''),
('5016','OrderProcess:1:4','5001','5009','exclusivegateway4',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2017-12-04 14:23:23','2017-12-04 14:23:23',1,''),
('5017','OrderProcess:1:4','5001','5009','ShipSuccessful',NULL,NULL,'Ship successful','serviceTask',NULL,'2017-12-04 14:23:23','2017-12-04 14:23:37',14566,''),
('5018','OrderProcess:1:4','5001','5009','parallelgateway1',NULL,NULL,'Parallel Gateway','parallelGateway',NULL,'2017-12-04 14:23:37','2017-12-04 14:23:37',0,''),
('5020','OrderProcess:1:4','5019','5019','task1',NULL,NULL,'Start','startEvent',NULL,'2017-12-04 14:25:35','2017-12-04 14:25:35',1,''),
('5022','OrderProcess:1:4','5019','5019','Processing','5023',NULL,'Processing','userTask',NULL,'2017-12-04 14:25:35','2017-12-04 14:25:50',15443,''),
('5026','OrderProcess:1:4','5019','5019','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2017-12-04 14:25:50','2017-12-04 14:25:50',0,''),
('5028','OrderProcess:1:4','5019','5027','subprocess1',NULL,NULL,'Sub Process','subProcess',NULL,'2017-12-04 14:25:50','2017-12-04 14:25:58',8955,''),
('5029','OrderProcess:1:4','5019','5027','startevent2',NULL,NULL,'Start','startEvent',NULL,'2017-12-04 14:25:50','2017-12-04 14:25:50',0,''),
('5030','OrderProcess:1:4','5019','5027','exclusivegateway2',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2017-12-04 14:25:50','2017-12-04 14:25:50',0,''),
('5031','OrderProcess:1:4','5019','5027','ShipVoucher','5032',NULL,'Ship voucher','userTask',NULL,'2017-12-04 14:25:50','2017-12-04 14:25:54',4711,''),
('5034','OrderProcess:1:4','5019','5027','exclusivegateway4',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2017-12-04 14:25:54','2017-12-04 14:25:54',0,''),
('5035','OrderProcess:1:4','5019','5027','ShipFail',NULL,NULL,'Ship fail','serviceTask',NULL,'2017-12-04 14:25:54','2017-12-04 14:25:58',4241,''),
('5036','OrderProcess:1:4','5019','5027','endevent4',NULL,NULL,NULL,'endEvent',NULL,'2017-12-04 14:25:58','2017-12-04 14:25:58',0,''),
('5037','OrderProcess:1:4','5019','5019','CloseOrder2','5038',NULL,'Close order','userTask',NULL,'2017-12-04 14:25:58','2017-12-04 14:26:53',55458,''),
('5039','OrderProcess:1:4','5019','5019','endevent5',NULL,NULL,NULL,'endEvent',NULL,'2017-12-04 14:26:53','2017-12-04 14:26:53',0,''),
('6','OrderProcess:1:4','5','5','task1',NULL,NULL,'Start','startEvent',NULL,'2017-12-01 11:26:04','2017-12-01 11:26:04',17,''),
('8','OrderProcess:1:4','5','5','Processing','9',NULL,'Processing','userTask',NULL,'2017-12-01 11:26:04','2017-12-01 11:26:22',18261,'');

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`) values 
('12501','12501',NULL,'OrderProcess:3:10004','2017-12-07 14:18:18',NULL,NULL,NULL,'task1',NULL,NULL,NULL,'',NULL),
('15001','15001',NULL,'OrderProcess:3:10004','2017-12-07 14:34:51',NULL,NULL,NULL,'task1',NULL,NULL,NULL,'',NULL),
('15006','15006',NULL,'OrderProcess:3:10004','2017-12-07 14:36:48',NULL,NULL,NULL,'task1',NULL,NULL,NULL,'',NULL),
('17501','17501',NULL,'OrderProcess:3:10004','2017-12-07 14:40:06',NULL,NULL,NULL,'task1',NULL,NULL,NULL,'',NULL),
('20001','20001',NULL,'OrderProcess:3:10004','2017-12-07 15:08:18','2017-12-07 15:08:56',38913,NULL,'task1','endevent1',NULL,NULL,'',NULL),
('2501','2501',NULL,'OrderProcess:1:4','2017-12-04 14:17:35',NULL,NULL,NULL,'task1',NULL,NULL,NULL,'',NULL),
('5','5',NULL,'OrderProcess:1:4','2017-12-01 11:26:04',NULL,NULL,NULL,'task1',NULL,NULL,NULL,'',NULL),
('5001','5001',NULL,'OrderProcess:1:4','2017-12-04 14:23:04',NULL,NULL,NULL,'task1',NULL,NULL,NULL,'',NULL),
('5019','5019',NULL,'OrderProcess:1:4','2017-12-04 14:25:35','2017-12-04 14:26:53',78459,NULL,'task1','endevent5',NULL,NULL,'',NULL);

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values 
('12505','OrderProcess:3:10004','Processing','12501','12501','Processing',NULL,NULL,NULL,NULL,'2017-12-07 14:18:18',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),
('15005','OrderProcess:3:10004','Processing','15001','15001','Processing',NULL,NULL,NULL,NULL,'2017-12-07 14:34:51',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),
('15010','OrderProcess:3:10004','Processing','15006','15006','Processing',NULL,NULL,NULL,NULL,'2017-12-07 14:36:48',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),
('17505','OrderProcess:3:10004','Processing','17501','17501','Processing',NULL,NULL,NULL,NULL,'2017-12-07 14:40:06',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),
('20005','OrderProcess:3:10004','Processing','20001','20001','Processing',NULL,NULL,NULL,NULL,'2017-12-07 15:08:18',NULL,'2017-12-07 15:08:44',26829,'completed',50,NULL,NULL,NULL,''),
('20010','OrderProcess:3:10004','CloseOrder1','20001','20001','Close order',NULL,NULL,NULL,NULL,'2017-12-07 15:08:47',NULL,'2017-12-07 15:08:56',9905,'completed',50,NULL,NULL,NULL,''),
('23','OrderProcess:1:4','CloseOrder2','5','5','Close order',NULL,NULL,NULL,NULL,'2017-12-01 11:26:24',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),
('2505','OrderProcess:1:4','Processing','2501','2501','Processing',NULL,NULL,NULL,NULL,'2017-12-04 14:17:35',NULL,'2017-12-04 14:18:57',82568,'completed',50,NULL,NULL,NULL,''),
('2514','OrderProcess:1:4','ShipVoucher','2501','2509','Ship voucher',NULL,NULL,NULL,NULL,'2017-12-04 14:18:57',NULL,'2017-12-04 14:19:09',12871,'completed',50,NULL,NULL,NULL,''),
('5005','OrderProcess:1:4','Processing','5001','5001','Processing',NULL,NULL,NULL,NULL,'2017-12-04 14:23:04',NULL,'2017-12-04 14:23:18',14693,'completed',50,NULL,NULL,NULL,''),
('5014','OrderProcess:1:4','ShipVoucher','5001','5009','Ship voucher',NULL,NULL,NULL,NULL,'2017-12-04 14:23:18',NULL,'2017-12-04 14:23:23',5385,'completed',50,NULL,NULL,NULL,''),
('5023','OrderProcess:1:4','Processing','5019','5019','Processing',NULL,NULL,NULL,NULL,'2017-12-04 14:25:35',NULL,'2017-12-04 14:25:50',15443,'completed',50,NULL,NULL,NULL,''),
('5032','OrderProcess:1:4','ShipVoucher','5019','5027','Ship voucher',NULL,NULL,NULL,NULL,'2017-12-04 14:25:50',NULL,'2017-12-04 14:25:54',4708,'completed',50,NULL,NULL,NULL,''),
('5038','OrderProcess:1:4','CloseOrder2','5019','5019','Close order',NULL,NULL,NULL,NULL,'2017-12-04 14:25:58',NULL,'2017-12-04 14:26:53',55454,'completed',50,NULL,NULL,NULL,''),
('9','OrderProcess:1:4','Processing','5','5','Processing',NULL,NULL,NULL,NULL,'2017-12-01 11:26:04',NULL,'2017-12-01 11:26:22',18261,'completed',50,NULL,NULL,NULL,'');

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values 
('10','5','5',NULL,'cancelOrder','boolean',0,NULL,NULL,0,NULL,NULL,'2017-12-01 11:26:22','2017-12-01 11:26:22'),
('11','5','5',NULL,'eVoucher','boolean',0,NULL,NULL,1,NULL,NULL,'2017-12-01 11:26:22','2017-12-01 11:26:22'),
('12503','12501','12501',NULL,'id','long',0,NULL,NULL,0,'0',NULL,'2017-12-07 14:18:18','2017-12-07 14:18:18'),
('15003','15001','15001',NULL,'id','long',0,NULL,NULL,27,'27',NULL,'2017-12-07 14:34:51','2017-12-07 14:34:51'),
('15008','15006','15006',NULL,'id','long',0,NULL,NULL,28,'28',NULL,'2017-12-07 14:36:48','2017-12-07 14:36:48'),
('17503','17501','17501',NULL,'id','long',0,NULL,NULL,29,'29',NULL,'2017-12-07 14:40:06','2017-12-07 14:40:06'),
('18','5','5',NULL,'sendFail','boolean',0,NULL,NULL,1,NULL,NULL,'2017-12-01 11:26:24','2017-12-01 11:26:24'),
('20003','20001','20001',NULL,'id','long',1,NULL,NULL,31,'31',NULL,'2017-12-07 15:08:18','2017-12-07 15:08:56'),
('20006','20001','20001',NULL,'cancelOrder','boolean',1,NULL,NULL,1,NULL,NULL,'2017-12-07 15:08:44','2017-12-07 15:08:56'),
('2503','2501','2501',NULL,'id','long',0,NULL,NULL,14,'14',NULL,'2017-12-04 14:17:35','2017-12-04 14:17:35'),
('2506','2501','2501',NULL,'cancelOrder','boolean',0,NULL,NULL,0,NULL,NULL,'2017-12-04 14:18:57','2017-12-04 14:18:57'),
('2507','2501','2501',NULL,'eVoucher','boolean',0,NULL,NULL,0,NULL,NULL,'2017-12-04 14:18:57','2017-12-04 14:18:57'),
('2515','2501','2501',NULL,'shipFail','boolean',0,NULL,NULL,0,NULL,NULL,'2017-12-04 14:19:09','2017-12-04 14:19:09'),
('5003','5001','5001',NULL,'id','long',0,NULL,NULL,14,'14',NULL,'2017-12-04 14:23:04','2017-12-04 14:23:04'),
('5006','5001','5001',NULL,'cancelOrder','boolean',0,NULL,NULL,0,NULL,NULL,'2017-12-04 14:23:18','2017-12-04 14:23:18'),
('5007','5001','5001',NULL,'eVoucher','boolean',0,NULL,NULL,0,NULL,NULL,'2017-12-04 14:23:18','2017-12-04 14:23:18'),
('5015','5001','5001',NULL,'shipFail','boolean',0,NULL,NULL,0,NULL,NULL,'2017-12-04 14:23:23','2017-12-04 14:23:23'),
('5021','5019','5019',NULL,'id','long',1,NULL,NULL,14,'14',NULL,'2017-12-04 14:25:35','2017-12-04 14:26:53'),
('5024','5019','5019',NULL,'cancelOrder','boolean',1,NULL,NULL,0,NULL,NULL,'2017-12-04 14:25:50','2017-12-04 14:26:53'),
('5025','5019','5019',NULL,'eVoucher','boolean',1,NULL,NULL,0,NULL,NULL,'2017-12-04 14:25:50','2017-12-04 14:26:53'),
('5033','5019','5019',NULL,'shipFail','boolean',1,NULL,NULL,1,NULL,NULL,'2017-12-04 14:25:54','2017-12-04 14:26:53'),
('7','5','5',NULL,'id','long',0,NULL,NULL,14,'14',NULL,'2017-12-01 11:26:04','2017-12-01 11:26:04');

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values 
('1','SpringAutoDeployment',NULL,'','2017-12-01 11:25:46'),
('10001','SpringAutoDeployment',NULL,'','2017-12-07 14:09:19'),
('22501','SpringAutoDeployment',NULL,'','2017-12-18 21:11:09'),
('25001','SpringAutoDeployment',NULL,'','2017-12-19 18:01:20'),
('27501','SpringAutoDeployment',NULL,'','2017-12-20 14:53:31'),
('30001','SpringAutoDeployment',NULL,'','2017-12-20 15:14:59'),
('7501','SpringAutoDeployment',NULL,'','2017-12-07 10:23:30');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values 
('OrderProcess:1:4',1,'http://www.activiti.org/test','Order process','OrderProcess',1,'1','E:\\works\\Fintechviet\\AdServer\\adserver\\target\\classes\\processes\\Order.bpmn20.xml','E:\\works\\Fintechviet\\AdServer\\adserver\\target\\classes\\processes\\Order.OrderProcess.png',NULL,0,1,1,''),
('OrderProcess:2:7504',1,'http://www.activiti.org/test','Order process','OrderProcess',2,'7501','E:\\works\\Fintechviet\\AdServer\\adserver_msb\\target\\classes\\processes\\Order.bpmn20.xml','E:\\works\\Fintechviet\\AdServer\\adserver_msb\\target\\classes\\processes\\Order.OrderProcess.png',NULL,0,1,1,''),
('OrderProcess:3:10004',1,'http://www.activiti.org/test','Order process','OrderProcess',3,'10001','E:\\works\\Fintechviet\\AdServer\\adserver\\target\\classes\\processes\\Order.bpmn20.xml','E:\\works\\Fintechviet\\AdServer\\adserver\\target\\classes\\processes\\Order.OrderProcess.png',NULL,0,1,1,''),
('OrderProcess:4:22504',1,'http://www.activiti.org/test','Order process','OrderProcess',4,'22501','E:\\works\\Fintechviet\\AdServer\\adserver_msb\\target\\classes\\processes\\Order.bpmn20.xml','E:\\works\\Fintechviet\\AdServer\\adserver_msb\\target\\classes\\processes\\Order.OrderProcess.png',NULL,0,1,1,''),
('OrderProcess:5:25004',1,'http://www.activiti.org/test','Order process','OrderProcess',5,'25001','E:\\works\\Fintechviet\\AdServer\\adserver\\target\\classes\\processes\\Order.bpmn20.xml','E:\\works\\Fintechviet\\AdServer\\adserver\\target\\classes\\processes\\Order.OrderProcess.png',NULL,0,1,1,''),
('OrderProcess:6:27504',1,'http://www.activiti.org/test','Order process','OrderProcess',6,'27501','E:\\works\\Fintechviet\\AdServer\\adserver_msb\\target\\classes\\processes\\Order.bpmn20.xml','E:\\works\\Fintechviet\\AdServer\\adserver_msb\\target\\classes\\processes\\Order.OrderProcess.png',NULL,0,1,1,''),
('OrderProcess:7:30004',1,'http://www.activiti.org/test','Order process','OrderProcess',7,'30001','E:\\works\\Fintechviet\\AdServer\\adserver\\target\\classes\\processes\\Order.bpmn20.xml','E:\\works\\Fintechviet\\AdServer\\adserver\\target\\classes\\processes\\Order.OrderProcess.png',NULL,0,1,1,'');

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`LOCK_TIME_`) values 
('12501',1,'12501',NULL,NULL,'OrderProcess:3:10004',NULL,'Processing',1,0,1,0,1,2,'',NULL,NULL),
('15001',1,'15001',NULL,NULL,'OrderProcess:3:10004',NULL,'Processing',1,0,1,0,1,2,'',NULL,NULL),
('15006',1,'15006',NULL,NULL,'OrderProcess:3:10004',NULL,'Processing',1,0,1,0,1,2,'',NULL,NULL),
('17501',1,'17501',NULL,NULL,'OrderProcess:3:10004',NULL,'Processing',1,0,1,0,1,2,'',NULL,NULL),
('2501',2,'2501',NULL,NULL,'OrderProcess:1:4',NULL,NULL,0,0,1,0,1,0,'',NULL,NULL),
('2509',2,'2501',NULL,'2501','OrderProcess:1:4',NULL,'parallelgateway1',0,0,1,0,1,0,'',NULL,NULL),
('5',2,'5',NULL,NULL,'OrderProcess:1:4',NULL,'CloseOrder2',1,0,1,0,1,2,'',NULL,NULL),
('5001',2,'5001',NULL,NULL,'OrderProcess:1:4',NULL,NULL,0,0,1,0,1,0,'',NULL,NULL),
('5009',2,'5001',NULL,'5001','OrderProcess:1:4',NULL,'parallelgateway1',0,0,1,0,1,0,'',NULL,NULL);

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`) values 
('12505',1,'12501','12501','OrderProcess:3:10004','Processing',NULL,NULL,'Processing',NULL,NULL,NULL,50,'2017-12-07 14:18:18',NULL,NULL,1,'',NULL),
('15005',1,'15001','15001','OrderProcess:3:10004','Processing',NULL,NULL,'Processing',NULL,NULL,NULL,50,'2017-12-07 14:34:51',NULL,NULL,1,'',NULL),
('15010',1,'15006','15006','OrderProcess:3:10004','Processing',NULL,NULL,'Processing',NULL,NULL,NULL,50,'2017-12-07 14:36:48',NULL,NULL,1,'',NULL),
('17505',1,'17501','17501','OrderProcess:3:10004','Processing',NULL,NULL,'Processing',NULL,NULL,NULL,50,'2017-12-07 14:40:06',NULL,NULL,1,'',NULL),
('23',1,'5','5','OrderProcess:1:4','Close order',NULL,NULL,'CloseOrder2',NULL,NULL,NULL,50,'2017-12-01 11:26:24',NULL,NULL,1,'',NULL);

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values 
('10',1,'boolean','cancelOrder','5','5',NULL,NULL,NULL,0,NULL,NULL),
('11',1,'boolean','eVoucher','5','5',NULL,NULL,NULL,1,NULL,NULL),
('12503',1,'long','id','12501','12501',NULL,NULL,NULL,0,'0',NULL),
('15003',1,'long','id','15001','15001',NULL,NULL,NULL,27,'27',NULL),
('15008',1,'long','id','15006','15006',NULL,NULL,NULL,28,'28',NULL),
('17503',1,'long','id','17501','17501',NULL,NULL,NULL,29,'29',NULL),
('18',1,'boolean','sendFail','5','5',NULL,NULL,NULL,1,NULL,NULL),
('2503',1,'long','id','2501','2501',NULL,NULL,NULL,14,'14',NULL),
('2506',1,'boolean','cancelOrder','2501','2501',NULL,NULL,NULL,0,NULL,NULL),
('2507',1,'boolean','eVoucher','2501','2501',NULL,NULL,NULL,0,NULL,NULL),
('2515',1,'boolean','shipFail','2501','2501',NULL,NULL,NULL,0,NULL,NULL),
('5003',1,'long','id','5001','5001',NULL,NULL,NULL,14,'14',NULL),
('5006',1,'boolean','cancelOrder','5001','5001',NULL,NULL,NULL,0,NULL,NULL),
('5007',1,'boolean','eVoucher','5001','5001',NULL,NULL,NULL,0,NULL,NULL),
('5015',1,'boolean','shipFail','5001','5001',NULL,NULL,NULL,0,NULL,NULL),
('7',1,'long','id','5','5',NULL,NULL,NULL,14,'14',NULL);

/*Table structure for table `ad` */

DROP TABLE IF EXISTS `ad`;

CREATE TABLE `ad` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `flightId` bigint(11) DEFAULT NULL,
  `creativeId` bigint(11) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `impressions` int(11) DEFAULT NULL,
  `isFreCap` tinyint(1) DEFAULT NULL,
  `freCap` int(11) DEFAULT NULL,
  `freCapDuration` int(11) DEFAULT NULL,
  `freCapType` varchar(10) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(10) DEFAULT 'NEW',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FKa8gj50a6ds6kssguuqnvu2knf` (`creativeId`),
  KEY `FKc993igiqswlewhcwpvti3r5j5` (`flightId`),
  CONSTRAINT `FKa8gj50a6ds6kssguuqnvu2knf` FOREIGN KEY (`creativeId`) REFERENCES `creative` (`id`),
  CONSTRAINT `FKc993igiqswlewhcwpvti3r5j5` FOREIGN KEY (`flightId`) REFERENCES `flight` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `ad` */

insert  into `ad`(`id`,`flightId`,`creativeId`,`name`,`impressions`,`isFreCap`,`freCap`,`freCapDuration`,`freCapType`,`description`,`status`,`createdDate`) values 
(1,1,1,'Quáº£ng cÃ¡o MSB1',10000,NULL,NULL,NULL,NULL,'ko','ACTIVE','2017-10-19 04:31:50'),
(2,1,2,'Quáº£ng cÃ¡o MSB2',10000,NULL,NULL,NULL,NULL,'','ACTIVE','2017-10-19 04:32:05'),
(3,1,3,'Quáº£ng cÃ¡o MSB3',10000,NULL,NULL,NULL,NULL,'','ACTIVE','2017-10-19 04:32:58'),
(4,1,4,'Quáº£ng cÃ¡o MSB4',10000,NULL,NULL,NULL,NULL,'','ACTIVE','2017-10-19 04:33:28'),
(5,1,5,'Quáº£ng cÃ¡o MSB5',10000,NULL,NULL,NULL,NULL,'','ACTIVE','2017-10-19 04:33:58'),
(6,1,6,'Quáº£ng cÃ¡o MSB6',10000,NULL,NULL,NULL,NULL,'','ACTIVE','2017-10-19 04:34:38'),
(7,1,7,'Quáº£ng cÃ¡o MSB7',10000,NULL,NULL,NULL,NULL,'','ACTIVE','2017-10-19 04:35:07'),
(8,1,8,'Quáº£ng cÃ¡o video',10000,NULL,NULL,NULL,NULL,'','ACTIVE','2017-10-19 04:36:28'),
(9,8,9,'Quáº£ng cÃ¡o Vietin1',10000,NULL,NULL,NULL,NULL,'','INACTIVE','2017-10-19 07:13:45'),
(10,8,10,'Quáº£ng cÃ¡o Vietin2',10000,NULL,NULL,NULL,NULL,'','ACTIVE','2017-10-19 07:14:14'),
(11,8,11,'Quáº£ng cÃ¡o Vietin3',10000,NULL,NULL,NULL,NULL,'','ACTIVE','2017-10-19 07:14:36'),
(12,8,12,'Quáº£ng cÃ¡o Vietin4',10000,NULL,NULL,NULL,NULL,'','ACTIVE','2017-10-19 07:15:10'),
(13,8,13,'Quáº£ng cÃ¡o Vietin5',10000,NULL,NULL,NULL,NULL,'','ACTIVE','2017-10-19 07:15:37'),
(14,8,14,'Quáº£ng cÃ¡o Vietin6',10000,NULL,NULL,NULL,NULL,'','ACTIVE','2017-10-19 07:15:57'),
(15,8,15,'Quáº£ng cÃ¡o Vietin7',10000,NULL,NULL,NULL,NULL,'','ACTIVE','2017-10-19 07:16:28'),
(16,8,16,'Quáº£ng cÃ¡o Vietin8',10000,NULL,NULL,NULL,NULL,'','ACTIVE','2017-10-19 07:16:55');

/*Table structure for table `ad_clicks` */

DROP TABLE IF EXISTS `ad_clicks`;

CREATE TABLE `ad_clicks` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) DEFAULT NULL,
  `adId` bigint(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `ad_clicks` */

insert  into `ad_clicks`(`id`,`uid`,`adId`,`date`) values 
(1,1,1,'2017-09-07 21:24:30'),
(2,2,1,'2017-09-07 21:24:35'),
(3,3,1,'2017-09-07 21:24:42'),
(4,4,1,'2017-09-07 21:24:57'),
(5,5,2,'2017-09-07 21:25:01'),
(8,1,1,'2017-09-25 22:57:02'),
(9,1,1,'2017-09-25 22:59:08'),
(10,1,1,'2017-09-25 22:59:40');

/*Table structure for table `ad_impressions` */

DROP TABLE IF EXISTS `ad_impressions`;

CREATE TABLE `ad_impressions` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `adId` bigint(11) DEFAULT NULL,
  `impression` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK1pmq4tadhoc5s3bdpbg1qs97x` (`adId`),
  CONSTRAINT `FK1pmq4tadhoc5s3bdpbg1qs97x` FOREIGN KEY (`adId`) REFERENCES `ad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table `ad_impressions` */

insert  into `ad_impressions`(`id`,`adId`,`impression`,`date`) values 
(1,1,1,'2017-09-07 20:59:59'),
(2,1,1,'2017-09-07 21:01:16'),
(3,1,1,'2017-09-07 21:01:24'),
(4,1,1,'2017-09-07 21:01:24'),
(5,1,1,'2017-09-07 21:01:24'),
(6,1,1,'2017-09-07 21:01:24'),
(7,1,1,'2017-09-07 21:01:24'),
(8,1,1,'2017-09-07 21:01:24'),
(9,1,1,'2017-09-12 15:19:17'),
(15,1,1,'2017-09-25 22:13:39'),
(16,1,1,'2017-09-25 22:16:55'),
(17,1,1,'2017-09-25 22:17:58'),
(18,1,1,'2017-09-25 22:18:42'),
(19,1,1,'2017-09-25 22:26:21'),
(20,1,1,'2017-09-25 22:27:52'),
(21,1,1,'2017-09-25 22:56:02'),
(22,1,1,'2017-09-25 22:56:06'),
(23,1,1,'2017-09-25 22:56:10'),
(24,1,1,'2017-09-25 22:56:15'),
(25,1,1,'2017-09-25 22:56:19'),
(26,1,1,'2017-09-25 22:56:23'),
(27,1,1,'2017-09-25 22:56:44'),
(28,1,1,'2017-09-25 22:59:04'),
(29,1,1,'2017-09-25 22:59:32');

/*Table structure for table `ad_type` */

DROP TABLE IF EXISTS `ad_type`;

CREATE TABLE `ad_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `ad_type` */

insert  into `ad_type`(`id`,`name`,`width`,`height`) values 
(1,'Banner',320,100),
(2,'Full',320,480);

/*Table structure for table `ad_views` */

DROP TABLE IF EXISTS `ad_views`;

CREATE TABLE `ad_views` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) DEFAULT NULL,
  `adId` bigint(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `ad_views` */

insert  into `ad_views`(`id`,`uid`,`adId`,`date`) values 
(1,1,1,'2017-09-11 11:03:31'),
(2,2,1,'2017-09-11 11:03:35'),
(3,3,1,'2017-09-10 11:03:39'),
(4,4,1,'2017-09-11 11:03:44'),
(5,5,2,'2017-09-11 11:03:47');

/*Table structure for table `app_ad` */

DROP TABLE IF EXISTS `app_ad`;

CREATE TABLE `app_ad` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `campaignId` bigint(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `installLink` varchar(255) DEFAULT NULL,
  `shortDescription` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `app_ad` */

insert  into `app_ad`(`id`,`campaignId`,`name`,`icon`,`installLink`,`shortDescription`,`status`,`createdDate`) values 
(1,1,'Lazada','http://222.252.16.132:8080/ad/app/lazada.png','https://play.google.com/store/apps/details?id=com.lazada.android&hl=vi','á»¨ng dá»¥ng thÆ°Æ¡ng máº¡i Ä‘iá»‡n tá»­ Lazada. Tháº£nh thÆ¡i mua sáº¯m má»i lÃºc má»i nÆ¡i.','ACTIVE','2017-09-29 10:28:21'),
(2,1,'Money Keeper','http://222.252.16.132:8080/ad/app/money keeper.png','https://play.google.com/store/apps/details?id=vn.com.misa.misafinancialbook','á»¨ng dá»¥ng quáº£n lÃ½ chi tiÃªu','ACTIVE','2017-09-29 10:34:35'),
(3,1,'Lá»‹ch Viá»‡t','http://222.252.16.132:8080/ad/app/ung-dung-lich-van-nien-tot-nhat-cho-nam-moi-1.png','https://play.google.com/store/apps/details?id=com.somestudio.lichvietnam','á»¨ng dá»¥ng lá»‹ch','ACTIVE','2017-09-29 10:40:03'),
(4,1,'Wifi chÃ¹a','http://222.252.16.132:8080/ad/app/wifichua.png','https://play.google.com/store/apps/details?id=com.bangdev.wifichua&hl=vi','á»¨ng dá»¥ng quáº£n lÃ½ wifi','ACTIVE','2017-10-11 20:26:12');

/*Table structure for table `app_ad_installs` */

DROP TABLE IF EXISTS `app_ad_installs`;

CREATE TABLE `app_ad_installs` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `appAdId` bigint(11) DEFAULT NULL,
  `deviceToken` varchar(255) DEFAULT NULL,
  `platform` varchar(10) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `app_ad_installs` */

insert  into `app_ad_installs`(`id`,`appAdId`,`deviceToken`,`platform`,`date`) values 
(1,1,'dsfdsfds','ios','2017-09-27 15:24:34'),
(2,1,'sdsgdsgdf','ios','2017-09-28 15:24:45'),
(3,1,'dgfdffdgf','ios','2017-09-29 15:24:51'),
(4,1,'dfdf','android','2017-09-27 15:25:23'),
(5,1,'fdsds','android','2017-09-28 15:25:33'),
(6,1,'dfdf','android','2017-09-28 15:25:43'),
(7,1,'sdsd','android','2017-09-29 15:25:47'),
(8,1,'androidtoken','android','2017-10-01 22:09:19');

/*Table structure for table `campaign` */

DROP TABLE IF EXISTS `campaign`;

CREATE TABLE `campaign` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `isFreCap` tinyint(1) DEFAULT NULL,
  `freCap` int(11) DEFAULT NULL,
  `freCapDuration` int(11) DEFAULT NULL,
  `freCapType` varchar(10) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(10) DEFAULT 'NEW',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `campaign` */

insert  into `campaign`(`id`,`name`,`startDate`,`endDate`,`isFreCap`,`freCap`,`freCapDuration`,`freCapType`,`description`,`status`,`createdDate`) values 
(1,'Khuyáº¿n mÃ£i hÃ¨ thu MSB','2017-02-08 00:00:00','2018-02-02 23:59:00',NULL,NULL,NULL,NULL,'','ACTIVE','2017-10-19 03:37:24'),
(2,'Chiáº¿n dá»‹ch khuyáº¿n mÃ£i hÃ¨ thu Vietin','2017-10-11 00:00:00',NULL,NULL,NULL,NULL,NULL,'','INACTIVE','2017-10-19 07:04:34'),
(4,'','2017-01-09 00:00:00','2017-10-06 00:00:00',NULL,NULL,NULL,'HOUR','','NEW','2017-09-01 11:49:56'),
(5,'','2017-09-01 00:00:00','2017-10-04 23:59:00',NULL,NULL,NULL,'HOUR','','INACTIVE','2017-09-01 11:57:02'),
(6,'test','2017-10-05 00:00:00',NULL,NULL,NULL,NULL,NULL,'sáº¥','ACTIVE','2017-10-06 13:33:09');

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) DEFAULT NULL,
  `phoneCardId` int(11) DEFAULT NULL,
  `giftCodeId` int(11) DEFAULT NULL,
  `gameCardId` int(11) DEFAULT NULL,
  `voucherId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT '0',
  `status` varchar(10) NOT NULL DEFAULT 'NEW',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cart` */

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) DEFAULT NULL,
  `contentId` bigint(11) DEFAULT NULL,
  `newsId` bigint(11) DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  `noOfLike` int(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `createdDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `comment` */

/*Table structure for table `content` */

DROP TABLE IF EXISTS `content`;

CREATE TABLE `content` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `originalLink` varchar(255) DEFAULT NULL,
  `noOfLike` int(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `content` */

insert  into `content`(`id`,`title`,`link`,`originalLink`,`noOfLike`,`status`,`createdDate`) values 
(2,'test',NULL,'linkgoc1',NULL,'NEW','2017-09-27 16:51:44'),
(3,'test2',NULL,'linkgoc2',NULL,'NEW','2017-09-27 17:12:16');

/*Table structure for table `content_clicks` */

DROP TABLE IF EXISTS `content_clicks`;

CREATE TABLE `content_clicks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uid` bigint(11) DEFAULT NULL,
  `newsId` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=latin1;

/*Data for the table `content_clicks` */

insert  into `content_clicks`(`id`,`date`,`uid`,`newsId`) values 
(1,'2017-09-12 15:14:11',NULL,NULL),
(2,'2017-09-12 15:14:16',NULL,NULL),
(3,'2017-09-15 11:01:48',NULL,NULL),
(4,'2017-09-15 11:16:02',NULL,NULL),
(5,'2017-09-15 11:17:50',NULL,NULL),
(6,'2017-10-13 07:17:47',NULL,NULL),
(7,'2017-10-13 08:14:58',NULL,NULL),
(8,'2017-10-13 08:18:00',NULL,NULL),
(9,'2017-10-13 09:56:03',NULL,NULL),
(10,'2017-10-13 10:21:04',NULL,NULL),
(11,'2017-10-13 10:21:08',NULL,NULL),
(12,'2017-10-13 10:21:10',NULL,NULL),
(13,'2017-10-13 10:21:11',NULL,NULL),
(14,'2017-10-13 10:23:38',NULL,NULL),
(15,'2017-10-13 10:32:34',NULL,NULL),
(16,'2017-10-13 10:32:39',NULL,NULL),
(17,'2017-10-13 10:32:46',NULL,NULL),
(18,'2017-10-13 10:36:27',NULL,NULL),
(19,'2017-10-13 10:36:32',NULL,NULL),
(20,'2017-10-13 10:36:35',NULL,NULL),
(21,'2017-10-13 10:36:49',NULL,NULL),
(22,'2017-10-13 10:41:13',NULL,NULL),
(23,'2017-10-13 10:43:20',NULL,NULL),
(24,'2017-10-13 10:43:24',NULL,NULL),
(25,'2017-10-13 10:43:27',NULL,NULL),
(26,'2017-10-13 10:43:37',NULL,NULL),
(27,'2017-10-13 10:44:39',NULL,NULL),
(28,'2017-10-13 10:47:21',NULL,NULL),
(29,'2017-10-13 10:47:33',NULL,NULL),
(30,'2017-10-13 10:47:44',NULL,NULL),
(31,'2017-10-13 10:47:48',NULL,NULL),
(32,'2017-10-13 10:48:49',NULL,NULL),
(33,'2017-10-13 10:48:55',NULL,NULL),
(34,'2017-10-13 10:49:57',NULL,NULL),
(35,'2017-10-13 10:50:02',NULL,NULL),
(36,'2017-10-13 10:52:13',NULL,NULL),
(37,'2017-10-13 10:53:13',NULL,NULL),
(38,'2017-10-13 10:55:59',NULL,NULL),
(39,'2017-10-13 10:58:06',NULL,NULL),
(40,'2017-10-13 10:59:49',NULL,NULL),
(41,'2017-10-13 11:00:00',NULL,NULL),
(42,'2017-10-13 11:00:07',NULL,NULL),
(43,'2017-10-13 11:01:25',NULL,NULL),
(44,'2017-10-13 17:09:44',NULL,NULL),
(45,'2017-10-13 17:10:10',NULL,NULL),
(46,'2017-10-13 17:10:56',NULL,NULL),
(47,'2017-10-13 17:10:58',NULL,NULL),
(48,'2017-10-13 17:11:00',NULL,NULL),
(49,'2017-10-13 17:11:03',NULL,NULL),
(50,'2017-10-13 17:11:12',NULL,NULL),
(51,'2017-10-13 19:50:10',NULL,NULL),
(52,'2017-10-13 19:50:32',NULL,NULL),
(53,'2017-10-13 19:51:04',NULL,NULL),
(54,'2017-10-13 19:51:17',NULL,NULL),
(55,'2017-10-13 19:52:25',NULL,NULL),
(56,'2017-10-13 19:56:41',NULL,NULL),
(57,'2017-10-13 20:17:46',NULL,NULL),
(58,'2017-10-13 20:33:22',NULL,NULL),
(59,'2017-10-13 20:34:04',NULL,NULL),
(60,'2017-10-13 20:34:23',NULL,NULL),
(61,'2017-10-13 20:36:19',NULL,NULL),
(62,'2017-10-13 20:48:03',NULL,NULL),
(63,'2017-10-13 20:48:06',NULL,NULL),
(64,'2017-10-13 20:48:32',NULL,NULL),
(65,'2017-10-13 20:49:12',NULL,NULL),
(66,'2017-10-13 20:51:34',NULL,NULL),
(67,'2017-10-13 20:52:15',NULL,NULL),
(68,'2017-10-13 20:53:45',NULL,NULL),
(69,'2017-10-13 20:53:53',NULL,NULL),
(70,'2017-10-13 20:58:11',NULL,NULL),
(71,'2017-10-13 20:58:36',NULL,NULL),
(72,'2017-10-13 20:59:36',NULL,NULL),
(73,'2017-10-13 20:59:38',NULL,NULL),
(74,'2017-10-13 20:59:52',NULL,NULL),
(75,'2017-10-13 21:00:11',NULL,NULL),
(76,'2017-10-13 21:00:42',NULL,NULL),
(77,'2017-10-13 21:01:17',NULL,NULL),
(78,'2017-10-13 21:01:24',NULL,NULL),
(79,'2017-10-13 21:01:47',NULL,NULL),
(80,'2017-10-13 21:01:52',NULL,NULL),
(81,'2017-10-13 21:05:22',NULL,NULL),
(82,'2017-10-13 21:11:38',NULL,NULL),
(83,'2017-10-13 21:13:38',NULL,NULL),
(84,'2017-10-13 21:15:46',NULL,NULL),
(85,'2017-10-13 21:16:47',NULL,NULL),
(86,'2017-10-13 21:17:49',NULL,NULL),
(87,'2017-10-13 21:18:31',NULL,NULL),
(88,'2017-10-13 21:18:41',NULL,NULL),
(89,'2017-10-13 21:21:26',NULL,NULL),
(90,'2017-10-13 21:22:52',NULL,NULL),
(91,'2017-10-13 21:23:59',NULL,NULL),
(92,'2017-10-13 21:26:37',NULL,NULL),
(93,'2017-10-13 21:28:23',NULL,NULL),
(94,'2017-10-13 21:31:41',NULL,NULL),
(95,'2017-10-13 21:33:12',NULL,NULL),
(96,'2017-10-13 21:34:39',NULL,NULL),
(97,'2017-10-13 21:36:37',NULL,NULL),
(98,'2017-10-13 21:37:03',NULL,NULL),
(99,'2017-10-13 21:37:44',NULL,NULL),
(100,'2017-10-13 21:39:27',NULL,NULL),
(101,'2017-10-13 21:40:22',NULL,NULL),
(102,'2017-10-13 21:41:02',NULL,NULL),
(103,'2017-10-13 21:48:18',NULL,NULL),
(104,'2017-10-13 21:48:21',NULL,NULL),
(105,'2017-10-13 21:48:30',NULL,NULL),
(106,'2017-10-13 21:48:36',NULL,NULL),
(107,'2017-10-13 21:48:43',NULL,NULL),
(108,'2017-10-13 23:57:04',NULL,NULL),
(109,'2017-10-14 01:28:28',NULL,NULL),
(110,'2017-10-14 01:28:31',NULL,NULL),
(111,'2017-10-14 01:29:03',NULL,NULL),
(112,'2017-10-14 01:34:02',NULL,NULL),
(113,'2017-10-14 01:35:22',NULL,NULL),
(114,'2017-10-14 01:36:25',NULL,NULL),
(115,'2017-10-14 01:37:03',NULL,NULL),
(116,'2017-10-14 01:38:15',NULL,NULL),
(117,'2017-10-14 01:38:35',NULL,NULL),
(118,'2017-10-14 01:38:39',NULL,NULL),
(119,'2017-10-16 22:50:46',NULL,NULL),
(120,'2017-10-16 22:50:55',NULL,NULL),
(121,'2017-10-16 22:51:04',NULL,NULL),
(122,'2017-10-16 22:52:04',NULL,NULL),
(123,'2017-10-16 23:58:58',NULL,NULL),
(124,'2017-10-19 03:55:47',NULL,NULL),
(125,'2017-10-19 09:13:56',NULL,NULL),
(126,'2017-10-19 09:14:02',NULL,NULL),
(127,'2017-10-19 09:14:04',NULL,NULL),
(128,'2017-10-19 09:15:51',NULL,NULL),
(129,'2017-10-19 09:16:56',NULL,NULL),
(130,'2017-10-19 09:16:56',NULL,NULL),
(131,'2017-10-19 09:26:58',NULL,NULL),
(132,'2017-10-19 09:39:14',NULL,NULL),
(133,'2017-10-19 09:44:11',NULL,NULL),
(134,'2017-10-19 09:44:27',NULL,NULL),
(135,'2017-10-19 09:54:07',NULL,NULL),
(136,'2017-10-19 10:02:56',NULL,NULL),
(137,'2017-10-19 10:03:40',NULL,NULL),
(138,'2017-10-19 10:04:06',NULL,NULL),
(139,'2017-10-20 07:17:46',NULL,NULL),
(140,'2017-10-20 07:59:19',NULL,NULL),
(141,'2017-10-22 00:57:55',NULL,NULL),
(142,'2017-10-22 01:38:33',NULL,NULL),
(143,'2017-10-22 01:39:45',NULL,NULL),
(144,'2017-10-22 01:40:04',NULL,NULL),
(145,'2017-10-22 01:40:08',NULL,NULL),
(146,'2017-10-22 01:40:11',NULL,NULL),
(147,'2017-10-22 01:40:18',NULL,NULL),
(148,'2017-10-22 01:40:51',NULL,NULL),
(149,'2017-10-22 01:52:10',NULL,NULL),
(150,'2017-10-22 04:00:55',NULL,NULL),
(151,'2017-10-22 04:01:02',NULL,NULL),
(152,'2017-10-22 04:02:33',NULL,NULL),
(153,'2017-11-20 11:34:30',NULL,NULL),
(154,'2017-11-20 11:34:34',NULL,NULL),
(155,'2017-11-20 11:31:49',1,NULL),
(156,'2017-11-20 11:31:47',1,NULL),
(157,'2017-11-20 11:31:47',1,NULL),
(158,'2017-11-20 11:31:46',1,NULL),
(159,'2017-11-20 11:31:45',1,NULL),
(161,'2017-11-20 11:21:12',1,NULL),
(162,'2017-11-20 11:31:30',1,NULL),
(164,'2017-11-20 11:33:42',1,NULL),
(165,'2017-11-20 11:33:57',1,NULL),
(166,'2017-11-20 11:34:40',1,NULL),
(167,'2017-11-20 11:35:03',1,NULL),
(169,'2017-11-25 16:00:34',1,NULL),
(171,'2017-09-02 16:03:15',1,NULL),
(173,'2017-09-02 16:08:56',1,NULL),
(175,'2017-11-27 15:22:27',1,NULL),
(176,'2017-11-27 15:23:39',1,'1'),
(177,'2017-11-27 15:24:07',1,'2'),
(179,'2017-12-06 15:09:53',1,'12'),
(180,'2017-12-06 15:10:16',1,'123'),
(182,'2017-12-18 17:33:59',44,'123'),
(183,'2017-12-18 17:34:11',45,'123');

/*Table structure for table `content_details` */

DROP TABLE IF EXISTS `content_details`;

CREATE TABLE `content_details` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `contentId` bigint(11) DEFAULT NULL,
  `imageLink` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `order` int(11) DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `content_details` */

insert  into `content_details`(`id`,`contentId`,`imageLink`,`description`,`order`,`createdDate`) values 
(2,2,'http://localhost:8080/content/images/user3-128x128.jpg','',2,'2017-09-27 23:55:19');

/*Table structure for table `content_impressions` */

DROP TABLE IF EXISTS `content_impressions`;

CREATE TABLE `content_impressions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3716 DEFAULT CHARSET=latin1;

/*Data for the table `content_impressions` */

insert  into `content_impressions`(`id`,`date`) values 
(1,'2017-09-12 15:14:22'),
(2,'2017-09-12 15:14:25'),
(3,'2017-09-12 15:14:28'),
(4,'2017-09-12 15:14:31'),
(5,'2017-09-12 15:14:33'),
(6,'2017-09-14 22:09:12'),
(7,'2017-09-14 22:11:29'),
(8,'2017-09-14 22:23:52'),
(9,'2017-09-14 22:32:09'),
(10,'2017-09-15 10:19:23'),
(11,'2017-09-15 10:21:28'),
(12,'2017-09-15 10:22:26'),
(13,'2017-09-15 11:01:40'),
(14,'2017-09-15 11:12:33'),
(15,'2017-09-15 11:13:48'),
(16,'2017-10-12 23:11:48'),
(17,'2017-10-12 23:11:49'),
(18,'2017-10-12 23:11:49'),
(19,'2017-10-12 23:11:50'),
(20,'2017-10-12 23:11:51'),
(21,'2017-10-12 23:11:51'),
(22,'2017-10-12 23:11:52'),
(23,'2017-10-12 23:11:52'),
(24,'2017-10-12 23:11:53'),
(25,'2017-10-13 04:30:43'),
(26,'2017-10-13 04:30:44'),
(27,'2017-10-13 04:30:44'),
(28,'2017-10-13 04:30:45'),
(29,'2017-10-13 04:30:46'),
(30,'2017-10-13 04:30:46'),
(31,'2017-10-13 04:30:47'),
(32,'2017-10-13 04:30:47'),
(33,'2017-10-13 04:30:48'),
(34,'2017-10-13 04:30:49'),
(35,'2017-10-13 04:30:49'),
(36,'2017-10-13 04:30:49'),
(37,'2017-10-13 04:30:58'),
(38,'2017-10-13 04:31:01'),
(39,'2017-10-13 04:31:01'),
(40,'2017-10-13 04:31:01'),
(41,'2017-10-13 04:31:07'),
(42,'2017-10-13 04:31:08'),
(43,'2017-10-13 04:31:08'),
(44,'2017-10-13 07:40:49'),
(45,'2017-10-13 07:40:50'),
(46,'2017-10-13 07:40:50'),
(47,'2017-10-13 07:40:51'),
(48,'2017-10-13 07:40:51'),
(49,'2017-10-13 07:40:52'),
(50,'2017-10-13 07:40:53'),
(51,'2017-10-13 07:40:53'),
(52,'2017-10-13 07:40:54'),
(53,'2017-10-13 07:40:54'),
(54,'2017-10-13 07:40:55'),
(55,'2017-10-13 07:40:58'),
(56,'2017-10-13 07:40:58'),
(57,'2017-10-13 07:40:59'),
(58,'2017-10-13 07:43:38'),
(59,'2017-10-13 07:43:39'),
(60,'2017-10-13 07:43:40'),
(61,'2017-10-13 07:43:53'),
(62,'2017-10-13 07:43:53'),
(63,'2017-10-13 07:43:53'),
(64,'2017-10-13 07:43:53'),
(65,'2017-10-13 07:43:53'),
(66,'2017-10-13 07:43:53'),
(67,'2017-10-13 07:43:53'),
(68,'2017-10-13 07:43:53'),
(69,'2017-10-13 07:43:53'),
(70,'2017-10-13 07:43:55'),
(71,'2017-10-13 07:43:57'),
(72,'2017-10-13 07:45:15'),
(73,'2017-10-13 07:45:16'),
(74,'2017-10-13 07:45:16'),
(75,'2017-10-13 07:45:17'),
(76,'2017-10-13 07:45:18'),
(77,'2017-10-13 07:45:18'),
(78,'2017-10-13 07:45:19'),
(79,'2017-10-13 07:45:19'),
(80,'2017-10-13 07:45:20'),
(81,'2017-10-13 07:45:20'),
(82,'2017-10-13 07:45:21'),
(83,'2017-10-13 07:45:23'),
(84,'2017-10-13 07:45:24'),
(85,'2017-10-13 07:45:25'),
(86,'2017-10-13 07:45:43'),
(87,'2017-10-13 07:45:44'),
(88,'2017-10-13 07:45:44'),
(89,'2017-10-13 07:45:45'),
(90,'2017-10-13 07:45:45'),
(91,'2017-10-13 07:45:46'),
(92,'2017-10-13 07:45:47'),
(93,'2017-10-13 07:45:47'),
(94,'2017-10-13 08:14:57'),
(95,'2017-10-13 08:14:58'),
(96,'2017-10-13 08:15:08'),
(97,'2017-10-13 08:15:10'),
(98,'2017-10-13 08:15:10'),
(99,'2017-10-13 08:15:10'),
(100,'2017-10-13 08:15:10'),
(101,'2017-10-13 08:15:10'),
(102,'2017-10-13 08:15:11'),
(103,'2017-10-13 08:15:11'),
(104,'2017-10-13 08:15:11'),
(105,'2017-10-13 08:15:12'),
(106,'2017-10-13 08:15:12'),
(107,'2017-10-13 08:15:16'),
(108,'2017-10-13 08:17:53'),
(109,'2017-10-13 08:17:53'),
(110,'2017-10-13 08:17:54'),
(111,'2017-10-13 08:17:54'),
(112,'2017-10-13 08:17:55'),
(113,'2017-10-13 08:17:55'),
(114,'2017-10-13 08:17:56'),
(115,'2017-10-13 08:17:56'),
(116,'2017-10-13 08:17:57'),
(117,'2017-10-13 08:17:58'),
(118,'2017-10-13 08:17:58'),
(119,'2017-10-13 08:18:03'),
(120,'2017-10-13 08:18:04'),
(121,'2017-10-13 08:18:04'),
(122,'2017-10-13 08:18:56'),
(123,'2017-10-13 08:18:59'),
(124,'2017-10-13 08:19:00'),
(125,'2017-10-13 08:19:00'),
(126,'2017-10-13 08:19:01'),
(127,'2017-10-13 08:19:01'),
(128,'2017-10-13 08:19:02'),
(129,'2017-10-13 08:19:02'),
(130,'2017-10-13 08:19:03'),
(131,'2017-10-13 08:19:03'),
(132,'2017-10-13 08:19:04'),
(133,'2017-10-13 08:19:07'),
(134,'2017-10-13 08:19:08'),
(135,'2017-10-13 08:19:09'),
(136,'2017-10-13 08:20:08'),
(137,'2017-10-13 08:20:08'),
(138,'2017-10-13 08:20:09'),
(139,'2017-10-13 08:20:09'),
(140,'2017-10-13 08:20:10'),
(141,'2017-10-13 08:20:10'),
(142,'2017-10-13 08:20:11'),
(143,'2017-10-13 08:20:11'),
(144,'2017-10-13 08:20:15'),
(145,'2017-10-13 08:20:15'),
(146,'2017-10-13 08:20:16'),
(147,'2017-10-13 08:20:16'),
(148,'2017-10-13 08:20:16'),
(149,'2017-10-13 08:20:16'),
(150,'2017-10-13 09:28:12'),
(151,'2017-10-13 09:28:12'),
(152,'2017-10-13 09:28:13'),
(153,'2017-10-13 09:28:13'),
(154,'2017-10-13 09:28:14'),
(155,'2017-10-13 09:28:14'),
(156,'2017-10-13 09:28:15'),
(157,'2017-10-13 09:28:16'),
(158,'2017-10-13 09:28:16'),
(159,'2017-10-13 09:28:16'),
(160,'2017-10-13 09:28:19'),
(161,'2017-10-13 09:28:19'),
(162,'2017-10-13 09:28:20'),
(163,'2017-10-13 09:29:16'),
(164,'2017-10-13 09:29:17'),
(165,'2017-10-13 09:29:17'),
(166,'2017-10-13 09:29:18'),
(167,'2017-10-13 09:29:18'),
(168,'2017-10-13 09:29:19'),
(169,'2017-10-13 09:29:19'),
(170,'2017-10-13 09:29:20'),
(171,'2017-10-13 09:29:20'),
(172,'2017-10-13 09:29:22'),
(173,'2017-10-13 09:29:22'),
(174,'2017-10-13 09:29:24'),
(175,'2017-10-13 09:29:24'),
(176,'2017-10-13 09:29:25'),
(177,'2017-10-13 09:31:51'),
(178,'2017-10-13 09:31:52'),
(179,'2017-10-13 09:32:39'),
(180,'2017-10-13 09:32:40'),
(181,'2017-10-13 09:33:36'),
(182,'2017-10-13 09:33:37'),
(183,'2017-10-13 09:35:22'),
(184,'2017-10-13 09:35:23'),
(185,'2017-10-13 09:35:23'),
(186,'2017-10-13 09:35:24'),
(187,'2017-10-13 09:35:24'),
(188,'2017-10-13 09:35:25'),
(189,'2017-10-13 09:35:25'),
(190,'2017-10-13 09:35:26'),
(191,'2017-10-13 09:35:26'),
(192,'2017-10-13 09:35:27'),
(193,'2017-10-13 09:35:27'),
(194,'2017-10-13 09:35:29'),
(195,'2017-10-13 09:35:30'),
(196,'2017-10-13 09:35:31'),
(197,'2017-10-13 09:42:44'),
(198,'2017-10-13 09:42:45'),
(199,'2017-10-13 09:42:45'),
(200,'2017-10-13 09:42:46'),
(201,'2017-10-13 09:42:46'),
(202,'2017-10-13 09:42:47'),
(203,'2017-10-13 09:42:47'),
(204,'2017-10-13 09:42:48'),
(205,'2017-10-13 09:42:48'),
(206,'2017-10-13 09:42:49'),
(207,'2017-10-13 09:42:49'),
(208,'2017-10-13 09:42:51'),
(209,'2017-10-13 09:42:52'),
(210,'2017-10-13 09:42:52'),
(211,'2017-10-13 09:44:20'),
(212,'2017-10-13 09:44:21'),
(213,'2017-10-13 09:44:23'),
(214,'2017-10-13 09:44:23'),
(215,'2017-10-13 09:44:24'),
(216,'2017-10-13 09:44:25'),
(217,'2017-10-13 09:44:25'),
(218,'2017-10-13 09:44:26'),
(219,'2017-10-13 09:44:26'),
(220,'2017-10-13 09:44:27'),
(221,'2017-10-13 09:44:27'),
(222,'2017-10-13 09:44:27'),
(223,'2017-10-13 09:44:29'),
(224,'2017-10-13 09:44:30'),
(225,'2017-10-13 09:46:37'),
(226,'2017-10-13 09:46:37'),
(227,'2017-10-13 09:46:38'),
(228,'2017-10-13 09:46:38'),
(229,'2017-10-13 09:46:39'),
(230,'2017-10-13 09:46:39'),
(231,'2017-10-13 09:46:40'),
(232,'2017-10-13 09:46:40'),
(233,'2017-10-13 09:46:41'),
(234,'2017-10-13 09:46:41'),
(235,'2017-10-13 09:46:41'),
(236,'2017-10-13 09:46:45'),
(237,'2017-10-13 09:46:49'),
(238,'2017-10-13 09:46:59'),
(239,'2017-10-13 09:48:30'),
(240,'2017-10-13 09:48:31'),
(241,'2017-10-13 09:48:31'),
(242,'2017-10-13 09:48:32'),
(243,'2017-10-13 09:48:32'),
(244,'2017-10-13 09:48:33'),
(245,'2017-10-13 09:48:33'),
(246,'2017-10-13 09:48:34'),
(247,'2017-10-13 09:48:36'),
(248,'2017-10-13 09:48:37'),
(249,'2017-10-13 09:48:38'),
(250,'2017-10-13 09:48:40'),
(251,'2017-10-13 09:48:40'),
(252,'2017-10-13 09:48:41'),
(253,'2017-10-13 09:52:18'),
(254,'2017-10-13 09:52:18'),
(255,'2017-10-13 09:52:19'),
(256,'2017-10-13 09:52:19'),
(257,'2017-10-13 09:52:19'),
(258,'2017-10-13 09:52:20'),
(259,'2017-10-13 09:52:20'),
(260,'2017-10-13 09:52:21'),
(261,'2017-10-13 09:52:21'),
(262,'2017-10-13 09:52:22'),
(263,'2017-10-13 09:52:22'),
(264,'2017-10-13 09:52:24'),
(265,'2017-10-13 09:52:25'),
(266,'2017-10-13 09:52:25'),
(267,'2017-10-13 09:55:56'),
(268,'2017-10-13 09:55:56'),
(269,'2017-10-13 09:55:57'),
(270,'2017-10-13 09:55:57'),
(271,'2017-10-13 09:55:58'),
(272,'2017-10-13 09:55:58'),
(273,'2017-10-13 09:55:59'),
(274,'2017-10-13 09:55:59'),
(275,'2017-10-13 09:56:00'),
(276,'2017-10-13 09:56:00'),
(277,'2017-10-13 09:56:01'),
(278,'2017-10-13 09:56:03'),
(279,'2017-10-13 09:56:06'),
(280,'2017-10-13 09:56:07'),
(281,'2017-10-13 09:58:00'),
(282,'2017-10-13 09:58:01'),
(283,'2017-10-13 10:12:42'),
(284,'2017-10-13 10:12:43'),
(285,'2017-10-13 10:12:43'),
(286,'2017-10-13 10:12:44'),
(287,'2017-10-13 10:12:44'),
(288,'2017-10-13 10:12:45'),
(289,'2017-10-13 10:12:45'),
(290,'2017-10-13 10:12:46'),
(291,'2017-10-13 10:12:46'),
(292,'2017-10-13 10:12:46'),
(293,'2017-10-13 10:12:47'),
(294,'2017-10-13 10:12:49'),
(295,'2017-10-13 10:12:50'),
(296,'2017-10-13 10:12:50'),
(297,'2017-10-13 10:14:29'),
(298,'2017-10-13 10:14:30'),
(299,'2017-10-13 10:14:31'),
(300,'2017-10-13 10:14:32'),
(301,'2017-10-13 10:14:37'),
(302,'2017-10-13 10:14:37'),
(303,'2017-10-13 10:14:38'),
(304,'2017-10-13 10:14:39'),
(305,'2017-10-13 10:14:39'),
(306,'2017-10-13 10:14:39'),
(307,'2017-10-13 10:14:40'),
(308,'2017-10-13 10:14:40'),
(309,'2017-10-13 10:14:40'),
(310,'2017-10-13 10:14:41'),
(311,'2017-10-13 10:14:41'),
(312,'2017-10-13 10:14:44'),
(313,'2017-10-13 10:14:45'),
(314,'2017-10-13 10:14:45'),
(315,'2017-10-13 10:14:46'),
(316,'2017-10-13 10:15:51'),
(317,'2017-10-13 10:15:52'),
(318,'2017-10-13 10:15:53'),
(319,'2017-10-13 10:15:53'),
(320,'2017-10-13 10:15:54'),
(321,'2017-10-13 10:15:54'),
(322,'2017-10-13 10:15:55'),
(323,'2017-10-13 10:15:55'),
(324,'2017-10-13 10:15:56'),
(325,'2017-10-13 10:16:07'),
(326,'2017-10-13 10:16:07'),
(327,'2017-10-13 10:16:12'),
(328,'2017-10-13 10:16:16'),
(329,'2017-10-13 10:16:18'),
(330,'2017-10-13 10:16:19'),
(331,'2017-10-13 10:16:20'),
(332,'2017-10-13 11:04:00'),
(333,'2017-10-13 11:04:00'),
(334,'2017-10-13 11:04:01'),
(335,'2017-10-13 11:04:01'),
(336,'2017-10-13 11:04:02'),
(337,'2017-10-13 11:04:02'),
(338,'2017-10-13 11:04:03'),
(339,'2017-10-13 11:04:03'),
(340,'2017-10-13 11:04:04'),
(341,'2017-10-13 11:04:04'),
(342,'2017-10-13 11:04:04'),
(343,'2017-10-13 11:04:07'),
(344,'2017-10-13 11:04:07'),
(345,'2017-10-13 11:04:08'),
(346,'2017-10-13 11:04:22'),
(347,'2017-10-13 11:04:23'),
(348,'2017-10-13 11:04:32'),
(349,'2017-10-13 11:04:32'),
(350,'2017-10-13 11:04:37'),
(351,'2017-10-13 11:04:37'),
(352,'2017-10-13 17:09:31'),
(353,'2017-10-13 17:09:32'),
(354,'2017-10-13 17:09:33'),
(355,'2017-10-13 17:10:42'),
(356,'2017-10-13 17:10:43'),
(357,'2017-10-13 17:10:44'),
(358,'2017-10-13 17:10:45'),
(359,'2017-10-13 17:10:45'),
(360,'2017-10-13 17:10:46'),
(361,'2017-10-13 17:10:47'),
(362,'2017-10-13 17:10:47'),
(363,'2017-10-13 17:10:47'),
(364,'2017-10-13 19:46:34'),
(365,'2017-10-13 19:46:34'),
(366,'2017-10-13 19:48:59'),
(367,'2017-10-13 19:49:00'),
(368,'2017-10-13 19:49:02'),
(369,'2017-10-13 19:49:54'),
(370,'2017-10-13 19:49:59'),
(371,'2017-10-13 19:50:01'),
(372,'2017-10-13 19:50:02'),
(373,'2017-10-13 19:52:21'),
(374,'2017-10-13 19:52:22'),
(375,'2017-10-13 20:04:01'),
(376,'2017-10-13 20:04:02'),
(377,'2017-10-13 20:04:02'),
(378,'2017-10-13 20:26:50'),
(379,'2017-10-13 20:26:50'),
(380,'2017-10-13 20:26:51'),
(381,'2017-10-13 20:26:51'),
(382,'2017-10-13 21:04:18'),
(383,'2017-10-13 21:04:19'),
(384,'2017-10-13 21:04:20'),
(385,'2017-10-13 21:04:22'),
(386,'2017-10-13 21:04:25'),
(387,'2017-10-13 21:04:31'),
(388,'2017-10-13 21:04:33'),
(389,'2017-10-13 21:04:34'),
(390,'2017-10-13 21:05:25'),
(391,'2017-10-13 21:05:26'),
(392,'2017-10-13 21:05:27'),
(393,'2017-10-13 21:05:27'),
(394,'2017-10-13 21:05:28'),
(395,'2017-10-13 21:05:29'),
(396,'2017-10-13 21:05:30'),
(397,'2017-10-13 21:05:55'),
(398,'2017-10-13 21:05:56'),
(399,'2017-10-13 21:05:57'),
(400,'2017-10-13 21:05:57'),
(401,'2017-10-13 21:05:58'),
(402,'2017-10-13 21:05:59'),
(403,'2017-10-13 21:06:00'),
(404,'2017-10-13 21:06:01'),
(405,'2017-10-13 21:06:02'),
(406,'2017-10-13 21:06:02'),
(407,'2017-10-13 21:06:03'),
(408,'2017-10-13 21:06:03'),
(409,'2017-10-13 21:44:58'),
(410,'2017-10-13 21:44:58'),
(411,'2017-10-13 21:44:59'),
(412,'2017-10-13 21:44:59'),
(413,'2017-10-13 21:45:06'),
(414,'2017-10-13 21:45:07'),
(415,'2017-10-13 21:45:08'),
(416,'2017-10-13 21:45:09'),
(417,'2017-10-13 21:45:10'),
(418,'2017-10-13 21:45:18'),
(419,'2017-10-13 21:45:18'),
(420,'2017-10-13 21:45:22'),
(421,'2017-10-13 21:45:23'),
(422,'2017-10-13 21:45:24'),
(423,'2017-10-13 21:45:30'),
(424,'2017-10-13 21:45:31'),
(425,'2017-10-13 21:45:36'),
(426,'2017-10-13 21:45:37'),
(427,'2017-10-13 21:45:52'),
(428,'2017-10-13 21:45:53'),
(429,'2017-10-13 21:46:04'),
(430,'2017-10-13 21:46:05'),
(431,'2017-10-13 21:46:06'),
(432,'2017-10-13 21:46:06'),
(433,'2017-10-13 21:48:12'),
(434,'2017-10-13 21:48:13'),
(435,'2017-10-13 21:48:14'),
(436,'2017-10-13 21:48:15'),
(437,'2017-10-13 21:48:16'),
(438,'2017-10-13 21:53:00'),
(439,'2017-10-13 21:53:01'),
(440,'2017-10-13 21:53:02'),
(441,'2017-10-13 21:53:02'),
(442,'2017-10-13 21:53:03'),
(443,'2017-10-13 21:53:04'),
(444,'2017-10-13 21:53:05'),
(445,'2017-10-13 21:53:05'),
(446,'2017-10-13 21:53:06'),
(447,'2017-10-13 21:53:07'),
(448,'2017-10-13 21:53:07'),
(449,'2017-10-13 21:53:12'),
(450,'2017-10-13 21:53:13'),
(451,'2017-10-13 21:53:14'),
(452,'2017-10-13 21:53:19'),
(453,'2017-10-13 21:53:20'),
(454,'2017-10-13 21:53:22'),
(455,'2017-10-13 21:53:23'),
(456,'2017-10-13 21:53:26'),
(457,'2017-10-13 21:53:27'),
(458,'2017-10-13 21:53:27'),
(459,'2017-10-13 21:53:28'),
(460,'2017-10-13 21:53:33'),
(461,'2017-10-13 21:53:34'),
(462,'2017-10-13 21:53:34'),
(463,'2017-10-13 21:53:35'),
(464,'2017-10-13 21:53:36'),
(465,'2017-10-13 21:53:37'),
(466,'2017-10-13 21:53:41'),
(467,'2017-10-13 21:53:42'),
(468,'2017-10-13 21:53:43'),
(469,'2017-10-13 21:53:54'),
(470,'2017-10-13 21:53:54'),
(471,'2017-10-13 21:53:59'),
(472,'2017-10-13 21:53:59'),
(473,'2017-10-13 21:54:00'),
(474,'2017-10-13 21:54:00'),
(475,'2017-10-13 21:54:03'),
(476,'2017-10-13 21:54:03'),
(477,'2017-10-13 21:54:04'),
(478,'2017-10-13 21:54:05'),
(479,'2017-10-13 21:54:08'),
(480,'2017-10-13 21:54:12'),
(481,'2017-10-13 21:54:13'),
(482,'2017-10-13 21:54:15'),
(483,'2017-10-13 21:54:16'),
(484,'2017-10-13 21:54:16'),
(485,'2017-10-13 21:54:17'),
(486,'2017-10-13 21:54:18'),
(487,'2017-10-13 21:54:20'),
(488,'2017-10-13 21:54:22'),
(489,'2017-10-13 21:54:23'),
(490,'2017-10-13 21:54:25'),
(491,'2017-10-13 21:54:25'),
(492,'2017-10-13 21:54:32'),
(493,'2017-10-13 23:13:58'),
(494,'2017-10-13 23:13:59'),
(495,'2017-10-13 23:14:00'),
(496,'2017-10-13 23:14:01'),
(497,'2017-10-13 23:14:01'),
(498,'2017-10-13 23:14:02'),
(499,'2017-10-13 23:14:03'),
(500,'2017-10-13 23:14:03'),
(501,'2017-10-13 23:14:04'),
(502,'2017-10-13 23:14:04'),
(503,'2017-10-13 23:14:05'),
(504,'2017-10-13 23:14:17'),
(505,'2017-10-13 23:14:18'),
(506,'2017-10-13 23:14:23'),
(507,'2017-10-13 23:14:23'),
(508,'2017-10-13 23:14:27'),
(509,'2017-10-13 23:14:27'),
(510,'2017-10-13 23:14:30'),
(511,'2017-10-13 23:14:31'),
(512,'2017-10-13 23:14:32'),
(513,'2017-10-13 23:14:32'),
(514,'2017-10-13 23:56:56'),
(515,'2017-10-13 23:56:57'),
(516,'2017-10-13 23:56:57'),
(517,'2017-10-13 23:56:58'),
(518,'2017-10-13 23:56:58'),
(519,'2017-10-14 00:00:40'),
(520,'2017-10-14 00:00:40'),
(521,'2017-10-14 00:00:41'),
(522,'2017-10-14 00:00:41'),
(523,'2017-10-14 00:00:42'),
(524,'2017-10-14 00:00:42'),
(525,'2017-10-14 00:00:43'),
(526,'2017-10-14 00:00:43'),
(527,'2017-10-14 00:00:44'),
(528,'2017-10-14 00:00:44'),
(529,'2017-10-14 00:00:44'),
(530,'2017-10-14 00:00:45'),
(531,'2017-10-14 00:00:47'),
(532,'2017-10-14 00:00:47'),
(533,'2017-10-14 00:00:48'),
(534,'2017-10-14 00:00:48'),
(535,'2017-10-14 00:00:50'),
(536,'2017-10-14 00:00:50'),
(537,'2017-10-14 00:00:51'),
(538,'2017-10-14 00:00:51'),
(539,'2017-10-14 00:00:52'),
(540,'2017-10-14 00:00:52'),
(541,'2017-10-14 00:00:55'),
(542,'2017-10-14 00:00:56'),
(543,'2017-10-14 00:00:56'),
(544,'2017-10-14 00:00:57'),
(545,'2017-10-14 00:00:57'),
(546,'2017-10-14 00:00:58'),
(547,'2017-10-14 00:00:59'),
(548,'2017-10-14 00:00:59'),
(549,'2017-10-14 00:01:00'),
(550,'2017-10-14 00:01:02'),
(551,'2017-10-14 00:01:02'),
(552,'2017-10-14 00:01:08'),
(553,'2017-10-14 00:01:09'),
(554,'2017-10-14 00:01:10'),
(555,'2017-10-14 00:01:11'),
(556,'2017-10-14 00:02:09'),
(557,'2017-10-14 00:02:09'),
(558,'2017-10-14 00:02:10'),
(559,'2017-10-14 00:02:10'),
(560,'2017-10-14 00:02:11'),
(561,'2017-10-14 00:02:11'),
(562,'2017-10-14 00:02:12'),
(563,'2017-10-14 00:02:12'),
(564,'2017-10-14 00:02:13'),
(565,'2017-10-14 00:02:13'),
(566,'2017-10-14 00:02:14'),
(567,'2017-10-14 00:02:15'),
(568,'2017-10-14 00:02:16'),
(569,'2017-10-14 00:02:16'),
(570,'2017-10-14 00:02:17'),
(571,'2017-10-14 00:02:17'),
(572,'2017-10-14 00:02:18'),
(573,'2017-10-14 00:02:18'),
(574,'2017-10-14 00:02:19'),
(575,'2017-10-14 00:02:19'),
(576,'2017-10-14 00:02:19'),
(577,'2017-10-14 00:02:20'),
(578,'2017-10-14 00:02:21'),
(579,'2017-10-14 00:02:22'),
(580,'2017-10-14 00:02:22'),
(581,'2017-10-14 00:02:23'),
(582,'2017-10-14 00:02:23'),
(583,'2017-10-14 00:02:24'),
(584,'2017-10-14 00:02:24'),
(585,'2017-10-14 00:02:24'),
(586,'2017-10-14 00:02:26'),
(587,'2017-10-14 00:02:27'),
(588,'2017-10-14 00:02:27'),
(589,'2017-10-14 00:02:28'),
(590,'2017-10-14 00:02:29'),
(591,'2017-10-14 00:02:32'),
(592,'2017-10-14 00:02:32'),
(593,'2017-10-14 00:02:33'),
(594,'2017-10-14 00:02:34'),
(595,'2017-10-14 00:02:36'),
(596,'2017-10-14 00:02:36'),
(597,'2017-10-14 00:02:36'),
(598,'2017-10-14 00:02:39'),
(599,'2017-10-14 00:02:40'),
(600,'2017-10-14 00:02:41'),
(601,'2017-10-14 00:02:41'),
(602,'2017-10-14 00:02:42'),
(603,'2017-10-14 00:02:42'),
(604,'2017-10-14 00:02:42'),
(605,'2017-10-14 00:02:43'),
(606,'2017-10-14 00:02:43'),
(607,'2017-10-14 00:02:44'),
(608,'2017-10-14 00:02:44'),
(609,'2017-10-14 00:02:47'),
(610,'2017-10-14 00:02:48'),
(611,'2017-10-14 00:02:48'),
(612,'2017-10-14 00:02:49'),
(613,'2017-10-14 00:02:49'),
(614,'2017-10-14 00:02:50'),
(615,'2017-10-14 00:02:50'),
(616,'2017-10-14 00:02:51'),
(617,'2017-10-14 00:02:52'),
(618,'2017-10-14 00:02:54'),
(619,'2017-10-14 00:02:55'),
(620,'2017-10-14 00:02:55'),
(621,'2017-10-14 00:02:56'),
(622,'2017-10-14 00:05:08'),
(623,'2017-10-14 00:05:08'),
(624,'2017-10-14 00:05:09'),
(625,'2017-10-14 00:05:09'),
(626,'2017-10-14 00:05:10'),
(627,'2017-10-14 00:05:10'),
(628,'2017-10-14 00:05:11'),
(629,'2017-10-14 00:05:11'),
(630,'2017-10-14 00:05:11'),
(631,'2017-10-14 00:05:13'),
(632,'2017-10-14 00:05:14'),
(633,'2017-10-14 00:05:14'),
(634,'2017-10-14 00:05:15'),
(635,'2017-10-14 00:05:15'),
(636,'2017-10-14 00:05:16'),
(637,'2017-10-14 00:05:16'),
(638,'2017-10-14 00:05:16'),
(639,'2017-10-14 00:05:17'),
(640,'2017-10-14 00:05:17'),
(641,'2017-10-14 00:05:17'),
(642,'2017-10-14 00:05:20'),
(643,'2017-10-14 00:05:20'),
(644,'2017-10-14 00:05:21'),
(645,'2017-10-14 00:05:21'),
(646,'2017-10-14 00:05:22'),
(647,'2017-10-14 00:05:23'),
(648,'2017-10-14 00:05:24'),
(649,'2017-10-14 00:05:24'),
(650,'2017-10-14 00:05:25'),
(651,'2017-10-14 00:05:26'),
(652,'2017-10-14 00:05:30'),
(653,'2017-10-14 00:05:31'),
(654,'2017-10-14 00:05:32'),
(655,'2017-10-14 00:05:32'),
(656,'2017-10-14 00:05:35'),
(657,'2017-10-14 00:05:35'),
(658,'2017-10-14 00:05:36'),
(659,'2017-10-14 00:05:36'),
(660,'2017-10-14 00:05:39'),
(661,'2017-10-14 00:05:40'),
(662,'2017-10-14 00:05:41'),
(663,'2017-10-14 00:05:44'),
(664,'2017-10-14 00:05:45'),
(665,'2017-10-14 00:05:46'),
(666,'2017-10-14 00:05:52'),
(667,'2017-10-14 00:05:53'),
(668,'2017-10-14 00:05:57'),
(669,'2017-10-14 00:05:58'),
(670,'2017-10-14 00:27:20'),
(671,'2017-10-14 00:27:21'),
(672,'2017-10-14 01:25:13'),
(673,'2017-10-14 01:25:13'),
(674,'2017-10-14 01:25:14'),
(675,'2017-10-14 01:25:15'),
(676,'2017-10-14 01:25:16'),
(677,'2017-10-14 01:28:24'),
(678,'2017-10-14 01:28:25'),
(679,'2017-10-14 01:28:25'),
(680,'2017-10-14 01:28:45'),
(681,'2017-10-14 01:28:46'),
(682,'2017-10-14 01:28:46'),
(683,'2017-10-14 01:28:47'),
(684,'2017-10-14 01:28:47'),
(685,'2017-10-14 01:28:47'),
(686,'2017-10-14 01:28:51'),
(687,'2017-10-14 01:28:51'),
(688,'2017-10-14 01:28:52'),
(689,'2017-10-14 01:28:52'),
(690,'2017-10-14 01:28:53'),
(691,'2017-10-14 01:28:53'),
(692,'2017-10-14 01:28:54'),
(693,'2017-10-14 01:28:54'),
(694,'2017-10-14 01:28:55'),
(695,'2017-10-14 01:28:55'),
(696,'2017-10-14 01:28:55'),
(697,'2017-10-14 01:29:00'),
(698,'2017-10-14 01:29:00'),
(699,'2017-10-14 01:29:01'),
(700,'2017-10-14 01:29:01'),
(701,'2017-10-14 01:29:01'),
(702,'2017-10-14 01:29:02'),
(703,'2017-10-14 01:29:11'),
(704,'2017-10-14 01:29:11'),
(705,'2017-10-14 01:29:13'),
(706,'2017-10-14 01:29:14'),
(707,'2017-10-14 01:29:15'),
(708,'2017-10-14 01:29:16'),
(709,'2017-10-14 01:29:16'),
(710,'2017-10-14 01:29:23'),
(711,'2017-10-14 01:29:24'),
(712,'2017-10-14 01:29:25'),
(713,'2017-10-14 01:29:25'),
(714,'2017-10-14 01:29:26'),
(715,'2017-10-14 01:29:28'),
(716,'2017-10-14 01:29:29'),
(717,'2017-10-14 01:29:30'),
(718,'2017-10-14 01:29:30'),
(719,'2017-10-14 01:29:31'),
(720,'2017-10-14 01:29:31'),
(721,'2017-10-14 01:29:34'),
(722,'2017-10-14 01:29:34'),
(723,'2017-10-14 01:29:35'),
(724,'2017-10-14 01:29:35'),
(725,'2017-10-14 01:29:36'),
(726,'2017-10-14 01:29:40'),
(727,'2017-10-14 01:29:41'),
(728,'2017-10-14 01:29:41'),
(729,'2017-10-14 01:29:42'),
(730,'2017-10-14 01:29:42'),
(731,'2017-10-14 01:29:42'),
(732,'2017-10-14 01:29:43'),
(733,'2017-10-14 01:29:43'),
(734,'2017-10-14 01:29:44'),
(735,'2017-10-14 01:29:44'),
(736,'2017-10-14 01:29:47'),
(737,'2017-10-14 01:29:48'),
(738,'2017-10-14 01:29:49'),
(739,'2017-10-14 01:29:50'),
(740,'2017-10-14 01:29:51'),
(741,'2017-10-14 01:29:51'),
(742,'2017-10-14 01:29:55'),
(743,'2017-10-14 01:29:56'),
(744,'2017-10-14 01:29:57'),
(745,'2017-10-14 01:29:57'),
(746,'2017-10-14 01:29:58'),
(747,'2017-10-14 01:29:59'),
(748,'2017-10-14 01:29:59'),
(749,'2017-10-14 01:29:59'),
(750,'2017-10-14 01:30:02'),
(751,'2017-10-14 01:30:03'),
(752,'2017-10-14 01:30:04'),
(753,'2017-10-14 01:30:05'),
(754,'2017-10-14 01:30:05'),
(755,'2017-10-14 01:30:06'),
(756,'2017-10-14 01:30:07'),
(757,'2017-10-14 01:30:07'),
(758,'2017-10-14 01:30:08'),
(759,'2017-10-14 01:30:09'),
(760,'2017-10-14 01:30:13'),
(761,'2017-10-14 01:30:14'),
(762,'2017-10-14 01:30:15'),
(763,'2017-10-14 01:30:15'),
(764,'2017-10-14 01:30:19'),
(765,'2017-10-14 01:30:20'),
(766,'2017-10-14 01:30:23'),
(767,'2017-10-14 01:30:24'),
(768,'2017-10-14 01:30:25'),
(769,'2017-10-14 01:30:26'),
(770,'2017-10-14 01:30:27'),
(771,'2017-10-14 01:30:27'),
(772,'2017-10-14 01:30:28'),
(773,'2017-10-14 01:30:29'),
(774,'2017-10-14 01:30:29'),
(775,'2017-10-14 01:30:29'),
(776,'2017-10-14 01:30:30'),
(777,'2017-10-14 01:30:31'),
(778,'2017-10-14 01:30:35'),
(779,'2017-10-14 01:30:36'),
(780,'2017-10-14 01:30:37'),
(781,'2017-10-14 01:30:38'),
(782,'2017-10-14 01:30:38'),
(783,'2017-10-14 01:30:39'),
(784,'2017-10-14 01:30:45'),
(785,'2017-10-14 01:30:45'),
(786,'2017-10-14 01:30:46'),
(787,'2017-10-14 01:30:47'),
(788,'2017-10-14 01:30:48'),
(789,'2017-10-14 01:30:48'),
(790,'2017-10-14 01:30:49'),
(791,'2017-10-14 01:30:49'),
(792,'2017-10-14 01:30:50'),
(793,'2017-10-14 01:30:50'),
(794,'2017-10-14 01:30:50'),
(795,'2017-10-14 01:33:45'),
(796,'2017-10-14 01:33:46'),
(797,'2017-10-14 01:33:46'),
(798,'2017-10-14 01:33:47'),
(799,'2017-10-14 01:33:47'),
(800,'2017-10-14 01:33:47'),
(801,'2017-10-14 01:33:48'),
(802,'2017-10-14 01:33:48'),
(803,'2017-10-14 01:33:49'),
(804,'2017-10-14 01:33:49'),
(805,'2017-10-14 01:33:49'),
(806,'2017-10-14 01:33:52'),
(807,'2017-10-14 01:33:52'),
(808,'2017-10-14 01:33:53'),
(809,'2017-10-14 01:33:53'),
(810,'2017-10-14 01:33:53'),
(811,'2017-10-14 01:33:54'),
(812,'2017-10-14 01:33:54'),
(813,'2017-10-14 01:33:55'),
(814,'2017-10-14 01:33:55'),
(815,'2017-10-14 01:33:56'),
(816,'2017-10-14 01:33:56'),
(817,'2017-10-14 01:33:56'),
(818,'2017-10-14 01:33:58'),
(819,'2017-10-14 01:33:58'),
(820,'2017-10-14 01:33:59'),
(821,'2017-10-14 01:33:59'),
(822,'2017-10-14 01:34:00'),
(823,'2017-10-14 01:34:00'),
(824,'2017-10-14 01:34:01'),
(825,'2017-10-14 01:34:01'),
(826,'2017-10-14 01:34:05'),
(827,'2017-10-14 01:34:12'),
(828,'2017-10-14 01:34:13'),
(829,'2017-10-14 01:34:19'),
(830,'2017-10-14 01:34:19'),
(831,'2017-10-14 01:34:19'),
(832,'2017-10-14 01:34:20'),
(833,'2017-10-14 01:34:21'),
(834,'2017-10-14 01:34:22'),
(835,'2017-10-14 01:34:22'),
(836,'2017-10-14 01:34:23'),
(837,'2017-10-14 01:34:27'),
(838,'2017-10-14 01:34:28'),
(839,'2017-10-14 01:34:28'),
(840,'2017-10-14 01:37:21'),
(841,'2017-10-14 01:37:23'),
(842,'2017-10-14 01:37:43'),
(843,'2017-10-14 01:37:45'),
(844,'2017-10-14 01:37:46'),
(845,'2017-10-14 01:37:46'),
(846,'2017-10-14 01:37:49'),
(847,'2017-10-14 01:37:50'),
(848,'2017-10-14 01:37:52'),
(849,'2017-10-14 01:37:53'),
(850,'2017-10-14 01:37:53'),
(851,'2017-10-14 01:37:54'),
(852,'2017-10-14 01:37:55'),
(853,'2017-10-14 01:37:55'),
(854,'2017-10-14 01:37:56'),
(855,'2017-10-14 01:37:56'),
(856,'2017-10-14 01:37:56'),
(857,'2017-10-14 01:37:58'),
(858,'2017-10-14 01:37:58'),
(859,'2017-10-14 01:37:59'),
(860,'2017-10-14 01:37:59'),
(861,'2017-10-14 01:38:00'),
(862,'2017-10-14 01:38:00'),
(863,'2017-10-14 01:38:01'),
(864,'2017-10-14 01:38:01'),
(865,'2017-10-14 01:38:04'),
(866,'2017-10-14 01:38:07'),
(867,'2017-10-14 01:38:08'),
(868,'2017-10-14 01:38:08'),
(869,'2017-10-14 01:38:09'),
(870,'2017-10-14 01:38:10'),
(871,'2017-10-14 01:38:10'),
(872,'2017-10-14 01:38:11'),
(873,'2017-10-14 01:38:11'),
(874,'2017-10-14 01:38:12'),
(875,'2017-10-14 01:38:12'),
(876,'2017-10-14 01:38:14'),
(877,'2017-10-14 01:38:23'),
(878,'2017-10-14 01:38:26'),
(879,'2017-10-14 01:38:27'),
(880,'2017-10-14 01:38:27'),
(881,'2017-10-14 01:38:28'),
(882,'2017-10-14 01:38:29'),
(883,'2017-10-14 01:38:29'),
(884,'2017-10-14 01:45:10'),
(885,'2017-10-14 01:45:11'),
(886,'2017-10-14 01:45:12'),
(887,'2017-10-14 01:45:12'),
(888,'2017-10-14 01:45:13'),
(889,'2017-10-14 01:45:14'),
(890,'2017-10-14 01:45:15'),
(891,'2017-10-14 01:45:15'),
(892,'2017-10-14 01:45:16'),
(893,'2017-10-14 01:45:17'),
(894,'2017-10-14 01:45:17'),
(895,'2017-10-14 01:45:21'),
(896,'2017-10-14 01:45:22'),
(897,'2017-10-14 01:45:24'),
(898,'2017-10-14 01:45:25'),
(899,'2017-10-14 01:45:27'),
(900,'2017-10-14 01:45:28'),
(901,'2017-10-14 01:45:29'),
(902,'2017-10-14 01:45:30'),
(903,'2017-10-14 01:45:31'),
(904,'2017-10-14 01:45:32'),
(905,'2017-10-14 01:45:32'),
(906,'2017-10-15 02:21:25'),
(907,'2017-10-15 02:21:26'),
(908,'2017-10-15 02:21:27'),
(909,'2017-10-15 02:21:28'),
(910,'2017-10-15 02:21:29'),
(911,'2017-10-15 02:21:30'),
(912,'2017-10-15 02:21:32'),
(913,'2017-10-15 02:21:33'),
(914,'2017-10-15 02:21:34'),
(915,'2017-10-15 02:21:35'),
(916,'2017-10-15 02:21:36'),
(917,'2017-10-15 02:21:37'),
(918,'2017-10-15 02:21:37'),
(919,'2017-10-15 02:21:44'),
(920,'2017-10-15 02:21:46'),
(921,'2017-10-15 02:21:47'),
(922,'2017-10-15 02:21:49'),
(923,'2017-10-15 02:21:50'),
(924,'2017-10-15 02:21:54'),
(925,'2017-10-15 02:21:57'),
(926,'2017-10-15 02:22:01'),
(927,'2017-10-15 02:22:02'),
(928,'2017-10-15 02:22:05'),
(929,'2017-10-15 02:22:05'),
(930,'2017-10-16 22:50:02'),
(931,'2017-10-16 22:50:03'),
(932,'2017-10-16 22:50:03'),
(933,'2017-10-16 22:50:04'),
(934,'2017-10-16 22:50:22'),
(935,'2017-10-16 22:50:23'),
(936,'2017-10-16 22:50:25'),
(937,'2017-10-16 22:50:37'),
(938,'2017-10-16 22:50:37'),
(939,'2017-10-16 22:50:38'),
(940,'2017-10-16 22:50:38'),
(941,'2017-10-16 22:50:45'),
(942,'2017-10-16 22:50:52'),
(943,'2017-10-16 22:50:52'),
(944,'2017-10-16 22:52:07'),
(945,'2017-10-16 22:57:06'),
(946,'2017-10-16 22:57:12'),
(947,'2017-10-16 22:57:12'),
(948,'2017-10-16 22:57:13'),
(949,'2017-10-16 22:57:21'),
(950,'2017-10-16 22:57:26'),
(951,'2017-10-16 22:57:27'),
(952,'2017-10-16 22:57:28'),
(953,'2017-10-16 22:57:29'),
(954,'2017-10-16 22:57:32'),
(955,'2017-10-16 22:57:33'),
(956,'2017-10-16 22:57:34'),
(957,'2017-10-16 22:57:35'),
(958,'2017-10-16 22:57:36'),
(959,'2017-10-16 22:57:37'),
(960,'2017-10-16 22:57:38'),
(961,'2017-10-16 22:57:39'),
(962,'2017-10-16 22:57:42'),
(963,'2017-10-16 22:57:42'),
(964,'2017-10-16 22:57:44'),
(965,'2017-10-16 22:57:44'),
(966,'2017-10-16 22:57:44'),
(967,'2017-10-16 22:57:51'),
(968,'2017-10-16 22:57:53'),
(969,'2017-10-16 22:57:54'),
(970,'2017-10-16 22:57:55'),
(971,'2017-10-16 22:57:55'),
(972,'2017-10-16 22:58:09'),
(973,'2017-10-16 22:58:19'),
(974,'2017-10-16 22:58:28'),
(975,'2017-10-16 22:58:29'),
(976,'2017-10-16 22:58:35'),
(977,'2017-10-16 22:58:35'),
(978,'2017-10-16 23:58:47'),
(979,'2017-10-16 23:58:47'),
(980,'2017-10-16 23:58:48'),
(981,'2017-10-16 23:58:48'),
(982,'2017-10-19 03:19:49'),
(983,'2017-10-19 03:19:50'),
(984,'2017-10-19 03:19:52'),
(985,'2017-10-19 03:19:52'),
(986,'2017-10-19 03:19:53'),
(987,'2017-10-19 03:19:54'),
(988,'2017-10-19 03:19:55'),
(989,'2017-10-19 03:19:56'),
(990,'2017-10-19 03:19:58'),
(991,'2017-10-19 03:19:59'),
(992,'2017-10-19 03:20:00'),
(993,'2017-10-19 03:20:08'),
(994,'2017-10-19 03:20:08'),
(995,'2017-10-19 03:20:09'),
(996,'2017-10-19 03:20:10'),
(997,'2017-10-19 03:20:12'),
(998,'2017-10-19 03:20:14'),
(999,'2017-10-19 03:20:14'),
(1000,'2017-10-19 03:20:14'),
(1001,'2017-10-19 03:20:14'),
(1002,'2017-10-19 03:20:14'),
(1003,'2017-10-19 03:20:14'),
(1004,'2017-10-19 03:20:32'),
(1005,'2017-10-19 03:20:33'),
(1006,'2017-10-19 03:20:33'),
(1007,'2017-10-19 03:51:06'),
(1008,'2017-10-19 03:51:07'),
(1009,'2017-10-19 03:51:07'),
(1010,'2017-10-19 03:51:08'),
(1011,'2017-10-19 03:51:08'),
(1012,'2017-10-19 03:51:09'),
(1013,'2017-10-19 03:51:09'),
(1014,'2017-10-19 03:51:10'),
(1015,'2017-10-19 03:51:10'),
(1016,'2017-10-19 03:51:11'),
(1017,'2017-10-19 03:51:11'),
(1018,'2017-10-19 03:51:35'),
(1019,'2017-10-19 03:51:36'),
(1020,'2017-10-19 03:51:36'),
(1021,'2017-10-19 03:52:26'),
(1022,'2017-10-19 03:52:27'),
(1023,'2017-10-19 03:52:27'),
(1024,'2017-10-19 03:52:28'),
(1025,'2017-10-19 03:52:29'),
(1026,'2017-10-19 03:52:29'),
(1027,'2017-10-19 03:52:30'),
(1028,'2017-10-19 03:52:30'),
(1029,'2017-10-19 03:52:31'),
(1030,'2017-10-19 03:52:31'),
(1031,'2017-10-19 03:52:31'),
(1032,'2017-10-19 03:52:33'),
(1033,'2017-10-19 03:52:33'),
(1034,'2017-10-19 03:52:35'),
(1035,'2017-10-19 03:52:36'),
(1036,'2017-10-19 03:52:36'),
(1037,'2017-10-19 03:52:37'),
(1038,'2017-10-19 03:52:37'),
(1039,'2017-10-19 03:52:37'),
(1040,'2017-10-19 03:52:38'),
(1041,'2017-10-19 03:52:38'),
(1042,'2017-10-19 03:52:39'),
(1043,'2017-10-19 03:52:39'),
(1044,'2017-10-19 03:52:39'),
(1045,'2017-10-19 03:52:40'),
(1046,'2017-10-19 03:52:50'),
(1047,'2017-10-19 03:52:51'),
(1048,'2017-10-19 03:52:51'),
(1049,'2017-10-19 03:52:52'),
(1050,'2017-10-19 03:52:52'),
(1051,'2017-10-19 03:52:52'),
(1052,'2017-10-19 03:52:53'),
(1053,'2017-10-19 03:52:55'),
(1054,'2017-10-19 03:53:01'),
(1055,'2017-10-19 03:53:01'),
(1056,'2017-10-19 03:53:02'),
(1057,'2017-10-19 03:53:02'),
(1058,'2017-10-19 03:53:03'),
(1059,'2017-10-19 03:53:03'),
(1060,'2017-10-19 03:53:03'),
(1061,'2017-10-19 03:53:04'),
(1062,'2017-10-19 03:53:04'),
(1063,'2017-10-19 03:53:05'),
(1064,'2017-10-19 03:53:05'),
(1065,'2017-10-19 03:53:47'),
(1066,'2017-10-19 03:53:48'),
(1067,'2017-10-19 03:53:48'),
(1068,'2017-10-19 03:53:49'),
(1069,'2017-10-19 03:53:49'),
(1070,'2017-10-19 03:55:35'),
(1071,'2017-10-19 03:55:35'),
(1072,'2017-10-19 03:55:35'),
(1073,'2017-10-19 03:55:36'),
(1074,'2017-10-19 03:55:37'),
(1075,'2017-10-19 03:55:42'),
(1076,'2017-10-19 03:55:42'),
(1077,'2017-10-19 03:55:43'),
(1078,'2017-10-19 03:55:43'),
(1079,'2017-10-19 03:55:44'),
(1080,'2017-10-19 03:55:51'),
(1081,'2017-10-19 03:55:52'),
(1082,'2017-10-19 03:55:52'),
(1083,'2017-10-19 03:55:53'),
(1084,'2017-10-19 03:55:53'),
(1085,'2017-10-19 03:55:58'),
(1086,'2017-10-19 03:56:03'),
(1087,'2017-10-19 03:56:03'),
(1088,'2017-10-19 03:56:04'),
(1089,'2017-10-19 03:56:04'),
(1090,'2017-10-19 03:56:09'),
(1091,'2017-10-19 03:56:10'),
(1092,'2017-10-19 03:56:10'),
(1093,'2017-10-19 03:56:11'),
(1094,'2017-10-19 03:56:11'),
(1095,'2017-10-19 03:56:15'),
(1096,'2017-10-19 03:56:15'),
(1097,'2017-10-19 03:56:16'),
(1098,'2017-10-19 03:56:17'),
(1099,'2017-10-19 03:56:19'),
(1100,'2017-10-19 03:56:22'),
(1101,'2017-10-19 03:56:22'),
(1102,'2017-10-19 03:56:23'),
(1103,'2017-10-19 03:56:23'),
(1104,'2017-10-19 03:56:24'),
(1105,'2017-10-19 03:58:10'),
(1106,'2017-10-19 03:58:10'),
(1107,'2017-10-19 03:58:11'),
(1108,'2017-10-19 03:58:11'),
(1109,'2017-10-19 03:58:12'),
(1110,'2017-10-19 03:58:13'),
(1111,'2017-10-19 03:58:14'),
(1112,'2017-10-19 03:58:15'),
(1113,'2017-10-19 03:58:16'),
(1114,'2017-10-19 03:58:16'),
(1115,'2017-10-19 03:58:17'),
(1116,'2017-10-19 03:58:21'),
(1117,'2017-10-19 03:58:21'),
(1118,'2017-10-19 03:58:22'),
(1119,'2017-10-19 03:58:22'),
(1120,'2017-10-19 03:58:23'),
(1121,'2017-10-19 03:58:23'),
(1122,'2017-10-19 03:58:24'),
(1123,'2017-10-19 03:58:24'),
(1124,'2017-10-19 03:58:25'),
(1125,'2017-10-19 03:58:25'),
(1126,'2017-10-19 03:58:25'),
(1127,'2017-10-19 03:59:41'),
(1128,'2017-10-19 03:59:42'),
(1129,'2017-10-19 03:59:42'),
(1130,'2017-10-19 03:59:42'),
(1131,'2017-10-19 03:59:43'),
(1132,'2017-10-19 03:59:46'),
(1133,'2017-10-19 03:59:46'),
(1134,'2017-10-19 03:59:47'),
(1135,'2017-10-19 04:02:09'),
(1136,'2017-10-19 04:02:09'),
(1137,'2017-10-19 04:02:10'),
(1138,'2017-10-19 04:02:10'),
(1139,'2017-10-19 04:02:11'),
(1140,'2017-10-19 04:02:11'),
(1141,'2017-10-19 04:02:13'),
(1142,'2017-10-19 04:02:13'),
(1143,'2017-10-19 04:02:14'),
(1144,'2017-10-19 04:02:14'),
(1145,'2017-10-19 04:02:15'),
(1146,'2017-10-19 04:02:15'),
(1147,'2017-10-19 04:02:17'),
(1148,'2017-10-19 04:02:18'),
(1149,'2017-10-19 04:03:57'),
(1150,'2017-10-19 04:03:57'),
(1151,'2017-10-19 04:03:58'),
(1152,'2017-10-19 04:03:58'),
(1153,'2017-10-19 04:03:59'),
(1154,'2017-10-19 04:04:02'),
(1155,'2017-10-19 04:04:03'),
(1156,'2017-10-19 04:04:03'),
(1157,'2017-10-19 04:04:04'),
(1158,'2017-10-19 04:04:04'),
(1159,'2017-10-19 04:04:05'),
(1160,'2017-10-19 04:04:06'),
(1161,'2017-10-19 04:04:07'),
(1162,'2017-10-19 04:04:07'),
(1163,'2017-10-19 04:04:08'),
(1164,'2017-10-19 04:04:08'),
(1165,'2017-10-19 04:04:09'),
(1166,'2017-10-19 04:04:09'),
(1167,'2017-10-19 04:04:10'),
(1168,'2017-10-19 04:04:10'),
(1169,'2017-10-19 04:04:11'),
(1170,'2017-10-19 04:04:13'),
(1171,'2017-10-19 04:04:13'),
(1172,'2017-10-19 04:04:14'),
(1173,'2017-10-19 04:04:14'),
(1174,'2017-10-19 04:04:15'),
(1175,'2017-10-19 04:04:16'),
(1176,'2017-10-19 04:04:17'),
(1177,'2017-10-19 04:04:17'),
(1178,'2017-10-19 04:04:18'),
(1179,'2017-10-19 04:04:18'),
(1180,'2017-10-19 04:04:19'),
(1181,'2017-10-19 04:04:20'),
(1182,'2017-10-19 04:04:20'),
(1183,'2017-10-19 04:04:21'),
(1184,'2017-10-19 04:04:21'),
(1185,'2017-10-19 04:04:24'),
(1186,'2017-10-19 04:04:25'),
(1187,'2017-10-19 04:04:25'),
(1188,'2017-10-19 04:04:26'),
(1189,'2017-10-19 04:04:27'),
(1190,'2017-10-19 04:04:27'),
(1191,'2017-10-19 04:04:28'),
(1192,'2017-10-19 04:04:28'),
(1193,'2017-10-19 04:04:29'),
(1194,'2017-10-19 04:04:29'),
(1195,'2017-10-19 04:04:32'),
(1196,'2017-10-19 04:04:32'),
(1197,'2017-10-19 04:04:33'),
(1198,'2017-10-19 04:04:33'),
(1199,'2017-10-19 04:04:34'),
(1200,'2017-10-19 04:04:35'),
(1201,'2017-10-19 04:04:36'),
(1202,'2017-10-19 04:04:37'),
(1203,'2017-10-19 04:04:37'),
(1204,'2017-10-19 04:04:38'),
(1205,'2017-10-19 04:04:39'),
(1206,'2017-10-19 04:04:40'),
(1207,'2017-10-19 04:04:41'),
(1208,'2017-10-19 04:04:41'),
(1209,'2017-10-19 04:04:41'),
(1210,'2017-10-19 04:04:44'),
(1211,'2017-10-19 04:04:45'),
(1212,'2017-10-19 04:04:45'),
(1213,'2017-10-19 04:04:46'),
(1214,'2017-10-19 04:04:47'),
(1215,'2017-10-19 04:04:50'),
(1216,'2017-10-19 04:04:50'),
(1217,'2017-10-19 04:04:51'),
(1218,'2017-10-19 04:04:52'),
(1219,'2017-10-19 04:04:52'),
(1220,'2017-10-19 04:04:53'),
(1221,'2017-10-19 04:06:47'),
(1222,'2017-10-19 04:06:48'),
(1223,'2017-10-19 04:06:48'),
(1224,'2017-10-19 04:06:49'),
(1225,'2017-10-19 04:06:49'),
(1226,'2017-10-19 04:06:53'),
(1227,'2017-10-19 04:06:54'),
(1228,'2017-10-19 04:06:54'),
(1229,'2017-10-19 04:06:55'),
(1230,'2017-10-19 04:06:55'),
(1231,'2017-10-19 04:06:58'),
(1232,'2017-10-19 04:06:59'),
(1233,'2017-10-19 04:06:59'),
(1234,'2017-10-19 04:07:00'),
(1235,'2017-10-19 04:07:01'),
(1236,'2017-10-19 04:07:01'),
(1237,'2017-10-19 04:07:02'),
(1238,'2017-10-19 04:07:02'),
(1239,'2017-10-19 04:07:03'),
(1240,'2017-10-19 04:07:03'),
(1241,'2017-10-19 04:07:06'),
(1242,'2017-10-19 04:07:07'),
(1243,'2017-10-19 04:07:07'),
(1244,'2017-10-19 04:07:08'),
(1245,'2017-10-19 04:07:09'),
(1246,'2017-10-19 04:07:11'),
(1247,'2017-10-19 04:07:12'),
(1248,'2017-10-19 04:07:12'),
(1249,'2017-10-19 04:07:13'),
(1250,'2017-10-19 04:07:13'),
(1251,'2017-10-19 04:07:17'),
(1252,'2017-10-19 04:07:17'),
(1253,'2017-10-19 04:07:18'),
(1254,'2017-10-19 04:07:18'),
(1255,'2017-10-19 04:07:19'),
(1256,'2017-10-19 04:07:22'),
(1257,'2017-10-19 04:07:22'),
(1258,'2017-10-19 04:07:23'),
(1259,'2017-10-19 04:07:23'),
(1260,'2017-10-19 04:07:24'),
(1261,'2017-10-19 04:17:34'),
(1262,'2017-10-19 04:17:35'),
(1263,'2017-10-19 04:17:35'),
(1264,'2017-10-19 04:17:36'),
(1265,'2017-10-19 04:17:36'),
(1266,'2017-10-19 04:17:41'),
(1267,'2017-10-19 04:17:42'),
(1268,'2017-10-19 04:17:42'),
(1269,'2017-10-19 04:17:43'),
(1270,'2017-10-19 04:17:43'),
(1271,'2017-10-19 04:18:00'),
(1272,'2017-10-19 04:18:01'),
(1273,'2017-10-19 04:18:01'),
(1274,'2017-10-19 04:18:02'),
(1275,'2017-10-19 04:18:02'),
(1276,'2017-10-19 04:18:07'),
(1277,'2017-10-19 04:18:07'),
(1278,'2017-10-19 04:18:08'),
(1279,'2017-10-19 04:18:08'),
(1280,'2017-10-19 04:18:09'),
(1281,'2017-10-19 04:19:06'),
(1282,'2017-10-19 04:19:07'),
(1283,'2017-10-19 04:19:07'),
(1284,'2017-10-19 04:19:08'),
(1285,'2017-10-19 04:19:09'),
(1286,'2017-10-19 04:19:09'),
(1287,'2017-10-19 04:19:12'),
(1288,'2017-10-19 04:19:13'),
(1289,'2017-10-19 04:19:13'),
(1290,'2017-10-19 04:19:14'),
(1291,'2017-10-19 04:19:14'),
(1292,'2017-10-19 04:19:17'),
(1293,'2017-10-19 04:19:18'),
(1294,'2017-10-19 04:19:18'),
(1295,'2017-10-19 04:19:19'),
(1296,'2017-10-19 04:19:19'),
(1297,'2017-10-19 04:19:23'),
(1298,'2017-10-19 04:19:24'),
(1299,'2017-10-19 04:19:24'),
(1300,'2017-10-19 04:19:25'),
(1301,'2017-10-19 04:19:25'),
(1302,'2017-10-19 04:19:30'),
(1303,'2017-10-19 04:19:30'),
(1304,'2017-10-19 04:19:31'),
(1305,'2017-10-19 04:19:31'),
(1306,'2017-10-19 04:19:36'),
(1307,'2017-10-19 04:19:36'),
(1308,'2017-10-19 04:19:39'),
(1309,'2017-10-19 04:19:40'),
(1310,'2017-10-19 04:19:40'),
(1311,'2017-10-19 04:19:45'),
(1312,'2017-10-19 04:19:45'),
(1313,'2017-10-19 04:19:46'),
(1314,'2017-10-19 04:19:46'),
(1315,'2017-10-19 04:19:47'),
(1316,'2017-10-19 04:21:52'),
(1317,'2017-10-19 04:21:52'),
(1318,'2017-10-19 04:21:53'),
(1319,'2017-10-19 04:21:53'),
(1320,'2017-10-19 04:21:54'),
(1321,'2017-10-19 04:21:58'),
(1322,'2017-10-19 04:21:59'),
(1323,'2017-10-19 04:21:59'),
(1324,'2017-10-19 04:21:59'),
(1325,'2017-10-19 04:22:00'),
(1326,'2017-10-19 04:22:05'),
(1327,'2017-10-19 04:22:05'),
(1328,'2017-10-19 04:22:06'),
(1329,'2017-10-19 04:22:06'),
(1330,'2017-10-19 04:22:06'),
(1331,'2017-10-19 04:22:10'),
(1332,'2017-10-19 04:22:10'),
(1333,'2017-10-19 04:22:11'),
(1334,'2017-10-19 04:22:12'),
(1335,'2017-10-19 04:22:12'),
(1336,'2017-10-19 04:22:16'),
(1337,'2017-10-19 04:22:17'),
(1338,'2017-10-19 04:22:17'),
(1339,'2017-10-19 04:22:18'),
(1340,'2017-10-19 04:22:18'),
(1341,'2017-10-19 04:22:21'),
(1342,'2017-10-19 04:22:22'),
(1343,'2017-10-19 04:22:22'),
(1344,'2017-10-19 04:22:23'),
(1345,'2017-10-19 04:22:23'),
(1346,'2017-10-19 04:22:27'),
(1347,'2017-10-19 04:22:28'),
(1348,'2017-10-19 04:22:28'),
(1349,'2017-10-19 04:22:29'),
(1350,'2017-10-19 04:22:29'),
(1351,'2017-10-19 04:22:33'),
(1352,'2017-10-19 04:22:33'),
(1353,'2017-10-19 04:22:34'),
(1354,'2017-10-19 04:22:34'),
(1355,'2017-10-19 04:22:35'),
(1356,'2017-10-19 04:22:40'),
(1357,'2017-10-19 04:22:40'),
(1358,'2017-10-19 04:22:41'),
(1359,'2017-10-19 04:22:41'),
(1360,'2017-10-19 04:22:42'),
(1361,'2017-10-19 04:22:46'),
(1362,'2017-10-19 04:22:46'),
(1363,'2017-10-19 04:22:46'),
(1364,'2017-10-19 04:22:49'),
(1365,'2017-10-19 04:22:49'),
(1366,'2017-10-19 04:24:55'),
(1367,'2017-10-19 04:24:55'),
(1368,'2017-10-19 04:24:56'),
(1369,'2017-10-19 04:24:56'),
(1370,'2017-10-19 04:25:01'),
(1371,'2017-10-19 04:25:02'),
(1372,'2017-10-19 04:25:02'),
(1373,'2017-10-19 04:25:03'),
(1374,'2017-10-19 04:25:03'),
(1375,'2017-10-19 04:25:07'),
(1376,'2017-10-19 04:25:08'),
(1377,'2017-10-19 04:25:08'),
(1378,'2017-10-19 04:25:09'),
(1379,'2017-10-19 04:25:09'),
(1380,'2017-10-19 04:25:13'),
(1381,'2017-10-19 04:25:14'),
(1382,'2017-10-19 04:25:14'),
(1383,'2017-10-19 04:25:15'),
(1384,'2017-10-19 04:25:15'),
(1385,'2017-10-19 04:25:19'),
(1386,'2017-10-19 04:25:19'),
(1387,'2017-10-19 04:25:20'),
(1388,'2017-10-19 04:25:21'),
(1389,'2017-10-19 04:25:21'),
(1390,'2017-10-19 04:25:26'),
(1391,'2017-10-19 04:25:26'),
(1392,'2017-10-19 04:25:27'),
(1393,'2017-10-19 04:25:27'),
(1394,'2017-10-19 04:25:28'),
(1395,'2017-10-19 04:25:31'),
(1396,'2017-10-19 04:25:32'),
(1397,'2017-10-19 04:25:32'),
(1398,'2017-10-19 04:25:33'),
(1399,'2017-10-19 04:25:33'),
(1400,'2017-10-19 04:25:37'),
(1401,'2017-10-19 04:25:38'),
(1402,'2017-10-19 04:25:38'),
(1403,'2017-10-19 04:25:39'),
(1404,'2017-10-19 04:25:39'),
(1405,'2017-10-19 04:26:27'),
(1406,'2017-10-19 04:26:28'),
(1407,'2017-10-19 04:26:29'),
(1408,'2017-10-19 04:26:29'),
(1409,'2017-10-19 04:26:30'),
(1410,'2017-10-19 04:27:28'),
(1411,'2017-10-19 04:27:29'),
(1412,'2017-10-19 04:27:29'),
(1413,'2017-10-19 04:27:30'),
(1414,'2017-10-19 04:27:30'),
(1415,'2017-10-19 04:27:31'),
(1416,'2017-10-19 04:27:50'),
(1417,'2017-10-19 04:27:50'),
(1418,'2017-10-19 04:27:50'),
(1419,'2017-10-19 04:27:51'),
(1420,'2017-10-19 04:27:51'),
(1421,'2017-10-19 04:27:54'),
(1422,'2017-10-19 04:27:55'),
(1423,'2017-10-19 04:27:55'),
(1424,'2017-10-19 04:27:59'),
(1425,'2017-10-19 04:27:59'),
(1426,'2017-10-19 04:28:00'),
(1427,'2017-10-19 04:28:00'),
(1428,'2017-10-19 04:28:01'),
(1429,'2017-10-19 04:28:05'),
(1430,'2017-10-19 04:28:06'),
(1431,'2017-10-19 04:28:06'),
(1432,'2017-10-19 04:28:07'),
(1433,'2017-10-19 04:28:07'),
(1434,'2017-10-19 04:28:10'),
(1435,'2017-10-19 04:28:11'),
(1436,'2017-10-19 04:28:11'),
(1437,'2017-10-19 04:28:11'),
(1438,'2017-10-19 04:28:12'),
(1439,'2017-10-19 04:28:13'),
(1440,'2017-10-19 04:28:13'),
(1441,'2017-10-19 04:28:14'),
(1442,'2017-10-19 04:28:15'),
(1443,'2017-10-19 04:28:19'),
(1444,'2017-10-19 04:28:19'),
(1445,'2017-10-19 04:28:20'),
(1446,'2017-10-19 04:28:20'),
(1447,'2017-10-19 04:28:24'),
(1448,'2017-10-19 04:28:24'),
(1449,'2017-10-19 04:28:24'),
(1450,'2017-10-19 04:28:25'),
(1451,'2017-10-19 04:28:25'),
(1452,'2017-10-19 04:28:30'),
(1453,'2017-10-19 04:28:30'),
(1454,'2017-10-19 04:28:31'),
(1455,'2017-10-19 04:28:31'),
(1456,'2017-10-19 04:28:34'),
(1457,'2017-10-19 04:28:35'),
(1458,'2017-10-19 04:28:36'),
(1459,'2017-10-19 04:28:36'),
(1460,'2017-10-19 04:48:35'),
(1461,'2017-10-19 04:48:36'),
(1462,'2017-10-19 04:48:37'),
(1463,'2017-10-19 04:48:38'),
(1464,'2017-10-19 04:48:39'),
(1465,'2017-10-19 04:48:40'),
(1466,'2017-10-19 04:48:41'),
(1467,'2017-10-19 04:48:42'),
(1468,'2017-10-19 04:48:43'),
(1469,'2017-10-19 04:48:44'),
(1470,'2017-10-19 04:48:44'),
(1471,'2017-10-19 04:49:21'),
(1472,'2017-10-19 04:49:21'),
(1473,'2017-10-19 04:49:22'),
(1474,'2017-10-19 04:49:23'),
(1475,'2017-10-19 04:49:24'),
(1476,'2017-10-19 04:49:25'),
(1477,'2017-10-19 04:49:26'),
(1478,'2017-10-19 04:49:28'),
(1479,'2017-10-19 04:49:29'),
(1480,'2017-10-19 04:49:30'),
(1481,'2017-10-19 04:49:30'),
(1482,'2017-10-19 04:49:33'),
(1483,'2017-10-19 04:49:34'),
(1484,'2017-10-19 04:49:35'),
(1485,'2017-10-19 04:49:36'),
(1486,'2017-10-19 04:49:36'),
(1487,'2017-10-19 04:49:37'),
(1488,'2017-10-19 04:49:38'),
(1489,'2017-10-19 04:49:39'),
(1490,'2017-10-19 04:49:40'),
(1491,'2017-10-19 04:49:42'),
(1492,'2017-10-19 04:49:50'),
(1493,'2017-10-19 04:49:50'),
(1494,'2017-10-19 04:49:51'),
(1495,'2017-10-19 04:49:52'),
(1496,'2017-10-19 04:49:53'),
(1497,'2017-10-19 04:49:54'),
(1498,'2017-10-19 04:49:55'),
(1499,'2017-10-19 04:49:56'),
(1500,'2017-10-19 04:49:56'),
(1501,'2017-10-19 04:49:57'),
(1502,'2017-10-19 04:49:57'),
(1503,'2017-10-19 04:50:00'),
(1504,'2017-10-19 04:50:01'),
(1505,'2017-10-19 04:50:02'),
(1506,'2017-10-19 04:50:02'),
(1507,'2017-10-19 04:50:03'),
(1508,'2017-10-19 04:50:04'),
(1509,'2017-10-19 04:50:05'),
(1510,'2017-10-19 04:50:05'),
(1511,'2017-10-19 04:50:06'),
(1512,'2017-10-19 04:50:07'),
(1513,'2017-10-19 04:50:07'),
(1514,'2017-10-19 07:18:24'),
(1515,'2017-10-19 07:18:25'),
(1516,'2017-10-19 07:18:26'),
(1517,'2017-10-19 07:18:27'),
(1518,'2017-10-19 07:18:28'),
(1519,'2017-10-19 07:18:29'),
(1520,'2017-10-19 07:18:30'),
(1521,'2017-10-19 07:18:31'),
(1522,'2017-10-19 07:18:32'),
(1523,'2017-10-19 07:18:33'),
(1524,'2017-10-19 07:18:34'),
(1525,'2017-10-19 07:18:45'),
(1526,'2017-10-19 07:18:46'),
(1527,'2017-10-19 07:18:46'),
(1528,'2017-10-19 07:18:48'),
(1529,'2017-10-19 07:18:49'),
(1530,'2017-10-19 07:18:50'),
(1531,'2017-10-19 07:18:51'),
(1532,'2017-10-19 07:18:52'),
(1533,'2017-10-19 07:18:54'),
(1534,'2017-10-19 07:18:55'),
(1535,'2017-10-19 07:18:55'),
(1536,'2017-10-19 07:18:58'),
(1537,'2017-10-19 07:18:59'),
(1538,'2017-10-19 07:19:00'),
(1539,'2017-10-19 07:19:01'),
(1540,'2017-10-19 07:19:02'),
(1541,'2017-10-19 07:19:02'),
(1542,'2017-10-19 07:19:03'),
(1543,'2017-10-19 07:19:04'),
(1544,'2017-10-19 07:19:05'),
(1545,'2017-10-19 07:19:07'),
(1546,'2017-10-19 07:19:13'),
(1547,'2017-10-19 07:19:14'),
(1548,'2017-10-19 07:19:14'),
(1549,'2017-10-19 07:19:15'),
(1550,'2017-10-19 07:19:16'),
(1551,'2017-10-19 07:19:17'),
(1552,'2017-10-19 07:19:17'),
(1553,'2017-10-19 07:19:18'),
(1554,'2017-10-19 07:19:19'),
(1555,'2017-10-19 07:19:20'),
(1556,'2017-10-19 07:19:20'),
(1557,'2017-10-19 07:19:22'),
(1558,'2017-10-19 07:19:23'),
(1559,'2017-10-19 07:19:23'),
(1560,'2017-10-19 07:19:24'),
(1561,'2017-10-19 07:19:24'),
(1562,'2017-10-19 07:19:25'),
(1563,'2017-10-19 07:19:25'),
(1564,'2017-10-19 07:19:26'),
(1565,'2017-10-19 07:19:27'),
(1566,'2017-10-19 07:19:28'),
(1567,'2017-10-19 07:19:28'),
(1568,'2017-10-19 07:20:12'),
(1569,'2017-10-19 07:20:13'),
(1570,'2017-10-19 07:20:14'),
(1571,'2017-10-19 07:20:14'),
(1572,'2017-10-19 07:20:15'),
(1573,'2017-10-19 07:20:15'),
(1574,'2017-10-19 07:20:25'),
(1575,'2017-10-19 07:20:26'),
(1576,'2017-10-19 07:20:27'),
(1577,'2017-10-19 07:20:28'),
(1578,'2017-10-19 07:20:28'),
(1579,'2017-10-19 07:20:31'),
(1580,'2017-10-19 07:20:32'),
(1581,'2017-10-19 07:20:33'),
(1582,'2017-10-19 07:20:33'),
(1583,'2017-10-19 07:20:34'),
(1584,'2017-10-19 07:20:37'),
(1585,'2017-10-19 07:20:38'),
(1586,'2017-10-19 07:20:39'),
(1587,'2017-10-19 07:20:39'),
(1588,'2017-10-19 07:20:40'),
(1589,'2017-10-19 07:20:45'),
(1590,'2017-10-19 07:20:45'),
(1591,'2017-10-19 07:20:47'),
(1592,'2017-10-19 07:20:47'),
(1593,'2017-10-19 07:20:49'),
(1594,'2017-10-19 07:20:52'),
(1595,'2017-10-19 07:20:53'),
(1596,'2017-10-19 07:20:54'),
(1597,'2017-10-19 07:20:55'),
(1598,'2017-10-19 07:20:55'),
(1599,'2017-10-19 07:20:59'),
(1600,'2017-10-19 07:21:00'),
(1601,'2017-10-19 07:21:01'),
(1602,'2017-10-19 07:21:01'),
(1603,'2017-10-19 07:21:02'),
(1604,'2017-10-19 07:21:05'),
(1605,'2017-10-19 07:21:06'),
(1606,'2017-10-19 07:21:06'),
(1607,'2017-10-19 07:21:07'),
(1608,'2017-10-19 07:21:08'),
(1609,'2017-10-19 07:21:11'),
(1610,'2017-10-19 07:21:12'),
(1611,'2017-10-19 07:21:12'),
(1612,'2017-10-19 07:21:13'),
(1613,'2017-10-19 07:21:14'),
(1614,'2017-10-19 07:21:17'),
(1615,'2017-10-19 07:21:17'),
(1616,'2017-10-19 07:21:18'),
(1617,'2017-10-19 07:21:18'),
(1618,'2017-10-19 07:21:19'),
(1619,'2017-10-19 07:21:25'),
(1620,'2017-10-19 07:21:25'),
(1621,'2017-10-19 07:21:26'),
(1622,'2017-10-19 07:21:27'),
(1623,'2017-10-19 07:21:27'),
(1624,'2017-10-19 07:21:30'),
(1625,'2017-10-19 07:21:31'),
(1626,'2017-10-19 07:21:31'),
(1627,'2017-10-19 07:21:32'),
(1628,'2017-10-19 07:21:33'),
(1629,'2017-10-19 07:21:37'),
(1630,'2017-10-19 07:21:38'),
(1631,'2017-10-19 07:21:38'),
(1632,'2017-10-19 07:21:39'),
(1633,'2017-10-19 07:21:40'),
(1634,'2017-10-19 07:21:43'),
(1635,'2017-10-19 07:21:43'),
(1636,'2017-10-19 07:21:44'),
(1637,'2017-10-19 07:21:44'),
(1638,'2017-10-19 07:21:45'),
(1639,'2017-10-19 07:21:49'),
(1640,'2017-10-19 07:21:50'),
(1641,'2017-10-19 07:21:50'),
(1642,'2017-10-19 07:21:51'),
(1643,'2017-10-19 07:21:51'),
(1644,'2017-10-19 07:26:30'),
(1645,'2017-10-19 07:26:30'),
(1646,'2017-10-19 07:26:31'),
(1647,'2017-10-19 07:26:31'),
(1648,'2017-10-19 07:26:31'),
(1649,'2017-10-19 07:26:32'),
(1650,'2017-10-19 07:26:33'),
(1651,'2017-10-19 07:26:34'),
(1652,'2017-10-19 07:26:34'),
(1653,'2017-10-19 07:26:35'),
(1654,'2017-10-19 07:26:35'),
(1655,'2017-10-19 07:26:35'),
(1656,'2017-10-19 07:26:35'),
(1657,'2017-10-19 07:26:38'),
(1658,'2017-10-19 07:26:39'),
(1659,'2017-10-19 07:26:39'),
(1660,'2017-10-19 07:26:39'),
(1661,'2017-10-19 07:26:39'),
(1662,'2017-10-19 07:27:37'),
(1663,'2017-10-19 07:27:37'),
(1664,'2017-10-19 07:27:38'),
(1665,'2017-10-19 07:27:38'),
(1666,'2017-10-19 07:27:40'),
(1667,'2017-10-19 07:27:40'),
(1668,'2017-10-19 07:27:43'),
(1669,'2017-10-19 07:27:44'),
(1670,'2017-10-19 07:27:45'),
(1671,'2017-10-19 07:27:45'),
(1672,'2017-10-19 07:27:46'),
(1673,'2017-10-19 07:27:46'),
(1674,'2017-10-19 07:28:10'),
(1675,'2017-10-19 07:28:10'),
(1676,'2017-10-19 07:28:12'),
(1677,'2017-10-19 07:28:13'),
(1678,'2017-10-19 07:28:14'),
(1679,'2017-10-19 07:28:14'),
(1680,'2017-10-19 07:29:00'),
(1681,'2017-10-19 07:29:04'),
(1682,'2017-10-19 07:29:05'),
(1683,'2017-10-19 07:29:06'),
(1684,'2017-10-19 07:29:07'),
(1685,'2017-10-19 07:29:07'),
(1686,'2017-10-19 07:29:08'),
(1687,'2017-10-19 07:29:09'),
(1688,'2017-10-19 07:29:10'),
(1689,'2017-10-19 07:29:12'),
(1690,'2017-10-19 07:29:16'),
(1691,'2017-10-19 07:29:17'),
(1692,'2017-10-19 07:29:18'),
(1693,'2017-10-19 07:29:18'),
(1694,'2017-10-19 07:29:20'),
(1695,'2017-10-19 07:29:21'),
(1696,'2017-10-19 07:29:22'),
(1697,'2017-10-19 07:29:24'),
(1698,'2017-10-19 07:29:25'),
(1699,'2017-10-19 07:29:26'),
(1700,'2017-10-19 07:29:27'),
(1701,'2017-10-19 07:29:29'),
(1702,'2017-10-19 07:29:29'),
(1703,'2017-10-19 07:29:47'),
(1704,'2017-10-19 07:29:47'),
(1705,'2017-10-19 07:29:48'),
(1706,'2017-10-19 07:29:49'),
(1707,'2017-10-19 07:29:51'),
(1708,'2017-10-19 07:29:55'),
(1709,'2017-10-19 07:29:55'),
(1710,'2017-10-19 07:29:56'),
(1711,'2017-10-19 07:29:56'),
(1712,'2017-10-19 07:29:59'),
(1713,'2017-10-19 07:30:02'),
(1714,'2017-10-19 07:30:03'),
(1715,'2017-10-19 07:30:04'),
(1716,'2017-10-19 07:30:04'),
(1717,'2017-10-19 07:30:05'),
(1718,'2017-10-19 07:30:10'),
(1719,'2017-10-19 07:30:10'),
(1720,'2017-10-19 07:30:11'),
(1721,'2017-10-19 07:30:11'),
(1722,'2017-10-19 07:30:12'),
(1723,'2017-10-19 07:30:16'),
(1724,'2017-10-19 07:30:16'),
(1725,'2017-10-19 07:30:17'),
(1726,'2017-10-19 07:30:17'),
(1727,'2017-10-19 07:30:18'),
(1728,'2017-10-19 07:31:08'),
(1729,'2017-10-19 07:31:10'),
(1730,'2017-10-19 07:31:11'),
(1731,'2017-10-19 07:31:12'),
(1732,'2017-10-19 07:31:13'),
(1733,'2017-10-19 07:31:14'),
(1734,'2017-10-19 07:31:15'),
(1735,'2017-10-19 07:31:16'),
(1736,'2017-10-19 07:31:17'),
(1737,'2017-10-19 07:31:18'),
(1738,'2017-10-19 07:31:19'),
(1739,'2017-10-19 07:31:20'),
(1740,'2017-10-19 07:31:20'),
(1741,'2017-10-19 07:31:28'),
(1742,'2017-10-19 07:31:28'),
(1743,'2017-10-19 07:31:29'),
(1744,'2017-10-19 07:31:29'),
(1745,'2017-10-19 07:31:30'),
(1746,'2017-10-19 07:31:32'),
(1747,'2017-10-19 07:31:33'),
(1748,'2017-10-19 07:31:33'),
(1749,'2017-10-19 07:31:34'),
(1750,'2017-10-19 07:31:34'),
(1751,'2017-10-19 07:31:37'),
(1752,'2017-10-19 07:31:38'),
(1753,'2017-10-19 07:31:38'),
(1754,'2017-10-19 07:31:39'),
(1755,'2017-10-19 07:31:39'),
(1756,'2017-10-19 07:31:43'),
(1757,'2017-10-19 07:31:44'),
(1758,'2017-10-19 07:31:44'),
(1759,'2017-10-19 07:31:45'),
(1760,'2017-10-19 07:31:45'),
(1761,'2017-10-19 07:33:30'),
(1762,'2017-10-19 07:33:31'),
(1763,'2017-10-19 07:33:31'),
(1764,'2017-10-19 07:33:32'),
(1765,'2017-10-19 07:33:34'),
(1766,'2017-10-19 07:33:37'),
(1767,'2017-10-19 07:33:37'),
(1768,'2017-10-19 07:33:38'),
(1769,'2017-10-19 07:33:38'),
(1770,'2017-10-19 07:33:39'),
(1771,'2017-10-19 07:33:42'),
(1772,'2017-10-19 07:33:43'),
(1773,'2017-10-19 07:33:43'),
(1774,'2017-10-19 07:33:44'),
(1775,'2017-10-19 07:33:45'),
(1776,'2017-10-19 07:33:50'),
(1777,'2017-10-19 07:33:51'),
(1778,'2017-10-19 07:33:52'),
(1779,'2017-10-19 07:33:55'),
(1780,'2017-10-19 07:33:56'),
(1781,'2017-10-19 07:33:59'),
(1782,'2017-10-19 07:34:00'),
(1783,'2017-10-19 07:34:01'),
(1784,'2017-10-19 07:34:01'),
(1785,'2017-10-19 07:34:02'),
(1786,'2017-10-19 07:41:30'),
(1787,'2017-10-19 07:41:31'),
(1788,'2017-10-19 07:41:32'),
(1789,'2017-10-19 07:41:34'),
(1790,'2017-10-19 07:41:35'),
(1791,'2017-10-19 07:41:36'),
(1792,'2017-10-19 07:41:37'),
(1793,'2017-10-19 07:41:38'),
(1794,'2017-10-19 07:41:40'),
(1795,'2017-10-19 07:41:41'),
(1796,'2017-10-19 07:41:41'),
(1797,'2017-10-19 07:41:44'),
(1798,'2017-10-19 07:41:46'),
(1799,'2017-10-19 07:41:47'),
(1800,'2017-10-19 07:41:48'),
(1801,'2017-10-19 07:41:49'),
(1802,'2017-10-19 07:41:51'),
(1803,'2017-10-19 07:41:52'),
(1804,'2017-10-19 07:41:54'),
(1805,'2017-10-19 07:41:55'),
(1806,'2017-10-19 07:41:56'),
(1807,'2017-10-19 07:42:00'),
(1808,'2017-10-19 07:42:01'),
(1809,'2017-10-19 07:42:01'),
(1810,'2017-10-19 07:42:02'),
(1811,'2017-10-19 07:42:03'),
(1812,'2017-10-19 07:42:04'),
(1813,'2017-10-19 07:42:05'),
(1814,'2017-10-19 07:42:07'),
(1815,'2017-10-19 07:42:08'),
(1816,'2017-10-19 07:42:09'),
(1817,'2017-10-19 07:42:09'),
(1818,'2017-10-19 07:42:13'),
(1819,'2017-10-19 07:42:14'),
(1820,'2017-10-19 07:42:15'),
(1821,'2017-10-19 07:42:17'),
(1822,'2017-10-19 07:42:18'),
(1823,'2017-10-19 07:42:19'),
(1824,'2017-10-19 07:42:21'),
(1825,'2017-10-19 07:42:22'),
(1826,'2017-10-19 07:42:23'),
(1827,'2017-10-19 07:42:24'),
(1828,'2017-10-19 07:42:24'),
(1829,'2017-10-19 07:42:35'),
(1830,'2017-10-19 07:42:36'),
(1831,'2017-10-19 07:42:37'),
(1832,'2017-10-19 07:42:38'),
(1833,'2017-10-19 07:42:40'),
(1834,'2017-10-19 07:42:41'),
(1835,'2017-10-19 07:42:42'),
(1836,'2017-10-19 07:42:43'),
(1837,'2017-10-19 07:42:45'),
(1838,'2017-10-19 07:42:47'),
(1839,'2017-10-19 07:42:52'),
(1840,'2017-10-19 07:42:53'),
(1841,'2017-10-19 07:42:54'),
(1842,'2017-10-19 07:42:55'),
(1843,'2017-10-19 07:42:56'),
(1844,'2017-10-19 07:42:57'),
(1845,'2017-10-19 07:42:59'),
(1846,'2017-10-19 07:43:00'),
(1847,'2017-10-19 07:43:01'),
(1848,'2017-10-19 07:43:02'),
(1849,'2017-10-19 07:43:02'),
(1850,'2017-10-19 07:51:00'),
(1851,'2017-10-19 07:51:01'),
(1852,'2017-10-19 07:51:01'),
(1853,'2017-10-19 07:51:02'),
(1854,'2017-10-19 07:51:02'),
(1855,'2017-10-19 07:51:05'),
(1856,'2017-10-19 07:51:05'),
(1857,'2017-10-19 07:51:06'),
(1858,'2017-10-19 07:51:06'),
(1859,'2017-10-19 07:51:07'),
(1860,'2017-10-19 07:51:10'),
(1861,'2017-10-19 07:51:11'),
(1862,'2017-10-19 07:51:11'),
(1863,'2017-10-19 07:51:12'),
(1864,'2017-10-19 07:51:12'),
(1865,'2017-10-19 07:51:17'),
(1866,'2017-10-19 07:51:17'),
(1867,'2017-10-19 07:51:18'),
(1868,'2017-10-19 07:51:18'),
(1869,'2017-10-19 07:51:19'),
(1870,'2017-10-19 07:51:19'),
(1871,'2017-10-19 07:51:29'),
(1872,'2017-10-19 07:51:30'),
(1873,'2017-10-19 07:51:31'),
(1874,'2017-10-19 07:51:31'),
(1875,'2017-10-19 07:51:32'),
(1876,'2017-10-19 07:52:15'),
(1877,'2017-10-19 07:52:16'),
(1878,'2017-10-19 07:52:16'),
(1879,'2017-10-19 07:52:16'),
(1880,'2017-10-19 07:52:17'),
(1881,'2017-10-19 07:52:20'),
(1882,'2017-10-19 07:52:20'),
(1883,'2017-10-19 07:52:20'),
(1884,'2017-10-19 07:52:21'),
(1885,'2017-10-19 07:52:21'),
(1886,'2017-10-19 07:52:25'),
(1887,'2017-10-19 07:52:25'),
(1888,'2017-10-19 07:52:25'),
(1889,'2017-10-19 07:52:26'),
(1890,'2017-10-19 07:52:26'),
(1891,'2017-10-19 07:52:31'),
(1892,'2017-10-19 07:52:31'),
(1893,'2017-10-19 07:52:32'),
(1894,'2017-10-19 07:52:32'),
(1895,'2017-10-19 07:52:32'),
(1896,'2017-10-19 07:52:33'),
(1897,'2017-10-19 07:52:50'),
(1898,'2017-10-19 07:52:51'),
(1899,'2017-10-19 07:52:51'),
(1900,'2017-10-19 07:52:53'),
(1901,'2017-10-19 07:53:19'),
(1902,'2017-10-19 07:53:20'),
(1903,'2017-10-19 07:53:20'),
(1904,'2017-10-19 07:53:21'),
(1905,'2017-10-19 07:53:21'),
(1906,'2017-10-19 07:53:22'),
(1907,'2017-10-19 07:55:46'),
(1908,'2017-10-19 07:55:47'),
(1909,'2017-10-19 07:55:47'),
(1910,'2017-10-19 07:55:48'),
(1911,'2017-10-19 07:55:48'),
(1912,'2017-10-19 07:55:51'),
(1913,'2017-10-19 07:55:51'),
(1914,'2017-10-19 07:55:52'),
(1915,'2017-10-19 07:55:52'),
(1916,'2017-10-19 07:55:52'),
(1917,'2017-10-19 07:55:55'),
(1918,'2017-10-19 07:55:56'),
(1919,'2017-10-19 07:55:56'),
(1920,'2017-10-19 07:55:57'),
(1921,'2017-10-19 07:55:57'),
(1922,'2017-10-19 07:56:02'),
(1923,'2017-10-19 07:56:02'),
(1924,'2017-10-19 07:56:03'),
(1925,'2017-10-19 07:56:03'),
(1926,'2017-10-19 07:56:04'),
(1927,'2017-10-19 07:56:04'),
(1928,'2017-10-19 07:56:08'),
(1929,'2017-10-19 07:56:08'),
(1930,'2017-10-19 07:56:09'),
(1931,'2017-10-19 07:56:09'),
(1932,'2017-10-19 07:56:10'),
(1933,'2017-10-19 07:56:12'),
(1934,'2017-10-19 07:56:12'),
(1935,'2017-10-19 07:56:13'),
(1936,'2017-10-19 07:56:13'),
(1937,'2017-10-19 07:56:14'),
(1938,'2017-10-19 07:56:17'),
(1939,'2017-10-19 07:56:17'),
(1940,'2017-10-19 07:56:18'),
(1941,'2017-10-19 07:56:18'),
(1942,'2017-10-19 07:56:19'),
(1943,'2017-10-19 07:56:24'),
(1944,'2017-10-19 07:56:24'),
(1945,'2017-10-19 07:56:24'),
(1946,'2017-10-19 07:56:25'),
(1947,'2017-10-19 07:56:25'),
(1948,'2017-10-19 07:56:26'),
(1949,'2017-10-19 07:58:35'),
(1950,'2017-10-19 07:58:36'),
(1951,'2017-10-19 07:58:36'),
(1952,'2017-10-19 07:58:37'),
(1953,'2017-10-19 07:58:38'),
(1954,'2017-10-19 07:58:41'),
(1955,'2017-10-19 07:58:43'),
(1956,'2017-10-19 07:58:45'),
(1957,'2017-10-19 07:58:46'),
(1958,'2017-10-19 07:58:49'),
(1959,'2017-10-19 07:58:50'),
(1960,'2017-10-19 07:58:50'),
(1961,'2017-10-19 07:58:51'),
(1962,'2017-10-19 07:58:51'),
(1963,'2017-10-19 07:58:56'),
(1964,'2017-10-19 07:58:56'),
(1965,'2017-10-19 07:58:57'),
(1966,'2017-10-19 07:58:57'),
(1967,'2017-10-19 07:58:58'),
(1968,'2017-10-19 07:58:59'),
(1969,'2017-10-19 07:59:09'),
(1970,'2017-10-19 07:59:09'),
(1971,'2017-10-19 07:59:10'),
(1972,'2017-10-19 07:59:10'),
(1973,'2017-10-19 07:59:11'),
(1974,'2017-10-19 07:59:11'),
(1975,'2017-10-19 07:59:12'),
(1976,'2017-10-19 07:59:12'),
(1977,'2017-10-19 07:59:15'),
(1978,'2017-10-19 07:59:16'),
(1979,'2017-10-19 07:59:16'),
(1980,'2017-10-19 07:59:17'),
(1981,'2017-10-19 07:59:17'),
(1982,'2017-10-19 07:59:20'),
(1983,'2017-10-19 07:59:21'),
(1984,'2017-10-19 07:59:21'),
(1985,'2017-10-19 07:59:22'),
(1986,'2017-10-19 07:59:22'),
(1987,'2017-10-19 07:59:26'),
(1988,'2017-10-19 07:59:27'),
(1989,'2017-10-19 07:59:27'),
(1990,'2017-10-19 07:59:27'),
(1991,'2017-10-19 08:06:01'),
(1992,'2017-10-19 08:06:01'),
(1993,'2017-10-19 08:06:02'),
(1994,'2017-10-19 08:06:03'),
(1995,'2017-10-19 08:06:03'),
(1996,'2017-10-19 08:06:05'),
(1997,'2017-10-19 08:06:06'),
(1998,'2017-10-19 08:06:07'),
(1999,'2017-10-19 08:06:07'),
(2000,'2017-10-19 08:06:08'),
(2001,'2017-10-19 08:06:11'),
(2002,'2017-10-19 08:06:11'),
(2003,'2017-10-19 08:06:12'),
(2004,'2017-10-19 08:06:12'),
(2005,'2017-10-19 08:06:13'),
(2006,'2017-10-19 08:06:17'),
(2007,'2017-10-19 08:06:18'),
(2008,'2017-10-19 08:06:18'),
(2009,'2017-10-19 08:06:19'),
(2010,'2017-10-19 08:06:19'),
(2011,'2017-10-19 08:06:20'),
(2012,'2017-10-19 08:06:29'),
(2013,'2017-10-19 08:06:50'),
(2014,'2017-10-19 08:06:51'),
(2015,'2017-10-19 08:06:51'),
(2016,'2017-10-19 08:06:53'),
(2017,'2017-10-19 08:06:54'),
(2018,'2017-10-19 08:06:54'),
(2019,'2017-10-19 08:06:55'),
(2020,'2017-10-19 08:06:58'),
(2021,'2017-10-19 08:06:58'),
(2022,'2017-10-19 08:06:59'),
(2023,'2017-10-19 08:06:59'),
(2024,'2017-10-19 08:07:03'),
(2025,'2017-10-19 08:07:04'),
(2026,'2017-10-19 08:07:04'),
(2027,'2017-10-19 08:08:44'),
(2028,'2017-10-19 08:08:45'),
(2029,'2017-10-19 08:08:45'),
(2030,'2017-10-19 08:08:45'),
(2031,'2017-10-19 08:08:46'),
(2032,'2017-10-19 08:08:49'),
(2033,'2017-10-19 08:08:49'),
(2034,'2017-10-19 08:08:50'),
(2035,'2017-10-19 08:08:50'),
(2036,'2017-10-19 08:08:54'),
(2037,'2017-10-19 08:08:54'),
(2038,'2017-10-19 08:08:54'),
(2039,'2017-10-19 08:08:55'),
(2040,'2017-10-19 08:08:57'),
(2041,'2017-10-19 08:09:01'),
(2042,'2017-10-19 08:09:01'),
(2043,'2017-10-19 08:09:02'),
(2044,'2017-10-19 08:09:03'),
(2045,'2017-10-19 08:09:04'),
(2046,'2017-10-19 08:09:04'),
(2047,'2017-10-19 08:09:09'),
(2048,'2017-10-19 08:09:10'),
(2049,'2017-10-19 08:09:12'),
(2050,'2017-10-19 08:09:12'),
(2051,'2017-10-19 08:09:15'),
(2052,'2017-10-19 08:09:16'),
(2053,'2017-10-19 08:09:19'),
(2054,'2017-10-19 08:09:20'),
(2055,'2017-10-19 08:09:20'),
(2056,'2017-10-19 08:09:33'),
(2057,'2017-10-19 08:09:34'),
(2058,'2017-10-19 08:09:36'),
(2059,'2017-10-19 08:09:37'),
(2060,'2017-10-19 08:09:40'),
(2061,'2017-10-19 08:09:40'),
(2062,'2017-10-19 08:09:46'),
(2063,'2017-10-19 08:09:47'),
(2064,'2017-10-19 08:09:47'),
(2065,'2017-10-19 08:39:47'),
(2066,'2017-10-19 08:39:47'),
(2067,'2017-10-19 08:39:48'),
(2068,'2017-10-19 08:39:48'),
(2069,'2017-10-19 08:39:49'),
(2070,'2017-10-19 08:39:52'),
(2071,'2017-10-19 08:39:53'),
(2072,'2017-10-19 08:39:53'),
(2073,'2017-10-19 08:39:54'),
(2074,'2017-10-19 08:39:54'),
(2075,'2017-10-19 08:40:05'),
(2076,'2017-10-19 08:40:05'),
(2077,'2017-10-19 08:40:06'),
(2078,'2017-10-19 08:40:06'),
(2079,'2017-10-19 08:40:07'),
(2080,'2017-10-19 08:40:14'),
(2081,'2017-10-19 08:40:14'),
(2082,'2017-10-19 08:40:15'),
(2083,'2017-10-19 08:40:15'),
(2084,'2017-10-19 08:40:17'),
(2085,'2017-10-19 08:40:17'),
(2086,'2017-10-19 08:40:35'),
(2087,'2017-10-19 08:40:35'),
(2088,'2017-10-19 08:40:36'),
(2089,'2017-10-19 08:40:36'),
(2090,'2017-10-19 08:40:37'),
(2091,'2017-10-19 08:40:40'),
(2092,'2017-10-19 08:40:40'),
(2093,'2017-10-19 08:40:41'),
(2094,'2017-10-19 08:40:41'),
(2095,'2017-10-19 08:40:42'),
(2096,'2017-10-19 08:40:46'),
(2097,'2017-10-19 08:40:46'),
(2098,'2017-10-19 08:40:47'),
(2099,'2017-10-19 08:40:47'),
(2100,'2017-10-19 08:40:48'),
(2101,'2017-10-19 08:40:51'),
(2102,'2017-10-19 08:40:52'),
(2103,'2017-10-19 08:40:52'),
(2104,'2017-10-19 08:40:53'),
(2105,'2017-10-19 08:40:53'),
(2106,'2017-10-19 08:40:53'),
(2107,'2017-10-19 08:40:59'),
(2108,'2017-10-19 08:40:59'),
(2109,'2017-10-19 08:41:03'),
(2110,'2017-10-19 08:41:03'),
(2111,'2017-10-19 08:41:07'),
(2112,'2017-10-19 08:41:07'),
(2113,'2017-10-19 08:41:11'),
(2114,'2017-10-19 08:41:12'),
(2115,'2017-10-19 08:41:12'),
(2116,'2017-10-19 08:42:51'),
(2117,'2017-10-19 08:42:51'),
(2118,'2017-10-19 08:42:52'),
(2119,'2017-10-19 08:42:53'),
(2120,'2017-10-19 08:42:56'),
(2121,'2017-10-19 08:42:56'),
(2122,'2017-10-19 08:42:56'),
(2123,'2017-10-19 08:42:57'),
(2124,'2017-10-19 08:42:57'),
(2125,'2017-10-19 08:43:01'),
(2126,'2017-10-19 08:43:02'),
(2127,'2017-10-19 08:43:02'),
(2128,'2017-10-19 08:43:03'),
(2129,'2017-10-19 08:43:04'),
(2130,'2017-10-19 08:43:09'),
(2131,'2017-10-19 08:43:09'),
(2132,'2017-10-19 08:43:10'),
(2133,'2017-10-19 08:43:12'),
(2134,'2017-10-19 08:43:14'),
(2135,'2017-10-19 08:43:14'),
(2136,'2017-10-19 08:43:51'),
(2137,'2017-10-19 08:43:51'),
(2138,'2017-10-19 08:43:52'),
(2139,'2017-10-19 08:43:52'),
(2140,'2017-10-19 08:43:53'),
(2141,'2017-10-19 08:44:55'),
(2142,'2017-10-19 08:44:56'),
(2143,'2017-10-19 08:44:57'),
(2144,'2017-10-19 08:44:58'),
(2145,'2017-10-19 08:44:58'),
(2146,'2017-10-19 08:44:58'),
(2147,'2017-10-19 08:46:27'),
(2148,'2017-10-19 08:46:28'),
(2149,'2017-10-19 08:46:28'),
(2150,'2017-10-19 08:46:29'),
(2151,'2017-10-19 08:46:29'),
(2152,'2017-10-19 08:46:29'),
(2153,'2017-10-19 08:46:38'),
(2154,'2017-10-19 08:46:38'),
(2155,'2017-10-19 08:46:39'),
(2156,'2017-10-19 08:46:39'),
(2157,'2017-10-19 08:46:40'),
(2158,'2017-10-19 08:46:42'),
(2159,'2017-10-19 08:46:43'),
(2160,'2017-10-19 08:46:43'),
(2161,'2017-10-19 08:46:43'),
(2162,'2017-10-19 08:46:45'),
(2163,'2017-10-19 08:46:48'),
(2164,'2017-10-19 08:46:49'),
(2165,'2017-10-19 08:46:49'),
(2166,'2017-10-19 08:46:50'),
(2167,'2017-10-19 08:46:50'),
(2168,'2017-10-19 08:46:55'),
(2169,'2017-10-19 08:46:56'),
(2170,'2017-10-19 08:46:56'),
(2171,'2017-10-19 08:46:57'),
(2172,'2017-10-19 08:46:59'),
(2173,'2017-10-19 08:46:59'),
(2174,'2017-10-19 08:47:03'),
(2175,'2017-10-19 08:47:03'),
(2176,'2017-10-19 08:47:03'),
(2177,'2017-10-19 08:47:04'),
(2178,'2017-10-19 08:47:06'),
(2179,'2017-10-19 08:47:07'),
(2180,'2017-10-19 08:47:07'),
(2181,'2017-10-19 08:47:08'),
(2182,'2017-10-19 08:47:08'),
(2183,'2017-10-19 08:47:12'),
(2184,'2017-10-19 08:47:12'),
(2185,'2017-10-19 08:47:12'),
(2186,'2017-10-19 08:47:13'),
(2187,'2017-10-19 08:47:14'),
(2188,'2017-10-19 08:47:18'),
(2189,'2017-10-19 08:47:18'),
(2190,'2017-10-19 08:47:18'),
(2191,'2017-10-19 08:47:19'),
(2192,'2017-10-19 08:47:20'),
(2193,'2017-10-19 08:47:20'),
(2194,'2017-10-19 08:50:08'),
(2195,'2017-10-19 08:50:11'),
(2196,'2017-10-19 08:50:12'),
(2197,'2017-10-19 08:50:12'),
(2198,'2017-10-19 08:50:13'),
(2199,'2017-10-19 08:50:13'),
(2200,'2017-10-19 08:50:17'),
(2201,'2017-10-19 08:50:18'),
(2202,'2017-10-19 08:50:18'),
(2203,'2017-10-19 08:50:19'),
(2204,'2017-10-19 08:50:22'),
(2205,'2017-10-19 08:50:23'),
(2206,'2017-10-19 08:50:23'),
(2207,'2017-10-19 08:50:24'),
(2208,'2017-10-19 08:50:24'),
(2209,'2017-10-19 08:50:28'),
(2210,'2017-10-19 08:50:28'),
(2211,'2017-10-19 08:50:29'),
(2212,'2017-10-19 08:50:29'),
(2213,'2017-10-19 08:50:30'),
(2214,'2017-10-19 08:50:34'),
(2215,'2017-10-19 08:50:35'),
(2216,'2017-10-19 08:50:35'),
(2217,'2017-10-19 08:50:36'),
(2218,'2017-10-19 08:50:38'),
(2219,'2017-10-19 08:50:38'),
(2220,'2017-10-19 08:53:36'),
(2221,'2017-10-19 08:53:36'),
(2222,'2017-10-19 08:53:37'),
(2223,'2017-10-19 08:53:37'),
(2224,'2017-10-19 08:53:38'),
(2225,'2017-10-19 08:53:38'),
(2226,'2017-10-19 08:53:40'),
(2227,'2017-10-19 08:53:41'),
(2228,'2017-10-19 08:53:41'),
(2229,'2017-10-19 08:53:41'),
(2230,'2017-10-19 08:53:42'),
(2231,'2017-10-19 08:53:45'),
(2232,'2017-10-19 08:53:45'),
(2233,'2017-10-19 08:53:46'),
(2234,'2017-10-19 08:53:49'),
(2235,'2017-10-19 08:53:50'),
(2236,'2017-10-19 08:53:50'),
(2237,'2017-10-19 08:53:55'),
(2238,'2017-10-19 08:53:55'),
(2239,'2017-10-19 08:53:55'),
(2240,'2017-10-19 08:53:56'),
(2241,'2017-10-19 08:53:57'),
(2242,'2017-10-19 08:53:57'),
(2243,'2017-10-19 08:54:02'),
(2244,'2017-10-19 08:54:02'),
(2245,'2017-10-19 08:54:05'),
(2246,'2017-10-19 08:54:05'),
(2247,'2017-10-19 08:54:06'),
(2248,'2017-10-19 08:54:06'),
(2249,'2017-10-19 08:55:58'),
(2250,'2017-10-19 08:55:58'),
(2251,'2017-10-19 08:55:59'),
(2252,'2017-10-19 08:55:59'),
(2253,'2017-10-19 08:56:00'),
(2254,'2017-10-19 08:56:00'),
(2255,'2017-10-19 08:56:07'),
(2256,'2017-10-19 08:56:07'),
(2257,'2017-10-19 08:56:08'),
(2258,'2017-10-19 08:56:08'),
(2259,'2017-10-19 08:56:09'),
(2260,'2017-10-19 08:56:09'),
(2261,'2017-10-19 08:56:11'),
(2262,'2017-10-19 08:56:12'),
(2263,'2017-10-19 08:56:15'),
(2264,'2017-10-19 08:56:16'),
(2265,'2017-10-19 08:56:16'),
(2266,'2017-10-19 08:56:17'),
(2267,'2017-10-19 08:56:20'),
(2268,'2017-10-19 08:56:21'),
(2269,'2017-10-19 08:56:21'),
(2270,'2017-10-19 08:56:22'),
(2271,'2017-10-19 08:56:25'),
(2272,'2017-10-19 08:56:26'),
(2273,'2017-10-19 08:56:26'),
(2274,'2017-10-19 08:56:27'),
(2275,'2017-10-19 08:56:30'),
(2276,'2017-10-19 08:56:31'),
(2277,'2017-10-19 08:56:32'),
(2278,'2017-10-19 08:56:35'),
(2279,'2017-10-19 08:56:36'),
(2280,'2017-10-19 08:56:39'),
(2281,'2017-10-19 08:56:40'),
(2282,'2017-10-19 08:56:43'),
(2283,'2017-10-19 08:56:44'),
(2284,'2017-10-19 08:56:44'),
(2285,'2017-10-19 08:56:48'),
(2286,'2017-10-19 08:56:49'),
(2287,'2017-10-19 08:56:51'),
(2288,'2017-10-19 08:56:52'),
(2289,'2017-10-19 08:56:55'),
(2290,'2017-10-19 08:56:56'),
(2291,'2017-10-19 08:57:01'),
(2292,'2017-10-19 08:57:02'),
(2293,'2017-10-19 08:57:02'),
(2294,'2017-10-19 08:57:04'),
(2295,'2017-10-19 08:57:05'),
(2296,'2017-10-19 08:57:08'),
(2297,'2017-10-19 08:57:09'),
(2298,'2017-10-19 08:57:12'),
(2299,'2017-10-19 08:57:15'),
(2300,'2017-10-19 08:57:15'),
(2301,'2017-10-19 08:57:16'),
(2302,'2017-10-19 08:57:39'),
(2303,'2017-10-19 08:57:40'),
(2304,'2017-10-19 08:57:40'),
(2305,'2017-10-19 08:57:41'),
(2306,'2017-10-19 08:57:41'),
(2307,'2017-10-19 08:57:52'),
(2308,'2017-10-19 08:57:53'),
(2309,'2017-10-19 08:57:53'),
(2310,'2017-10-19 08:57:54'),
(2311,'2017-10-19 08:57:57'),
(2312,'2017-10-19 08:57:58'),
(2313,'2017-10-19 08:57:59'),
(2314,'2017-10-19 08:57:59'),
(2315,'2017-10-19 08:58:03'),
(2316,'2017-10-19 08:58:04'),
(2317,'2017-10-19 08:58:05'),
(2318,'2017-10-19 08:58:10'),
(2319,'2017-10-19 08:58:11'),
(2320,'2017-10-19 08:58:11'),
(2321,'2017-10-19 09:00:29'),
(2322,'2017-10-19 09:00:30'),
(2323,'2017-10-19 09:00:31'),
(2324,'2017-10-19 09:00:32'),
(2325,'2017-10-19 09:00:34'),
(2326,'2017-10-19 09:00:51'),
(2327,'2017-10-19 09:00:52'),
(2328,'2017-10-19 09:00:53'),
(2329,'2017-10-19 09:00:54'),
(2330,'2017-10-19 09:00:55'),
(2331,'2017-10-19 09:02:04'),
(2332,'2017-10-19 09:02:05'),
(2333,'2017-10-19 09:02:06'),
(2334,'2017-10-19 09:02:07'),
(2335,'2017-10-19 09:02:09'),
(2336,'2017-10-19 09:02:48'),
(2337,'2017-10-19 09:02:49'),
(2338,'2017-10-19 09:02:49'),
(2339,'2017-10-19 09:02:51'),
(2340,'2017-10-19 09:02:51'),
(2341,'2017-10-19 09:03:05'),
(2342,'2017-10-19 09:03:06'),
(2343,'2017-10-19 09:03:07'),
(2344,'2017-10-19 09:03:08'),
(2345,'2017-10-19 09:03:11'),
(2346,'2017-10-19 09:04:11'),
(2347,'2017-10-19 09:04:12'),
(2348,'2017-10-19 09:04:14'),
(2349,'2017-10-19 09:04:15'),
(2350,'2017-10-19 09:04:17'),
(2351,'2017-10-19 09:05:57'),
(2352,'2017-10-19 09:05:57'),
(2353,'2017-10-19 09:05:58'),
(2354,'2017-10-19 09:05:58'),
(2355,'2017-10-19 09:05:59'),
(2356,'2017-10-19 09:06:11'),
(2357,'2017-10-19 09:06:11'),
(2358,'2017-10-19 09:06:12'),
(2359,'2017-10-19 09:06:14'),
(2360,'2017-10-19 09:06:16'),
(2361,'2017-10-19 09:06:49'),
(2362,'2017-10-19 09:06:49'),
(2363,'2017-10-19 09:06:50'),
(2364,'2017-10-19 09:06:50'),
(2365,'2017-10-19 09:06:51'),
(2366,'2017-10-19 09:06:51'),
(2367,'2017-10-19 09:06:51'),
(2368,'2017-10-19 09:06:54'),
(2369,'2017-10-19 09:06:55'),
(2370,'2017-10-19 09:06:56'),
(2371,'2017-10-19 09:07:40'),
(2372,'2017-10-19 09:07:40'),
(2373,'2017-10-19 09:07:41'),
(2374,'2017-10-19 09:07:42'),
(2375,'2017-10-19 09:07:42'),
(2376,'2017-10-19 09:07:42'),
(2377,'2017-10-19 09:08:32'),
(2378,'2017-10-19 09:08:32'),
(2379,'2017-10-19 09:08:33'),
(2380,'2017-10-19 09:08:33'),
(2381,'2017-10-19 09:08:34'),
(2382,'2017-10-19 09:08:37'),
(2383,'2017-10-19 09:08:38'),
(2384,'2017-10-19 09:08:38'),
(2385,'2017-10-19 09:08:39'),
(2386,'2017-10-19 09:08:40'),
(2387,'2017-10-19 09:08:43'),
(2388,'2017-10-19 09:08:44'),
(2389,'2017-10-19 09:08:48'),
(2390,'2017-10-19 09:08:48'),
(2391,'2017-10-19 09:08:48'),
(2392,'2017-10-19 09:08:59'),
(2393,'2017-10-19 09:09:00'),
(2394,'2017-10-19 09:09:03'),
(2395,'2017-10-19 09:09:04'),
(2396,'2017-10-19 09:09:07'),
(2397,'2017-10-19 09:09:08'),
(2398,'2017-10-19 09:09:12'),
(2399,'2017-10-19 09:09:12'),
(2400,'2017-10-19 09:09:12'),
(2401,'2017-10-19 09:09:42'),
(2402,'2017-10-19 09:09:42'),
(2403,'2017-10-19 09:10:30'),
(2404,'2017-10-19 09:10:31'),
(2405,'2017-10-19 09:10:32'),
(2406,'2017-10-19 09:10:33'),
(2407,'2017-10-19 09:10:33'),
(2408,'2017-10-19 09:10:38'),
(2409,'2017-10-19 09:10:39'),
(2410,'2017-10-19 09:10:39'),
(2411,'2017-10-19 09:10:40'),
(2412,'2017-10-19 09:10:41'),
(2413,'2017-10-19 09:10:45'),
(2414,'2017-10-19 09:10:46'),
(2415,'2017-10-19 09:10:47'),
(2416,'2017-10-19 09:10:48'),
(2417,'2017-10-19 09:10:49'),
(2418,'2017-10-19 09:10:56'),
(2419,'2017-10-19 09:10:57'),
(2420,'2017-10-19 09:10:58'),
(2421,'2017-10-19 09:10:58'),
(2422,'2017-10-19 09:11:00'),
(2423,'2017-10-19 09:11:24'),
(2424,'2017-10-19 09:11:25'),
(2425,'2017-10-19 09:11:26'),
(2426,'2017-10-19 09:11:26'),
(2427,'2017-10-19 09:11:27'),
(2428,'2017-10-19 09:11:27'),
(2429,'2017-10-19 09:11:30'),
(2430,'2017-10-19 09:11:33'),
(2431,'2017-10-19 09:11:34'),
(2432,'2017-10-19 09:11:34'),
(2433,'2017-10-19 09:11:35'),
(2434,'2017-10-19 09:11:35'),
(2435,'2017-10-19 09:11:35'),
(2436,'2017-10-19 09:11:39'),
(2437,'2017-10-19 09:11:40'),
(2438,'2017-10-19 09:11:43'),
(2439,'2017-10-19 09:11:44'),
(2440,'2017-10-19 09:11:47'),
(2441,'2017-10-19 09:11:48'),
(2442,'2017-10-19 09:11:51'),
(2443,'2017-10-19 09:11:52'),
(2444,'2017-10-19 09:11:52'),
(2445,'2017-10-19 09:12:18'),
(2446,'2017-10-19 09:12:19'),
(2447,'2017-10-19 09:12:20'),
(2448,'2017-10-19 09:12:21'),
(2449,'2017-10-19 09:12:22'),
(2450,'2017-10-19 09:12:22'),
(2451,'2017-10-19 09:12:25'),
(2452,'2017-10-19 09:12:26'),
(2453,'2017-10-19 09:12:27'),
(2454,'2017-10-19 09:12:28'),
(2455,'2017-10-19 09:12:29'),
(2456,'2017-10-19 09:12:32'),
(2457,'2017-10-19 09:12:33'),
(2458,'2017-10-19 09:12:34'),
(2459,'2017-10-19 09:12:35'),
(2460,'2017-10-19 09:12:36'),
(2461,'2017-10-19 09:13:01'),
(2462,'2017-10-19 09:13:02'),
(2463,'2017-10-19 09:13:03'),
(2464,'2017-10-19 09:13:03'),
(2465,'2017-10-19 09:13:07'),
(2466,'2017-10-19 09:13:08'),
(2467,'2017-10-19 09:13:09'),
(2468,'2017-10-19 09:13:10'),
(2469,'2017-10-19 09:13:14'),
(2470,'2017-10-19 09:13:15'),
(2471,'2017-10-19 09:13:16'),
(2472,'2017-10-19 09:13:16'),
(2473,'2017-10-19 09:13:17'),
(2474,'2017-10-19 09:13:19'),
(2475,'2017-10-19 09:13:20'),
(2476,'2017-10-19 09:13:22'),
(2477,'2017-10-19 09:13:23'),
(2478,'2017-10-19 09:13:28'),
(2479,'2017-10-19 09:13:29'),
(2480,'2017-10-19 09:13:30'),
(2481,'2017-10-19 09:13:30'),
(2482,'2017-10-19 09:13:31'),
(2483,'2017-10-19 09:13:32'),
(2484,'2017-10-19 09:13:34'),
(2485,'2017-10-19 09:13:35'),
(2486,'2017-10-19 09:13:36'),
(2487,'2017-10-19 09:13:38'),
(2488,'2017-10-19 09:13:39'),
(2489,'2017-10-19 09:13:42'),
(2490,'2017-10-19 09:13:43'),
(2491,'2017-10-19 09:13:44'),
(2492,'2017-10-19 09:13:45'),
(2493,'2017-10-19 09:13:46'),
(2494,'2017-10-19 09:13:48'),
(2495,'2017-10-19 09:13:48'),
(2496,'2017-10-19 09:13:48'),
(2497,'2017-10-19 09:13:49'),
(2498,'2017-10-19 09:13:50'),
(2499,'2017-10-19 09:14:10'),
(2500,'2017-10-19 09:14:10'),
(2501,'2017-10-19 09:14:11'),
(2502,'2017-10-19 09:14:25'),
(2503,'2017-10-19 09:14:26'),
(2504,'2017-10-19 09:14:27'),
(2505,'2017-10-19 09:14:34'),
(2506,'2017-10-19 09:14:34'),
(2507,'2017-10-19 09:14:34'),
(2508,'2017-10-19 09:14:35'),
(2509,'2017-10-19 09:14:35'),
(2510,'2017-10-19 09:14:36'),
(2511,'2017-10-19 09:14:37'),
(2512,'2017-10-19 09:14:37'),
(2513,'2017-10-19 09:14:37'),
(2514,'2017-10-19 09:14:37'),
(2515,'2017-10-19 09:14:38'),
(2516,'2017-10-19 09:14:39'),
(2517,'2017-10-19 09:14:40'),
(2518,'2017-10-19 09:14:40'),
(2519,'2017-10-19 09:14:40'),
(2520,'2017-10-19 09:14:41'),
(2521,'2017-10-19 09:14:41'),
(2522,'2017-10-19 09:14:42'),
(2523,'2017-10-19 09:14:42'),
(2524,'2017-10-19 09:14:42'),
(2525,'2017-10-19 09:14:43'),
(2526,'2017-10-19 09:14:45'),
(2527,'2017-10-19 09:14:46'),
(2528,'2017-10-19 09:14:46'),
(2529,'2017-10-19 09:14:46'),
(2530,'2017-10-19 09:14:46'),
(2531,'2017-10-19 09:14:47'),
(2532,'2017-10-19 09:14:47'),
(2533,'2017-10-19 09:14:48'),
(2534,'2017-10-19 09:14:48'),
(2535,'2017-10-19 09:14:50'),
(2536,'2017-10-19 09:14:51'),
(2537,'2017-10-19 09:14:51'),
(2538,'2017-10-19 09:14:52'),
(2539,'2017-10-19 09:14:55'),
(2540,'2017-10-19 09:14:56'),
(2541,'2017-10-19 09:15:00'),
(2542,'2017-10-19 09:15:00'),
(2543,'2017-10-19 09:15:00'),
(2544,'2017-10-19 09:15:55'),
(2545,'2017-10-19 09:15:56'),
(2546,'2017-10-19 09:15:56'),
(2547,'2017-10-19 09:15:57'),
(2548,'2017-10-19 09:15:58'),
(2549,'2017-10-19 09:16:02'),
(2550,'2017-10-19 09:16:02'),
(2551,'2017-10-19 09:16:03'),
(2552,'2017-10-19 09:16:04'),
(2553,'2017-10-19 09:16:04'),
(2554,'2017-10-19 09:16:05'),
(2555,'2017-10-19 09:16:08'),
(2556,'2017-10-19 09:16:08'),
(2557,'2017-10-19 09:16:09'),
(2558,'2017-10-19 09:16:10'),
(2559,'2017-10-19 09:16:10'),
(2560,'2017-10-19 09:16:13'),
(2561,'2017-10-19 09:16:14'),
(2562,'2017-10-19 09:16:14'),
(2563,'2017-10-19 09:16:15'),
(2564,'2017-10-19 09:16:16'),
(2565,'2017-10-19 09:16:18'),
(2566,'2017-10-19 09:16:19'),
(2567,'2017-10-19 09:16:19'),
(2568,'2017-10-19 09:16:20'),
(2569,'2017-10-19 09:16:21'),
(2570,'2017-10-19 09:17:02'),
(2571,'2017-10-19 09:17:03'),
(2572,'2017-10-19 09:17:04'),
(2573,'2017-10-19 09:17:05'),
(2574,'2017-10-19 09:17:06'),
(2575,'2017-10-19 09:17:06'),
(2576,'2017-10-19 09:17:09'),
(2577,'2017-10-19 09:17:10'),
(2578,'2017-10-19 09:17:11'),
(2579,'2017-10-19 09:17:11'),
(2580,'2017-10-19 09:17:12'),
(2581,'2017-10-19 09:17:15'),
(2582,'2017-10-19 09:17:16'),
(2583,'2017-10-19 09:17:18'),
(2584,'2017-10-19 09:17:19'),
(2585,'2017-10-19 09:17:20'),
(2586,'2017-10-19 09:17:46'),
(2587,'2017-10-19 09:17:54'),
(2588,'2017-10-19 09:17:56'),
(2589,'2017-10-19 09:17:57'),
(2590,'2017-10-19 09:17:58'),
(2591,'2017-10-19 09:18:02'),
(2592,'2017-10-19 09:18:04'),
(2593,'2017-10-19 09:18:06'),
(2594,'2017-10-19 09:18:07'),
(2595,'2017-10-19 09:18:08'),
(2596,'2017-10-19 09:18:08'),
(2597,'2017-10-19 09:18:10'),
(2598,'2017-10-19 09:18:11'),
(2599,'2017-10-19 09:18:13'),
(2600,'2017-10-19 09:18:14'),
(2601,'2017-10-19 09:18:16'),
(2602,'2017-10-19 09:18:19'),
(2603,'2017-10-19 09:18:20'),
(2604,'2017-10-19 09:18:21'),
(2605,'2017-10-19 09:18:23'),
(2606,'2017-10-19 09:18:27'),
(2607,'2017-10-19 09:18:28'),
(2608,'2017-10-19 09:18:29'),
(2609,'2017-10-19 09:18:31'),
(2610,'2017-10-19 09:18:32'),
(2611,'2017-10-19 09:18:36'),
(2612,'2017-10-19 09:18:37'),
(2613,'2017-10-19 09:18:38'),
(2614,'2017-10-19 09:18:40'),
(2615,'2017-10-19 09:19:03'),
(2616,'2017-10-19 09:19:04'),
(2617,'2017-10-19 09:19:09'),
(2618,'2017-10-19 09:19:10'),
(2619,'2017-10-19 09:19:12'),
(2620,'2017-10-19 09:19:14'),
(2621,'2017-10-19 09:19:17'),
(2622,'2017-10-19 09:19:20'),
(2623,'2017-10-19 09:19:21'),
(2624,'2017-10-19 09:19:23'),
(2625,'2017-10-19 09:19:24'),
(2626,'2017-10-19 09:19:26'),
(2627,'2017-10-19 09:19:29'),
(2628,'2017-10-19 09:19:31'),
(2629,'2017-10-19 09:19:33'),
(2630,'2017-10-19 09:19:34'),
(2631,'2017-10-19 09:19:36'),
(2632,'2017-10-19 09:19:40'),
(2633,'2017-10-19 09:19:42'),
(2634,'2017-10-19 09:19:43'),
(2635,'2017-10-19 09:19:44'),
(2636,'2017-10-19 09:19:46'),
(2637,'2017-10-19 09:19:46'),
(2638,'2017-10-19 09:19:49'),
(2639,'2017-10-19 09:19:50'),
(2640,'2017-10-19 09:19:53'),
(2641,'2017-10-19 09:19:54'),
(2642,'2017-10-19 09:19:56'),
(2643,'2017-10-19 09:20:19'),
(2644,'2017-10-19 09:20:20'),
(2645,'2017-10-19 09:20:21'),
(2646,'2017-10-19 09:20:22'),
(2647,'2017-10-19 09:20:24'),
(2648,'2017-10-19 09:20:27'),
(2649,'2017-10-19 09:20:28'),
(2650,'2017-10-19 09:20:29'),
(2651,'2017-10-19 09:20:30'),
(2652,'2017-10-19 09:20:32'),
(2653,'2017-10-19 09:20:36'),
(2654,'2017-10-19 09:20:37'),
(2655,'2017-10-19 09:20:38'),
(2656,'2017-10-19 09:20:40'),
(2657,'2017-10-19 09:20:41'),
(2658,'2017-10-19 09:20:41'),
(2659,'2017-10-19 09:20:58'),
(2660,'2017-10-19 09:20:59'),
(2661,'2017-10-19 09:21:02'),
(2662,'2017-10-19 09:21:03'),
(2663,'2017-10-19 09:21:04'),
(2664,'2017-10-19 09:21:09'),
(2665,'2017-10-19 09:21:10'),
(2666,'2017-10-19 09:21:10'),
(2667,'2017-10-19 09:21:11'),
(2668,'2017-10-19 09:21:12'),
(2669,'2017-10-19 09:21:15'),
(2670,'2017-10-19 09:21:16'),
(2671,'2017-10-19 09:21:20'),
(2672,'2017-10-19 09:21:21'),
(2673,'2017-10-19 09:21:22'),
(2674,'2017-10-19 09:21:23'),
(2675,'2017-10-19 09:21:24'),
(2676,'2017-10-19 09:21:24'),
(2677,'2017-10-19 09:21:27'),
(2678,'2017-10-19 09:21:28'),
(2679,'2017-10-19 09:21:30'),
(2680,'2017-10-19 09:21:31'),
(2681,'2017-10-19 09:21:32'),
(2682,'2017-10-19 09:21:34'),
(2683,'2017-10-19 09:21:35'),
(2684,'2017-10-19 09:21:36'),
(2685,'2017-10-19 09:21:37'),
(2686,'2017-10-19 09:21:39'),
(2687,'2017-10-19 09:21:41'),
(2688,'2017-10-19 09:21:44'),
(2689,'2017-10-19 09:21:45'),
(2690,'2017-10-19 09:21:46'),
(2691,'2017-10-19 09:21:48'),
(2692,'2017-10-19 09:21:52'),
(2693,'2017-10-19 09:21:53'),
(2694,'2017-10-19 09:21:53'),
(2695,'2017-10-19 09:21:54'),
(2696,'2017-10-19 09:21:56'),
(2697,'2017-10-19 09:21:56'),
(2698,'2017-10-19 09:21:59'),
(2699,'2017-10-19 09:26:28'),
(2700,'2017-10-19 09:26:29'),
(2701,'2017-10-19 09:26:29'),
(2702,'2017-10-19 09:26:30'),
(2703,'2017-10-19 09:26:31'),
(2704,'2017-10-19 09:26:31'),
(2705,'2017-10-19 09:26:34'),
(2706,'2017-10-19 09:26:34'),
(2707,'2017-10-19 09:26:35'),
(2708,'2017-10-19 09:26:35'),
(2709,'2017-10-19 09:26:36'),
(2710,'2017-10-19 09:26:36'),
(2711,'2017-10-19 09:26:39'),
(2712,'2017-10-19 09:26:39'),
(2713,'2017-10-19 09:26:40'),
(2714,'2017-10-19 09:26:40'),
(2715,'2017-10-19 09:26:41'),
(2716,'2017-10-19 09:26:41'),
(2717,'2017-10-19 09:26:43'),
(2718,'2017-10-19 09:26:44'),
(2719,'2017-10-19 09:26:44'),
(2720,'2017-10-19 09:26:45'),
(2721,'2017-10-19 09:26:45'),
(2722,'2017-10-19 09:26:46'),
(2723,'2017-10-19 09:27:02'),
(2724,'2017-10-19 09:27:03'),
(2725,'2017-10-19 09:27:03'),
(2726,'2017-10-19 09:27:04'),
(2727,'2017-10-19 09:27:04'),
(2728,'2017-10-19 09:27:07'),
(2729,'2017-10-19 09:27:08'),
(2730,'2017-10-19 09:27:09'),
(2731,'2017-10-19 09:27:09'),
(2732,'2017-10-19 09:27:11'),
(2733,'2017-10-19 09:27:11'),
(2734,'2017-10-19 09:27:15'),
(2735,'2017-10-19 09:27:16'),
(2736,'2017-10-19 09:27:18'),
(2737,'2017-10-19 09:27:19'),
(2738,'2017-10-19 09:27:20'),
(2739,'2017-10-19 09:27:20'),
(2740,'2017-10-19 09:27:24'),
(2741,'2017-10-19 09:27:24'),
(2742,'2017-10-19 09:27:25'),
(2743,'2017-10-19 09:27:26'),
(2744,'2017-10-19 09:27:27'),
(2745,'2017-10-19 09:38:11'),
(2746,'2017-10-19 09:38:12'),
(2747,'2017-10-19 09:38:12'),
(2748,'2017-10-19 09:38:13'),
(2749,'2017-10-19 09:38:14'),
(2750,'2017-10-19 09:38:14'),
(2751,'2017-10-19 09:38:18'),
(2752,'2017-10-19 09:38:18'),
(2753,'2017-10-19 09:38:19'),
(2754,'2017-10-19 09:38:19'),
(2755,'2017-10-19 09:38:20'),
(2756,'2017-10-19 09:38:20'),
(2757,'2017-10-19 09:38:23'),
(2758,'2017-10-19 09:38:24'),
(2759,'2017-10-19 09:38:24'),
(2760,'2017-10-19 09:38:25'),
(2761,'2017-10-19 09:38:25'),
(2762,'2017-10-19 09:38:25'),
(2763,'2017-10-19 09:38:29'),
(2764,'2017-10-19 09:38:31'),
(2765,'2017-10-19 09:38:32'),
(2766,'2017-10-19 09:38:32'),
(2767,'2017-10-19 09:38:33'),
(2768,'2017-10-19 09:38:37'),
(2769,'2017-10-19 09:38:37'),
(2770,'2017-10-19 09:38:38'),
(2771,'2017-10-19 09:38:41'),
(2772,'2017-10-19 09:38:42'),
(2773,'2017-10-19 09:38:42'),
(2774,'2017-10-19 09:38:46'),
(2775,'2017-10-19 09:38:47'),
(2776,'2017-10-19 09:38:48'),
(2777,'2017-10-19 09:38:49'),
(2778,'2017-10-19 09:38:50'),
(2779,'2017-10-19 09:38:50'),
(2780,'2017-10-19 09:38:52'),
(2781,'2017-10-19 09:38:53'),
(2782,'2017-10-19 09:38:54'),
(2783,'2017-10-19 09:38:54'),
(2784,'2017-10-19 09:38:55'),
(2785,'2017-10-19 09:38:55'),
(2786,'2017-10-19 09:38:58'),
(2787,'2017-10-19 09:38:59'),
(2788,'2017-10-19 09:38:59'),
(2789,'2017-10-19 09:39:02'),
(2790,'2017-10-19 09:39:02'),
(2791,'2017-10-19 09:39:02'),
(2792,'2017-10-19 09:39:05'),
(2793,'2017-10-19 09:39:06'),
(2794,'2017-10-19 09:39:06'),
(2795,'2017-10-19 09:39:08'),
(2796,'2017-10-19 09:39:09'),
(2797,'2017-10-19 09:39:09'),
(2798,'2017-10-19 09:39:11'),
(2799,'2017-10-19 09:39:12'),
(2800,'2017-10-19 09:39:12'),
(2801,'2017-10-19 09:39:19'),
(2802,'2017-10-19 09:39:20'),
(2803,'2017-10-19 09:39:20'),
(2804,'2017-10-19 09:39:23'),
(2805,'2017-10-19 09:39:24'),
(2806,'2017-10-19 09:39:24'),
(2807,'2017-10-19 09:39:33'),
(2808,'2017-10-19 09:39:34'),
(2809,'2017-10-19 09:39:34'),
(2810,'2017-10-19 09:39:36'),
(2811,'2017-10-19 09:39:37'),
(2812,'2017-10-19 09:39:37'),
(2813,'2017-10-19 09:39:39'),
(2814,'2017-10-19 09:39:39'),
(2815,'2017-10-19 09:39:39'),
(2816,'2017-10-19 09:39:42'),
(2817,'2017-10-19 09:39:43'),
(2818,'2017-10-19 09:39:43'),
(2819,'2017-10-19 09:39:47'),
(2820,'2017-10-19 09:39:47'),
(2821,'2017-10-19 09:39:47'),
(2822,'2017-10-19 09:39:50'),
(2823,'2017-10-19 09:39:52'),
(2824,'2017-10-19 09:39:52'),
(2825,'2017-10-19 09:40:13'),
(2826,'2017-10-19 09:40:13'),
(2827,'2017-10-19 09:40:13'),
(2828,'2017-10-19 09:40:28'),
(2829,'2017-10-19 09:40:29'),
(2830,'2017-10-19 09:40:29'),
(2831,'2017-10-19 09:40:31'),
(2832,'2017-10-19 09:40:32'),
(2833,'2017-10-19 09:40:32'),
(2834,'2017-10-19 09:40:34'),
(2835,'2017-10-19 09:40:35'),
(2836,'2017-10-19 09:40:35'),
(2837,'2017-10-19 09:40:37'),
(2838,'2017-10-19 09:40:38'),
(2839,'2017-10-19 09:40:38'),
(2840,'2017-10-19 09:43:44'),
(2841,'2017-10-19 09:43:45'),
(2842,'2017-10-19 09:43:47'),
(2843,'2017-10-19 09:43:48'),
(2844,'2017-10-19 09:43:50'),
(2845,'2017-10-19 09:43:50'),
(2846,'2017-10-19 09:43:53'),
(2847,'2017-10-19 09:43:54'),
(2848,'2017-10-19 09:43:54'),
(2849,'2017-10-19 09:43:55'),
(2850,'2017-10-19 09:43:56'),
(2851,'2017-10-19 09:43:56'),
(2852,'2017-10-19 09:43:58'),
(2853,'2017-10-19 09:43:59'),
(2854,'2017-10-19 09:44:00'),
(2855,'2017-10-19 09:44:01'),
(2856,'2017-10-19 09:44:02'),
(2857,'2017-10-19 09:44:02'),
(2858,'2017-10-19 09:44:05'),
(2859,'2017-10-19 09:44:06'),
(2860,'2017-10-19 09:44:06'),
(2861,'2017-10-19 09:44:07'),
(2862,'2017-10-19 09:44:08'),
(2863,'2017-10-19 09:44:14'),
(2864,'2017-10-19 09:44:14'),
(2865,'2017-10-19 09:44:15'),
(2866,'2017-10-19 09:44:15'),
(2867,'2017-10-19 09:44:16'),
(2868,'2017-10-19 09:44:17'),
(2869,'2017-10-19 09:44:21'),
(2870,'2017-10-19 09:44:23'),
(2871,'2017-10-19 09:44:23'),
(2872,'2017-10-19 09:44:26'),
(2873,'2017-10-19 09:44:30'),
(2874,'2017-10-19 09:44:30'),
(2875,'2017-10-19 09:45:27'),
(2876,'2017-10-19 09:45:28'),
(2877,'2017-10-19 09:45:28'),
(2878,'2017-10-19 09:45:29'),
(2879,'2017-10-19 09:45:30'),
(2880,'2017-10-19 09:45:30'),
(2881,'2017-10-19 09:45:33'),
(2882,'2017-10-19 09:45:33'),
(2883,'2017-10-19 09:45:34'),
(2884,'2017-10-19 09:45:35'),
(2885,'2017-10-19 09:45:36'),
(2886,'2017-10-19 09:45:36'),
(2887,'2017-10-19 09:53:17'),
(2888,'2017-10-19 09:53:18'),
(2889,'2017-10-19 09:53:19'),
(2890,'2017-10-19 09:53:20'),
(2891,'2017-10-19 09:53:20'),
(2892,'2017-10-19 09:53:35'),
(2893,'2017-10-19 09:53:36'),
(2894,'2017-10-19 09:53:37'),
(2895,'2017-10-19 09:53:37'),
(2896,'2017-10-19 09:53:38'),
(2897,'2017-10-19 09:53:38'),
(2898,'2017-10-19 09:53:49'),
(2899,'2017-10-19 09:53:50'),
(2900,'2017-10-19 09:53:51'),
(2901,'2017-10-19 09:53:52'),
(2902,'2017-10-19 09:53:53'),
(2903,'2017-10-19 09:53:53'),
(2904,'2017-10-19 09:53:58'),
(2905,'2017-10-19 09:53:59'),
(2906,'2017-10-19 09:54:00'),
(2907,'2017-10-19 09:54:01'),
(2908,'2017-10-19 09:54:02'),
(2909,'2017-10-19 09:54:14'),
(2910,'2017-10-19 09:54:15'),
(2911,'2017-10-19 09:54:16'),
(2912,'2017-10-19 09:54:17'),
(2913,'2017-10-19 09:54:18'),
(2914,'2017-10-19 09:54:18'),
(2915,'2017-10-19 09:54:26'),
(2916,'2017-10-19 09:54:26'),
(2917,'2017-10-19 09:54:27'),
(2918,'2017-10-19 09:54:28'),
(2919,'2017-10-19 09:54:29'),
(2920,'2017-10-19 09:54:29'),
(2921,'2017-10-19 09:54:35'),
(2922,'2017-10-19 09:54:35'),
(2923,'2017-10-19 09:54:37'),
(2924,'2017-10-19 09:54:37'),
(2925,'2017-10-19 09:54:38'),
(2926,'2017-10-19 09:54:40'),
(2927,'2017-10-19 09:54:41'),
(2928,'2017-10-19 09:54:42'),
(2929,'2017-10-19 09:54:45'),
(2930,'2017-10-19 09:54:47'),
(2931,'2017-10-19 09:54:48'),
(2932,'2017-10-19 09:54:48'),
(2933,'2017-10-19 09:55:01'),
(2934,'2017-10-19 09:55:02'),
(2935,'2017-10-19 09:55:03'),
(2936,'2017-10-19 09:55:04'),
(2937,'2017-10-19 09:55:05'),
(2938,'2017-10-19 09:55:05'),
(2939,'2017-10-19 09:55:19'),
(2940,'2017-10-19 09:55:21'),
(2941,'2017-10-19 09:55:22'),
(2942,'2017-10-19 09:55:23'),
(2943,'2017-10-19 09:55:24'),
(2944,'2017-10-19 09:55:24'),
(2945,'2017-10-19 09:56:16'),
(2946,'2017-10-19 09:56:18'),
(2947,'2017-10-19 09:56:18'),
(2948,'2017-10-19 09:56:20'),
(2949,'2017-10-19 09:56:22'),
(2950,'2017-10-19 09:56:22'),
(2951,'2017-10-19 09:56:25'),
(2952,'2017-10-19 09:56:26'),
(2953,'2017-10-19 09:56:27'),
(2954,'2017-10-19 09:56:28'),
(2955,'2017-10-19 09:56:29'),
(2956,'2017-10-19 09:56:29'),
(2957,'2017-10-19 09:56:32'),
(2958,'2017-10-19 09:56:34'),
(2959,'2017-10-19 09:56:35'),
(2960,'2017-10-19 09:56:37'),
(2961,'2017-10-19 09:56:38'),
(2962,'2017-10-19 09:56:38'),
(2963,'2017-10-19 09:56:56'),
(2964,'2017-10-19 09:56:57'),
(2965,'2017-10-19 09:56:58'),
(2966,'2017-10-19 09:56:59'),
(2967,'2017-10-19 09:56:59'),
(2968,'2017-10-19 09:57:03'),
(2969,'2017-10-19 09:57:03'),
(2970,'2017-10-19 09:57:04'),
(2971,'2017-10-19 09:57:05'),
(2972,'2017-10-19 09:57:05'),
(2973,'2017-10-19 09:57:05'),
(2974,'2017-10-19 09:59:06'),
(2975,'2017-10-19 10:00:21'),
(2976,'2017-10-19 10:00:22'),
(2977,'2017-10-19 10:00:23'),
(2978,'2017-10-19 10:00:24'),
(2979,'2017-10-19 10:00:24'),
(2980,'2017-10-19 10:01:07'),
(2981,'2017-10-19 10:01:12'),
(2982,'2017-10-19 10:01:14'),
(2983,'2017-10-19 10:01:16'),
(2984,'2017-10-19 10:01:18'),
(2985,'2017-10-19 10:01:18'),
(2986,'2017-10-19 10:01:38'),
(2987,'2017-10-19 10:01:39'),
(2988,'2017-10-19 10:01:40'),
(2989,'2017-10-19 10:01:41'),
(2990,'2017-10-19 10:01:41'),
(2991,'2017-10-19 10:01:42'),
(2992,'2017-10-19 10:02:46'),
(2993,'2017-10-19 10:02:48'),
(2994,'2017-10-19 10:02:49'),
(2995,'2017-10-19 10:02:50'),
(2996,'2017-10-19 10:02:51'),
(2997,'2017-10-19 10:03:03'),
(2998,'2017-10-19 10:03:03'),
(2999,'2017-10-19 10:03:04'),
(3000,'2017-10-19 10:03:05'),
(3001,'2017-10-19 10:03:07'),
(3002,'2017-10-19 10:03:08'),
(3003,'2017-10-19 10:03:19'),
(3004,'2017-10-19 10:03:20'),
(3005,'2017-10-19 10:03:22'),
(3006,'2017-10-19 10:03:23'),
(3007,'2017-10-19 10:03:24'),
(3008,'2017-10-19 10:03:24'),
(3009,'2017-10-19 10:03:35'),
(3010,'2017-10-19 10:03:36'),
(3011,'2017-10-19 10:03:37'),
(3012,'2017-10-19 10:03:39'),
(3013,'2017-10-19 10:03:44'),
(3014,'2017-10-19 10:03:44'),
(3015,'2017-10-19 10:04:10'),
(3016,'2017-10-19 10:04:10'),
(3017,'2017-10-19 10:04:11'),
(3018,'2017-10-19 10:04:12'),
(3019,'2017-10-19 10:04:13'),
(3020,'2017-10-19 10:04:16'),
(3021,'2017-10-19 10:04:18'),
(3022,'2017-10-19 10:04:20'),
(3023,'2017-10-19 10:04:22'),
(3024,'2017-10-19 10:04:23'),
(3025,'2017-10-19 10:04:23'),
(3026,'2017-10-19 10:04:42'),
(3027,'2017-10-19 10:04:43'),
(3028,'2017-10-19 10:04:44'),
(3029,'2017-10-19 10:04:44'),
(3030,'2017-10-19 10:04:45'),
(3031,'2017-10-19 10:04:45'),
(3032,'2017-10-19 10:04:49'),
(3033,'2017-10-19 10:04:51'),
(3034,'2017-10-19 10:04:52'),
(3035,'2017-10-19 10:04:53'),
(3036,'2017-10-19 10:04:54'),
(3037,'2017-10-19 10:04:54'),
(3038,'2017-10-19 10:06:41'),
(3039,'2017-10-19 10:06:42'),
(3040,'2017-10-19 10:06:43'),
(3041,'2017-10-19 10:06:44'),
(3042,'2017-10-19 10:11:57'),
(3043,'2017-10-19 10:11:58'),
(3044,'2017-10-19 10:12:11'),
(3045,'2017-10-20 02:29:07'),
(3046,'2017-10-20 02:29:07'),
(3047,'2017-10-20 02:29:08'),
(3048,'2017-10-20 02:29:08'),
(3049,'2017-10-20 02:29:11'),
(3050,'2017-10-20 02:29:11'),
(3051,'2017-10-20 02:29:16'),
(3052,'2017-10-20 02:29:16'),
(3053,'2017-10-20 02:29:17'),
(3054,'2017-10-20 02:29:17'),
(3055,'2017-10-20 02:29:18'),
(3056,'2017-10-20 02:29:18'),
(3057,'2017-10-20 02:44:59'),
(3058,'2017-10-20 02:45:00'),
(3059,'2017-10-20 02:45:01'),
(3060,'2017-10-20 02:45:01'),
(3061,'2017-10-20 02:45:01'),
(3062,'2017-10-20 02:45:01'),
(3063,'2017-10-20 02:59:09'),
(3064,'2017-10-20 02:59:09'),
(3065,'2017-10-20 02:59:10'),
(3066,'2017-10-20 02:59:10'),
(3067,'2017-10-20 02:59:11'),
(3068,'2017-10-20 02:59:11'),
(3069,'2017-10-20 02:59:11'),
(3070,'2017-10-20 02:59:12'),
(3071,'2017-10-20 02:59:13'),
(3072,'2017-10-20 02:59:13'),
(3073,'2017-10-20 02:59:13'),
(3074,'2017-10-20 02:59:20'),
(3075,'2017-10-20 02:59:21'),
(3076,'2017-10-20 02:59:21'),
(3077,'2017-10-20 02:59:21'),
(3078,'2017-10-20 02:59:21'),
(3079,'2017-10-20 03:01:27'),
(3080,'2017-10-20 03:01:27'),
(3081,'2017-10-20 03:01:28'),
(3082,'2017-10-20 03:01:28'),
(3083,'2017-10-20 03:01:29'),
(3084,'2017-10-20 03:01:29'),
(3085,'2017-10-20 03:01:34'),
(3086,'2017-10-20 03:01:35'),
(3087,'2017-10-20 03:01:35'),
(3088,'2017-10-20 03:01:36'),
(3089,'2017-10-20 03:01:36'),
(3090,'2017-10-20 03:01:36'),
(3091,'2017-10-20 03:01:39'),
(3092,'2017-10-20 03:01:39'),
(3093,'2017-10-20 03:01:40'),
(3094,'2017-10-20 03:01:40'),
(3095,'2017-10-20 03:01:41'),
(3096,'2017-10-20 03:01:41'),
(3097,'2017-10-20 03:01:47'),
(3098,'2017-10-20 03:01:48'),
(3099,'2017-10-20 03:01:48'),
(3100,'2017-10-20 03:01:50'),
(3101,'2017-10-20 03:01:55'),
(3102,'2017-10-20 03:01:56'),
(3103,'2017-10-20 03:01:56'),
(3104,'2017-10-20 03:01:57'),
(3105,'2017-10-20 03:01:58'),
(3106,'2017-10-20 03:01:58'),
(3107,'2017-10-20 03:02:04'),
(3108,'2017-10-20 03:02:04'),
(3109,'2017-10-20 03:02:05'),
(3110,'2017-10-20 03:02:06'),
(3111,'2017-10-20 03:02:07'),
(3112,'2017-10-20 03:02:07'),
(3113,'2017-10-20 03:05:08'),
(3114,'2017-10-20 03:05:10'),
(3115,'2017-10-20 03:05:11'),
(3116,'2017-10-20 03:05:12'),
(3117,'2017-10-20 03:05:12'),
(3118,'2017-10-20 03:05:12'),
(3119,'2017-10-20 03:06:32'),
(3120,'2017-10-20 03:06:33'),
(3121,'2017-10-20 03:06:34'),
(3122,'2017-10-20 03:06:34'),
(3123,'2017-10-20 03:06:40'),
(3124,'2017-10-20 03:06:41'),
(3125,'2017-10-20 03:06:42'),
(3126,'2017-10-20 03:06:42'),
(3127,'2017-10-20 03:06:42'),
(3128,'2017-10-20 03:06:42'),
(3129,'2017-10-20 03:06:54'),
(3130,'2017-10-20 03:06:54'),
(3131,'2017-10-20 03:06:59'),
(3132,'2017-10-20 03:06:59'),
(3133,'2017-10-20 03:06:59'),
(3134,'2017-10-20 03:08:41'),
(3135,'2017-10-20 03:08:42'),
(3136,'2017-10-20 03:08:42'),
(3137,'2017-10-20 03:08:43'),
(3138,'2017-10-20 03:08:43'),
(3139,'2017-10-20 03:08:43'),
(3140,'2017-10-20 03:11:50'),
(3141,'2017-10-20 03:11:51'),
(3142,'2017-10-20 03:11:51'),
(3143,'2017-10-20 03:11:52'),
(3144,'2017-10-20 03:11:52'),
(3145,'2017-10-20 03:11:52'),
(3146,'2017-10-20 03:12:11'),
(3147,'2017-10-20 03:12:12'),
(3148,'2017-10-20 03:12:12'),
(3149,'2017-10-20 03:12:13'),
(3150,'2017-10-20 03:12:13'),
(3151,'2017-10-20 03:12:13'),
(3152,'2017-10-20 03:15:51'),
(3153,'2017-10-20 03:15:51'),
(3154,'2017-10-20 03:15:52'),
(3155,'2017-10-20 03:15:52'),
(3156,'2017-10-20 03:15:53'),
(3157,'2017-10-20 03:15:53'),
(3158,'2017-10-20 03:17:23'),
(3159,'2017-10-20 03:17:24'),
(3160,'2017-10-20 03:17:24'),
(3161,'2017-10-20 03:17:25'),
(3162,'2017-10-20 03:17:25'),
(3163,'2017-10-20 03:17:25'),
(3164,'2017-10-20 03:18:53'),
(3165,'2017-10-20 03:18:53'),
(3166,'2017-10-20 03:18:54'),
(3167,'2017-10-20 03:18:55'),
(3168,'2017-10-20 03:18:55'),
(3169,'2017-10-20 03:18:55'),
(3170,'2017-10-20 03:19:59'),
(3171,'2017-10-20 03:19:59'),
(3172,'2017-10-20 03:32:31'),
(3173,'2017-10-20 03:32:31'),
(3174,'2017-10-20 03:32:32'),
(3175,'2017-10-20 03:32:32'),
(3176,'2017-10-20 03:32:32'),
(3177,'2017-10-20 03:32:40'),
(3178,'2017-10-20 03:32:41'),
(3179,'2017-10-20 03:32:42'),
(3180,'2017-10-20 03:32:42'),
(3181,'2017-10-20 03:32:42'),
(3182,'2017-10-20 03:32:51'),
(3183,'2017-10-20 03:32:51'),
(3184,'2017-10-20 03:32:51'),
(3185,'2017-10-20 03:32:59'),
(3186,'2017-10-20 03:32:59'),
(3187,'2017-10-20 03:32:59'),
(3188,'2017-10-20 03:33:06'),
(3189,'2017-10-20 03:33:07'),
(3190,'2017-10-20 03:33:08'),
(3191,'2017-10-20 03:33:08'),
(3192,'2017-10-20 03:43:25'),
(3193,'2017-10-20 03:43:26'),
(3194,'2017-10-20 03:43:26'),
(3195,'2017-10-20 03:43:27'),
(3196,'2017-10-20 03:43:27'),
(3197,'2017-10-20 03:43:28'),
(3198,'2017-10-20 03:43:28'),
(3199,'2017-10-20 03:46:24'),
(3200,'2017-10-20 03:46:24'),
(3201,'2017-10-20 03:46:25'),
(3202,'2017-10-20 03:46:25'),
(3203,'2017-10-20 03:46:26'),
(3204,'2017-10-20 03:46:26'),
(3205,'2017-10-20 03:46:34'),
(3206,'2017-10-20 03:46:34'),
(3207,'2017-10-20 03:46:34'),
(3208,'2017-10-20 03:46:42'),
(3209,'2017-10-20 03:46:43'),
(3210,'2017-10-20 03:46:43'),
(3211,'2017-10-20 03:46:55'),
(3212,'2017-10-20 03:46:57'),
(3213,'2017-10-20 03:46:57'),
(3214,'2017-10-20 03:46:57'),
(3215,'2017-10-20 03:47:12'),
(3216,'2017-10-20 03:47:12'),
(3217,'2017-10-20 03:47:14'),
(3218,'2017-10-20 03:47:14'),
(3219,'2017-10-20 03:50:17'),
(3220,'2017-10-20 03:50:18'),
(3221,'2017-10-20 03:50:21'),
(3222,'2017-10-20 03:50:24'),
(3223,'2017-10-20 03:50:26'),
(3224,'2017-10-20 03:50:26'),
(3225,'2017-10-20 03:50:27'),
(3226,'2017-10-20 03:50:27'),
(3227,'2017-10-20 03:50:37'),
(3228,'2017-10-20 03:50:37'),
(3229,'2017-10-20 03:50:41'),
(3230,'2017-10-20 03:50:41'),
(3231,'2017-10-20 03:50:42'),
(3232,'2017-10-20 03:50:42'),
(3233,'2017-10-20 03:50:43'),
(3234,'2017-10-20 03:50:43'),
(3235,'2017-10-20 04:06:19'),
(3236,'2017-10-20 04:06:19'),
(3237,'2017-10-20 04:06:19'),
(3238,'2017-10-20 04:06:20'),
(3239,'2017-10-20 04:06:20'),
(3240,'2017-10-20 04:06:20'),
(3241,'2017-10-20 04:10:01'),
(3242,'2017-10-20 04:10:02'),
(3243,'2017-10-20 04:10:02'),
(3244,'2017-10-20 04:10:02'),
(3245,'2017-10-20 04:10:03'),
(3246,'2017-10-20 04:10:12'),
(3247,'2017-10-20 04:10:12'),
(3248,'2017-10-20 04:10:12'),
(3249,'2017-10-20 04:10:28'),
(3250,'2017-10-20 04:10:29'),
(3251,'2017-10-20 04:10:29'),
(3252,'2017-10-20 04:10:40'),
(3253,'2017-10-20 04:10:41'),
(3254,'2017-10-20 04:10:41'),
(3255,'2017-10-20 04:10:52'),
(3256,'2017-10-20 04:10:53'),
(3257,'2017-10-20 04:10:53'),
(3258,'2017-10-20 04:11:07'),
(3259,'2017-10-20 04:11:08'),
(3260,'2017-10-20 04:11:08'),
(3261,'2017-10-20 04:11:11'),
(3262,'2017-10-20 04:11:11'),
(3263,'2017-10-20 04:11:11'),
(3264,'2017-10-20 04:11:28'),
(3265,'2017-10-20 04:11:29'),
(3266,'2017-10-20 04:11:29'),
(3267,'2017-10-20 04:11:29'),
(3268,'2017-10-20 04:11:30'),
(3269,'2017-10-20 04:11:34'),
(3270,'2017-10-20 04:11:35'),
(3271,'2017-10-20 04:11:35'),
(3272,'2017-10-20 04:11:35'),
(3273,'2017-10-20 04:11:35'),
(3274,'2017-10-20 04:11:36'),
(3275,'2017-10-20 04:11:39'),
(3276,'2017-10-20 04:11:40'),
(3277,'2017-10-20 04:11:40'),
(3278,'2017-10-20 04:11:41'),
(3279,'2017-10-20 04:11:41'),
(3280,'2017-10-20 04:11:41'),
(3281,'2017-10-20 06:32:47'),
(3282,'2017-10-20 06:32:48'),
(3283,'2017-10-20 06:32:49'),
(3284,'2017-10-20 06:32:50'),
(3285,'2017-10-20 06:32:57'),
(3286,'2017-10-20 06:32:58'),
(3287,'2017-10-20 06:33:02'),
(3288,'2017-10-20 06:33:03'),
(3289,'2017-10-20 06:33:04'),
(3290,'2017-10-20 06:33:06'),
(3291,'2017-10-20 06:33:07'),
(3292,'2017-10-20 06:33:07'),
(3293,'2017-10-20 06:33:13'),
(3294,'2017-10-20 06:34:08'),
(3295,'2017-10-20 06:34:09'),
(3296,'2017-10-20 06:34:11'),
(3297,'2017-10-20 06:34:12'),
(3298,'2017-10-20 06:34:12'),
(3299,'2017-10-20 06:34:16'),
(3300,'2017-10-20 06:34:17'),
(3301,'2017-10-20 06:34:19'),
(3302,'2017-10-20 06:34:20'),
(3303,'2017-10-20 06:34:22'),
(3304,'2017-10-20 06:34:27'),
(3305,'2017-10-20 06:34:28'),
(3306,'2017-10-20 06:34:29'),
(3307,'2017-10-20 06:34:33'),
(3308,'2017-10-20 06:34:34'),
(3309,'2017-10-20 06:34:35'),
(3310,'2017-10-20 06:37:07'),
(3311,'2017-10-20 06:37:07'),
(3312,'2017-10-20 06:37:08'),
(3313,'2017-10-20 06:37:09'),
(3314,'2017-10-20 06:37:09'),
(3315,'2017-10-20 06:37:10'),
(3316,'2017-10-20 06:37:10'),
(3317,'2017-10-20 06:38:31'),
(3318,'2017-10-20 06:38:31'),
(3319,'2017-10-20 06:38:32'),
(3320,'2017-10-20 06:38:35'),
(3321,'2017-10-20 06:38:36'),
(3322,'2017-10-20 06:38:36'),
(3323,'2017-10-20 06:38:52'),
(3324,'2017-10-20 06:38:53'),
(3325,'2017-10-20 06:38:54'),
(3326,'2017-10-20 06:38:55'),
(3327,'2017-10-20 06:38:56'),
(3328,'2017-10-20 06:38:56'),
(3329,'2017-10-20 06:40:41'),
(3330,'2017-10-20 06:40:43'),
(3331,'2017-10-20 06:40:44'),
(3332,'2017-10-20 06:40:46'),
(3333,'2017-10-20 06:40:49'),
(3334,'2017-10-20 06:40:51'),
(3335,'2017-10-20 06:40:53'),
(3336,'2017-10-20 06:40:54'),
(3337,'2017-10-20 06:40:55'),
(3338,'2017-10-20 06:40:56'),
(3339,'2017-10-20 06:40:56'),
(3340,'2017-10-20 06:40:59'),
(3341,'2017-10-20 06:41:00'),
(3342,'2017-10-20 06:41:02'),
(3343,'2017-10-20 06:41:03'),
(3344,'2017-10-20 06:41:05'),
(3345,'2017-10-20 06:41:05'),
(3346,'2017-10-20 06:41:08'),
(3347,'2017-10-20 06:41:08'),
(3348,'2017-10-20 06:41:09'),
(3349,'2017-10-20 06:41:09'),
(3350,'2017-10-20 06:41:10'),
(3351,'2017-10-20 06:41:10'),
(3352,'2017-10-20 06:41:10'),
(3353,'2017-10-20 06:41:25'),
(3354,'2017-10-20 06:41:26'),
(3355,'2017-10-20 06:41:27'),
(3356,'2017-10-20 06:41:27'),
(3357,'2017-10-20 06:41:39'),
(3358,'2017-10-20 06:41:40'),
(3359,'2017-10-20 06:41:40'),
(3360,'2017-10-20 06:42:00'),
(3361,'2017-10-20 06:42:01'),
(3362,'2017-10-20 06:42:01'),
(3363,'2017-10-20 06:42:09'),
(3364,'2017-10-20 06:42:09'),
(3365,'2017-10-20 06:42:09'),
(3366,'2017-10-20 06:42:16'),
(3367,'2017-10-20 06:42:17'),
(3368,'2017-10-20 06:42:17'),
(3369,'2017-10-20 06:42:24'),
(3370,'2017-10-20 06:42:24'),
(3371,'2017-10-20 06:42:24'),
(3372,'2017-10-20 06:42:31'),
(3373,'2017-10-20 06:42:31'),
(3374,'2017-10-20 06:42:31'),
(3375,'2017-10-20 06:42:39'),
(3376,'2017-10-20 06:42:40'),
(3377,'2017-10-20 06:42:40'),
(3378,'2017-10-20 06:42:41'),
(3379,'2017-10-20 06:42:41'),
(3380,'2017-10-20 06:42:41'),
(3381,'2017-10-20 06:42:51'),
(3382,'2017-10-20 06:42:52'),
(3383,'2017-10-20 06:42:52'),
(3384,'2017-10-20 06:42:53'),
(3385,'2017-10-20 06:42:53'),
(3386,'2017-10-20 06:42:56'),
(3387,'2017-10-20 06:42:57'),
(3388,'2017-10-20 06:42:57'),
(3389,'2017-10-20 06:42:58'),
(3390,'2017-10-20 06:42:58'),
(3391,'2017-10-20 06:42:58'),
(3392,'2017-10-20 06:43:08'),
(3393,'2017-10-20 06:43:08'),
(3394,'2017-10-20 06:43:09'),
(3395,'2017-10-20 06:43:09'),
(3396,'2017-10-20 06:43:10'),
(3397,'2017-10-20 06:43:10'),
(3398,'2017-10-20 06:43:10'),
(3399,'2017-10-20 06:43:19'),
(3400,'2017-10-20 06:43:19'),
(3401,'2017-10-20 06:43:20'),
(3402,'2017-10-20 06:43:20'),
(3403,'2017-10-20 06:43:20'),
(3404,'2017-10-20 06:43:31'),
(3405,'2017-10-20 06:43:31'),
(3406,'2017-10-20 06:43:32'),
(3407,'2017-10-20 06:43:32'),
(3408,'2017-10-20 06:43:33'),
(3409,'2017-10-20 06:43:36'),
(3410,'2017-10-20 06:43:36'),
(3411,'2017-10-20 06:43:36'),
(3412,'2017-10-20 06:43:38'),
(3413,'2017-10-20 06:43:38'),
(3414,'2017-10-20 07:08:25'),
(3415,'2017-10-20 07:08:26'),
(3416,'2017-10-20 07:08:27'),
(3417,'2017-10-20 07:13:08'),
(3418,'2017-10-20 07:13:08'),
(3419,'2017-10-20 07:13:09'),
(3420,'2017-10-20 07:13:09'),
(3421,'2017-10-20 07:13:11'),
(3422,'2017-10-20 07:13:11'),
(3423,'2017-10-20 07:13:12'),
(3424,'2017-10-20 07:15:03'),
(3425,'2017-10-20 07:15:04'),
(3426,'2017-10-20 07:15:04'),
(3427,'2017-10-20 07:15:05'),
(3428,'2017-10-20 07:15:05'),
(3429,'2017-10-20 07:15:06'),
(3430,'2017-10-20 07:17:26'),
(3431,'2017-10-20 07:17:27'),
(3432,'2017-10-20 07:17:28'),
(3433,'2017-10-20 07:17:28'),
(3434,'2017-10-20 07:59:13'),
(3435,'2017-10-20 07:59:37'),
(3436,'2017-10-20 08:00:00'),
(3437,'2017-10-20 08:00:02'),
(3438,'2017-10-20 08:00:03'),
(3439,'2017-10-20 08:00:04'),
(3440,'2017-10-20 08:00:04'),
(3441,'2017-10-20 08:00:17'),
(3442,'2017-10-20 08:00:18'),
(3443,'2017-10-20 08:00:19'),
(3444,'2017-10-20 08:00:20'),
(3445,'2017-10-20 08:00:20'),
(3446,'2017-10-20 08:00:20'),
(3447,'2017-10-20 08:00:31'),
(3448,'2017-10-20 08:00:32'),
(3449,'2017-10-20 08:00:33'),
(3450,'2017-10-20 08:00:33'),
(3451,'2017-10-20 08:00:34'),
(3452,'2017-10-20 08:00:34'),
(3453,'2017-10-20 08:06:17'),
(3454,'2017-10-20 08:06:18'),
(3455,'2017-10-20 08:06:45'),
(3456,'2017-10-20 08:06:46'),
(3457,'2017-10-20 08:06:46'),
(3458,'2017-10-20 08:06:47'),
(3459,'2017-10-20 08:07:01'),
(3460,'2017-10-20 08:07:02'),
(3461,'2017-10-20 08:07:02'),
(3462,'2017-10-20 08:07:19'),
(3463,'2017-10-20 08:07:20'),
(3464,'2017-10-20 08:07:21'),
(3465,'2017-10-20 08:07:21'),
(3466,'2017-10-20 08:07:22'),
(3467,'2017-10-20 08:07:22'),
(3468,'2017-10-20 08:15:17'),
(3469,'2017-10-20 08:15:18'),
(3470,'2017-10-20 08:15:19'),
(3471,'2017-10-20 08:15:20'),
(3472,'2017-10-20 08:15:20'),
(3473,'2017-10-20 08:15:20'),
(3474,'2017-10-20 08:16:04'),
(3475,'2017-10-20 08:16:05'),
(3476,'2017-10-20 08:16:05'),
(3477,'2017-10-20 08:16:06'),
(3478,'2017-10-20 08:16:07'),
(3479,'2017-10-20 08:16:07'),
(3480,'2017-10-20 08:16:07'),
(3481,'2017-10-20 08:16:18'),
(3482,'2017-10-20 08:54:15'),
(3483,'2017-10-20 08:54:16'),
(3484,'2017-10-20 08:54:16'),
(3485,'2017-10-20 08:54:17'),
(3486,'2017-10-20 08:54:17'),
(3487,'2017-10-20 08:54:18'),
(3488,'2017-10-20 19:26:25'),
(3489,'2017-10-20 19:26:26'),
(3490,'2017-10-20 19:26:27'),
(3491,'2017-10-20 19:26:27'),
(3492,'2017-10-20 19:26:28'),
(3493,'2017-10-20 19:26:28'),
(3494,'2017-10-20 19:26:29'),
(3495,'2017-10-20 19:26:35'),
(3496,'2017-10-20 19:26:36'),
(3497,'2017-10-20 19:26:40'),
(3498,'2017-10-20 19:26:42'),
(3499,'2017-10-20 20:08:07'),
(3500,'2017-10-20 20:08:24'),
(3501,'2017-10-20 20:08:25'),
(3502,'2017-10-20 20:48:24'),
(3503,'2017-10-20 20:48:25'),
(3504,'2017-10-20 20:48:25'),
(3505,'2017-10-20 20:48:26'),
(3506,'2017-10-20 20:48:27'),
(3507,'2017-10-20 20:48:27'),
(3508,'2017-10-20 20:48:32'),
(3509,'2017-10-20 20:48:33'),
(3510,'2017-10-20 20:48:33'),
(3511,'2017-10-20 20:48:34'),
(3512,'2017-10-20 20:48:35'),
(3513,'2017-10-20 20:48:35'),
(3514,'2017-10-20 20:48:41'),
(3515,'2017-10-20 20:48:42'),
(3516,'2017-10-20 20:48:43'),
(3517,'2017-10-21 02:27:16'),
(3518,'2017-10-21 02:27:17'),
(3519,'2017-10-21 02:27:18'),
(3520,'2017-10-21 02:27:19'),
(3521,'2017-10-21 02:27:19'),
(3522,'2017-10-21 02:27:19'),
(3523,'2017-10-21 02:27:20'),
(3524,'2017-10-21 02:27:27'),
(3525,'2017-10-21 02:27:28'),
(3526,'2017-10-22 01:53:00'),
(3527,'2017-10-22 01:53:02'),
(3528,'2017-10-22 01:53:02'),
(3529,'2017-10-22 01:53:03'),
(3530,'2017-10-22 01:53:03'),
(3531,'2017-10-22 01:53:04'),
(3532,'2017-10-22 01:53:04'),
(3533,'2017-10-22 04:00:42'),
(3534,'2017-10-22 04:00:42'),
(3535,'2017-10-22 04:00:43'),
(3536,'2017-10-22 04:00:43'),
(3537,'2017-10-22 04:00:44'),
(3538,'2017-10-22 04:00:44'),
(3539,'2017-10-22 04:00:49'),
(3540,'2017-10-22 04:00:50'),
(3541,'2017-10-22 04:00:51'),
(3542,'2017-10-22 04:00:51'),
(3543,'2017-10-22 04:00:52'),
(3544,'2017-10-22 04:00:52'),
(3545,'2017-10-22 04:01:01'),
(3546,'2017-10-22 04:01:05'),
(3547,'2017-10-22 04:01:05'),
(3548,'2017-10-22 04:01:07'),
(3549,'2017-10-22 04:01:08'),
(3550,'2017-10-22 04:01:08'),
(3551,'2017-10-22 04:01:30'),
(3552,'2017-10-22 04:01:30'),
(3553,'2017-10-22 04:01:31'),
(3554,'2017-10-22 04:01:31'),
(3555,'2017-10-22 04:01:32'),
(3556,'2017-10-22 04:01:36'),
(3557,'2017-10-22 04:01:36'),
(3558,'2017-10-22 04:01:37'),
(3559,'2017-10-22 04:01:37'),
(3560,'2017-10-22 04:01:38'),
(3561,'2017-10-22 04:01:38'),
(3562,'2017-10-22 04:01:42'),
(3563,'2017-10-22 04:01:43'),
(3564,'2017-10-22 04:01:43'),
(3565,'2017-10-22 04:01:44'),
(3566,'2017-10-22 04:01:44'),
(3567,'2017-10-22 04:01:45'),
(3568,'2017-10-22 04:01:52'),
(3569,'2017-10-22 04:01:53'),
(3570,'2017-10-22 04:01:53'),
(3571,'2017-10-22 04:01:54'),
(3572,'2017-10-22 04:01:54'),
(3573,'2017-10-22 04:01:54'),
(3574,'2017-10-22 04:02:02'),
(3575,'2017-10-22 04:02:03'),
(3576,'2017-10-22 04:02:04'),
(3577,'2017-10-22 04:02:04'),
(3578,'2017-10-22 04:02:05'),
(3579,'2017-10-22 04:02:08'),
(3580,'2017-10-22 04:02:08'),
(3581,'2017-10-22 04:02:09'),
(3582,'2017-10-22 04:02:09'),
(3583,'2017-10-22 04:02:10'),
(3584,'2017-10-22 04:02:10'),
(3585,'2017-10-22 04:03:00'),
(3586,'2017-10-22 04:03:02'),
(3587,'2017-10-22 04:03:03'),
(3588,'2017-10-22 04:03:03'),
(3589,'2017-10-22 04:03:04'),
(3590,'2017-10-22 04:03:04'),
(3591,'2017-10-22 04:03:04'),
(3592,'2017-10-22 08:03:36'),
(3593,'2017-10-22 08:03:37'),
(3594,'2017-10-22 08:03:38'),
(3595,'2017-10-22 08:03:38'),
(3596,'2017-10-22 08:03:39'),
(3597,'2017-10-22 08:03:39'),
(3598,'2017-10-22 08:03:40'),
(3599,'2017-10-22 08:03:45'),
(3600,'2017-10-22 08:03:45'),
(3601,'2017-10-22 08:03:46'),
(3602,'2017-10-22 08:03:46'),
(3603,'2017-10-22 08:03:47'),
(3604,'2017-10-22 08:03:52'),
(3605,'2017-10-22 08:03:53'),
(3606,'2017-10-22 08:03:53'),
(3607,'2017-10-22 08:04:01'),
(3608,'2017-10-22 08:04:01'),
(3609,'2017-10-22 08:04:02'),
(3610,'2017-10-22 08:04:06'),
(3611,'2017-10-22 08:04:06'),
(3612,'2017-10-22 08:04:07'),
(3613,'2017-10-22 08:04:07'),
(3614,'2017-10-22 08:04:08'),
(3615,'2017-10-22 08:04:08'),
(3616,'2017-10-22 19:57:34'),
(3617,'2017-10-22 19:57:34'),
(3618,'2017-10-22 19:57:36'),
(3619,'2017-10-22 19:58:19'),
(3620,'2017-10-22 19:58:20'),
(3621,'2017-10-22 19:58:20'),
(3622,'2017-10-22 19:58:28'),
(3623,'2017-10-22 19:58:40'),
(3624,'2017-10-22 19:58:41'),
(3625,'2017-10-22 19:59:16'),
(3626,'2017-10-22 19:59:16'),
(3627,'2017-10-22 19:59:48'),
(3628,'2017-10-22 19:59:51'),
(3629,'2017-10-23 00:21:18'),
(3630,'2017-10-23 00:21:19'),
(3631,'2017-10-23 00:21:19'),
(3632,'2017-10-23 00:21:20'),
(3633,'2017-10-23 00:21:20'),
(3634,'2017-10-23 00:21:20'),
(3635,'2017-10-23 00:21:23'),
(3636,'2017-10-23 00:21:24'),
(3637,'2017-10-23 00:21:24'),
(3638,'2017-10-23 00:21:30'),
(3639,'2017-10-23 00:21:30'),
(3640,'2017-10-23 00:21:30'),
(3641,'2017-10-23 00:21:31'),
(3642,'2017-10-23 00:21:33'),
(3643,'2017-10-23 00:21:34'),
(3644,'2017-10-23 00:21:35'),
(3645,'2017-10-23 00:21:56'),
(3646,'2017-10-23 00:21:56'),
(3647,'2017-10-23 00:21:59'),
(3648,'2017-10-23 00:21:59'),
(3649,'2017-10-23 00:22:00'),
(3650,'2017-10-23 00:22:01'),
(3651,'2017-10-23 00:22:02'),
(3652,'2017-10-23 00:22:02'),
(3653,'2017-10-23 00:22:03'),
(3654,'2017-10-23 00:22:03'),
(3655,'2017-10-23 00:22:08'),
(3656,'2017-10-23 00:22:08'),
(3657,'2017-10-23 00:22:09'),
(3658,'2017-10-23 00:22:09'),
(3659,'2017-10-23 00:22:09'),
(3660,'2017-10-23 00:24:04'),
(3661,'2017-10-23 00:24:04'),
(3662,'2017-10-23 00:24:10'),
(3663,'2017-10-23 00:24:10'),
(3664,'2017-10-23 00:24:11'),
(3665,'2017-10-23 00:24:11'),
(3666,'2017-10-23 00:24:13'),
(3667,'2017-10-23 00:24:14'),
(3668,'2017-10-23 00:24:14'),
(3669,'2017-10-23 00:24:15'),
(3670,'2017-10-23 00:24:16'),
(3671,'2017-10-23 00:24:16'),
(3672,'2017-10-23 00:24:18'),
(3673,'2017-10-23 00:24:18'),
(3674,'2017-10-23 00:24:19'),
(3675,'2017-10-23 00:24:19'),
(3676,'2017-10-23 00:24:20'),
(3677,'2017-10-23 00:24:20'),
(3678,'2017-10-23 00:24:27'),
(3679,'2017-10-23 00:24:28'),
(3680,'2017-10-23 00:24:29'),
(3681,'2017-10-23 00:24:29'),
(3682,'2017-10-23 00:24:30'),
(3683,'2017-10-23 00:24:34'),
(3684,'2017-10-23 00:24:37'),
(3685,'2017-10-23 00:24:37'),
(3686,'2017-10-23 00:26:50'),
(3687,'2017-10-23 00:26:51'),
(3688,'2017-10-23 00:26:51'),
(3689,'2017-10-23 00:26:51'),
(3690,'2017-10-23 00:26:52'),
(3691,'2017-10-23 00:26:52'),
(3692,'2017-10-23 00:26:56'),
(3693,'2017-10-23 00:26:57'),
(3694,'2017-10-23 00:26:57'),
(3695,'2017-10-23 00:26:58'),
(3696,'2017-10-23 00:32:04'),
(3697,'2017-10-23 00:32:05'),
(3698,'2017-10-23 00:32:06'),
(3699,'2017-10-23 00:32:09'),
(3700,'2017-10-23 00:32:19'),
(3701,'2017-10-23 00:32:19'),
(3702,'2017-10-23 02:30:32'),
(3703,'2017-10-23 02:30:33'),
(3704,'2017-10-23 02:30:33'),
(3705,'2017-10-23 02:30:48'),
(3706,'2017-10-23 02:30:49'),
(3707,'2017-10-23 02:30:49'),
(3708,'2017-10-23 02:30:52'),
(3709,'2017-10-23 02:30:53'),
(3710,'2017-10-23 02:30:53'),
(3711,'2017-10-23 02:30:58'),
(3712,'2017-10-23 02:30:59'),
(3713,'2017-10-23 02:30:59'),
(3714,'2017-10-24 23:28:36'),
(3715,'2017-10-24 23:28:37');

/*Table structure for table `cpe` */

DROP TABLE IF EXISTS `cpe`;

CREATE TABLE `cpe` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deviceId` varchar(255) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `cpe` */

insert  into `cpe`(`id`,`deviceId`,`date`) values 
(1,'abc','2017-09-12 15:21:40'),
(2,'def','2017-09-12 15:21:46');

/*Table structure for table `cpi` */

DROP TABLE IF EXISTS `cpi`;

CREATE TABLE `cpi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deviceId` varchar(255) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `cpi` */

insert  into `cpi`(`id`,`deviceId`,`date`) values 
(1,'abc','2017-09-12 15:21:56'),
(2,'def','2017-09-12 15:21:59'),
(3,'ghk','2017-09-12 15:22:02');

/*Table structure for table `creative` */

DROP TABLE IF EXISTS `creative`;

CREATE TABLE `creative` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `adTypeId` int(11) DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `body` text,
  `alt` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `template` varchar(10) DEFAULT NULL,
  `imageLink` varchar(255) DEFAULT NULL,
  `videoLink` varchar(255) DEFAULT NULL,
  `clickUrl` varchar(255) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'NEW',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `creative` */

insert  into `creative`(`id`,`adTypeId`,`title`,`body`,`alt`,`template`,`imageLink`,`videoLink`,`clickUrl`,`status`,`createdDate`) values 
(1,1,'MSB1','','','image','http://222.252.16.132:8080/ad/images/msb1.jpg',NULL,'https://www.msb.com.vn/ctkm/4132/Giao-dich-M-Banking-ngay-hom-nay---nhan-qua-len-toi-250.000-VND-tu-Maritime-Bank','ACTIVE','2017-10-06 14:08:53'),
(2,1,'MSB2','None','alt','image','http://222.252.16.132:8080/ad/images/msb2.jpg',NULL,'https://www.msb.com.vn/ctkm/4113/JOY_-THANG-10-Hoan-tien-30-toi-500.000-dong-cho-chu-the-Maritime-Bank-Mastercard-khi-thanh-toan-tai-he-thong-cac-nha-hang-King-BBQ-Seoul-Garden-Hotpot-Story-Sushi-Kei','ACTIVE','2017-08-31 09:58:19'),
(3,1,'MSB3','<p>https://drive.google.com/drive/u/1/folders/0Bxwc1saAqtz2VkhYQXlQbEVIeUE</p>\r\n','','image','http://222.252.16.132:8080/ad/images/msb3.jpg',NULL,'https://www.msb.com.vn/ctkm/4098/Travel-JOY_-thang-10-Hoan-toi-5-trieu-dong-khi-mua-tour-Vietravel-va-ve-VNA-Vietjet-Jetstar-tai-Gotadi-voi-the-tin-dung-du-lich-Maritime-Bank-Visa','ACTIVE','2017-08-29 16:55:50'),
(4,1,'MSB4','','','image','http://222.252.16.132:8080/ad/images/msb4.jpg',NULL,'https://www.msb.com.vn/ctkm/4092/Uu-dai-hap-dan-ty-gia-canh-tranh-khi-mua-ban-ngoai-te-voi-Maritime-Bank','ACTIVE','2017-10-03 18:00:34'),
(5,1,'MSB5','','','image','http://222.252.16.132:8080/ad/images/msb5.jpg',NULL,'https://www.msb.com.vn/tin-tuc/4133/Da-tim-ra-chu-nhan-thu-2-cua-giai-thuong-200-trieu-dong-trong-chuong-trinh---Tiet-kiem-lien-tay-%E2%80%93-Van-may-trieu-phu-','ACTIVE','2017-10-19 04:17:32'),
(6,1,'MSB6','','','image','http://222.252.16.132:8080/ad/images/msb6.jpg',NULL,'https://www.msb.com.vn/tin-tuc/4095/JOY_-Giam-gia-toi-60-cho-cac-san-pham-thoi-trang-&-my-pham','ACTIVE','2017-10-19 04:18:04'),
(7,1,'MSB7','','','image','http://222.252.16.132:8080/ad/images/msb7.jpg',NULL,'https://www.msb.com.vn/tin-tuc/4090/JOY-Uu-dai-toi-50-tai-Han-Quoc-voi-the-Quoc-te-Maritime-Bank','ACTIVE','2017-10-19 04:18:32'),
(8,2,'None 1','','','video','','http://222.252.16.132:8080/ad/videos/vid.mp4',NULL,'INACTIVE','2017-09-09 15:49:12'),
(9,2,'Vietin1','','','image','http://222.252.16.132:8080/ad/images/vietin1.jpg',NULL,'http://www.vietinbank.vn/vn/tin-tuc/Mo-the-VietinBank-trung-xe-Liberty-20170829172650.html','INACTIVE','2017-10-19 07:09:13'),
(10,2,'Vietin2','','','image','http://222.252.16.132:8080/ad/images/vietin2.jpg',NULL,'http://www.vietinbank.vn/vn/tin-tuc/VietinBank-tang-voucher-mua-sam-noi-that-den-300-trieu-dong-20170825083719.html','ACTIVE','2017-10-19 07:09:58'),
(11,2,'Vietin3','','','image','http://222.252.16.132:8080/ad/images/vietin3.jpg',NULL,'https://www.vietinbank.vn/vn/tin-tuc/Nhan-qua-khi-gui-tien-tiet-kiem-tai-VietinBank-20171010135006.html','ACTIVE','2017-10-19 07:10:30'),
(12,2,'Vietin4','','','image','http://222.252.16.132:8080/ad/images/vietin4.jpg',NULL,'http://www.vietinbank.vn/web/home/vn/news/17/02/vietinbank-gia-han-chuong-trinh-lai-suat-nho-uoc-mo-lon.html','ACTIVE','2017-10-19 07:11:05'),
(13,2,'Vietin5','','','image','http://222.252.16.132:8080/ad/images/vietin5.jpg',NULL,'http://www.vietinbank.vn/vn/tin-tuc/Uu-dai-lon-khi-thanh-toan-thue-bao-VTVcab-qua-VietinBank-20171010084205.html','ACTIVE','2017-10-19 07:11:39'),
(14,2,'Vietin6','','','image','http://222.252.16.132:8080/ad/images/vietin6.jpg',NULL,'http://www.vietinbank.vn/vn/tin-tuc/Khach-hang-SME-Chon-VietinBank-Cham-thanh-cong--20171013201328.html','ACTIVE','2017-10-19 07:12:04'),
(15,2,'Vietin7','','','image','http://222.252.16.132:8080/ad/images/vietin7.jpg',NULL,'http://www.vietinbank.vn/vn/tin-tuc/Trai-nghiem-dac-quyen-cung-VietinBank-SME-Club-20170828123142.html','ACTIVE','2017-10-19 07:12:21'),
(16,2,'Vietin8','','','image','http://222.252.16.132:8080/ad/images/vietin8.jpg',NULL,'http://www.vietinbank.vn/vn/tin-tuc/VietinBank-gia-han-chuong-trinh-Lai-gan-ket-Thoa-suc-vay--20170606142026.html','ACTIVE','2017-10-19 07:12:39');

/*Table structure for table `earning_details` */

DROP TABLE IF EXISTS `earning_details`;

CREATE TABLE `earning_details` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) DEFAULT NULL,
  `rewardCode` varchar(10) DEFAULT NULL,
  `amount` bigint(11) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

/*Data for the table `earning_details` */

insert  into `earning_details`(`id`,`uid`,`rewardCode`,`amount`,`date`) values 
(1,1,'INSTALL',2300,'2017-09-16 22:58:01'),
(2,1,'INVITE',32000,'2017-09-22 17:52:28'),
(3,2,'INVITE',20000,'2017-09-22 18:28:00'),
(4,1,'READ',20,'2017-09-22 21:00:57'),
(5,22,'INSTALL',2000,'2017-10-06 09:58:29'),
(6,23,'INSTALL',2000,'2017-10-11 09:51:18'),
(7,23,'INSTALL',2000,'2017-10-12 07:31:27'),
(8,24,'INSTALL',2000,'2017-10-12 20:21:45'),
(9,25,'INSTALL',2000,'2017-10-13 03:14:53'),
(10,24,'READ',10,'2017-10-13 04:30:54'),
(11,26,'INSTALL',2000,'2017-10-13 07:00:54'),
(12,26,'READ',460,'2017-10-13 07:17:47'),
(13,27,'INSTALL',2000,'2017-10-13 19:46:15'),
(14,27,'READ',70,'2017-10-13 19:50:10'),
(15,28,'INSTALL',2000,'2017-10-13 20:33:01'),
(16,28,'READ',560,'2017-10-13 20:33:22'),
(17,29,'INSTALL',2000,'2017-10-14 00:26:58'),
(18,30,'INSTALL',2000,'2017-10-14 00:32:21'),
(19,31,'INSTALL',2000,'2017-10-14 00:47:02'),
(20,32,'INSTALL',2000,'2017-10-14 01:24:50'),
(21,32,'READ',230,'2017-10-14 01:28:28'),
(22,33,'INSTALL',2000,'2017-10-19 03:19:26'),
(23,33,'READ',10,'2017-10-19 03:55:47'),
(24,34,'INSTALL',2000,'2017-10-19 07:20:02'),
(25,34,'READ',80,'2017-10-19 08:06:47'),
(26,35,'INSTALL',2000,'2017-10-19 08:59:34'),
(27,36,'INSTALL',2000,'2017-10-19 09:05:51'),
(28,36,'READ',150,'2017-10-19 09:11:27'),
(29,35,'READ',260,'2017-10-19 09:15:51'),
(30,37,'INSTALL',2000,'2017-10-20 02:28:53'),
(31,37,'READ',300,'2017-10-20 02:29:12'),
(32,38,'INSTALL',2000,'2017-10-20 06:36:43'),
(33,38,'READ',30,'2017-10-20 06:41:24'),
(34,39,'INSTALL',2000,'2017-10-20 09:09:43'),
(35,40,'INSTALL',2000,'2017-10-20 20:07:22'),
(36,41,'INSTALL',2000,'2017-10-20 20:27:53'),
(37,39,'READ',80,'2017-10-22 00:57:55'),
(38,42,'INSTALL',2000,'2017-10-22 01:51:15'),
(39,42,'READ',40,'2017-10-22 01:52:10'),
(40,41,'READ',50,'2017-10-22 07:54:46'),
(41,43,'INSTALL',2000,'2017-10-22 23:32:45'),
(42,43,'READ',30,'2017-10-22 23:42:29'),
(43,44,'INSTALL',2000,'2017-10-25 21:04:08'),
(44,45,'INSTALL',2000,'2017-11-02 10:33:09'),
(45,NULL,'READ',10,'2017-11-03 11:09:40'),
(46,17,'INVITE',20000,'2017-12-19 17:00:00');

/*Table structure for table `flight` */

DROP TABLE IF EXISTS `flight`;

CREATE TABLE `flight` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `campaignId` bigint(11) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `isFreCap` tinyint(1) DEFAULT NULL,
  `freCap` int(11) DEFAULT NULL,
  `freCapDuration` int(11) DEFAULT NULL,
  `freCapType` varchar(10) DEFAULT NULL,
  `rateType` varchar(10) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `user_age_from` int(10) DEFAULT NULL,
  `user_age_to` int(10) DEFAULT NULL,
  `user_gender` varchar(10) DEFAULT NULL,
  `user_location` varchar(200) DEFAULT NULL,
  `user_interest` varchar(500) DEFAULT NULL,
  `status` varchar(10) DEFAULT 'NEW',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK80iotlu66a2s7ojrf0i7n2ncx` (`campaignId`),
  CONSTRAINT `FK80iotlu66a2s7ojrf0i7n2ncx` FOREIGN KEY (`campaignId`) REFERENCES `campaign` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `flight` */

insert  into `flight`(`id`,`campaignId`,`name`,`startDate`,`endDate`,`isFreCap`,`freCap`,`freCapDuration`,`freCapType`,`rateType`,`price`,`description`,`user_age_from`,`user_age_to`,`user_gender`,`user_location`,`user_interest`,`status`,`createdDate`) values 
(1,1,'Khuyáº¿n mÃ£i cÃ¡c sáº£n pháº©m hÃ¨ thu MSB','2017-02-08 00:00:00','2018-02-02 23:59:00',NULL,NULL,NULL,NULL,'FLAT',10000000,'',0,0,'',NULL,NULL,'ACTIVE','2017-10-19 03:54:34'),
(8,2,'Khuyáº¿n mÃ£i cÃ¡c sáº£n pháº©m hÃ¨ thu Vietin','2017-10-11 00:00:00',NULL,NULL,NULL,NULL,NULL,'FLAT',1000,'',0,0,'',NULL,NULL,'INACTIVE','2017-10-19 07:05:54');

/*Table structure for table `game` */

DROP TABLE IF EXISTS `game`;

CREATE TABLE `game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `status` varchar(10) DEFAULT 'NEW',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `game` */

insert  into `game`(`id`,`name`,`image`,`link`,`status`,`createdDate`) values 
(1,'Shmup','http://222.252.16.132:8080/images/shmup.jpg','https://aduros.com/flambe/demos/shmup/?flambe=html','ACTIVE','2017-10-04 17:50:08'),
(2,'Pacman','http://222.252.16.132:8080/images/pacman-html5-canvat.jpg','http://pacman.platzh1rsch.ch/','ACTIVE','2017-10-04 17:51:45'),
(3,'Clumsy Bird','http://222.252.16.132:8080/images/clumsy-bird-open-source-game.png','http://www.ellison.rocks/clumsy-bird/','ACTIVE','2017-10-04 17:52:54');

/*Table structure for table `gamecard` */

DROP TABLE IF EXISTS `gamecard`;

CREATE TABLE `gamecard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'NEW',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `gamecard` */

insert  into `gamecard`(`id`,`name`,`image`,`price`,`status`,`createdDate`) values 
(1,'50.000Ä‘ FPT','http://222.252.16.132:8080/loyalty/game_card/fpt-gate.png',50000,'ACTIVE','2017-11-10 15:33:07'),
(2,'50.000Ä‘ VTCOnline','http://222.252.16.132:8080/loyalty/game_card/vcoin-vtc.png',50000,'ACTIVE','2017-11-10 15:33:09'),
(3,'50.000Ä‘ Garena','http://222.252.16.132:8080/loyalty/game_card/garena.png',50000,'ACTIVE','2017-11-10 15:33:10'),
(4,'50.000Ä‘ Vinagame','http://222.252.16.132:8080/loyalty/game_card/vinagame.png',50000,'ACTIVE','2017-11-10 15:33:11'),
(5,'100.000Ä‘ FPT','http://222.252.16.132:8080/loyalty/game_card/fpt-gate.png',100000,'ACTIVE','2017-11-10 15:33:13'),
(6,'100.000Ä‘ VTCOnline','http://222.252.16.132:8080/loyalty/game_card/vcoin-vtc.png',100000,'ACTIVE','2017-11-10 15:33:15'),
(7,'100.000Ä‘ Garena','http://222.252.16.132:8080/loyalty/game_card/garena.png',100000,'ACTIVE','2017-11-10 15:33:16'),
(8,'100.000Ä‘ Vinagame','http://222.252.16.132:8080/loyalty/game_card/vinagame.png',100000,'ACTIVE','2017-11-10 15:33:17');

/*Table structure for table `giftcode` */

DROP TABLE IF EXISTS `giftcode`;

CREATE TABLE `giftcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8,
  `expireDate` datetime DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'NEW',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `giftcode` */

/*Table structure for table `in_app_message` */

DROP TABLE IF EXISTS `in_app_message`;

CREATE TABLE `in_app_message` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) DEFAULT NULL,
  `body` longtext CHARACTER SET utf8,
  `type` varchar(10) NOT NULL DEFAULT 'PRIMARY',
  `user_age_from` int(10) NOT NULL DEFAULT '0',
  `user_age_to` int(10) NOT NULL DEFAULT '0',
  `user_gender` varchar(10) DEFAULT NULL,
  `user_location` varchar(200) DEFAULT NULL,
  `user_interest` varchar(500) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'NEW',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `in_app_message` */

insert  into `in_app_message`(`id`,`subject`,`body`,`type`,`user_age_from`,`user_age_to`,`user_gender`,`user_location`,`user_interest`,`status`,`createdDate`) values 
(1,'test tÃ½ thÃ´i','<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'',NULL,NULL,'ACTIVE','2017-11-02 15:11:50'),
(3,'test','<h2>Äiá»u kiá»‡n sá»­ dá»¥ng</h2>\r\n\r\n<p>Thá»i háº¡n sá»­ dá»¥ng voucher: 30/11/2017</p>\r\n\r\n<p>Ãp dá»¥ng cho: Há»™p socola gá»“m: 09 viÃªn socola tÆ°Æ¡i cÃ¡c vá»‹ nhÃ¢n + há»™p quÃ  táº·ng cao cáº¥p + tÃºi xÃ¡ch táº¡i D\'art Chocolate. KÃ­ch thÆ°á»›c há»™p 12cm x 12cm x 7cm</p>\r\n\r\n<p>Thá»i gian sá»­ dá»¥ng: 8h30 - 20h00 táº¥t cáº£ cÃ¡c ngÃ y trong tuáº§n.</p>\r\n\r\n<p>CÃ¡c ngÃ y Lá»… Ä‘Æ°á»£c Ã¡p dá»¥ng voucher: 20/11/2017.</p>\r\n\r\n<p>Sá»‘ lÆ°á»£ng Voucher Ã¡p dá»¥ng: 01 voucher/ há»™p (KhÃ´ng bÃ¹ thÃªm tiá»n).</p>\r\n\r\n<p>Sá»‘ lÆ°á»£ng voucher sá»­ dá»¥ng tá»‘i Ä‘a: KhÃ´ng giá»›i háº¡n sá»‘ voucher/ hÃ³a Ä‘Æ¡n thanh toÃ¡n. KhÃ¡ch hÃ ng cÃ³ nhu cáº§u xuáº¥t hÃ³a Ä‘Æ¡n vui lÃ²ng liÃªn há»‡ NCC.</p>\r\n\r\n<p>KhÃ¡ch hÃ ng cÃ³ thá»ƒ mua nhiá»u voucher Ä‘á»ƒ sá»­ dá»¥ng nhiá»u láº§n</p>\r\n\r\n<p>Ãp dá»¥ng mua mang vá»: KhÃ¡ch hÃ ng Ä‘á»•i voucher trá»±c tiáº¿p táº¡i cá»­a hÃ ng vÃ  vui lÃ²ng thanh toÃ¡n phÃ­ ship náº¿u yÃªu cáº§u giao hÃ ng táº­n nÆ¡i. Báº£ng giÃ¡ cÃ¡c sáº£n pháº©m táº¡i: http://dartchocolate.com/product</p>\r\n\r\n<p>KhÃ´ng Ã¡p dá»¥ng cho cÃ¡c chÆ°Æ¡ng trÃ¬nh khuyáº¿n mÃ£i khÃ¡c</p>\r\n\r\n<p>KhÃ´ng cÃ³ giÃ¡ trá»‹ quy Ä‘á»•i thÃ nh tiá»n, khÃ´ng hoÃ n tráº£ tiá»n thá»«a</p>\r\n\r\n<p>KhÃ¡ch hÃ ng vui lÃ²ng liÃªn há»‡ trÆ°á»›c khi Ä‘áº¿n Ä‘á»ƒ Ä‘Æ°á»£c phá»¥c vá»¥ tá»‘t nháº¥t</p>\r\n\r\n<p>ThÃ´ng tin Ä‘áº·t háº¹n: (024) 6670 5511</p>\r\n\r\n<h2>ThÃ´ng tin chi tiáº¿t</h2>\r\n\r\n<p>MÃª hoáº·c hÃ ng triá»‡u ngÆ°á»i bá»Ÿi hÆ°Æ¡ng vá»‹ ngá»t ngÃ o, Ä‘áº¯m say, chocolate Ä‘Æ°á»£c coi lÃ  má»™t trong nhá»¯ng mÃ³n Äƒn truyá»n cáº£m há»©ng hÃ ng Ä‘áº§u trÃªn tháº¿ giá»›i. VÆ°á»£t qua ranh giá»›i cá»§a má»™t mÃ³n Äƒn hay táº·ng pháº©m bÃ¬nh thÆ°á»ng, chocolate mang Ä‘áº¿n cho ngÆ°á»i ta cáº£m giÃ¡c cá»§a sá»± trÃ¢n trá»ng, sáº» chia vÃ  yÃªu thÆ°Æ¡ng. ChÃ­nh vÃ¬ váº­y, chocolate khÃ´ng chá»‰ dÃ nh riÃªng cho ngÃ y lá»… tÃ¬nh nhÃ¢n, mÃ  báº¥t cá»© dá»‹p quan trá»ng nÃ o trong nÄƒm, chocolate cÅ©ng lÃ  mÃ³n quÃ  cháº¡m tá»›i trÃ¡i tim ngÆ°á»i Ä‘Æ°á»£c táº·ng.Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn02.static-adayroi.com/resize/710_710/100/0/2017/10/25/1508902266283_4765519.jpg\" /></p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p><strong>Ngá»t ngÃ o hÆ°Æ¡ng vá»‹ chocolate</strong><br />\r\nVá»›i mong muá»‘n mang Ä‘áº¿n cho khÃ¡ch hÃ ng sáº£n pháº©m tuyá»‡t vá»i, Dâ€™art Ä‘áº·c biá»‡t chÃº trá»ng Ä‘áº¿n nguá»“n gá»‘c vÃ  cháº¥t lÆ°á»£ng cá»§a cacao Ä‘á»ƒ lÃ m ra sáº£n pháº©m chocolate cháº¥t lÆ°á»£ng. ChÃ­nh vÃ¬ váº­y, Dâ€™art Ä‘Ã£ chá»n cho mÃ¬nh Ä‘á»‘i tÃ¡c danh tiáº¿ng lÃ  hÃ ng Callebaut - nÆ¡i sáº£n xuáº¥t ra thá»© chocolate háº£o háº¡ng. Tá»« nhá»¯ng trÃ¡i cacao ban Ä‘áº§u, qua quÃ¡ trÃ¬nh xá»­ lÃ½ cháº¿ biáº¿n, pha trá»™nâ€¦ Dâ€™art Ä‘Ã£ táº¡o ra nhiá»u loáº¡i chocolate vá»›i hÆ°Æ¡ng vá»‹ Ä‘áº·c trÆ°ng háº¥p dáº«n.</p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn02.static-adayroi.com/resize/710_710/100/0/2017/10/25/1508902266598_7134646.jpg\" /></p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Äáº¿n vá»›i Dâ€™art, nhá»¯ng ngÆ°á»i yÃªu thÃ­ch hÆ°Æ¡ng vá»‹ truyá»n thá»‘ng cÃ³ thá»ƒ chá»n cho mÃ¬nh cÃ¡c loáº¡i chocolate gá»‘c lÃ  chocolate Ä‘áº¯ng, nÃ¢u. Chocolate cÃ³ nhÃ¢n dÃ nh cho nhá»¯ng ngÆ°á»i Æ°a thÃ­ch sá»± máº¡o hiá»ƒm vÃ Â bÃ­ áº©n. NgoÃ i cÃ¡c loáº¡i nhÃ¢n truyá»n thá»‘ng nhÆ° vá»‹ háº¡nh nhÃ¢n, caramenâ€¦ Dâ€™art cÃ²n táº¡o ra Ä‘á»™t phÃ¡ háº¥p dáº«n vá»›i hÆ°Æ¡ng vá»‹ trÃ  xanh thÆ¡m mÃ¡t, vá»‹ caramel ngá»t ngÃ o, vá»‹ cam thanh thoÃ¡t, mang Ä‘áº¿n cho báº¡n nhiá»u sá»± lá»±a chá»n háº¥p dáº«n.</p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn02.static-adayroi.com/resize/710_710/100/0/2017/10/25/1508902267349_7897000.jpg\" /></p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn02.static-adayroi.com/resize/710_710/100/0/2017/10/25/1508902267646_5031730.jpg\" /></p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p><strong>Dâ€™Art - KhÃ´ng chá»‰ lÃ  chocolate</strong><br />\r\nâ€‹PhÃ¡t triá»ƒn tá»« dÃ²ng chocolate Bá»‰ ná»•i tiáº¿ng tháº¿ giá»›i - Barry Callebaut, káº¿t há»£p vá»›i niá»m Ä‘am mÃª Ä‘áº§y sÃ¡ng táº¡o Ä‘Ã£ giÃºp Dâ€™art Chocolate sÃ¡ng táº¡o nÃªn nhá»¯ng tÃ¡c pháº©m nghá»‡ thuáº­t Ä‘á»™c Ä‘Ã¡o tá»« chocolate. áº¤n tÆ°á»£ng ngay tá»« cÃ¡i tÃªn, cÃ¡c sáº£n pháº©m cá»§a Dâ€™art luÃ´n Ä‘á» cao tÃ­nh tháº©m má»¹. BÃªn cáº¡nh Ä‘Ã³, nhá»¯ng thÃ´ng Ä‘iá»‡p ngá»t ngÃ o vÃ  Ä‘áº§y cáº£m há»©ng Ä‘Æ°á»£c cÃ¡ nhÃ¢n hÃ³a sáº½ dá»… cháº¡m tá»›i trÃ¡i tim khÃ¡ch hÃ ng. CÃ¡c loáº¡i chocolate quÃ  táº·ng cá»§a Dâ€™art vá»›i nhá»¯ng thiáº¿t káº¿ bao bÃ¬ sang trá»ng vÃ  Ä‘áº³ng cáº¥p sáº½ giÃºp báº¡n khÃ´ng gáº·p khÃ³ khÄƒn trong viá»‡c chá»n quÃ  cho báº¡n bÃ¨, ngÆ°á»i thÃ¢n hay Ä‘á»‘i tÃ¡c.</p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn02.static-adayroi.com/resize/710_710/100/0/2017/10/25/1508902268035_3213553.jpg\" /></p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p><strong>CÃ¢u chuyá»‡n vá» Dâ€™Art chocolate</strong><br />\r\nRa Ä‘á»i vá»›i mong muá»‘n xÃ¢y dá»±ng thÆ°Æ¡ng hiá»‡u chocolate Bá»‰ cao cáº¥p, Dâ€™Art Ä‘Ã£ káº¿t há»£p Ä‘á»™c Ä‘Ã¡o giá»¯a sá»± sÃ¡ng táº¡o, cháº¥t lÆ°á»£ng vÃ  cÃ´ng nghá»‡, mang Ä‘áº¿n sáº£n pháº©m socola cháº¥t lÆ°á»£ngÂ Ä‘áº¿n ngÆ°á»i tiÃªu dÃ¹ng.</p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn02.static-adayroi.com/resize/710_710/100/0/2017/10/25/1508902268317_2818701.jpg\" /></p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p>CÃ¡c tÃ¡c pháº©m cá»§a Dâ€™Art khÃ´ng Ä‘Æ¡n thuáº§n lÃ  nhá»¯ng mÃ³n Äƒn, Ä‘Ã³ chÃ­nh lÃ  nhá»¯ng thiáº¿t káº¿ má»¹ thuáº­t Ä‘Æ°á»£c thá»±c hiá»‡n trÃªn chocolate, táº¡o nÃªn giÃ¡ trá»‹ nghá»‡ thuáº­t cho dÃ²ng chocolate truyá»n thá»‘ng. Báº¡n sáº½ cáº£m nháº­n nguá»“n cáº£m há»©ng cÅ©ng nhÆ° tÃ¢m huyáº¿t cá»§a Ä‘áº§u báº¿p Ä‘Ã£ sáº» chia trong má»—i sáº£n pháº©m cá»§a Dâ€™Art Chocolate.</p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn02.static-adayroi.com/resize/710_710/100/0/2017/10/25/1508902268627_1577893.jpg\" /></p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn02.static-adayroi.com/resize/710_710/100/0/2017/10/25/1508902268956_2214066.jpg\" /></p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn02.static-adayroi.com/resize/710_710/100/0/2017/10/25/1508902269335_6628585.jpg\" /></p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn02.static-adayroi.com/resize/710_710/100/0/2017/10/25/1508902269642_6379845.jpg\" /></p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn02.static-adayroi.com/resize/710_710/100/0/2017/10/25/1508902269956_2729147.jpg\" /></p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p>Â </p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn02.static-adayroi.com/resize/710_710/100/0/2017/10/25/1508902270336_9491976.jpg\" /></p>\r\n\r\n<p>Â </p>\r\n\r\n<p><strong>Click mua ngay Ä‘á»ƒ táº­n hÆ°á»Ÿng nhá»¯ng Æ°u Ä‘Ã£i tuyá»‡t vá»i tá»« Adayroi.com.</strong><a href=\"https://cmsdv.adayroi.com/danh-sach-deal-sxhand\">â€‹</a></p>\r\n','PROMOTION',0,0,'',NULL,NULL,'ACTIVE','2017-12-19 17:55:59'),
(4,'test','<p>abcd</p>\r\n','PROMOTION',0,0,'',NULL,NULL,'ACTIVE','2017-11-02 15:12:56');

/*Table structure for table `loyalty_parameter` */

DROP TABLE IF EXISTS `loyalty_parameter`;

CREATE TABLE `loyalty_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `loyalty_parameter` */

insert  into `loyalty_parameter`(`id`,`name`,`value`) values 
(1,'loyalty.news.read.10','10'),
(2,'loyalty.news.read.100','100'),
(3,'loyalty.news.read.1000','1000'),
(4,'loyalty.birthday.rate','2'),
(5,'loyalty.weekend.rate','1.5'),
(6,'loyalty.holiday.rate','2');

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) DEFAULT NULL,
  `SUBJECT` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `body` longtext CHARACTER SET utf8,
  `type` varchar(10) NOT NULL DEFAULT 'PRIMARY',
  `read` tinyint(4) NOT NULL DEFAULT '0',
  `receive` tinyint(4) NOT NULL DEFAULT '0',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=latin1;

/*Data for the table `message` */

insert  into `message`(`id`,`uid`,`SUBJECT`,`body`,`type`,`read`,`receive`,`createdDate`) values 
(2,1,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 22:22:06'),
(3,22,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:12'),
(4,23,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:12'),
(5,23,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:13'),
(6,24,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:14'),
(7,25,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:16'),
(8,26,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:15'),
(9,27,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:18'),
(10,28,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:19'),
(11,29,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:20'),
(12,30,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:21'),
(13,31,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:22'),
(14,32,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:23'),
(15,33,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:23'),
(16,34,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:24'),
(17,35,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:26'),
(18,36,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:27'),
(19,37,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:28'),
(20,38,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:29'),
(21,39,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:29'),
(22,40,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:30'),
(23,41,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:32'),
(24,42,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:32'),
(25,43,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:34'),
(26,44,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PROMOTION',0,0,'2017-11-01 17:27:35'),
(59,1,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,1,'2017-11-01 22:21:06'),
(60,1,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,1,'2017-11-01 17:33:57'),
(61,2,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-11-01 17:33:58'),
(62,3,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-11-01 17:33:58'),
(63,4,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-11-01 17:33:59'),
(64,5,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-11-01 17:34:00'),
(65,6,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-11-01 17:34:00'),
(66,7,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(67,17,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(68,21,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(69,22,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(70,23,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(71,24,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(72,25,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(73,26,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(74,27,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(75,28,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(76,29,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(77,30,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(78,31,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(79,32,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(80,33,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(81,34,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(82,35,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(83,36,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(84,37,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(85,38,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(86,39,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(87,40,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(88,41,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(89,42,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(90,43,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(91,44,NULL,'<p>Báº¯t Ä‘áº§u tá»« 14:01 ngÃ y 27/10 (giá» HÃ  Ná»™i), ngÆ°á»i dÃ¹ng má»›i Ä‘áº·t hÃ ng Ä‘Æ°á»£c iPhone X trÃªn website cá»§a Apple. Tuy nhiÃªn, Viá»‡t Nam khÃ´ng náº±m trong danh sÃ¡ch nhá»¯ng thá»‹ trÆ°á»ng cÃ³ thá»ƒ Ä‘áº·t mua Ä‘Æ°á»£c iPhone X trong Ä‘á»£t Ä‘áº§u tiÃªn. Trong khi Ä‘Ã³, má»™t loáº¡t thá»‹ trÆ°á»ng chÃ¢u Ã nhÆ° Nháº­t, Trung Quá»‘c hay Hong Kong vÃ  Singapore Ä‘á»u Ä‘Æ°á»£c má»Ÿ bÃ¡n trong Ä‘á»£t hÃ ng Ä‘áº§u giá»‘ng nhÆ° Má»¹.Â </p>\r\n\r\n<p>Vá»›i nhá»¯ng dá»± bÃ¡o cho tháº¥y lÆ°á»£ng iPhone X mÃ  Apple cÃ³ thá»ƒ tung ra trong thá»i gian Ä‘áº§u ráº¥t háº¡n cháº¿, viá»‡c Ä‘áº·t hÃ ng online tá»« 27/10 Ä‘Æ°á»£c cho lÃ  cÃ¡ch giÃºp ngÆ°á»i dÃ¹ng cÃ³ Ä‘Æ°á»£c mÃ¡y sá»›m vÃ  dá»… nháº¥t, thay vÃ¬ pháº£i xáº¿p hÃ ng táº¡i cÃ¡c cá»­a hÃ ng bÃ¡n láº» trong ngÃ y má»Ÿ bÃ¡n 3/11.Â </p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.\" src=\"https://i-sohoa.vnecdn.net/2017/10/27/Screen-Shot-2017-10-27-at-8-50-2304-1698-1509069343.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Website cá»§a Apple táº¡i Má»¹ vÃ  má»™t loáº¡t thá»‹ trÆ°á»ng khÃ¡c Ä‘Ã£ Ä‘á»•i giao diá»‡n chá»§ Ä‘áº¡o sang iPhone X Ä‘á»ƒ chuáº©n bá»‹ cho viá»‡c Ä‘áº·t hÃ ng báº¯t Ä‘áº§u tá»« trÆ°a 27/10.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>DÃ¹ váº­y, theoÂ <em>The Verge</em>, viá»‡c Ä‘áº·t hÃ ng online iPhone X trong nÄƒm nay Ä‘Æ°á»£c dá»± bÃ¡o cÅ©ng sáº½ khÃ³ khÄƒn hÆ¡n nhiá»u má»i nÄƒm. Äá»ƒ Ä‘áº·t hÃ ng ngÆ°á»i dÃ¹ng buá»™c pháº£i cÃ³ tháº» thanh toÃ¡n quá»‘c táº¿ hoáº·c tháº» tÃ­n dá»¥ng vá»›i háº¡n má»©c thanh toÃ¡n má»—i láº§n tá»‘i thiá»ƒu 1.000 USD, tÆ°Æ¡ng Ä‘Æ°Æ¡ng vá»›i giÃ¡ khá»Ÿi Ä‘iá»ƒm chÆ°a tÃ­nh thuáº¿ cá»§a iPhone X. Äá»ƒ trÃ¡nh gáº·p pháº£i trÃ¬nh tráº¡ng quÃ¡ táº£i trÃªn website cá»§a Apple, ngÆ°á»i dÃ¹ng nÃªn sá»­ dá»¥ng á»©ng dá»¥ng mua sáº¯m Apple Store trÃªn iOS Ä‘á»ƒ giáº£m bá»›t cÃ¡c thao tÃ¡c nháº­p dá»¯ liá»‡u thanh toÃ¡n.Â </p>\r\n\r\n<p>Xuáº¥t hiá»‡n muá»™n hÆ¡n háº³n so vá»›i thÃ´ng lá»‡ má»i nÄƒm, nhÆ°ng iPhone X Ä‘ang lÃ  smartphone thu hÃºt nhiá»u chÃº Ã½ dá»‹p cuá»‘i nÄƒm. DÃ¹ thá»i Ä‘iá»ƒm lÃªn ká»‡ chÃ­nh hÃ£ng á»Ÿ Viá»‡t Nam váº«n chÆ°a rÃµ, iPhone X Ä‘Æ°á»£c cho váº«n sáº½ xuáº¥t hiá»‡n trÃªn thá»‹ trÆ°á»ng xÃ¡ch tay vÃ o Ä‘áº§u thÃ¡ng 11, ngay sau khi má»Ÿ bÃ¡n trÃªn tháº¿ giá»›i. Tuy nhiÃªn, giÃ¡ bÃ¡n Ä‘ang Ä‘Æ°á»£c nhiá»u cá»­a hÃ ng trong nÆ°á»›c chÃ o hÃ ng Ä‘Ã£ lÃªn tá»›i 40 Ä‘áº¿n 50 triá»‡u Ä‘á»“ng, gáº¥p Ä‘Ã´i giÃ¡ gá»‘c mÃ  Apple Ä‘Æ°a ra.</p>\r\n','PRIMARY',0,0,'2017-10-27 16:10:15'),
(92,45,NULL,'ChÃ o má»«ng báº¡n Ä‘áº¿n vá»›i SMA,\nSMA xin táº·ng báº¡n 2.000Ä‘ cho láº§n dÃ¹ng á»©ng dá»¥ng Ä‘áº§u tiÃªn.','PRIMARY',0,0,'2017-11-02 10:33:09'),
(93,1,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(94,2,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(95,3,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(96,4,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(97,5,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(98,6,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(99,7,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(100,17,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(101,21,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(102,22,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(103,23,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(104,24,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(105,25,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(106,26,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(107,27,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(108,28,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(109,29,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(110,30,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(111,31,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(112,32,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(113,33,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(114,34,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(115,35,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(116,36,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(117,37,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(118,38,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(119,39,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(120,40,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(121,41,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(122,42,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(123,43,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(124,44,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(125,45,NULL,'<p>abcd</p>\r\n','PRIMARY',0,1,'2017-11-02 15:12:15'),
(159,1,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:47'),
(160,2,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:47'),
(161,3,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(162,4,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(163,5,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(164,6,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(165,7,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(166,17,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(167,21,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(168,22,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(169,23,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(170,24,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(171,25,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(172,26,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(173,27,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(174,28,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(175,29,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(176,30,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(177,31,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(178,32,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(179,33,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(180,34,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(181,35,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(182,36,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(183,37,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(184,38,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(185,39,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(186,40,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(187,41,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(188,42,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(189,43,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(190,44,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48'),
(191,45,NULL,'<p>abcd</p>\r\n','PROMOTION',0,0,'2017-11-02 15:19:48');

/*Table structure for table `mobile_user` */

DROP TABLE IF EXISTS `mobile_user`;

CREATE TABLE `mobile_user` (
  `id` bigint(20) NOT NULL,
  `createdDate` datetime DEFAULT NULL,
  `deviceToken` varchar(255) DEFAULT NULL,
  `earning` bigint(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mobile_user` */

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shortDescription` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content` longtext,
  `link` varchar(500) DEFAULT NULL,
  `imageLink` varchar(500) DEFAULT NULL,
  `newsCategoryId` int(11) DEFAULT NULL,
  `noOfLike` int(11) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'ACTIVE',
  `source` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `news` */

/*Table structure for table `news_category` */

DROP TABLE IF EXISTS `news_category`;

CREATE TABLE `news_category` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'ACTIVE',
  `createdDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `point` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `news_category` */

insert  into `news_category`(`id`,`code`,`name`,`image`,`status`,`createdDate`,`point`) values 
(1,'TinNoiBat','Tin ná»•i báº­t','http://222.252.16.132:8080/images/TinNoiBat.jpg','ACTIVE','2017-09-12 16:47:57',10),
(2,'ChungKhoan','Chá»©ng khoÃ¡n','http://222.252.16.132:8080/images/ChungKhoan.jpg','ACTIVE','2017-09-12 16:48:02',20),
(3,'ThoiSu','Thá»i sá»±','http://222.252.16.132:8080/images/ThoiSu.jpg','ACTIVE','2017-09-12 16:48:08',10),
(4,'TaiChinh','TÃ i chÃ­nh','http://222.252.16.132:8080/images/TaiChinh.jpg','ACTIVE','2017-09-12 16:48:13',20),
(5,'PhapLuat','PhÃ¡p luáº­t','http://222.252.16.132:8080/images/PhapLuat.jpg','ACTIVE','2017-09-12 22:03:22',10),
(6,'XaHoi','XÃ£ há»™i','http://222.252.16.132:8080/images/XaHoi.jpg','ACTIVE','2017-09-12 22:03:22',10),
(7,'TheThao','Thá»ƒ thao','http://222.252.16.132:8080/images/TheThao.jpg','ACTIVE','2017-09-13 16:47:27',10),
(8,'KinhTe','Kinh táº¿','http://222.252.16.132:8080/images/KinhTe.jpg','ACTIVE','2017-09-13 16:47:27',20),
(9,'News','Tin tá»©c - Sá»± kiá»‡n','http://222.252.16.132:8080/images/News.jpg','ACTIVE','2017-09-13 16:51:50',10);

/*Table structure for table `offers` */

DROP TABLE IF EXISTS `offers`;

CREATE TABLE `offers` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `price` double DEFAULT NULL,
  `online_time` datetime DEFAULT NULL,
  `offline_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `device` varchar(20) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `geography` varchar(10) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `offers` */

insert  into `offers`(`id`,`name`,`price`,`online_time`,`offline_time`,`status`,`device`,`type`,`geography`,`description`) values 
(1,'offer1',10000000,NULL,NULL,NULL,'ios',NULL,NULL,'none');

/*Table structure for table `order_loyalty` */

DROP TABLE IF EXISTS `order_loyalty`;

CREATE TABLE `order_loyalty` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) DEFAULT NULL,
  `phoneCardId` int(11) DEFAULT NULL,
  `giftCodeId` int(11) DEFAULT NULL,
  `gameCardId` int(11) DEFAULT NULL,
  `voucherId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `totalPoint` int(11) DEFAULT '0',
  `customerName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'NEW',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `processInstanceId` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Data for the table `order_loyalty` */

insert  into `order_loyalty`(`id`,`uid`,`phoneCardId`,`giftCodeId`,`gameCardId`,`voucherId`,`quantity`,`price`,`total`,`totalPoint`,`customerName`,`address`,`phone`,`email`,`status`,`createdDate`,`processInstanceId`) values 
(1,1,NULL,NULL,NULL,1,1,20000,20000,0,'TÃ¹ng Nguyá»…n','HÃ  Ná»™i','0913515759',NULL,'SUCCESS','2017-11-13 17:49:28',NULL),
(2,1,NULL,NULL,NULL,1,1,20000,39000,0,NULL,NULL,NULL,NULL,'NEW','2017-11-15 14:23:58',NULL),
(3,1,NULL,NULL,NULL,1,1,20000,39000,0,'Tung','null','0913515759','null','NEW','2017-11-15 14:39:38',NULL),
(4,1,NULL,NULL,NULL,1,1,20000,39000,0,'','','0913515759','','CANCELLING','2017-11-15 14:43:10',NULL),
(5,1,NULL,NULL,NULL,1,2,200000,400000,0,'ffdfdf','dfdfdfd','90989978787','dfdfdf','NEW','2017-11-21 17:12:51',NULL),
(6,1,NULL,NULL,NULL,1,2,200000,400000,0,'ffdfdf','dfdfdfd','90989978787','dfdfdf','NEW','2017-11-21 17:17:25',NULL),
(7,1,NULL,NULL,NULL,1,2,200000,400000,0,'ffdfdf','dfdfdfd','90989978787','dfdfdf','NEW','2017-11-21 17:23:07',NULL),
(8,1,NULL,NULL,NULL,1,1,0,0,0,'fd','df','56575667567','trtre','NEW','2017-11-23 11:37:45',NULL),
(9,1,NULL,NULL,NULL,1,1,0,0,0,'fd','df','56575667567','trtre','NEW','2017-11-23 11:38:32',NULL),
(10,1,NULL,NULL,NULL,1,1,0,0,0,'sd','sds','66787878','trtytrrt','NEW','2017-11-27 10:08:51',NULL),
(11,1,NULL,NULL,NULL,1,1,0,0,0,'sdsdf','sfdf','s454545','erere','NEW','2017-11-29 15:18:02',NULL),
(14,1,NULL,NULL,NULL,1,1,0,0,0,'sdsdf','sfdf','s454545','erere','CLOSE','2017-12-04 14:26:53','5019'),
(15,1,NULL,NULL,NULL,1,1,0,0,0,'sdsd','sdsad','sdss','sdsd','NEW','2017-12-04 15:03:53',NULL),
(16,1,NULL,NULL,NULL,1,2,0,0,5000,'asdsadf','sdfdf','fdsfds','dfsdfd','CLOSE','2017-12-07 10:36:29',NULL),
(17,1,NULL,NULL,NULL,1,1,0,0,5000,'sdsd','sdsd','1234567890','','CLOSE','2017-12-06 13:49:16',NULL),
(18,1,NULL,NULL,NULL,1,1,0,0,5000,'Ã¡dsdsd','sdasdsa','1234567890','','CLOSE','2017-12-06 13:52:39',NULL),
(19,1,NULL,NULL,NULL,1,1,0,0,5000,'Ã¡dsdsd','sdasdsa','1234567890','','CLOSE','2017-12-06 13:53:03',NULL),
(24,1,NULL,NULL,NULL,1,1,0,0,5000,'dsd','dfdfdfd','0913515759','sdsdsd','PROCESSING','2017-12-07 14:18:15',NULL),
(25,1,NULL,NULL,NULL,1,1,0,0,5000,'dsd','dfdfdfd','0913515759','sdsdsd','PROCESSING','2017-12-07 14:27:13',NULL),
(26,1,NULL,NULL,NULL,1,1,0,0,5000,'sdfsdf','dsfdf','0913515759','','PROCESSING','2017-12-07 14:30:39',NULL),
(28,1,NULL,NULL,NULL,1,1,0,0,5000,'sdfsdf','dsfdf','0913515759','','PROCESSING','2017-12-07 14:35:55',NULL),
(31,1,NULL,NULL,NULL,1,1,0,0,5000,'sdsd','sdsd','0913515759','','CLOSE','2017-12-07 14:57:28','20001'),
(32,1,NULL,NULL,NULL,1,1,0,0,5000,'kdsdsd','sdsds','0913515759','','NEW','2017-12-08 09:54:01',NULL);

/*Table structure for table `password_reset_token` */

DROP TABLE IF EXISTS `password_reset_token`;

CREATE TABLE `password_reset_token` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `password_reset_token` */

insert  into `password_reset_token`(`id`,`uid`,`token`,`expiry_date`) values 
(1,10,'d3eaa6c3-7817-4398-a610-8a9e4a18ff17','2017-10-25 17:34:47'),
(2,10,'f145bb69-8a6a-45d6-b095-0b4980935d47','2017-10-25 21:15:34'),
(3,10,'b6c2ff3c-ca9e-4461-9a22-0d044f6cadf4','2017-10-25 21:22:12'),
(4,10,'cfd4c905-435c-4530-8e2c-18bd961bc2ff','2017-10-25 21:24:00'),
(5,10,'67b05652-8666-4489-9488-16b836f83c25','2017-10-25 21:26:37'),
(6,10,'4644a614-fbd8-4b22-96bb-e48116cd774b','2017-10-25 21:36:42'),
(7,10,'3d30106b-70a1-4140-80a0-03483e066389','2017-10-25 21:40:10'),
(8,10,'a72ab9ae-2ace-4fea-820b-7a6f1c18926b','2017-10-25 21:42:09'),
(9,10,'d7a96040-0a41-484f-a3d7-fdeb6dcc4cfa','2017-10-25 21:42:36'),
(10,10,'3d2d5957-9d52-4369-8fab-daaadf4501cf','2017-10-25 21:45:47'),
(11,10,'86f4a50a-aaee-4ec4-9bd5-3d353303f544','2017-10-25 21:48:34'),
(12,10,'bb6d7988-6060-401e-ac77-c4f556bf38b5','2017-10-25 21:49:53'),
(13,10,'169979f2-3758-435f-8be8-0271658f1f9a','2017-10-25 22:08:43'),
(14,10,'3e025617-f41d-449f-b643-700a7303534a','2017-10-25 22:11:18'),
(15,10,'42a2d4e4-389c-4769-a317-abf2d07604ba','2017-10-25 22:14:46'),
(16,10,'5d50d411-2f18-414b-a225-6b1eb90f73d2','2017-10-25 22:21:16'),
(17,10,'fd42b290-6c4b-4014-bbb6-2531f3f8f2ac','2017-10-26 11:15:33'),
(18,10,'bacdebbe-48eb-4572-877b-ccdde948eb71','2017-10-24 11:17:14'),
(19,10,'230d92f7-2f31-4444-a1f9-ce40953c2a66','2017-10-26 11:22:00'),
(20,10,'8b5db743-ec38-43e3-a76c-ec9e91b6c433','2017-10-26 11:24:11');

/*Table structure for table `phone_card_codes` */

DROP TABLE IF EXISTS `phone_card_codes`;

CREATE TABLE `phone_card_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phoneCardId` int(11) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `isDeliver` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `phone_card_codes` */

insert  into `phone_card_codes`(`id`,`phoneCardId`,`code`,`isDeliver`) values 
(1,1,'DJDJAHAGDDD',0);

/*Table structure for table `phonecard` */

DROP TABLE IF EXISTS `phonecard`;

CREATE TABLE `phonecard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `legacyId` varchar(100) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'NEW',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pointExchange` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `phonecard` */

insert  into `phonecard`(`id`,`legacyId`,`name`,`image`,`price`,`status`,`createdDate`,`pointExchange`) values 
(1,NULL,'50.000Ä‘ Viettel ','http://222.252.16.132:8080/loyalty/phone_card/viettel.png',50000,'ACTIVE','2017-12-05 09:51:42',5000),
(2,NULL,'50.000Ä‘ Vinaphone ','http://222.252.16.132:8080/loyalty/phone_card/vinaphone.png',50000,'ACTIVE','2017-11-10 15:31:56',0),
(3,NULL,'50.000Ä‘ Mobifone ','http://222.252.16.132:8080/loyalty/phone_card/mobifone.png',50000,'ACTIVE','2017-11-10 15:31:58',0),
(4,NULL,'50.000Ä‘ VNMobile ','http://222.252.16.132:8080/loyalty/phone_card/vietnamobile.png',50000,'ACTIVE','2017-11-10 15:32:01',0),
(5,NULL,'100.000Ä‘ Viettel ','http://222.252.16.132:8080/loyalty/phone_card/viettel.png',100000,'ACTIVE','2017-11-10 15:31:49',0),
(6,NULL,'100.000Ä‘ Vinaphone ','http://222.252.16.132:8080/loyalty/phone_card/vinaphone.png',100000,'ACTIVE','2017-11-10 15:32:18',0),
(7,'','100.000Ä‘ Mobifone ','http://222.252.16.132:8080/loyalty/phone_card/mobifone.png',100000,'ACTIVE','2017-11-20 16:59:28',0),
(8,NULL,'100.000Ä‘ VNMobile ','http://222.252.16.132:8080/loyalty/phone_card/vietnamobile.png',100000,'ACTIVE','2017-11-10 15:27:14',0);

/*Table structure for table `posts` */

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` bigint(20) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `posts` */

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `qrtz_cron_triggers` */

insert  into `qrtz_cron_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`CRON_EXPRESSION`,`TIME_ZONE_ID`) values 
('schedulerFactoryBean','jobGenerateLuckyNumberWithCronTriggerBeanTrigger','DEFAULT','0 0 1 * * ?','Asia/Bangkok'),
('schedulerFactoryBean','jobNewsWithCronTriggerBeanTrigger','DEFAULT','0 0/5 * * * ?','Asia/Bangkok'),
('schedulerFactoryBean','jobUserInviteWithCronTriggerBeanTrigger','DEFAULT','0 0/30 * * * ?','Asia/Bangkok');

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `qrtz_job_details` */

insert  into `qrtz_job_details`(`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`JOB_CLASS_NAME`,`IS_DURABLE`,`IS_NONCONCURRENT`,`IS_UPDATE_DATA`,`REQUESTS_RECOVERY`,`JOB_DATA`) values 
('schedulerFactoryBean','jobGenerateLuckyNumberWithCronTriggerBean','DEFAULT',NULL,'com.fintechviet.quartz.jobs.JobGenerateLuckyNumberWithCronTrigger','1','0','0','0','¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),
('schedulerFactoryBean','jobNewsWithCronTriggerBean','DEFAULT',NULL,'com.fintechviet.quartz.jobs.JobNewsWithCronTrigger','1','0','0','0','¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0'),
('schedulerFactoryBean','jobUserInviteWithCronTriggerBean','DEFAULT',NULL,'com.fintechviet.quartz.jobs.JobUserInviteWithCronTrigger','1','0','0','0','¬í\0sr\0org.quartz.JobDataMapŸ°ƒè¿©°Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap‚èÃûÅ](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMapæ.­(v\nÎ\0Z\0dirtyL\0mapt\0Ljava/util/Map;xp\0sr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0');

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `qrtz_locks` */

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `qrtz_scheduler_state` */

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `qrtz_triggers` */

insert  into `qrtz_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`NEXT_FIRE_TIME`,`PREV_FIRE_TIME`,`PRIORITY`,`TRIGGER_STATE`,`TRIGGER_TYPE`,`START_TIME`,`END_TIME`,`CALENDAR_NAME`,`MISFIRE_INSTR`,`JOB_DATA`) values 
('schedulerFactoryBean','jobGenerateLuckyNumberWithCronTriggerBeanTrigger','DEFAULT','jobGenerateLuckyNumberWithCronTriggerBean','DEFAULT',NULL,1519927200000,-1,0,'WAITING','CRON',1519870976000,0,NULL,1,''),
('schedulerFactoryBean','jobNewsWithCronTriggerBeanTrigger','DEFAULT','jobNewsWithCronTriggerBean','DEFAULT',NULL,1519872600000,1519872300000,0,'WAITING','CRON',1519870976000,0,NULL,1,''),
('schedulerFactoryBean','jobUserInviteWithCronTriggerBeanTrigger','DEFAULT','jobUserInviteWithCronTriggerBean','DEFAULT',NULL,1519873200000,1519871400000,0,'WAITING','CRON',1519870976000,0,NULL,1,'');

/*Table structure for table `reward_category` */

DROP TABLE IF EXISTS `reward_category`;

CREATE TABLE `reward_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rewardCode` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `rewardName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `reward_category` */

insert  into `reward_category`(`id`,`rewardCode`,`rewardName`) values 
(1,'INSTALL','Äiá»ƒm cÃ i Ä‘áº·t á»©ng dá»¥ng'),
(2,'INVITE','Äiá»ƒm giá»›i thiá»‡u báº¡n bÃ¨'),
(3,'READ','Äiá»ƒm Ä‘á»c tin'),
(4,'EVENT','Äiá»ƒm sá»± kiá»‡n');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `role` */

insert  into `role`(`id`,`name`) values 
(1,'ROLE_ADMIN'),
(2,'ROLE_ADVERTISER'),
(3,'ROLE_SUPER_ADMIN');

/*Table structure for table `system_parameter` */

DROP TABLE IF EXISTS `system_parameter`;

CREATE TABLE `system_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adv_image_path` varchar(255) NOT NULL,
  `adv_video_path` varchar(255) DEFAULT NULL,
  `news_image_path` varchar(255) DEFAULT NULL,
  `content_image_path` varchar(255) DEFAULT NULL,
  `news_category_path` varchar(255) DEFAULT NULL,
  `app_icon_path` varchar(255) DEFAULT NULL,
  `game_image_path` varchar(255) DEFAULT NULL,
  `loyalty_phone_card_image_path` varchar(255) DEFAULT NULL,
  `loyalty_voucher_image_path` varchar(255) DEFAULT NULL,
  `adv_image_folder` varchar(255) DEFAULT NULL,
  `adv_video_folder` varchar(255) DEFAULT NULL,
  `news_image_folder` varchar(255) DEFAULT NULL,
  `content_image_folder` varchar(255) DEFAULT NULL,
  `news_category_folder` varchar(255) DEFAULT NULL,
  `app_icon_folder` varchar(255) DEFAULT NULL,
  `game_image_folder` varchar(255) DEFAULT NULL,
  `loyalty_phone_card_image_folder` varchar(255) DEFAULT NULL,
  `loyalty_voucher_image_folder` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `system_parameter` */

insert  into `system_parameter`(`id`,`adv_image_path`,`adv_video_path`,`news_image_path`,`content_image_path`,`news_category_path`,`app_icon_path`,`game_image_path`,`loyalty_phone_card_image_path`,`loyalty_voucher_image_path`,`adv_image_folder`,`adv_video_folder`,`news_image_folder`,`content_image_folder`,`news_category_folder`,`app_icon_folder`,`game_image_folder`,`loyalty_phone_card_image_folder`,`loyalty_voucher_image_folder`) values 
(1,'http://222.252.16.132:8080/ad/images/','http://222.252.16.132:8080/ad/videos/','http://222.252.16.132:8080/news/images/','http://222.252.16.132:8080/content/images/','http://222.252.16.132:8080/images/','http://222.252.16.132:8080/ad/app/','http://222.252.16.132:8080/images/','http://222.252.16.132:8080/loyalty/phone_card/','http://222.252.16.132:8080/loyalty/voucher/','ad/images','ad/videos','news/images','content/images','images','ad/app','images','loyalty/phone_card','loyalty/voucher');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `avatarLink` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'NEW',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`password`,`username`,`avatarLink`,`status`,`createdDate`) values 
(10,'25d55ad283aa400af464c76d713c07ad','tungnv@abc.com','/images/avatar/user6-128x128.jpg','ACTIVE','2017-09-20 14:35:11'),
(11,'$2a$10$UFrHg/KA/iX4eLyHO01Xx.lD333aNn6Xrrl0sNRQwXccwa1jFnDXy','tungnv1','/images/avatar/avatar.png','NEW','2017-09-20 14:35:11'),
(12,'$2a$10$YS91B2dQYKlhcEVD8eVV6uYncKatTUCxtDlSYMg.CiO/m9fYR.JKW','tungnv2','/images/avatar/avatar.png','NEW','2017-09-20 14:35:11'),
(13,'$2a$10$/KK96DcLiO/YqVbZDVJ1Mu63v8QWfLwmWqryLzM2u2MIxsqCSJKbG','tungnv3','/images/avatar/avatar.png','NEW','2017-09-20 14:35:11'),
(14,'$2a$10$YoLONPKjgMGKugIcUfnlyuvppJtz6zzX0Q20J3VxUJDoqhHYnDMpi','tungnv4','/images/avatar/avatar.png','NEW','2017-09-20 14:35:11'),
(15,'$2a$10$tBFATFZZIMlnMrN.ra8tYO6Ki0LlOLpSmrGWPBFY11ZLgiOkbO7vG','tungnv5','/images/avatar/avatar.png','NEW','2017-09-20 14:35:11'),
(16,'$2a$10$u4sKn3H2xq49L/tG2cecoOn9mD096/C/zieXafUEU89JIFMIHFCGa','tungnv6','/images/avatar/avatar.png','NEW','2017-09-20 14:35:11'),
(17,'$2a$10$MOtWESY/Lx09F4xTCLc0se4E6NNIJoUMflKg1bgLgHkQaoRU2Oo4O','tungnv7','/images/avatar/avatar.png','NEW','2017-09-20 14:35:11'),
(18,'$2a$10$6kHrPerHv9pIK6lfXKH71egaGDw8wNvet.I9/Qv2xZrkdPtf8CVt2','tungnv8','/images/avatar/avatar.png','NEW','2017-09-20 14:35:11'),
(19,'$2a$10$2kcgrvMYVvwtAZdm.OeX2.owNtnmFssV8HwmeMJkyWL5zX3EW2H8a','tungnv9','/images/avatar/avatar.png','NEW','2017-09-20 14:35:11'),
(20,'$2a$10$EHoFHAMe/nTJvWAsx.O.LO22yxtXrdkHlYxRxk258hc2Xl3uuyAzq','tungnv10','/images/avatar/avatar.png','NEW','2017-09-20 14:35:11'),
(21,'$2a$10$CykW8XVbft36/afVz9uxD.Ttrer.fbDlAanw9LQs1xB/eN9kESmiK','tungnv11','/images/avatar/avatar.png','NEW','2017-09-20 14:35:11'),
(22,'25d55ad283aa400af464c76d713c07ad','tungnv1@abc.com','/images/avatar/avatar.png','ACTIVE','2017-09-20 14:35:11'),
(23,'25f9e794323b453885f5181f1b624d0b','ad1@abcd.com','/images/avatar/user8-128x128.jpg','NEW','2017-09-20 14:35:11'),
(24,'25d55ad283aa400af464c76d713c07ad','ad2@abcd.com','/images/avatar/avatar.png','NEW','2017-09-20 14:35:11'),
(25,'25f9e794323b453885f5181f1b624d0b','ad3@abcd.com','/images/avatar/avatar.png','ACTIVE','2017-09-20 14:35:11');

/*Table structure for table `user_mobile` */

DROP TABLE IF EXISTS `user_mobile`;

CREATE TABLE `user_mobile` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `legacyId` varchar(100) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dob` int(10) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `earning` bigint(20) NOT NULL DEFAULT '0',
  `inviteCode` varchar(20) DEFAULT NULL,
  `inviteCodeUsed` varchar(20) DEFAULT NULL,
  `isRewardForUserInvite` tinyint(4) DEFAULT '0',
  `noInvited` int(11) DEFAULT '0',
  `status` varchar(10) DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

/*Data for the table `user_mobile` */

insert  into `user_mobile`(`id`,`legacyId`,`username`,`gender`,`dob`,`location`,`earning`,`inviteCode`,`inviteCodeUsed`,`isRewardForUserInvite`,`noInvited`,`status`,`createdDate`) values 
(1,'abc','tungnv1234@gmail.com','MALE',1982,'HAN',145060,'invitecode1','SQXGWOBQ',1,100,'ACTIVE','2017-09-12 16:49:02'),
(2,NULL,'email2@gmail.com','MALE',1983,NULL,22000,'invitecode2','invitecode1',1,0,'ACTIVE','2017-09-12 16:49:14'),
(3,NULL,'email3@gmail.com','MALE',1990,NULL,2000,'invitecode3','invitecode1',1,0,'ACTIVE','2017-09-12 16:49:15'),
(4,NULL,'email4@gmail.com','FEMALE',1992,'HN',2000,'invitecode4','invitecode2',1,0,'ACTIVE','2017-09-12 16:49:16'),
(5,NULL,'abcd1','MALE',1982,'HN',0,NULL,NULL,0,0,'ACTIVE','2017-09-16 23:13:50'),
(6,NULL,'abcd','MALE',1982,'HN',0,NULL,NULL,0,0,'ACTIVE','2017-09-16 23:36:53'),
(7,NULL,'abcd','MALE',1982,'HN',0,NULL,NULL,0,0,'ACTIVE','2017-09-16 23:55:13'),
(17,NULL,'abcd','MALE',1982,'HN',22000,'SQXGWOBQ','invitecode2',1,0,'ACTIVE','2017-09-22 12:53:33'),
(21,NULL,'tungnv1234@gmail.com','MALE',1982,'HAN',2000,'J3ptmQrY','SQXGWOBQ',1,0,'ACTIVE','2017-10-03 00:24:08'),
(22,NULL,'tqlong.net@gmail.com','MALE',1984,'hanoi',2000,'wtOKJwQe',NULL,0,0,'ACTIVE','2017-10-06 09:58:29'),
(23,NULL,'test@gmail.com','Male',1900,'AG',2000,'L4CjZMoO',NULL,0,0,'ACTIVE','2017-10-12 07:31:27'),
(24,NULL,'vhjj','Male',1900,'AG',2010,'BCTXew29',NULL,0,0,'ACTIVE','2017-10-12 20:21:45'),
(25,NULL,'tq@k.q','Male',1900,'AG',2000,'UX4LxolP',NULL,0,0,'ACTIVE','2017-10-13 03:14:53'),
(26,NULL,'hsba','Male',1900,'AG',2460,'oUQOBiIT',NULL,0,0,'ACTIVE','2017-10-13 07:00:54'),
(27,NULL,'tqlong.net@gmail.com','Male',1900,'AG',2070,'56FyUUp5',NULL,0,0,'ACTIVE','2017-10-13 19:46:15'),
(28,NULL,'tfff@ghj.com','Male',1900,'AG',2560,'g3dmRYmF',NULL,0,0,'ACTIVE','2017-10-13 20:33:01'),
(29,NULL,NULL,'Male',1900,'AG',2000,'Ff4wyZNg',NULL,0,0,'ACTIVE','2017-10-14 00:26:58'),
(30,NULL,NULL,'Male',1900,'AG',2000,'BDzXJP1i',NULL,0,0,'ACTIVE','2017-10-14 00:32:21'),
(31,NULL,NULL,'Male',2017,'AG',2000,'izLaH7HX',NULL,0,0,'ACTIVE','2017-10-14 00:47:02'),
(32,NULL,'hhjhh@yyyy.com','Male',1996,'AG',2230,'JC7GKm9B',NULL,0,0,'ACTIVE','2017-10-14 01:24:50'),
(33,NULL,'tfg@thh.com','Male',2017,'AG',2010,'HuvKRYKa',NULL,0,0,'ACTIVE','2017-10-19 03:19:26'),
(34,NULL,'hhsh@jwks.com','Male',2017,'AG',2080,'eUdF0Ucz',NULL,0,0,'ACTIVE','2017-10-19 07:20:02'),
(35,NULL,'tung1@abc.com','Male',1988,'AG',2260,'ysi9Z3pX',NULL,0,0,'ACTIVE','2017-10-19 08:59:34'),
(36,NULL,'adas@adsdsda.com','Male',2017,'AG',2150,'pvbouCYd',NULL,0,0,'ACTIVE','2017-10-19 09:05:51'),
(37,NULL,'tahhj@jsj.com','Male',2017,'AG',2300,'Ig8QPF7b',NULL,0,0,'ACTIVE','2017-10-20 02:28:53'),
(38,NULL,'tqjaj@iwk.com','Male',2017,'AG',2030,'pYt6lFgt',NULL,0,0,'ACTIVE','2017-10-20 06:36:43'),
(39,NULL,NULL,'Male',2015,'TQ',2080,'OcBen0u4',NULL,0,0,'ACTIVE','2017-10-20 09:09:43'),
(40,NULL,'tung1@gmail.com','Male',2016,'BG',2000,'nVpnsbMs',NULL,0,0,'ACTIVE','2017-10-20 20:07:22'),
(41,NULL,'tung@gmail.com','Male',2017,'AG',2050,'OxRAkdYi',NULL,0,0,'ACTIVE','2017-10-20 20:27:53'),
(42,NULL,'hsj@7uwj.com','Male',2017,'AG',2040,'DIZ5XS4b',NULL,0,0,'ACTIVE','2017-10-22 01:51:15'),
(43,NULL,'tqaah@tah.com','Male',2017,'AG',2030,'ye7XYPLM',NULL,0,0,'ACTIVE','2017-10-22 23:32:45'),
(44,NULL,'tests@gmail.com','Male',2017,'AG',2000,'ttlueyXR',NULL,0,0,'ACTIVE','2017-10-25 21:04:08'),
(45,'def','tesat@gmail.com','Male',2017,'AG',2020,'mcyd3J4J','invitecode1',1,0,'ACTIVE','2017-11-02 10:33:09'),
(46,'1',NULL,NULL,0,NULL,2000,'Bsal7OfN',NULL,0,0,'ACTIVE','2017-11-15 10:01:10');

/*Table structure for table `user_mobile_device_token` */

DROP TABLE IF EXISTS `user_mobile_device_token`;

CREATE TABLE `user_mobile_device_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) DEFAULT NULL,
  `deviceToken` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

/*Data for the table `user_mobile_device_token` */

insert  into `user_mobile_device_token`(`id`,`uid`,`deviceToken`) values 
(1,1,'token_android'),
(2,1,'token_ios'),
(3,2,'token2'),
(4,3,'token3'),
(5,4,'token4'),
(6,5,'token5'),
(7,6,'token6'),
(8,7,'token7'),
(16,17,'abcdef1'),
(18,19,'token_android1'),
(20,21,'token_android1'),
(21,22,'abcdef'),
(22,23,'token_android2'),
(23,23,'ekeakzmohto:APA91bFWSe_a34yH32zY1XTnJOzsKn67iVD8_XfYudweY7s2RwT585zqYtz9OCdJZFRq8OM79cWC-wZiQW6OT3p9BGkZjO61LcsctT5tMF8e73uAMZzbNdLkkIOAV6bj5QfO2EYVoT4Q'),
(24,24,'eF5rqaQi3VY:APA91bGbIUPL2DJV1uu7Y4D-q29AJ_hFJ0CtHZ8axSBp331thqXid7Z3Ik06kqI6uoBjyPkTafPq1W0WeCCbddVyqT6u_31oNLkTBDD9LQXV0H3_NzBd9SOwQO4CHOoxtV_pBo2FgELQ'),
(25,25,'c6zX0qUHXqo:APA91bF0G9NFqiyy2HHOOZDVl5G8McFtgMqWEHBNVE117kcY8g73GJZm0S19Wa9JXozVvjCwZ1_TQErbabJxUG9Gwg1obV_zhA1TQZ1zzwy_U1x7gElq0YxTH8fSGJiv7ZuV0SzQhjan'),
(26,26,'cNH5M6grLL8:APA91bEgx6lF57bDedLgUUI3F9i_8KxkvRq25cE-9exQxtc2ZjixpNDckiew6FvY-a6eoYIldxh47hK0chcN8UIXC8Rmf2rFnfTt8GAitRgyXWqpRHOKoYPn-uK2ucBPMTYcrm84sQ5E'),
(27,27,'cbtgK4bGYW4:APA91bGIYMAjITOhikyKRWOVkd9e-b2PJIDSJq_WALlAzr96nDjInmxLDpwFVimVSghPZD6q5g9rbaaa1Ket5TDuwZ_JbM5iYeuiVfm0v49sywUYf4oy3tsgNnTbnyLLRROHzksjNt5g'),
(28,28,'dj5qBS3jOdA:APA91bF351wmSECqXg6tjWOq0qTm1-UEHiIapoxXPvOKbhVyi1RwXrkXjknjcMLPKKOthVQtThTTYRnUHjGMpN8MjlgED-Dh-QqJJrEJ0DmQx-TRAmvA9ag6TKVBv7EXlQ5vUKc2ylOu'),
(29,29,'fgKL6jX8wdw:APA91bEp1eussoc09D4HtMWzwz-8xQgCZ0C5bmQda1iR_qrB5jJfISMzpQ0ORcqgFg89V0rmup7pT0bZA21onZkT_rQ3gPJ39i95ASvuxPU_rOWhamfc-HEqWySV7NLi5hq1wnZeLZLs'),
(30,30,'dXDsiqCx0zU:APA91bHckKs3m8T_3NZgiPX0LHiSdqKazIlEwRh0g4qNgCX36JW1exmxINuY8K3Z0dCSpacYYOlTnuh7g3Ru0wHCYIZuThURTKveEmj4yVrG0peTkU4RpgK7baz-ZO-aLB7GkHEUE866'),
(31,31,'cCWvlqiORpw:APA91bGNf3YMZ36QHvk1Hp43l92TKn8FI0hyfSTwVQxxkS-8S1bT5o7uqEqY59wzSus-_hYsb-FnvmNzBuEibMvTAj6Bdp2uBq0AXk7I5LEVQU8t-Ip-5aemMn5k4baIfZKazACJA5tg'),
(32,32,'cLDw8JuwWbI:APA91bFkuDr69AyUyRZEVqGCz4QSMtxHGaf0g9DuUUUQfd8shaGX9jT1EtWtoQm6Ty19H_CYPRfDRltD5gaQutBZvvL_c9OGPEE6F7Ys8EF3bxTZdJmnwlweK6mHEZRxSDZ4ZAE94UJq'),
(33,33,'eaw86FIjjH8:APA91bEV6P1Q-hZcYul8zSzeIX_T3PxYN1NODxBbrCBsAHpb6ouZ4R5ghWYCnMFYpSRxGGsc1reYvLKEJT51h_WBGxwIvSPxLS6n88_qjCE0ssM1vwoxvTu6ToJDU6BJVpUqI3XMq5L_'),
(34,34,'d_V428u8Sl8:APA91bEYDmH2yGmRmGZN0K3Yt9c7j-oWG4wFEQTC2bmBelE3vEA_4GvTHkkATResV9cDu5VKXY7a5irawSLzBWodhYMKs9QWXmU1lvwjq7HofLxLeelu8V4HkLY7ELss-BjRL9XtLvMN'),
(35,35,'fE9AU9gtsqg:APA91bHzOGFBR48wsh8F6qu1j4KYQO4oAEOV8vqjrnWp_vVLJNsO0Xl1usrfM-qbLABc8_RN__STGNkg7Y4JiKjKXj-9V7nY2WxVNWTzTE7Iu_E-n5NNIFuGXJMEYuoIRvKSdOR6D9ku'),
(36,36,'eCsmRySwNro:APA91bEnpu_7F7CIQvgtAbYagkj-aCsunJuDwFTN2xFgFGT0FSzF2uHwUYvR1LvocxxXrkcnV3nWYhJJLkOSE1IJouo2qqc9iEM-AR7x94L90dZuVJ0OhGJCXtjs8Z45TkHkIAxmPBVC'),
(37,37,'eb5C6sMP9AU:APA91bHu-v8WhvP1GzUF2G91qO_5sD4uWHlb5_zQJ9aCu9lDQ44hCr7KUTgFKOGHnQq28SntQ3wUAcc3H_W-UHfBa0JjhovXPkYZ8EE-CCl7U40Rbq6Sj96_wCtjroIjXW8vPDddt8Ss'),
(38,38,'fSvEBTBsHN0:APA91bEsctT8Oy2fHsyb6GL_28nzYzVTa3auODth4YxdpTqpPOBb9iaXOGsjV_YJo71IBJwCls0Sfy9cJB2FzM9vRTS4lUbqPC4lSLmubZYRxB68wSTrnH00ob_mLENjzc7ce8yN4kFJ'),
(39,39,'ebzcEbPA4XE:APA91bElaYye1gmlcQ431ch22OCLRvFtSWO3Id-YW9PR9MZVYOPpPFoYBsYlwKVShrbkwLt2uVRsRaJ8yJhtUBneWCRmRCCvRkYpIN2BLFsNh-JNoHX8Pjqaku2z5ewKMm-1IeI6Wxmy'),
(40,40,'dwJF3_U7RUk:APA91bGt5orvRP1Pokw4GyZm0DTjSyE3PPzHd6OigdlBo6_zzaLTw77lQx-0VrVMb0UUyBywATKGQr1VrM7oXV8avp_3G2P5UFZZm2g17cTzOATGB-edEtW39JN-TTq3IURAV6IiGZED'),
(41,41,'cXfhJDCADj4:APA91bFWgut70WvDUEmSrcZMW4m-JfLk91UZ_G91-O36yHe2JSjXmAVyZsmI-PQwejB2QGzwx4VcDUjDGXfRHQ-Sy2qU60sAnOMKY1xHpa48pET5N0JNr4Z4UgBIeTdPU_29_fvjgAd2'),
(42,42,'dSbT9gHUOvc:APA91bHVRmFDNYAdsOS8Yga6h4KzLviB0PuZbkBa9rdqE-1NhSOCGYGNQndp8OytbMK_WiLyrrwlwDsTn4rkc9WGo4EpbH_V0xyZ1jm5QDyMwJ7Iy4EGhFSruP65xHIxRCL_aEz3Xqxg'),
(43,43,'c_cXP_1R0jk:APA91bHMbQwShW1OKJuEophgzfic1sq42QrDnCndcNGVZxMTtDuvGecrVzwXlF6in8yx0jjrHqPinGBtXTImnq__lidDJKrI8zwffY745yj66RxCY6BHYNszETzlvwBwWnBidHaLSDX8'),
(44,44,'d_LcjNhahJo:APA91bHx530C75hrU4gK_4Yn4Kq3N-yC2fmtDgkDsBYnhw36wLUu8yI99kxFKf94q3WSZ2VBQh_FQIRm69ifL4Y2TAHlbd-LWyoXakHJyZe69J6HFZpK2Uc5jNDBl-NElOMHwuPyAm2M'),
(45,45,'abc');

/*Table structure for table `user_mobile_interest` */

DROP TABLE IF EXISTS `user_mobile_interest`;

CREATE TABLE `user_mobile_interest` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) DEFAULT NULL,
  `newsCategoryId` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;

/*Data for the table `user_mobile_interest` */

insert  into `user_mobile_interest`(`id`,`uid`,`newsCategoryId`) values 
(4,2,1),
(5,2,2),
(6,2,3),
(7,2,4),
(8,3,1),
(9,4,1),
(18,23,2),
(19,23,3),
(20,23,4),
(21,23,7),
(73,24,1),
(74,24,6),
(75,26,2),
(76,29,2),
(77,31,2),
(82,32,1),
(83,32,2),
(84,32,3),
(85,32,4),
(86,32,5),
(87,32,9),
(88,33,2),
(89,36,2),
(90,38,2),
(91,39,2),
(92,1,1);

/*Table structure for table `user_mobile_lucky_number` */

DROP TABLE IF EXISTS `user_mobile_lucky_number`;

CREATE TABLE `user_mobile_lucky_number` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_mobile_id` int(11) NOT NULL,
  `lucky_number` int(11) NOT NULL,
  `start_date_week` date DEFAULT NULL,
  `end_date_week` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=latin1;

/*Data for the table `user_mobile_lucky_number` */

insert  into `user_mobile_lucky_number`(`id`,`user_mobile_id`,`lucky_number`,`start_date_week`,`end_date_week`,`status`,`create_date`) values 
(69,1,129787,'2017-10-02','2017-10-08','INVALID','2017-10-02'),
(70,2,204254,'2017-10-02','2017-10-08','INVALID','2017-10-02'),
(71,3,817392,'2017-10-02','2017-10-08','VALID','2017-10-02'),
(72,4,336156,'2017-10-02','2017-10-08','VALID','2017-10-02'),
(73,5,649881,'2017-10-02','2017-10-08','VALID','2017-10-02'),
(74,6,329829,'2017-10-02','2017-10-08','INVALID','2017-10-02'),
(75,7,282232,'2017-10-02','2017-10-08','INVALID','2017-10-02'),
(76,17,562468,'2017-10-02','2017-10-08','INVALID','2017-10-02'),
(77,1,140256,'2017-10-09','2017-10-15','INVALID','2017-10-12'),
(78,2,943446,'2017-10-09','2017-10-15','INVALID','2017-10-12'),
(79,3,335890,'2017-10-09','2017-10-15','INVALID','2017-10-12'),
(80,4,827974,'2017-10-09','2017-10-15','INVALID','2017-10-12'),
(81,5,951188,'2017-10-09','2017-10-15','INVALID','2017-10-12'),
(82,6,992083,'2017-10-09','2017-10-15','INVALID','2017-10-12'),
(83,7,499083,'2017-10-09','2017-10-15','INVALID','2017-10-12'),
(84,17,837194,'2017-10-09','2017-10-15','INVALID','2017-10-12'),
(85,21,965589,'2017-10-09','2017-10-15','INVALID','2017-10-12'),
(86,22,498311,'2017-10-09','2017-10-15','INVALID','2017-10-12'),
(87,1,425663,'2017-10-09','2017-10-15','INVALID','2017-10-13'),
(88,2,963346,'2017-10-09','2017-10-15','INVALID','2017-10-13'),
(89,3,548988,'2017-10-09','2017-10-15','INVALID','2017-10-13'),
(90,4,728165,'2017-10-09','2017-10-15','INVALID','2017-10-13'),
(91,5,798086,'2017-10-09','2017-10-15','INVALID','2017-10-13'),
(92,6,667644,'2017-10-09','2017-10-15','INVALID','2017-10-13'),
(93,7,660910,'2017-10-09','2017-10-15','INVALID','2017-10-13'),
(94,17,158844,'2017-10-09','2017-10-15','INVALID','2017-10-13'),
(95,21,601883,'2017-10-09','2017-10-15','INVALID','2017-10-13'),
(96,22,394147,'2017-10-09','2017-10-15','INVALID','2017-10-13'),
(97,23,931420,'2017-10-09','2017-10-15','INVALID','2017-10-13'),
(98,1,749091,'2017-10-09','2017-10-15','INVALID','2017-10-14'),
(99,2,247437,'2017-10-09','2017-10-15','INVALID','2017-10-14'),
(100,3,749830,'2017-10-09','2017-10-15','INVALID','2017-10-14'),
(101,4,861623,'2017-10-09','2017-10-15','INVALID','2017-10-14'),
(102,5,716319,'2017-10-09','2017-10-15','INVALID','2017-10-14'),
(103,6,836467,'2017-10-09','2017-10-15','INVALID','2017-10-14'),
(104,7,640920,'2017-10-09','2017-10-15','INVALID','2017-10-14'),
(105,17,777547,'2017-10-09','2017-10-15','INVALID','2017-10-14'),
(106,21,313909,'2017-10-09','2017-10-15','INVALID','2017-10-14'),
(107,22,529031,'2017-10-09','2017-10-15','INVALID','2017-10-14'),
(108,23,821601,'2017-10-09','2017-10-15','INVALID','2017-10-14'),
(109,24,338744,'2017-10-09','2017-10-15','INVALID','2017-10-14'),
(110,25,490594,'2017-10-09','2017-10-15','INVALID','2017-10-14'),
(111,26,425933,'2017-10-09','2017-10-15','INVALID','2017-10-14'),
(112,1,746075,'2017-10-09','2017-10-15','INVALID','2017-10-15'),
(113,2,508089,'2017-10-09','2017-10-15','INVALID','2017-10-15'),
(114,3,424971,'2017-10-09','2017-10-15','INVALID','2017-10-15'),
(115,4,843542,'2017-10-09','2017-10-15','INVALID','2017-10-15'),
(116,5,745512,'2017-10-09','2017-10-15','INVALID','2017-10-15'),
(117,6,711515,'2017-10-09','2017-10-15','INVALID','2017-10-15'),
(118,7,442598,'2017-10-09','2017-10-15','INVALID','2017-10-15'),
(119,17,605103,'2017-10-09','2017-10-15','INVALID','2017-10-15'),
(120,21,465334,'2017-10-09','2017-10-15','INVALID','2017-10-15'),
(121,22,478903,'2017-10-09','2017-10-15','INVALID','2017-10-15'),
(122,23,213616,'2017-10-09','2017-10-15','INVALID','2017-10-15'),
(123,24,587211,'2017-10-09','2017-10-15','INVALID','2017-10-15'),
(124,25,908072,'2017-10-09','2017-10-15','INVALID','2017-10-15'),
(125,26,664525,'2017-10-09','2017-10-15','INVALID','2017-10-15'),
(126,27,804692,'2017-10-09','2017-10-15','INVALID','2017-10-15'),
(127,28,225270,'2017-10-09','2017-10-15','INVALID','2017-10-15'),
(128,29,831605,'2017-10-09','2017-10-15','INVALID','2017-10-15'),
(129,30,509395,'2017-10-09','2017-10-15','INVALID','2017-10-15'),
(130,31,501462,'2017-10-09','2017-10-15','INVALID','2017-10-15'),
(131,32,112096,'2017-10-09','2017-10-15','INVALID','2017-10-15'),
(132,1,458094,'2017-10-16','2017-10-22','INVALID','2017-10-16'),
(133,2,908689,'2017-10-16','2017-10-22','INVALID','2017-10-16'),
(134,3,467774,'2017-10-16','2017-10-22','INVALID','2017-10-16'),
(135,4,232827,'2017-10-16','2017-10-22','INVALID','2017-10-16'),
(136,5,303361,'2017-10-16','2017-10-22','INVALID','2017-10-16'),
(137,6,381040,'2017-10-16','2017-10-22','INVALID','2017-10-16'),
(138,7,224102,'2017-10-16','2017-10-22','INVALID','2017-10-16'),
(139,17,854081,'2017-10-16','2017-10-22','INVALID','2017-10-16'),
(140,21,195195,'2017-10-16','2017-10-22','INVALID','2017-10-16'),
(141,22,885544,'2017-10-16','2017-10-22','INVALID','2017-10-16'),
(142,23,339509,'2017-10-16','2017-10-22','INVALID','2017-10-16'),
(143,24,163407,'2017-10-16','2017-10-22','INVALID','2017-10-16'),
(144,25,915529,'2017-10-16','2017-10-22','INVALID','2017-10-16'),
(145,26,541799,'2017-10-16','2017-10-22','INVALID','2017-10-16'),
(146,27,367280,'2017-10-16','2017-10-22','INVALID','2017-10-16'),
(147,28,663600,'2017-10-16','2017-10-22','INVALID','2017-10-16'),
(148,29,565999,'2017-10-16','2017-10-22','INVALID','2017-10-16'),
(149,30,705494,'2017-10-16','2017-10-22','INVALID','2017-10-16'),
(150,31,272829,'2017-10-16','2017-10-22','INVALID','2017-10-16'),
(151,32,236178,'2017-10-16','2017-10-22','INVALID','2017-10-16'),
(152,1,561325,'2017-10-16','2017-10-22','INVALID','2017-10-17'),
(153,2,129373,'2017-10-16','2017-10-22','INVALID','2017-10-17'),
(154,3,932383,'2017-10-16','2017-10-22','INVALID','2017-10-17'),
(155,4,403704,'2017-10-16','2017-10-22','INVALID','2017-10-17'),
(156,5,562814,'2017-10-16','2017-10-22','INVALID','2017-10-17'),
(157,6,863935,'2017-10-16','2017-10-22','INVALID','2017-10-17'),
(158,7,564468,'2017-10-16','2017-10-22','INVALID','2017-10-17'),
(159,17,567196,'2017-10-16','2017-10-22','INVALID','2017-10-17'),
(160,21,999457,'2017-10-16','2017-10-22','INVALID','2017-10-17'),
(161,22,912635,'2017-10-16','2017-10-22','INVALID','2017-10-17'),
(162,23,660924,'2017-10-16','2017-10-22','INVALID','2017-10-17'),
(163,24,352518,'2017-10-16','2017-10-22','INVALID','2017-10-17'),
(164,25,640024,'2017-10-16','2017-10-22','INVALID','2017-10-17'),
(165,26,870222,'2017-10-16','2017-10-22','INVALID','2017-10-17'),
(166,27,816368,'2017-10-16','2017-10-22','INVALID','2017-10-17'),
(167,28,595060,'2017-10-16','2017-10-22','INVALID','2017-10-17'),
(168,29,247584,'2017-10-16','2017-10-22','INVALID','2017-10-17'),
(169,30,848147,'2017-10-16','2017-10-22','INVALID','2017-10-17'),
(170,31,315804,'2017-10-16','2017-10-22','INVALID','2017-10-17'),
(171,32,975505,'2017-10-16','2017-10-22','INVALID','2017-10-17'),
(172,1,665983,'2017-10-16','2017-10-22','INVALID','2017-10-18'),
(173,2,206783,'2017-10-16','2017-10-22','INVALID','2017-10-18'),
(174,3,260077,'2017-10-16','2017-10-22','INVALID','2017-10-18'),
(175,4,881291,'2017-10-16','2017-10-22','INVALID','2017-10-18'),
(176,5,124204,'2017-10-16','2017-10-22','INVALID','2017-10-18'),
(177,6,668304,'2017-10-16','2017-10-22','INVALID','2017-10-18'),
(178,7,240858,'2017-10-16','2017-10-22','INVALID','2017-10-18'),
(179,17,382829,'2017-10-16','2017-10-22','INVALID','2017-10-18'),
(180,21,437502,'2017-10-16','2017-10-22','INVALID','2017-10-18'),
(181,22,728823,'2017-10-16','2017-10-22','INVALID','2017-10-18'),
(182,23,936620,'2017-10-16','2017-10-22','INVALID','2017-10-18'),
(183,24,459272,'2017-10-16','2017-10-22','INVALID','2017-10-18'),
(184,25,949088,'2017-10-16','2017-10-22','INVALID','2017-10-18'),
(185,26,687615,'2017-10-16','2017-10-22','INVALID','2017-10-18'),
(186,27,627019,'2017-10-16','2017-10-22','INVALID','2017-10-18'),
(187,28,511741,'2017-10-16','2017-10-22','INVALID','2017-10-18'),
(188,29,504218,'2017-10-16','2017-10-22','INVALID','2017-10-18'),
(189,30,858699,'2017-10-16','2017-10-22','INVALID','2017-10-18'),
(190,31,294567,'2017-10-16','2017-10-22','INVALID','2017-10-18'),
(191,32,451827,'2017-10-16','2017-10-22','INVALID','2017-10-18'),
(192,1,647867,'2017-10-16','2017-10-22','INVALID','2017-10-19'),
(193,2,527212,'2017-10-16','2017-10-22','INVALID','2017-10-19'),
(194,3,217399,'2017-10-16','2017-10-22','INVALID','2017-10-19'),
(195,4,432978,'2017-10-16','2017-10-22','INVALID','2017-10-19'),
(196,5,995681,'2017-10-16','2017-10-22','INVALID','2017-10-19'),
(197,6,791780,'2017-10-16','2017-10-22','INVALID','2017-10-19'),
(198,7,821548,'2017-10-16','2017-10-22','INVALID','2017-10-19'),
(199,17,425326,'2017-10-16','2017-10-22','INVALID','2017-10-19'),
(200,21,625356,'2017-10-16','2017-10-22','INVALID','2017-10-19'),
(201,22,986753,'2017-10-16','2017-10-22','INVALID','2017-10-19'),
(202,23,196261,'2017-10-16','2017-10-22','INVALID','2017-10-19'),
(203,24,212312,'2017-10-16','2017-10-22','INVALID','2017-10-19'),
(204,25,976524,'2017-10-16','2017-10-22','INVALID','2017-10-19'),
(205,26,545619,'2017-10-16','2017-10-22','INVALID','2017-10-19'),
(206,27,955182,'2017-10-16','2017-10-22','INVALID','2017-10-19'),
(207,28,872370,'2017-10-16','2017-10-22','INVALID','2017-10-19'),
(208,29,580466,'2017-10-16','2017-10-22','INVALID','2017-10-19'),
(209,30,720264,'2017-10-16','2017-10-22','INVALID','2017-10-19'),
(210,31,317033,'2017-10-16','2017-10-22','INVALID','2017-10-19'),
(211,32,920374,'2017-10-16','2017-10-22','INVALID','2017-10-19'),
(212,1,159127,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(213,2,625481,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(214,3,581057,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(215,4,544490,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(216,5,775977,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(217,6,720744,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(218,7,819371,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(219,17,432365,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(220,21,920834,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(221,22,715250,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(222,23,639491,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(223,24,126611,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(224,25,170591,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(225,26,617269,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(226,27,434250,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(227,28,147092,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(228,29,116092,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(229,30,294515,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(230,31,307750,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(231,32,622380,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(232,33,135240,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(233,34,582192,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(234,35,798080,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(235,36,323008,'2017-10-16','2017-10-22','INVALID','2017-10-20'),
(236,1,285040,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(237,2,623644,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(238,3,781075,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(239,4,939973,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(240,5,320483,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(241,6,472146,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(242,7,998979,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(243,17,919740,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(244,21,355488,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(245,22,954358,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(246,23,385703,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(247,24,149833,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(248,25,798317,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(249,26,200107,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(250,27,792162,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(251,28,537678,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(252,29,743785,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(253,30,773616,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(254,31,827517,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(255,32,797071,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(256,33,147581,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(257,34,442644,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(258,35,740471,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(259,36,554497,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(260,37,204580,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(261,38,950410,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(262,39,919111,'2017-10-16','2017-10-22','INVALID','2017-10-21'),
(263,1,560142,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(264,2,468849,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(265,3,535983,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(266,4,207200,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(267,5,473287,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(268,6,957906,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(269,7,963732,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(270,17,844034,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(271,21,618501,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(272,22,912317,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(273,23,874413,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(274,24,975127,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(275,25,449965,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(276,26,993059,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(277,27,176424,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(278,28,150945,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(279,29,997040,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(280,30,985157,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(281,31,421840,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(282,32,944691,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(283,33,498762,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(284,34,879597,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(285,35,327147,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(286,36,804396,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(287,37,644186,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(288,38,164161,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(289,39,437025,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(290,40,762626,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(291,41,587906,'2017-10-16','2017-10-22','INVALID','2017-10-22'),
(292,1,432997,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(293,2,679627,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(294,3,218470,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(295,4,136525,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(296,5,217265,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(297,6,545753,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(298,7,783138,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(299,17,694080,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(300,21,319365,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(301,22,267658,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(302,23,345554,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(303,24,626906,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(304,25,339595,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(305,26,122303,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(306,27,715950,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(307,28,848583,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(308,29,436822,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(309,30,281107,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(310,31,839770,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(311,32,196001,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(312,33,193264,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(313,34,176007,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(314,35,549689,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(315,36,946747,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(316,37,786046,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(317,38,185419,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(318,39,269580,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(319,40,343724,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(320,41,191042,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(321,42,665672,'2017-10-23','2017-10-29','INVALID','2017-10-23'),
(322,1,972726,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(323,2,121587,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(324,3,520772,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(325,4,892295,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(326,5,282068,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(327,6,423867,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(328,7,881209,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(329,17,220521,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(330,21,565750,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(331,22,285576,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(332,23,612614,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(333,24,297823,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(334,25,194158,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(335,26,274601,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(336,27,376091,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(337,28,541928,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(338,29,631439,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(339,30,281324,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(340,31,992315,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(341,32,532389,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(342,33,638386,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(343,34,901600,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(344,35,229752,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(345,36,537952,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(346,37,190038,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(347,38,590215,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(348,39,971498,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(349,40,723950,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(350,41,264471,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(351,42,145679,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(352,43,931912,'2017-10-23','2017-10-29','INVALID','2017-10-24'),
(353,1,230966,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(354,2,441849,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(355,3,567607,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(356,4,700524,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(357,5,191306,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(358,6,556913,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(359,7,179255,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(360,17,518861,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(361,21,244030,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(362,22,191095,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(363,23,430501,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(364,24,705380,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(365,25,303841,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(366,26,109107,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(367,27,123810,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(368,28,466306,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(369,29,691254,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(370,30,266442,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(371,31,553650,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(372,32,163829,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(373,33,972086,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(374,34,863990,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(375,35,971372,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(376,36,547851,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(377,37,268084,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(378,38,652873,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(379,39,282274,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(380,40,419248,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(381,41,496063,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(382,42,182976,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(383,43,473144,'2017-10-23','2017-10-29','INVALID','2017-10-25'),
(384,1,969517,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(385,2,859473,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(386,3,459351,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(387,4,684923,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(388,5,621387,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(389,6,518989,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(390,7,499792,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(391,17,168644,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(392,21,884627,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(393,22,621215,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(394,23,718616,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(395,24,697050,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(396,25,855920,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(397,26,102295,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(398,27,731661,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(399,28,725706,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(400,29,640636,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(401,30,847910,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(402,31,197260,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(403,32,153400,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(404,33,359512,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(405,34,987262,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(406,35,753025,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(407,36,415718,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(408,37,601454,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(409,38,976478,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(410,39,611153,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(411,40,763285,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(412,41,864158,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(413,42,923249,'2017-10-23','2017-10-29','INVALID','2017-10-26'),
(414,43,198410,'2017-10-23','2017-10-29','INVALID','2017-10-26');

/*Table structure for table `user_mobile_msb` */

DROP TABLE IF EXISTS `user_mobile_msb`;

CREATE TABLE `user_mobile_msb` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dob` int(10) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `earning` bigint(20) NOT NULL DEFAULT '0',
  `inviteCode` varchar(20) DEFAULT NULL,
  `inviteCodeUsed` varchar(20) DEFAULT NULL,
  `isRewardForUserInvite` tinyint(4) DEFAULT '0',
  `status` varchar(10) DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `user_mobile_msb` */

insert  into `user_mobile_msb`(`id`,`username`,`gender`,`dob`,`location`,`earning`,`inviteCode`,`inviteCodeUsed`,`isRewardForUserInvite`,`status`,`createdDate`) values 
(1,'tungnv1234@gmail.com','MALE',1982,'HAN',22020,'invitecode1','SQXGWOBQ',0,'ACTIVE','2017-09-12 16:49:02'),
(2,'email2@gmail.com','MALE',1983,NULL,12000,'invitecode2','invitecode1',1,'ACTIVE','2017-09-12 16:49:14'),
(3,'email3@gmail.com','MALE',1990,NULL,2000,'invitecode3','invitecode1',1,'ACTIVE','2017-09-12 16:49:15'),
(4,'email4@gmail.com','FEMALE',1992,'HN',2000,'invitecode4','invitecode2',1,'ACTIVE','2017-09-12 16:49:16'),
(5,'abcd1','MALE',1982,'HN',0,NULL,NULL,0,'ACTIVE','2017-09-16 23:13:50'),
(6,'abcd','MALE',1982,'HN',0,NULL,NULL,0,'ACTIVE','2017-09-16 23:36:53'),
(7,'abcd','MALE',1982,'HN',0,NULL,NULL,0,'ACTIVE','2017-09-16 23:55:13'),
(17,'abcd','MALE',1982,'HN',2000,'SQXGWOBQ','invitecode2',0,'ACTIVE','2017-09-22 12:53:33'),
(22,'tqlong.net@gmail.com','MALE',1984,'hanoi',2000,'wtOKJwQe',NULL,0,'ACTIVE','2017-10-06 09:58:29'),
(23,'user1',NULL,0,NULL,2000,'y7L4zHDV','invitecode1',0,'ACTIVE','2017-10-11 09:51:18');

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_role` */

insert  into `user_role`(`user_id`,`role_id`) values 
(23,2),
(24,2),
(10,3),
(22,3),
(25,3);

/*Table structure for table `voucher` */

DROP TABLE IF EXISTS `voucher`;

CREATE TABLE `voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `legacyId` varchar(100) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `description` longtext CHARACTER SET utf8,
  `marketPrice` double DEFAULT '0',
  `price` double DEFAULT '0',
  `quantity` int(11) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'NEW',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pointExchange` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `voucher` */

insert  into `voucher`(`id`,`legacyId`,`name`,`type`,`picture`,`description`,`marketPrice`,`price`,`quantity`,`status`,`createdDate`,`pointExchange`) values 
(1,NULL,'Yukssam BBQ: Check-in VÃ  ThÆ°á»Ÿng Buffet NÆ°á»›ng Chuáº©n Vá»‹ HÃ n Giá»¯a LÃ²ng HÃ  Ná»™i','PHYSICAL_VOUCHER','http://222.252.16.132:8080/loyalty/voucher/yukssam1.jpg','Äiá»u kiá»‡n sá»­ dá»¥ng Thá»i háº¡n sá»­ dá»¥ng voucher: 29/12/2017 Ãp dá»¥ng cho Buffet: Menu 299k buffet nÆ°á»›ng háº£i sáº£n chuáº©n HÃ n Quá»‘c táº¡i Yukssam BBQ â€“ Cáº£ ngÃ y. Thá»i gian sá»­ dá»¥ng: TrÆ°a tá»« 11h00 - 14h00, tá»‘i tá»« 17h00 - 21h00 tá»« thá»© 2 Ä‘áº¿n thá»© 6 hÃ ng tuáº§n. KhÃ´ng Ã¡p dá»¥ng thá»© 7 vÃ  Chá»§ Nháº­t. Voucher chÆ°a bao gá»“m VAT. CÃ¡c ngÃ y Lá»… Ä‘Æ°á»£c Ã¡p dá»¥ng voucher: 20/11/2017 Sá»‘ lÆ°á»£ng Voucher Ã¡p dá»¥ng: 01 voucher/01 ngÆ°á»i/01 suáº¥t buffet. NhÃ  hÃ ng phá»¥c vá»¥ bÃ n tá»« 02 khÃ¡ch hÃ ng trá»Ÿ lÃªn. Sá»‘ lÆ°á»£ng voucher sá»­ dá»¥ng tá»‘i Ä‘a: KhÃ´ng giÆ¡Ìi haÌ£n voucher/HoÌa Ä‘Æ¡n thanh toaÌn KhÃ¡ch hÃ ng cÃ³ thá»ƒ mua nhiá»u voucher Ä‘á»ƒ sá»­ dá»¥ng nhiá»u láº§n ChÃ­nh sÃ¡ch dÃ nh cho tráº» em: Tráº» dÆ°á»›i 1m: Miá»…n phÃ­. Tráº» tá»« 1m Ä‘áº¿n 1,3m: Phá»¥ thu 150.000 VND/ 01 tráº» (chÆ°a bao gá»“m VAT, thanh toÃ¡n trá»±c tiáº¿p táº¡i nhÃ  hÃ ng). Tráº» em trÃªn 1,3m: TÃ­nh phÃ­ nhÆ° ngÆ°á»i lá»›n. Bao gá»“m: Thá»©c Äƒn theo Menu Ä‘Ã­nh kÃ¨m Â  Äiá»u kiá»‡n khÃ¡c: NhÃ  hÃ ng phá»¥c vá»¥ bÃ n tá»« 02 khÃ¡ch hÃ ng trá»Ÿ lÃªn. KhÃ´ng Ã¡p dá»¥ng mang Ä‘á»“ uá»‘ng bÃªn ngoÃ i vÃ o nhÃ  hÃ ng, náº¿u mang sáº½ bá»‹ tÃ­nh phÃ­. Vui lÃ²ng liÃªn há»‡ nhÃ  hÃ ng Ä‘á»ƒ biáº¿t thÃªm chi tiáº¿t. NhÃ  hÃ ng chÆ°a cÃ³ chá»— Ä‘á»ƒ xe Ã´tÃ´, khÃ¡ch hÃ ng vui lÃ²ng di chuyá»ƒn báº±ng phÆ°Æ¡ng tiá»‡n taxi hoáº·c xe mÃ¡y. NhÃ  hÃ ng chá»‹u trÃ¡ch nhiá»‡m xuáº¥t hoÃ¡ Ä‘Æ¡n tÃ i chÃ­nh theo giÃ¡ bÃ¡n voucher vÃ  giÃ¡ trá»‹ vÆ°á»£t trá»™i khi khÃ¡ch hÃ ng yÃªu cáº§u Äiá»u kiá»‡n hÃ³a Ä‘Æ¡n: KhÃ¡ch hÃ ng vui lÃ²ng thanh toÃ¡n thÃªm VAT khi cÃ³ nhu cáº§u xuáº¥t hÃ³a Ä‘Æ¡n. KhÃ´ng Ã¡p dá»¥ng cho mua mang vá» KhÃ´ng Ã¡p dá»¥ng cho cÃ¡c chÆ°Æ¡ng trÃ¬nh khuyáº¿n mÃ£i khÃ¡c KhÃ´ng cÃ³ giÃ¡ trá»‹ quy Ä‘á»•i thÃ nh tiá»n, khÃ´ng hoÃ n tráº£ tiá»n thá»«a KhÃ¡ch hÃ ng vui lÃ²ng liÃªn há»‡ trÆ°á»›c khi Ä‘áº¿n Ä‘á»ƒ Ä‘Æ°á»£c phá»¥c vá»¥ tá»‘t nháº¥t ThÃ´ng tin Ä‘áº·t háº¹n: 024.3232.3222/0984.001.670. KhÃ¡ch hÃ ng báº¯t buá»™c Ä‘áº·t chá»— trÆ°á»›c khi Ä‘áº¿n Ä‘á»ƒ Ä‘Æ°á»£c phá»¥c vá»¥ tá»‘t nháº¥t. TrÃ¡nh trÆ°á»ng há»£p nhÃ  hÃ ng full chá»— khÃ´ng thá»ƒ phá»¥c vá»¥ Ä‘Æ°á»£c. Xem báº£ng giÃ¡ chi tiáº¿t ThÃ´ng tin chi tiáº¿t ChÃºng tÃ´i ráº¥t vui khi Ä‘Æ°á»£c ká»ƒ cho báº¡n nghe nhá»¯ng cÃ¢u chuyá»‡n vá» YUKSSAM â€œMá»™t Ä‘áº§u báº¿p ná»•i tiáº¿ng Ä‘Ã£ tá»«ng nÃ³i áº©m thá»±c HÃ n Quá»‘c lÃ  sá»± â€œtrung thá»±câ€ bá»Ÿi vÃ¬ vá»›i mÃ³n Äƒn HÃ n thÃ¬ gia giáº£m dÃ¹ chá»‰ 0,01% cÅ©ng Ä‘Ã£ lÃ m hÆ°Æ¡ng vá»‹ hoÃ n toÃ n thay Ä‘á»•i. Tuy nhiÃªn khi Ä‘áº¿n vá»›i nhá»¯ng vÃ¹ng Ä‘áº¥t má»›i, nhiá»u mÃ³n Äƒn HÃ n Quá»‘c Ä‘Ã£ biáº¿n táº¥u Ä‘á»ƒ phÃ¹ há»£p vá»›i thá»±c khÃ¡ch nÆ¡i Ä‘Ã³, khiáº¿n hÆ°Æ¡ng vá»‹ truyá»n thá»‘ng khÃ´ng cÃ²n nguyÃªn váº¹n. LÃ  má»™t ngÆ°á»i con xa xá»©, tÃ´i luÃ´n kháº¯c khoáº£i tÃ¬m kiáº¿m hÆ°Æ¡ng vá»‹ quÃª hÆ°Æ¡ng vÃ  nuÃ´i hi vá»ng xÃ¢y dá»±ng má»™t khÃ´ng gian Ä‘á»ƒ nhá»¯ng ngÆ°á»i HÃ n Quá»‘c cáº£m tháº¥y Ä‘Æ°á»£c trá»Ÿ vá», vÃ  nhá»¯ng ngÆ°á»i Viá»‡t hiá»ƒu sÃ¢u sáº¯c hÆ¡n vá» vÄƒn hoÃ¡ áº©m thá»±c cá»§a chÃºng tÃ´i. Bá»Ÿi váº­y YUKSSAM ra Ä‘á»i -Â Má»™t nÆ¡i mÃ  chÃºng tÃ´i cÃ³ thá»ƒ gá»i lÃ :Â \"HOME AWAYS FROM HOMEâ€ Â  Â  Â  Â  Â  Â  Â  ÄÃ³ chÃ­nh lÃ  nhá»¯ng chia sáº» tá»« anh JUNG WOO SEUNG - SÃ¡ng láº­p nhÃ  hÃ ng Yukssam. Báº¯t Ä‘áº§u tá»« ná»—i nhá»› quÃª hÆ°Æ¡ng, Yukssam Ä‘Ã£ Ä‘Æ°á»£c xÃ¢y dá»±ng nhÆ° má»™t Ä‘á»‹a chá»‰ khÃ´ng chá»‰ Ä‘á»ƒ thÆ°á»Ÿng thá»©c áº©m thá»±c, mÃ  cÃ²n lÃ  nÆ¡i báº¡n sáº½ Ä‘Æ°á»£c táº­n hÆ°á»Ÿng trá»n váº¹n nhá»¯ng phong vá»‹ tá»« xá»© sá»Ÿ Kim Chi. Yukssam hy vá»ng sáº½ mang Ä‘áº¿n háº¡nh phÃºc Ä‘áº¿n vá»›i má»—i thá»±c khÃ¡ch thÃ´ng qua nhá»¯ng mÃ³n Äƒn tÆ°Æ¡i ngon, thuáº§n vá»‹ HÃ n Quá»‘c.Â  Â  Â  Náº¡c vai heo sá»‘t muá»‘i Â  â€œMá»™t mÃ³n Äƒn ngon chá»‰ cÃ³ thá»ƒ Ä‘Æ°á»£c lÃ m tá»« má»™t nhÃ  hÃ ng sáº¡ch. Vá»›i quan Ä‘iá»ƒm Ä‘Ã³, nÃªn Ä‘á»‘i vá»›i áº©m thá»±c HÃ n Quá»‘c, yáº¿u tá»‘ vá»‡ sinh luÃ´n Ä‘Æ°á»£c Ä‘áº·t lÃªn vá»‹ trÃ­ hÃ ng Ä‘áº§u. Bá»Ÿi váº­y, chÃºng tÃ´i luÃ´n chÃº trá»ng lá»±a chá»n nguyÃªn liá»‡u tÆ°Æ¡i ngonÂ Ä‘á»ƒ mang Ä‘áº¿n cho thá»±c khÃ¡ch nhá»¯ng mÃ³n Äƒn Ä‘áº£m báº£o. Khi báº¡n lá»±a chá»n Yukssam lÃ  Ä‘Ã£ Ä‘áº·t sá»± tin tÆ°á»Ÿng vÃ o chÃºng tÃ´i vÃ  chÃºng tÃ´i sáº½ Ä‘Ã¡p láº¡i báº±ng cáº£ táº¥m lÃ²ngâ€ - Báº¿p trÆ°á»Ÿng Kim So Young chia sáº». Â  Â  Thá»‹t bÃ² cuá»‘n Ä‘áº­u báº¯p Â  Mang Ä‘áº¿n thá»±c Ä‘Æ¡n buffet cháº¥t lÆ°á»£ng Ä‘áº¿n tá»«ng chi tiáº¿t - Yukssam khÃ´ng cÃ³ quÃ¡ nhiá»u mÃ³n Äƒn, nhÆ°ng nhÃ  hÃ ng chÃº trá»ng lÃ m trÃ²n vá»‹ Ä‘áº¿n tá»«ng mÃ³n nhá». CÃ¡c mÃ³n Äƒn Ä‘á»u Ä‘Æ°á»£c cháº¿ biáº¿n theo chuáº©n hÆ°Æ¡ng vá»‹ HÃ n, vá»›i cÃ¡c mÃ³n chÃ­nh pháº£i ká»ƒ Ä‘áº¿n nhÆ° náº¡c vai heo sá»‘t muá»‘i, thá»‹t dáº» sÆ°á»n nÆ°á»›ng, diá»m thÄƒn heo, ba chá»‰ heo táº©m sá»‘tâ€¦Â Trong má»™t bá»¯a tiá»‡c buffet, bao giá» mÃ³n nÆ°á»›ng Ä‘Æ°á»£c táº©m sá»‘t theo bÃ­ quyáº¿t riÃªng cá»§a nhÃ  hÃ ng cÅ©ng lÃ  mÃ³n Ä‘Æ°á»£c mong chá». BÃ­ quyáº¿t Ä‘á»ƒ cÃ³ mÃ³n nÆ°á»›ng ngon lÃ  nguyÃªn liá»‡u pháº£i tÆ°Æ¡i ngon, pháº§n sá»‘t Ä‘iá»u cháº¿ gia giáº£m há»£p lÃ½, thá»i gian táº©m Æ°á»›p Ä‘á»§ ngáº¥m. Yukssam vá»›i kinh nghiá»‡m áº©m thá»±c cá»§a mÃ¬nh luÃ´n tá»± tin vÃ o tay nghá» cá»§a Ä‘áº§u báº¿p, cÃ¡c mÃ³n nÆ°á»›ng khÃ´ng lÃ m máº¥t Ä‘i sá»± tÆ°Æ¡i ngon vÃ  ngá»t tá»± nhiÃªn cá»§a thá»±c pháº©m. CÃ¡c mÃ³n nÆ°á»›ng thÆ°á»ng Ä‘Æ°á»£c cuá»‘n cÃ¹ng xÃ  lÃ¡ch xoÄƒn, cháº¥m ngáº­p trong sá»‘t cháº¥m vÃ  thÆ°á»Ÿng thá»©c.Â  Â  Â  SÆ°á»n heo táº©m sá»‘t Yukssam Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Thá»‹t chÃ¢n giÃ² sá»‘t Bulgogi Â  Â  Â  Â  GÃ  nÆ°á»›ng sá»‘t cay Â  Â  Â  Â  Ba chá»‰ heo táº©m sá»‘t HÃ n Quá»‘c Â  Â  Â  Â  Â  Â  Â  Ngao nÆ°á»›ng Â  Â  Â  Â  TÃ´m táº©m Æ°á»›p Â  Â  Â  Â  Â  Â  Â  ThÆ°á»Ÿng thá»©c thá»‹t nÆ°á»›ng Ä‘Ãºng kiá»ƒu HÃ n, báº¡n sáº½ gÃ³i ghÃ©m thá»‹t trong xÃ  lÃ¡ch xoÄƒn, cháº¥m ngáº­p sá»‘t vÃ  thÆ°á»Ÿng thá»©c Â  Â  Â  Â  Äiá»ƒm ná»•i báº­t cá»§a áº©m thá»±c HÃ n lÃ  má»—i vÃ¹ng miá»n, má»—i mÃ¹a Ä‘á»u cÃ³ nhá»¯ng mÃ³n Äƒn riÃªng Ä‘á»™c Ä‘Ã¡o. NguyÃªn liá»‡u mÃ³n Äƒn thÆ°á»ng Ä‘a dáº¡ng, tá»« cÃ¡c loáº¡i thá»‹t, háº£i sáº£n, rau cá»§, cÃ¡c loáº¡i gia vá»‹, tháº£o má»™câ€¦ MÃ³n Äƒn cÅ©ng mang nhiá»u mÃ u sáº¯c nhÆ° mÃ u vÃ ng cá»§a trá»©ng, Ä‘á» cá»§a tÆ°Æ¡ng á»›t, xanh cá»§a rau, Ä‘á» cá»§a thá»‹t tÆ°Æ¡i, tráº¯ng cá»§a náº¥mâ€¦ nhÆ° má»™t bá»©c tranh Ä‘a sáº¯c mÃ u. Äáº·c biá»‡t, mang Ä‘áº¿n bá»¯a Äƒn chuáº©n vá»‹ HÃ n Quá»‘c, Yukssam ráº¥t Ä‘a dáº¡ng cÃ¡c mÃ³n panchan vÃ  cÃ¡c mÃ³n Äƒn kÃ¨m khÃ¡c. CÃ¡c mÃ³n Äƒn khi káº¿t há»£p vá»›i nhau sáº½ tÄƒng thÃªm hÆ°Æ¡ng vá»‹, Ä‘á»™ Ä‘áº­m Ä‘Ã  vÃ  tá»‘t cho sá»©c khá»e. Â  Â  Canh kim chi vÃ  cÃ¡c loáº¡i panchan Äƒn kÃ¨m Â  Â  Â  Â  CÆ¡m trá»™n bÃ¡t Ä‘Ã¡ Â  Â  Â  Â  Sá»¥n heo nÆ°á»›ng sá»‘t cay Â  Â  Â  Â  Trá»©ng háº¥p kiá»ƒu HÃ n Â  Â  Â  Â  White Salad Â  Â  Â  Â  CÆ¡m rang kim chi Â  Â  Â  Â  Â  Â  Â  Miáº¿n trá»™n HÃ n Quá»‘c Â  Â  Â  Â  Náº¥m tá»•ng há»£p Â  Â  Â  Â  Giá»›i thiá»‡u NhÃ  hÃ ng Yukssam Ra Ä‘á»i tá»« ná»—i niá»m thÆ°Æ¡ng nhá»› quÃª hÆ°Æ¡ng, NhÃ  hÃ ng Yukssam lÃ  Ä‘á»‹a chá»‰ áº©m thá»±c hiáº¿m hoi mang Ä‘áº¿n hÆ°Æ¡ng vá»‹ HÃ n Quá»‘c nguyÃªn báº£n - khÃ´ng trá»™n láº«n cho thá»±c khÃ¡ch á»Ÿ HÃ  Ná»™i. Ngay khi bÆ°á»›c chÃ¢n tá»›i Yukssam, thá»±c khÃ¡ch Ä‘á»u cÃ³ thá»ƒ cáº£m nháº­n nhÆ° bÆ°á»›c vÃ o má»™t xá»© sá»Ÿ kim chi thu nhá». Sá»©c hÃºt cá»§a Yukssam khÃ´ng chá»‰ Ä‘áº¿n tá»« cÃ¡c mÃ³n Äƒn Ä‘áº­m Ä‘Ã  báº£n sáº¯c, mÃ  cÃ²n lÃ  nhá»¯ng tráº£i nghiá»‡m tháº­t sá»± vá» di sáº£n vÄƒn hÃ³a HÃ n Quá»‘c ngay giá»¯a lÃ²ng thá»§ Ä‘Ã´. Má»™t cáº£m giÃ¡c thÆ° thÃ¡i, má»™t tráº£i nghiá»‡m thÃº vá»‹ Ä‘ang Ä‘Ã³n chá» thá»±c khÃ¡ch táº¡i NhÃ  hÃ ng Yukssam.Â  Â  Â  Â  Â  KhÃ´ng chá»‰ thÃ nh cÃ´ng trong cháº¥t lÆ°á»£ng mÃ³n Äƒn, khi Ä‘áº¿n Ä‘Ã¢y thá»±c khÃ¡ch cÃ²n hÃ i lÃ²ng vá»›i cung cÃ¡ch phá»¥c vá»¥ táº­n tÃ¢m vÃ  chuyÃªn nghiá»‡p cá»§a nhÃ¢n viÃªn nhÃ  hÃ ng. ChÃ­nh vÃ¬ láº½ Ä‘Ã³ mÃ  nhÃ  hÃ ng Yukssam lÃ  Ä‘iá»ƒm háº¹n áº©m thá»±c lÃ½ tÆ°á»Ÿng Ä‘á»ƒ báº¡n cÃ¹ng ngÆ°á»i thÃ¢n, báº¡n bÃ¨ Ä‘áº¿n tráº£i nghiá»‡m hÆ°Æ¡ng vá»‹ tinh tÃºy cá»§a áº©m thá»±c HÃ n Quá»‘c ngay giá»¯a lÃ²ng HÃ  Ná»™i. Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  KhÃ¡ch hÃ ng vui lÃ²ng Ä‘áº·t chá»— trÆ°á»›c Ä‘á»ƒ Ä‘Æ°á»£c phá»¥c vá»¥ chu Ä‘Ã¡o!',254000,249000,82,'ACTIVE','2017-12-05 09:50:57',5000),
(3,NULL,'ChÆ°a Tá»›i 50K/N CÃ¹ng ThÆ°á»Ÿng Thá»©c Set Láº©u RiÃªu Cua Báº¯p BÃ² Cho 4 - 6N Táº¡i NH Tre BÃ£i ÄÃ¡','PHYSICAL_VOUCHER','http://222.252.16.132:8080/loyalty/voucher/trebaida1.jpg','Äiá»u kiá»‡n sá»­ dá»¥ng Thá»i háº¡n sá»­ dá»¥ng voucher: 09/01/2018 Ãp dá»¥ng cho: Set láº©u riÃªu cua báº¯p bÃ² dÃ nh cho tá»« 4 - 6N táº¡i nhÃ  hÃ ng Tre BÃ£i ÄÃ¡. Set Äƒn gá»“m: Cá»§ quáº£ luá»™c: 01 Ä‘Ä©a; NgÃ´ chiÃªn: 01 Ä‘Ä©a; Ná»™m hoa chuá»‘i tai lá»£n: 01 Ä‘Ä©a; áº¾ch xÃ o lÄƒn: 01 Ä‘Ä©a; Láº©u riÃªu cua báº¯p bÃ²: Báº¯p bÃ²: 380gram; Cua xay: 380gram; BÃºn: 01 Ä‘Ä©a Äƒn kÃ¨m rau Äƒn láº©u vÃ  hoa chuá»‘i Thá»i gian phá»¥c vá»¥: TrÆ°a tá»« 11h00 - 14h00, tá»‘i tá»« 17h00 Ä‘áº¿n 22h00 táº¥t cáº£ cÃ¡c ngÃ y trong tuáº§n. KhÃ´ng Ã¡p dá»¥ng cho cÃ¡c ngÃ y lá»…: 20/11, 24/12, 31/12, 1/1/2018 Sá»‘ lÆ°á»£ng voucher Ã¡p dá»¥ng: 01 voucher/ 01 set dÃ nh cho 04 - 06 ngÆ°á»i Sá»‘ lÆ°á»£ng voucher sá»­ dá»¥ng tá»‘i Ä‘a: KhÃ´ng giá»›i háº¡n voucher/ hÃ³a Ä‘Æ¡n thanh toÃ¡n KhÃ¡ch hÃ ng cÃ³ thá»ƒ mua nhiá»u voucher Ä‘á»ƒ sá»­ dá»¥ng nhiá»u láº§n Ãp dá»¥ng cho Äƒn táº¡i chá»— KhÃ´ng Ã¡p dá»¥ng cho cÃ¡c chÆ°Æ¡ng trÃ¬nh khuyáº¿n mÃ£i khÃ¡c KhÃ´ng cÃ³ giÃ¡ trá»‹ quy Ä‘á»•i thÃ nh tiá»n, khÃ´ng hoÃ n tráº£ tiá»n thá»«a Voucher chÆ°a bao gá»“m VAT NhÃ  hÃ ng chá»‹u trÃ¡ch nhiá»‡m xuáº¥t hoÃ¡ Ä‘Æ¡n tÃ i chÃ­nh theo giÃ¡ bÃ¡n voucher vÃ  giÃ¡ trá»‹ vÆ°á»£t trá»™i khi khÃ¡ch hÃ ng yÃªu cáº§u Äiá»u kiá»‡n hÃ³a Ä‘Æ¡n: KhÃ¡ch hÃ ng vui lÃ²ng thanh toÃ¡n thÃªm VAT khi cÃ³ nhu cáº§u xuáº¥t hÃ³a Ä‘Æ¡n. ThÃ´ng tin Ä‘áº·t háº¹n: 024.62913798 - 0911581818. QuÃ½ khÃ¡ch hÃ ng vui lÃ²ng liÃªn há»‡ trÆ°á»›c khi Ä‘áº¿n sá»­ dá»¥ng dá»‹ch vá»¥. Xem báº£ng giÃ¡ chi tiáº¿t ThÃ´ng tin chi tiáº¿t NÃ³ng há»•i, lai rai vÃ  táº¡o khÃ´ng khÃ­ rÃ´m ráº£, Ä‘Ã³ chÃ­nh lÃ  lÃ½ do khiáº¿n láº©u mÃ¹a nÃ o cÅ©ng Ä‘áº¯t hÃ ng. Thuá»™c nhÃ³m cÃ¡c mÃ³n Äƒn quen thuá»™c, trong nhá»¯ng ngÃ y hÃ¨ nÃ³ng bá»©c, mÃ¹a Ä‘Ã´ng láº¡nh hay nhá»¯ng ngÃ y giao mÃ¹a se se, láº©u riÃªu cua lÃ  mÃ³n Äƒn chÆ°a bao giá» â€œgiáº£m nhiá»‡tâ€ vá»›i thá»±c khÃ¡ch. Tuy khÃ´ng pháº£i lÃ  mÃ³n Äƒn má»›i, nhÆ°ng Ä‘á»ƒ cháº¿ biáº¿n mÃ³n láº©u riÃªu cua ngon Ä‘Ãºng Ä‘iá»‡u thÃ¬ láº¡i khÃ´ng pháº£i lÃ  Ä‘iá»u Ä‘Æ¡n giáº£n chÃºt nÃ o. Äá»ƒ táº­n hÆ°á»Ÿng hÆ°Æ¡ng vá»‹ cá»§a mÃ³n Äƒn háº¥p dáº«n nÃ y, Adayroi má»i báº¡n cÃ¹ng Ä‘áº¿nÂ NhÃ  hÃ ng Tre BÃ£i ÄÃ¡Â Ä‘á»ƒ thÆ°á»Ÿng thá»©cÂ Set láº©u riÃªu cua báº¯p bÃ² dÃ nh cho 4 - 6 ngÆ°á»i. Set Äƒn gá»“m: Cá»§ quáº£ luá»™c: 01 Ä‘Ä©a; NgÃ´ chiÃªn: 01 Ä‘Ä©a; Ná»™m hoa chuá»‘i tai lá»£n: 01 Ä‘Ä©a; áº¾ch xÃ o lÄƒn: 01 Ä‘Ä©a; Láº©u riÃªu cua báº¯p bÃ²: Báº¯p bÃ²: 380gram; Cua xay: 380gram; BÃºn: 01 Ä‘Ä©a Äƒn kÃ¨m rau Äƒn láº©u vÃ  hoa chuá»‘i. Â  Â  Â  Â  áº¨m thá»±c Viá»‡t phong phÃº táº¡i nhÃ  hÃ ng Tre BÃ£i ÄÃ¡ Má»™t ná»“i láº©u riÃªu cua thÆ¡m ngon vÃ ng Ã³ng gáº¡ch cua, nhÃºng thÃªm chÃºt thá»‹tÂ báº¯p bÃ² tÆ°Æ¡i thÃ¡i má»ng vÃ o ná»“i nÆ°á»›c riÃªu cua vá»«a tÄƒng thÃªm Ä‘á»™ ngá»t cá»§a nÆ°á»›c mÃ  khÃ´ng bá»‹ má»¡ vÃ  ngáº¥y. Láº©u riÃªu cua khÃ´ng thá»ƒ thiáº¿u Ä‘áº­u phá»¥ rÃ¡n phá»“ng rá»“i tháº£ vÃ o ná»“i nÆ°á»›c dÃ¹ng. Miáº¿ng Ä‘áº­u phá»¥ má»m máº¡i ngáº¥m nÆ°á»›c riÃªu cua vá»«a chua chua láº¡i bÃ¹i bÃ¹i cÃ ng lÃ m tÄƒng sá»©c háº¥p dáº«n cá»§a mÃ³n Äƒn. Äáº·c biá»‡t, Äƒn kÃ¨m vá»›i ná»“i láº©u riÃªu cua thÆ°á»ng cÃ³ ráº¥t nhiá»u loáº¡i rau xanh nhÆ° giÃ¡ Ä‘á»—, hoaÂ chuá»‘i, tÃ­a tÃ´... vÃ  Ä‘a dáº¡ng cÃ¡c loáº¡i rau sá»‘ng. Â  Â  NÆ°á»›c láº©u cua Ä‘á»“ng vÃ ng Ã³ng Â  Â  Â  Â  Â  Â  MÃ³n láº©u riÃªu cua báº¯p bÃ² táº¡iÂ NhÃ  hÃ ng Tre BÃ£i ÄÃ¡Â Ä‘Æ°á»£c cháº¿ biáº¿n báº±ng nguyÃªn liá»‡u tÆ°Æ¡iÂ ngon, cÃ¹ng vá»›i cÃ´ng thá»©c riÃªng biá»‡t táº¡i nhÃ  hÃ ng sáº½ khiáº¿n thá»±c khÃ¡ch dÃ¹ chá»‰ má»™t láº§n thÆ°á»Ÿng thá»©c cÅ©ng sáº½ khÃ´ng thá»ƒ nÃ o quÃªn. Â  Â  Rau láº©u vÃ  bÃºn tÆ°Æ¡i Äƒn kÃ¨m Â  Â  Â  Â  Â  Â  Ná»™m hoa chuá»‘i tai lá»£n lÃ  mÃ³n Äƒn ngon Ä‘Æ°á»£c nhiá»u ngÆ°á»i thÆ°á»Ÿng thá»©c vÃ¬ hÆ°Æ¡ng vá»‹ thanh Ä‘áº¡m láº¡i bá»• dÆ°á»¡ng. MÃ³n ÄƒnÂ Ä‘Æ°á»£c trÃ¬nh bÃ y báº¯t máº¯t, mÃ u sáº¯c háº¥p dáº«n, vá»‹ chua ngá»t ráº¥t vá»«a miá»‡ng, tai lá»£nÂ Ä‘Æ°á»£c thÃ¡i má»ng, tráº¯ng Ä‘áº¹p, giÃ²n ngon hÃ²a quyá»‡n vá»›i vá»‹ chua cá»§a nÆ°á»›c trá»™nÂ cÃ¹ng vá»‹ ngon cá»§a cÃ¡c nguyÃªn liá»‡u Ä‘i kÃ¨m gÃ³p pháº§n táº¡o nÃªn hÆ°Æ¡ng vá»‹ thÆ¡m ngon ráº¥t Ä‘áº·c trÆ°ng cá»§a mÃ³n ná»™m nÃ y. Â  Â  Â  Â  NgoÃ i ra, lá»±a chá»n set Äƒn nÃ y báº¡n cÃ²n cÃ³ cÆ¡ há»™i thÆ°á»Ÿng thá»©c nhiá»u mÃ³n Äƒn phong phÃº tÆ°Æ¡i ngon nhÆ°: áº¾ch xÃ o lÄƒn, ngÃ´ chiÃªnÂ vÃ  cá»§ quáº£ luá»™cÂ cho bá»¯a Äƒn no Ä‘á»§, trá»n váº¹n. Â  Â  áº¾ch xÃ o lÄƒn Ä‘áº·c biá»‡t khÃ³ quÃªn Â  Â  Â  Â  NgÃ´ chiÃªn Â  Â  Â  Â  Rau cá»§ quáº£ luá»™c Â  Giá»›i thiá»‡u NhÃ  hÃ ng Tre BÃ£i ÄÃ¡ Tá»a láº¡c táº¡i Ã‚u CÆ¡ -Â HÃ  Ná»™i, NhÃ  hÃ ng Tre BÃ£i ÄÃ¡Â lÃ  Ä‘á»‹a chá»‰ áº©m thá»±c Ä‘Æ°á»£c nhiá»u ngÆ°á»i yÃªu thÃ­ch. Vá»›i khÃ´ng gian gáº§n gÅ©i vÃ  thÃ¢n máº­t, nhÃ  hÃ ng cÃ²nÂ lÃ  Ä‘iá»ƒm háº¹n lÃ½ tÆ°á»Ÿng cho nhá»¯ng bá»¯a cÆ¡m gia Ä‘Ã¬nh, nhá»¯ng buá»•i tá»¥ táº­p báº¡n bÃ¨ vá»›i nhá»¯ng giÃ¢y phÃºt thÆ° giÃ£n thoáº£i mÃ¡i vÃ  Ä‘Ã¡ng nhá»›. Â  Â  Â  Â  NhÃ  hÃ ng Tre BÃ£i ÄÃ¡Â luÃ´n Ä‘áº·t tiÃªu chÃ­ ngon -Â sáº¡ch lÃªn hÃ ng Ä‘áº§u, Ä‘áº£m báº£o nguyÃªn liá»‡u tÆ°Æ¡i ngon má»—i ngÃ y, an toÃ n vá»‡ sinh thá»±c pháº©m. Äá»™i ngÅ© nhÃ¢n viÃªn chuyÃªn nghiá»‡p, chu Ä‘Ã¡o, táº­n tÃ¬nh cháº¯c cháº¯n sáº½ lÃ m hÃ i lÃ²ng ngay cáº£ vá»‹ khÃ¡ch khÃ³ tÃ­nh. Â  Â  Â  Â  NhÃ  hÃ ng Tre BÃ£i ÄÃ¡ cÃ²n lÃ  nÆ¡i thÆ°á»ng xuyÃªn diá»…n ra nhiá»u sá»± kiá»‡n, nhiá»u bá»¯a tiá»‡c liÃªn hoan lá»›n nhá» cá»§a thá»±c khÃ¡ch. Nhá» lá»£i tháº¿ khÃ´ng gian rá»™ng lá»›n, ngoÃ i ra nhÃ  hÃ ng cÃ²n há»— trá»£ cung cáº¥p cho báº¡n há»‡ thá»‘ng mÃ¡y chiáº¿u, loa Ä‘Ã i, sÃ¢n kháº¥u ngoÃ i trá»i hoÃ nh trÃ¡ngâ€¦ ráº¥t thuáº­n tiá»‡n vá»›i nhá»¯ng nhu cáº§u tá»• chá»©c tiá»‡c hay liÃªn hoan cá»§a cÃ¡c cÃ´ng ty, há»™i nhÃ³m. Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â ',529000,259000,400,'ACTIVE','2017-11-10 16:13:24',0),
(4,NULL,'1 NgÃ y Vui ChÆ¡i Thá»a ThÃ­ch Táº¡i Flamingo Äáº¡i Láº£i Resort 5* - Gá»“m Bá»¯a Ä‚n ChÃ­nh','PHYSICAL_VOUCHER','http://222.252.16.132:8080/loyalty/voucher/flamingo1.jpg','Äiá»u kiá»‡n sá»­ dá»¥ng Thá»i háº¡n sá»­ dá»¥ng voucher: 30/12/2017 KhÃ¡ch hÃ ng vui lÃ²ng liÃªn há»‡Â 1900 1901Â Ä‘á»ƒ chá»n ngÃ y á»Ÿ sau khi nháº­n Ä‘Æ°á»£c voucher tá»« Adayroi. Ãp dá»¥ng cho: GÃ³i vui chÆ¡i, giáº£i trÃ­ táº¡i Flamingo Äáº¡i Láº£i resort tiÃªu chuáº©n 5 sao. KhÃ¡ch hÃ ng vui lÃ²ng liÃªn há»‡ 19001901 Ä‘á»ƒ Ä‘áº·t dá»‹ch vá»¥ tá»‘i thiá»ƒu trÆ°á»›c 03 ngÃ y lÃ m viá»‡c. Sá»‘ lÆ°á»£ng Giáº¥y chá»©ng nháº­n Ã¡p dá»¥ng: 01 Giáº¥y chá»©ng nháº­n/01 ngÆ°á»i lá»›n/01 láº§n sá»­ dá»¥ng. KhÃ´ng Ã¡p dá»¥ng cho cÃ¡c ngÃ y Lá»…: 08/03/2017, 06/04/2017, 30/04/2017, 01/05/2017, 02/09/2017, 24/12/2017. KhÃ¡ch hÃ ng cÃ³ thá»ƒ mua nhiá»u Giáº¥y chá»©ng nháº­n Ä‘á»ƒ sá»­ dá»¥ng nhiá»u láº§n: Thá»i gian nháº­n phÃ²ng: KhÃ´ng Ã¡p dá»¥ng Thá»i gian tráº£ phÃ²ng: KhÃ´ng Ã¡p dá»¥ng Bao gá»“m: Miá»…n phÃ­ vÃ© vÃ o cá»•ng. 01 bá»¯a Äƒn chÃ­nh. Miá»…n phÃ­ sá»­ dá»¥ng dá»‹ch vá»¥ xe bus Ä‘iá»‡n di chuyá»ƒn theo lá»™ trÃ¬nh vÃ  cÃ¡c Ä‘iá»ƒm Ä‘Ã³n cá»‘ Ä‘á»‹nh táº¡i Resort. ThÄƒm quan VÆ°á»n Äá»‹a ÄÃ ng, vÆ°á»n rau sáº¡ch Flamingo vÃ  cÃ¡c tÃ¡c pháº©m Nghá»‡ thuáº­t Art in The Forest táº¡i Resort. Miá»…n phÃ­ bÆ¡i táº¡i CÃ¢u láº¡c bá»™ bÃ£i biá»ƒn Flamingo. Miá»…n phÃ­ sá»­ dá»¥ng nhÃ  phao dÆ°á»›i nÆ°á»›c (chÆ°a bao gá»“m thuÃª Ã¡o phao). Phá»¥ thuá»™c vÃ o Ä‘iá»u kiá»‡n thá»i tiáº¿t, Resort sáº½ cung cáº¥p dá»‹ch vá»¥ nÃ y. Miá»…n phÃ­ chÆ¡i 30 phÃºt Bi-a, 30 phÃºt Bilak (vui lÃ²ng Ä‘áº·t trÆ°á»›c). Miá»…n phÃ­ cÃ¢u cÃ¡ (chÆ°a bao gá»“m cáº§n cÃ¢u vÃ  má»“i cÃ¢u). Miá»…n phÃ­ sá»­ dá»¥ng nhÃ  phao trÃªn cáº¡n, vui chÆ¡i táº¡i cÃ´ng viÃªn dÃ nh cho tráº» em táº¡i rá»«ng thÃ´ng (Wonder Park). Táº·ng 01 voucher Spa trá»‹ giÃ¡ 150.000 VND/khÃ¡ch (Ã¡p dá»¥ng cho ngÆ°á»i lá»›n). Giáº£m giÃ¡ 50% dá»‹ch vá»¥ xe Bus di chuyá»ƒn 02 chiá»u HÃ  Ná»™i â€“ Flamingo (thá»i gian cháº¡y xe bus theo lá»‹ch trÃ¬nh cá»§a Resort). Giáº£m 50% cÃ¡c dá»‹ch vá»¥ vui chÆ¡i táº¡i CLB bÃ£i biá»ƒn nhÆ°: Thuyá»n Kayak, thuyá»n chuá»‘i, thuyá»n hoáº·c cano thÄƒm quan há»“ Äáº¡i Láº£i, xe Ä‘áº¡p nÆ°á»›c. Giáº£m 50% dá»‹ch vá»¥ Karaoke táº¡i Resort. KhÃ´ng bao gá»“m: CÃ¡c chi phÃ­ dá»‹ch vá»¥ phÃ¡t sinh,chi phÃ­ cÃ¡ nhÃ¢n nhÆ° giáº·t á»§i, Ä‘iá»‡n thoáº¡i, Äƒn uá»‘ng vÃ  cÃ¡c chi phÃ­ phÃ¡t sinh tá»« yÃªu cáº§u cá»§a quÃ½ khÃ¡ch. GiÃ¡ trÃªn khÃ´ng bao gá»“m chi phÃ­ váº­n chuyá»ƒn Ä‘áº¿n resort vÃ  ngÆ°á»£c láº¡i. CÃ¡c chi phÃ­ khÃ´ng liá»‡t kÃª táº¡i má»¥c \"Bao gá»“m\". ChÃ­nh sÃ¡ch tráº» em vÃ  ngÆ°á»i lá»›n Ä‘i kÃ¨m: Miá»…n phÃ­ tráº» em tá»« 0 Ä‘áº¿n dÆ°á»›i 2 tuá»•i sá»­ dá»¥ng chung cÃ¡c dá»‹ch vá»¥ vá»›i gia Ä‘Ã¬nh. TrÆ°á»ng há»£p 02 ngÆ°á»i lá»›n sáº½ Ä‘Æ°á»£c miá»…n phÃ­ 01 tráº» em dÆ°á»›i 5 tuá»•i Ä‘i kÃ¨m. Tráº» em tá»« 2 tuá»•i trá»Ÿ lÃªn tÃ­nh phÃ­ nhÆ° ngÆ°á»i lá»›n, QuÃ½ khÃ¡ch vui lÃ²ng mua thÃªm 01 Giáº¥y chá»©ng nháº­n. Phá»¥ thu cuá»‘i tuáº§n: KhÃ´ng. Phá»¥ thu ngÆ°á»i nÆ°á»›c ngoÃ i: KhÃ´ng. ÄÃ£ bao gá»“m VAT vÃ  phÃ­ phá»¥c vá»¥ NhÃ  cung cáº¥p chá»‹u trÃ¡ch nhiá»‡m xuáº¥t hoÃ¡ Ä‘Æ¡n tÃ i chÃ­nh khi khÃ¡ch hÃ ng yÃªu cáº§u Thá»i gian Ä‘áº·t phÃ²ng tá»‘i thiá»ƒu trÆ°á»›c ngÃ y sá»­ dá»¥ng dá»‹ch vá»¥: . ChÃ­nh sÃ¡ch há»§y Ä‘áº·t phÃ²ng: GÃ³i vui chÆ¡i khÃ´ng Ã¡p dá»¥ng chÃ­nh sÃ¡ch há»§y dá»‹ch vá»¥ Ä‘Ã£ Ä‘áº·t, QuÃ½ khÃ¡ch Ä‘Æ°á»£c phÃ©p thay Ä‘á»•i ngÃ y sá»­ dá»¥ng dá»‹ch vá»¥. TrÆ°á»ng há»£p thay Ä‘á»•i ngÃ y sá»­ dá»¥ng dá»‹ch vá»¥ QuÃ½ khÃ¡ch vui lÃ²ng thÃ´ng bÃ¡o trÆ°á»›c 02 ngÃ y. Hotline Ä‘áº·t chá»—: 1900 1901. Thá»i gian Ä‘áº·t dá»‹ch vá»¥ tá»‘i thiá»ƒu trÆ°á»›c 03 ngÃ y lÃ m viá»‡c KhÃ´ng cÃ³ giÃ¡ trá»‹ quy Ä‘á»•i thÃ nh tiá»n, khÃ´ng hoÃ n tráº£ tiá»n thá»«a KhÃ´ng Ã¡p dá»¥ng cho cÃ¡c chÆ°Æ¡ng trÃ¬nh khuyáº¿n mÃ£i khÃ¡c LiÃªn há»‡ tÆ° váº¥n vÃ  há»— trá»£ Ä‘áº·t phÃ²ng: 19001901 TÆ° váº¥n & Äáº·t dá»‹ch vá»¥Â 1900 1901 ThÃ´ng tin chi tiáº¿t Khu biá»‡t thá»±Â nghá»‰ dÆ°á»¡ng Flamingo mang láº¡i má»™t tráº£i nghiá»‡m nghá»‰ dÆ°á»¡ng má»›i láº¡ cho du khÃ¡ch. Cáº£m nháº­n má»™t khÃ´ng gian rá»™ng lá»›n, ráº¥t thiÃªn nhiÃªn cÃ¹ng vÃ´ sá»‘ cÃ¡c dá»‹ch vá»¥ Ä‘áº³ng cáº¥p táº¡i má»™t khu resort trong mÆ¡.Â Trong lÆ°á»£t deal du lá»‹ch láº§n nÃ y, Adayroi mang Ä‘áº¿n cho báº¡n voucherÂ 1 NgÃ y Vui ChÆ¡i Thá»a ThÃ­ch Táº¡i Flamingo Äáº¡i Láº£i Resort 5* - Gá»“m Bá»¯a Ä‚n ChÃ­nhÂ giÃ¡ chá»‰ 440.000VND giáº£m 45% so vá»›i giÃ¡ gá»‘c 800.000VND!Â â€‹ Lá»ŠCH TRÃŒNH XE BUSÂ (veÌ xe bus baÌn trÆ°Ì£c tiÃªÌp taÌ£i LÃ¢Ì€u 6 - 127 LoÌ€ ÄuÌc, Hai BaÌ€ TrÆ°ng, HN.Â SÄT 0945 082 393 Ms. Dung) a. NgÃ y trong tuáº§n (Thá»© 2 â€“ Thá»© 6): 1 lÆ°á»£t/ngÃ y: - Xuáº¥t phÃ¡t 7h30 - Vá» 16h00Â  Äiá»ƒm Ä‘Ã³n: CÃ´ng viÃªn Thá»‘ng Nháº¥t (cá»•ng Tráº§n NhÃ¢n TÃ´ng) - NhÃ  hÃ¡t Lá»›n - 252 Nghi TÃ m (Honda TÃ¢y Há»“) - Flamingo vÃ  ngÆ°á»£c láº¡i. b. Cuá»‘i tuáº§n (Thá»© 7 & Chá»§ nháº­t): 2 lÆ°á»£t/ngÃ y - LÆ°á»£t 1: Xuáº¥t phÃ¡t 7h30 â€“ Vá» 14h00Â  Äiá»ƒm Ä‘Ã³n: CÃ´ng viÃªn Thá»‘ng Nháº¥t (cá»•ng Tráº§n NhÃ¢n TÃ´ng) - NhÃ  hÃ¡t Lá»›n - 252 Nghi TÃ m (Honda TÃ¢y Há»“) - FlamingoÂ  -Â LÆ°á»£t 2: Xuáº¥t phÃ¡t 11h00 â€“ Vá» 17h30 Äiá»ƒm Ä‘Ã³n: 104 Nguyá»…n TrÃ£i (chÃ¢n cáº§u vÆ°á»£t Ä‘i bá»™ gáº§n Royal City) - Cá»™t Äá»“ng há»“ SVÄ Má»¹ ÄÃ¬nh - NgÃµ 5 LÃª Äá»©c Thá» (FLC Landmark Tower) - CÃ´ng viÃªn HÃ²a BÃ¬nh/KÄT Ciputra - Flamingo. Â  Â  Â  Â  Flamingo Äáº¡i Láº£i Resort sáº½ lÃ  gá»£i Ã½ hay Ä‘á»ƒ du khÃ¡ch táº­n hÆ°á»Ÿng cuá»™c sá»‘ng theo cÃ¡ch riÃªng cá»§a mÃ¬nh Â  Â  Â  Â  Â  Â  Â  Vá»›i tá»•ng diá»‡n tÃ­ch lÃªn Ä‘áº¿n gáº§n 1000m2, bá»ƒ bÆ¡i nÆ°á»›c nÃ³ng ngoÃ i trá»i táº¡i Flamingo Äáº¡i Láº£i Resort Ä‘Æ°á»£c thiáº¿t káº¿ vá»›i kiáº¿n trÃºc Ä‘á»™c Ä‘Ã¡o, náº±m trÃªn triá»n Ä‘á»“i thoáº£i, bá»ƒ bÆ¡i nÆ°á»›c nÃ³ng mang láº¡i cáº£m giÃ¡c thÆ° giÃ£n tuyá»‡t vá»i giá»¯a thiÃªn nhiÃªn. Â  Â  Â  Â  Â  Â  Â  Äiá»ƒm nháº¥n cá»§a cÃ´ng trÃ¬nh nÃ y lÃ  ká»¹ thuáº­t lá»c sáº¡ch báº±ng ozone, khÃ´ng hÃ³a cháº¥t, thÃ¢n thiá»‡n vá»›i mÃ´i trÆ°á»ng vÃ  an toÃ n cho sá»©c khá»e con ngÆ°á»i. Bá»ƒ bÆ¡i nÆ°á»›c nÃ³ng sá»­ dá»¥ng cÃ´ng nghá»‡ lÃ m nÃ³ng tiÃªn tiáº¿n, Ä‘áº£m báº£o há»‡ thá»‘ng hoáº¡t Ä‘á»™ng Ä‘á»“ng bá»™ vÃ  an toÃ n. HÆ¡n tháº¿ ná»¯a, káº¿t cáº¥u Ä‘áº·c biá»‡t cá»§a bá»ƒ bÆ¡i giÃºp duy trÃ¬ nÆ°á»›c nÃ³ng á»Ÿ nhiá»‡t Ä‘á»™ 40 Ä‘á»™ trong thá»i gian dÃ i. Â  Â  Â  Â  Äáº¿n Flamingo Äáº¡i Láº£i Resort,Â ngoÃ i viá»‡c cáº£m nháº­n khÃ´ng gian xanh, gáº§n gÅ©i thiÃªn nhiÃªn, du khÃ¡ch cÃ²n cÃ³ cÆ¡ há»™i thÆ°á»Ÿng thá»©c nhá»¯ng mÃ³n Äƒn Ä‘áº·c biá»‡t mang Ä‘áº­m phong cÃ¡ch Flamingo. NhÃ  hÃ ng Bamboo Wings chuyÃªn phá»¥c vá»¥ cÃ¡c mÃ³n Äƒn Ã‚u, Ã Ä‘Æ°á»£c cháº¿ biáº¿n bá»Ÿi cÃ¡c Ä‘áº§u báº¿p hÃ ng mang tá»›i nhá»¯ng hÆ°Æ¡ng vá»‹ má»›i láº¡, Ä‘á»™c Ä‘Ã¡o khÃ´ng Ä‘Ã¢u cÃ³ Ä‘Æ°á»£c. áº¨m thá»±c Flamingo táº¡i nhÃ  hÃ ng Bamboo Wings khÃ´ng chá»‰ cáº§u ká»³ trong cháº¿ biáº¿n mÃ  cÃ²n kiá»ƒu cÃ¡ch trong trÃ¬nh bÃ y vÃ  tinh táº¿ mang tá»›i cho quÃ½ vá»‹ hÆ¡n cáº£ má»™t bá»¯a Äƒn ngon mÃ  lÃ  má»™t phong cÃ¡ch thÆ°á»Ÿng thá»©c Ä‘áº³ng cáº¥p vÃ  sÃ nh Ä‘iá»‡u.Â  Â  Â  Â  Â  MENU Bá»®A Ä‚N CHÃNH Táº I FLAMINGO Äáº I Láº¢I RESORT Salad rong biá»ƒn trá»©ng cua kiá»ƒu Nháº­t Báº£n SÃºp bÃ² Ãšc náº¥m tuyáº¿t mÄƒng tÃ¢y Khoai lang chiÃªn háº¡t mÃ¨ CÃ¡ há»“ng háº¥p ngÅ© liá»…u BÃ² chiÃªn ngÅ© vá»‹ Rau xanh theo mÃ¹a xÃ o tá»i xá»‘t náº¥m rá»«ng tÆ°Æ¡i Phá»Ÿ xÃ o kiá»ƒu ThÃ¡i vá»›i tÃ´m Ä‘áº­u phá»¥ TrÃ¡i cÃ¢y theo mÃ¹a Â  Â  Â  Â  Â  Â  Â  Â  Â  Tá»a láº¡c táº¡i vá»‹ trÃ­ Ä‘áº¹p cá»§a resort, bar táº¡i Hilltop Resort cÃ³ â€œviewâ€ hÆ°á»›ng há»“ ThiÃªn Yáº¿n tuyá»‡t Ä‘áº¹p. Sá»± hÃ²a quyá»‡n giá»¯a váº» Ä‘áº¹p cá»§a kiáº¿n trÃºc vÃ  táº§m nhÃ¬n Ä‘Ã£ táº¡o cho bar cÃ³ sá»©c hÃºt ráº¥t lá»›n Ä‘á»‘i vá»›i báº¥t ká»³ du khÃ¡ch nÃ o khi Ä‘áº¿n Ä‘Ã¢y. Thiáº¿t káº¿ tinh táº¿ cÃ¹ng phong cÃ¡ch phá»¥c vá»¥ chu Ä‘Ã¡o, chuyÃªn nghiá»‡p sáº½ thá»a mÃ£n má»i nhu cáº§u thÆ°á»Ÿng thá»©c cÃ¡c loáº¡i Ä‘á»“ uá»‘ng háº£o háº¡ng theo phong cÃ¡ch thÆ°á»£ng lÆ°u. Â  Â  Â  Â  Â  Â  Â  Flamingo Äáº¡i Láº£i Resort tráº£i rá»™ng trÃªn 1,23 triá»‡u m2, nÆ¡i Ä‘Ã¢y sá»Ÿ há»¯u thiÃªn nhiÃªn tÆ°Æ¡i Ä‘áº¹p, Ä‘a dáº¡ng vá» Ä‘á»‹a hÃ¬nh, tÃ i nguyÃªn tá»± nhiÃªn phong phÃº vÃ  cáº£nh quan Ä‘á»™c Ä‘Ã¡o: - 4 bÃ¡n Ä‘áº£o, 2 hÃ²n Ä‘áº£o - 10 cÃ¡nh rá»«ng, 5 quáº£ Ä‘á»“i - 100 triá»‡u m2 nÃºi & rá»«ng thÃ´ng bao quanh - 5 triá»‡u m2 máº·t há»“ Äáº¡i Láº£i, bÃ£i biá»ƒn dÃ i 3km, 2 há»“ trung tÃ¢m & suá»‘i - Nguá»“n nÆ°á»›c trong sáº¡ch, khÃ´ng khÃ­ trong lÃ nh - TrÃ n ngáº­p cá» cÃ¢y hoa lÃ¡, cáº£nh quan rá»™ng lá»›n hÃ¹ng vÄ© - Phong thá»§y Ä‘á»™c Ä‘Ã¡o, Ä‘áº¯c Ä‘á»‹a, há»¯u tÃ¬nh, tÆ°Æ¡i tá»‘t - ChÆ°a tá»«ng cÃ³ nÆ¡i nÃ o Ä‘Æ°á»£c thiÃªn nhiÃªn tÃ´n táº¡o Ä‘áº·c biá»‡t nhÆ° váº­y Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Tráº£i dÃ i trÃªn diá»‡n tÃ­ch gáº§n 6ha, sÃ¢n Golf Flamingo bao gá»“m sÃ¢n golf 9 lá»— vÃ  sÃ¢n gáº¡t golf 18 lá»—: ÄÆ°á»£c thiáº¿t káº¿ nhá» gá»n vÃ  tinh táº¿ mang Ä‘áº­m phong cÃ¡ch cá»§a nhá»¯ng sÃ¢n golf ven biá»ƒn vá»›i cÃ¡c Ä‘á»¥n cÃ¡t tráº¯ng xen káº½ nhá»¯ng Ä‘á»“i cá» xanh má»m máº¡i.Â SÃ¢n Golf Flamingo náº±m áº©n mÃ¬nh giá»¯a cÃ¡c ráº·ng cÃ¢y an toÃ n vÃ  che khuáº¥t táº§m nhÃ¬n tá»« ngoÃ i vÃ o,Â cáº£ khoáº£ng khÃ´ng bao quanh lÃ  máº·t há»“ trong xanh thÆ¡ má»™ng uá»‘n lÆ°á»£n bÃªn Ä‘á»“i thÃ´ng, tháº£m cá» tráº£i ngÃºt táº§m máº¯t vÃ  dÃ£y nÃºi Tam Äáº£o má» áº£o phÃ­a chÃ¢n trá»i xa, táº¥t cáº£ táº¡o nÃªn cÃ¡c dáº£i sáº¯c mÃ u Ä‘á»™c Ä‘Ã¡o, áº¥n tÆ°á»£ng. Â  Â  Â  Â  Â  Â  Â  PhÆ°Æ¡ng tiá»‡n Ä‘i láº¡i trong Flamingo Äáº¡i Láº£i Resort lÃ  xe Ä‘áº¡p vÃ  xe Ä‘iá»‡n, bÃªn cáº¡nh Ä‘Ã³ lÃ  há»‡ thá»‘ng nÆ°á»›c sinh hoáº¡t tinh khiáº¿t Ä‘áº¡t tiÃªu chuáº©n, giÃºp duy trÃ¬ mÃ´i trÆ°á»ng trong xanh vÃ  báº£o vá»‡ sá»©c khá»e. Vá»›i thiáº¿t káº¿ phÃ³ng khoÃ¡ng, hiá»‡n Ä‘áº¡i, cÃ¹ng cÃ¡c trang thiáº¿t bá»‹ ná»™i -Â ngoáº¡i tháº¥t Ä‘áº¡t tiÃªu chuáº©n quá»‘c táº¿, cÃ¡c biá»‡t thá»± mang láº¡i cho chá»§ nhÃ¢n cáº£m giÃ¡c thoáº£i mÃ¡i giá»¯a thiÃªn nhiÃªn, tá»± do giá»¯a khÃ´ng gian má»Ÿ, mÃ  váº«n Ä‘áº£m báº£o sá»± riÃªng tÆ° cáº§n cÃ³.â€‹ Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Náº±m trÃªn cÃ¡c trá»¥c Ä‘Æ°á»ng chÃ­nh, ná»‘i tháº³ng tá»« cá»•ng Báº¯c ra phÃ­a Nam vá»›i táº§m nhÃ¬n tuyá»‡t Ä‘áº¹p, Ä‘áº¿n vá»›i Flamingo Äáº¡i Láº£i Resort du khÃ¡ch Ä‘Æ°á»£c Ä‘áº¯m mÃ¬nh giá»¯a nhá»¯ng vÆ°á»n hoa tuyá»‡t sáº¯c vá»›i nhiá»u loÃ i hoa quÃ½, tá»« nhá»¯ng loÃ i hoa thÃ¢n quen nhÆ°: Hoa há»“ng, hoa mai, hoa Ä‘Ã o, hoa máº­n,â€¦ Ä‘áº¿n nhá»¯ng cÃ¡i tÃªn nghe lÃ  láº¡: Hoa cáº©m tÃº quá»³nh, cá» vÃ ng PhÃ¡p, tháº¡ch tháº£o, lay Æ¡n, lobolia,â€¦ Há»™i tá»¥ Ä‘á»§ cÃ¡c gam mÃ u rá»±c rá»¡, hoa Ä‘ua nhau khoe sáº¯c, lÃ m nÃªn váº» Ä‘áº¹p Ä‘áº·c trÆ°ng cho Flamingo Äáº¡i Láº£i Resort. Táº¥t cáº£ hiá»‡n lÃªn bá»©c tranh tá»•ng thá»ƒ hÃ i hÃ²a, Ä‘a sáº¯c, má»™t Ä‘á»‹a cáº£nh phiÃªu lÃ£ng gá»£i lÃªn cháº¥t vÄƒn, cháº¥t nghá»‡ vÃ  cháº¥t nghá»‰ dÆ°á»¡ng. Â  Â  Â  Â  60% diá»‡n tÃ­ch toÃ n dá»± Ã¡n dÃ nh cho cáº£nh quan nghá»‡ thuáº­t: há»“ cáº£nh quan, Ä‘á»“i cá» land-art, tháº£m hoa mÃ u vÃ  cÃ¡c khÃ´ng gian cáº£nh quan nghá»‡ thuáº­t Ä‘áº·c sáº¯c: Äá»“i Thiá»n, Quáº£ng trÆ°á»ng Ä‘Ã¡ vÃ  nÆ°á»›c, cÃ¡ch sáº¯p Ä‘áº·t Ä‘Ã¡, cÃ´ng viÃªn tre, rá»«ng Ä‘Ã o, rá»«ng máº­n...Â Flamingo Äáº¡i Láº£i ResortÂ Ä‘Æ°á»£c Ä‘áº§u tÆ° Ä‘á»ƒ táº¡o nÃªn khÃ´ng gian nghá»‡ thuáº­t cáº£nh quan rá»™ng, káº¿t há»£p giá»¯a phong cáº£nh rá»«ng há»“, nÃºi Ä‘á»“i vá»‘n cÃ³ vá»›i cÃ¡c gÃ² Ä‘á»“i, máº·t nÆ°á»›c, tháº£m hoa Ä‘Æ°á»£c kiáº¿n táº¡o tá»« bÃ n tay con ngÆ°á»i. Â  Â  Â  Â  Â  Â  Â  Â ',800000,440000,400,'ACTIVE','2017-11-10 16:13:53',0),
(5,NULL,'Há»™p Cao Cáº¥p 09 ViÃªn Chocolate TÆ°Æ¡i CÃ¡c Vá»‹ Táº¡i Dâ€™art Chocolate','PHYSICAL_VOUCHER','http://222.252.16.132:8080/loyalty/voucher/dart1.jpg','Äiá»u kiá»‡n sá»­ dá»¥ng Thá»i háº¡n sá»­ dá»¥ng voucher: 30/11/2017 Ãp dá»¥ng cho: Há»™p socola gá»“m: 09 viÃªn socola tÆ°Æ¡i cÃ¡c vá»‹ nhÃ¢n + há»™p quÃ  táº·ng cao cáº¥p + tÃºi xÃ¡ch táº¡i D\'art Chocolate. KÃ­ch thÆ°á»›c há»™p 12cm x 12cm x 7cm Thá»i gian sá»­ dá»¥ng: 8h30 - 20h00 táº¥t cáº£ cÃ¡c ngÃ y trong tuáº§n. CÃ¡c ngÃ y Lá»… Ä‘Æ°á»£c Ã¡p dá»¥ng voucher: 20/11/2017. Sá»‘ lÆ°á»£ng Voucher Ã¡p dá»¥ng: 01 voucher/ há»™p (KhÃ´ng bÃ¹ thÃªm tiá»n). Sá»‘ lÆ°á»£ng voucher sá»­ dá»¥ng tá»‘i Ä‘a: KhÃ´ng giá»›i háº¡n sá»‘ voucher/ hÃ³a Ä‘Æ¡n thanh toÃ¡n. KhÃ¡ch hÃ ng cÃ³ nhu cáº§u xuáº¥t hÃ³a Ä‘Æ¡n vui lÃ²ng liÃªn há»‡ NCC. KhÃ¡ch hÃ ng cÃ³ thá»ƒ mua nhiá»u voucher Ä‘á»ƒ sá»­ dá»¥ng nhiá»u láº§n Ãp dá»¥ng mua mang vá»: KhÃ¡ch hÃ ng Ä‘á»•i voucher trá»±c tiáº¿p táº¡i cá»­a hÃ ng vÃ  vui lÃ²ng thanh toÃ¡n phÃ­ ship náº¿u yÃªu cáº§u giao hÃ ng táº­n nÆ¡i. Báº£ng giÃ¡ cÃ¡c sáº£n pháº©m táº¡i: http://dartchocolate.com/product KhÃ´ng Ã¡p dá»¥ng cho cÃ¡c chÆ°Æ¡ng trÃ¬nh khuyáº¿n mÃ£i khÃ¡c KhÃ´ng cÃ³ giÃ¡ trá»‹ quy Ä‘á»•i thÃ nh tiá»n, khÃ´ng hoÃ n tráº£ tiá»n thá»«a KhÃ¡ch hÃ ng vui lÃ²ng liÃªn há»‡ trÆ°á»›c khi Ä‘áº¿n Ä‘á»ƒ Ä‘Æ°á»£c phá»¥c vá»¥ tá»‘t nháº¥t ThÃ´ng tin Ä‘áº·t háº¹n: (024) 6670 5511 ThÃ´ng tin chi tiáº¿t MÃª hoáº·c hÃ ng triá»‡u ngÆ°á»i bá»Ÿi hÆ°Æ¡ng vá»‹ ngá»t ngÃ o, Ä‘áº¯m say, chocolate Ä‘Æ°á»£c coi lÃ  má»™t trong nhá»¯ng mÃ³n Äƒn truyá»n cáº£m há»©ng hÃ ng Ä‘áº§u trÃªn tháº¿ giá»›i. VÆ°á»£t qua ranh giá»›i cá»§a má»™t mÃ³n Äƒn hay táº·ng pháº©m bÃ¬nh thÆ°á»ng, chocolate mang Ä‘áº¿n cho ngÆ°á»i ta cáº£m giÃ¡c cá»§a sá»± trÃ¢n trá»ng, sáº» chia vÃ  yÃªu thÆ°Æ¡ng. ChÃ­nh vÃ¬ váº­y, chocolate khÃ´ng chá»‰ dÃ nh riÃªng cho ngÃ y lá»… tÃ¬nh nhÃ¢n, mÃ  báº¥t cá»© dá»‹p quan trá»ng nÃ o trong nÄƒm, chocolate cÅ©ng lÃ  mÃ³n quÃ  cháº¡m tá»›i trÃ¡i tim ngÆ°á»i Ä‘Æ°á»£c táº·ng.Â  Â  Â  Â  Â  Ngá»t ngÃ o hÆ°Æ¡ng vá»‹ chocolate Vá»›i mong muá»‘n mang Ä‘áº¿n cho khÃ¡ch hÃ ng sáº£n pháº©m tuyá»‡t vá»i, Dâ€™art Ä‘áº·c biá»‡t chÃº trá»ng Ä‘áº¿n nguá»“n gá»‘c vÃ  cháº¥t lÆ°á»£ng cá»§a cacao Ä‘á»ƒ lÃ m ra sáº£n pháº©m chocolate cháº¥t lÆ°á»£ng. ChÃ­nh vÃ¬ váº­y, Dâ€™art Ä‘Ã£ chá»n cho mÃ¬nh Ä‘á»‘i tÃ¡c danh tiáº¿ng lÃ  hÃ ng Callebaut - nÆ¡i sáº£n xuáº¥t ra thá»© chocolate háº£o háº¡ng. Tá»« nhá»¯ng trÃ¡i cacao ban Ä‘áº§u, qua quÃ¡ trÃ¬nh xá»­ lÃ½ cháº¿ biáº¿n, pha trá»™nâ€¦ Dâ€™art Ä‘Ã£ táº¡o ra nhiá»u loáº¡i chocolate vá»›i hÆ°Æ¡ng vá»‹ Ä‘áº·c trÆ°ng háº¥p dáº«n. Â  Â  Â  Â  Äáº¿n vá»›i Dâ€™art, nhá»¯ng ngÆ°á»i yÃªu thÃ­ch hÆ°Æ¡ng vá»‹ truyá»n thá»‘ng cÃ³ thá»ƒ chá»n cho mÃ¬nh cÃ¡c loáº¡i chocolate gá»‘c lÃ  chocolate Ä‘áº¯ng, nÃ¢u. Chocolate cÃ³ nhÃ¢n dÃ nh cho nhá»¯ng ngÆ°á»i Æ°a thÃ­ch sá»± máº¡o hiá»ƒm vÃ Â bÃ­ áº©n. NgoÃ i cÃ¡c loáº¡i nhÃ¢n truyá»n thá»‘ng nhÆ° vá»‹ háº¡nh nhÃ¢n, caramenâ€¦ Dâ€™art cÃ²n táº¡o ra Ä‘á»™t phÃ¡ háº¥p dáº«n vá»›i hÆ°Æ¡ng vá»‹ trÃ  xanh thÆ¡m mÃ¡t, vá»‹ caramel ngá»t ngÃ o, vá»‹ cam thanh thoÃ¡t, mang Ä‘áº¿n cho báº¡n nhiá»u sá»± lá»±a chá»n háº¥p dáº«n. Â  Â  Â  Â  Â  Â  Â  Dâ€™Art - KhÃ´ng chá»‰ lÃ  chocolate â€‹PhÃ¡t triá»ƒn tá»« dÃ²ng chocolate Bá»‰ ná»•i tiáº¿ng tháº¿ giá»›i - Barry Callebaut, káº¿t há»£p vá»›i niá»m Ä‘am mÃª Ä‘áº§y sÃ¡ng táº¡o Ä‘Ã£ giÃºp Dâ€™art Chocolate sÃ¡ng táº¡o nÃªn nhá»¯ng tÃ¡c pháº©m nghá»‡ thuáº­t Ä‘á»™c Ä‘Ã¡o tá»« chocolate. áº¤n tÆ°á»£ng ngay tá»« cÃ¡i tÃªn, cÃ¡c sáº£n pháº©m cá»§a Dâ€™art luÃ´n Ä‘á» cao tÃ­nh tháº©m má»¹. BÃªn cáº¡nh Ä‘Ã³, nhá»¯ng thÃ´ng Ä‘iá»‡p ngá»t ngÃ o vÃ  Ä‘áº§y cáº£m há»©ng Ä‘Æ°á»£c cÃ¡ nhÃ¢n hÃ³a sáº½ dá»… cháº¡m tá»›i trÃ¡i tim khÃ¡ch hÃ ng. CÃ¡c loáº¡i chocolate quÃ  táº·ng cá»§a Dâ€™art vá»›i nhá»¯ng thiáº¿t káº¿ bao bÃ¬ sang trá»ng vÃ  Ä‘áº³ng cáº¥p sáº½ giÃºp báº¡n khÃ´ng gáº·p khÃ³ khÄƒn trong viá»‡c chá»n quÃ  cho báº¡n bÃ¨, ngÆ°á»i thÃ¢n hay Ä‘á»‘i tÃ¡c. Â  Â  Â  Â  CÃ¢u chuyá»‡n vá» Dâ€™Art chocolate Ra Ä‘á»i vá»›i mong muá»‘n xÃ¢y dá»±ng thÆ°Æ¡ng hiá»‡u chocolate Bá»‰ cao cáº¥p, Dâ€™Art Ä‘Ã£ káº¿t há»£p Ä‘á»™c Ä‘Ã¡o giá»¯a sá»± sÃ¡ng táº¡o, cháº¥t lÆ°á»£ng vÃ  cÃ´ng nghá»‡, mang Ä‘áº¿n sáº£n pháº©m socola cháº¥t lÆ°á»£ngÂ Ä‘áº¿n ngÆ°á»i tiÃªu dÃ¹ng. Â  Â  Â  Â  CÃ¡c tÃ¡c pháº©m cá»§a Dâ€™Art khÃ´ng Ä‘Æ¡n thuáº§n lÃ  nhá»¯ng mÃ³n Äƒn, Ä‘Ã³ chÃ­nh lÃ  nhá»¯ng thiáº¿t káº¿ má»¹ thuáº­t Ä‘Æ°á»£c thá»±c hiá»‡n trÃªn chocolate, táº¡o nÃªn giÃ¡ trá»‹ nghá»‡ thuáº­t cho dÃ²ng chocolate truyá»n thá»‘ng. Báº¡n sáº½ cáº£m nháº­n nguá»“n cáº£m há»©ng cÅ©ng nhÆ° tÃ¢m huyáº¿t cá»§a Ä‘áº§u báº¿p Ä‘Ã£ sáº» chia trong má»—i sáº£n pháº©m cá»§a Dâ€™Art Chocolate. Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â ',235000,188000,400,'ACTIVE','2017-11-10 16:13:46',0),
(6,'','sd','E_VOUCHER','http://222.252.16.132:8080/loyalty/voucher/yoga1.jpg','<p>Thá»i háº¡n sá»­ dá»¥ng:&nbsp;<strong>25/01/2018</strong></p>\r\n',0,0,100,'NEW','2017-11-23 11:03:36',0),
(7,'','rdfd','E_VOUCHER','http://222.252.16.132:8080/loyalty/voucher/yoga1.jpg','<h2>Yoga cho v&oacute;c d&aacute;ng thon gá»n, sÄƒn&nbsp;cháº¯c</h2>\r\n\r\n<hr />\r\n<p>Luyá»‡n táº­p thÆ°á»ng xuy&ecirc;n c&ugrave;ng vá»›i ká»¹ thuáº­t thá»Ÿ trong&nbsp;<strong>Yoga sáº½ gi&uacute;p báº¡n báº¡n c&oacute; Ä‘Æ°á»£c má»™t th&acirc;n h&igrave;nh sÄƒn cháº¯c.&nbsp;</strong>Ä&acirc;y l&agrave; sá»± lá»±a chá»n ho&agrave;n háº£o Ä‘á»ƒ báº¡n láº¥y láº¡i v&oacute;c d&aacute;ng thon gá»n thuá»Ÿ thiáº¿u thá»i. Yoga c&ograve;n gi&uacute;p n&acirc;ng cao sá»©c khá»e v&agrave; t&iacute;nh linh hoáº¡t, báº¡n sáº½ cáº£m nháº­n Ä‘Æ°á»£c cÆ¡ thá»ƒ trá»Ÿ n&ecirc;n sÄƒn cháº¯c v&agrave; quyáº¿n rÅ© hÆ¡n.&nbsp;<br />\r\n<br />\r\nLá»±a chá»n ho&agrave;n háº£o cho th&acirc;n h&igrave;nh thon gá»n, sÄƒn cháº¯c:&nbsp;<strong>Hot Yoga, Power Yoga, Ashtanga v&agrave; Hatha Flow</strong></p>\r\n\r\n<p><a href=\"http://www.cfyc.com.vn/yoga/loi-ich-yoga.html\">XEM TH&Ecirc;M Lá»¢I &Iacute;CH YOGA</a></p>\r\n\r\n<h2>Liá»u thuá»‘c ho&agrave;n háº£o cho ng&agrave;y d&agrave;i cÄƒng tháº³ng</h2>\r\n\r\n<hr />\r\n<p><strong>Yoga sáº½ gi&uacute;p giáº£i tá»a cÄƒng tháº³ng v&agrave; thÆ° gi&atilde;n t&acirc;m há»“n cÅ©ng nhÆ° cÆ¡ thá»ƒ báº¡n.&nbsp;</strong>Báº¡n sáº½ cáº£m tháº¥y thoáº£i m&atilde;i v&agrave; nháº¹ nh&otilde;m hÆ¡n chá»‰ sau lá»›p há»c Ä‘áº§u ti&ecirc;n.&nbsp;<br />\r\n<br />\r\nC&aacute;c lá»›p Yoga ho&agrave;n háº£o gi&uacute;p giáº£i tá»a cÄƒng tháº³ng:<strong>&nbsp;Hatha, Gentle, Therapy, Stretch &amp; Sun Series</strong></p>\r\n\r\n<p><a href=\"http://www.cfyc.com.vn/yoga/loi-ich-yoga.html\">XEM TH&Ecirc;M Lá»¢I &Iacute;CH YOGA</a></p>\r\n\r\n<p><img alt=\"Yoga giáº£m cÄƒng tháº³ng\" src=\"http://www.cfyc.com.vn/images_server/themes/celebration/img/yoga-services/section2-yoga-reduces-stress.png\" /></p>\r\n\r\n<p><img src=\"http://www.cfyc.com.vn/images_server/themes/celebration/img/yoga-services/section3-ngu-ngon.jpg\" /></p>\r\n\r\n<h2>Yoga gi&uacute;p báº¡n c&oacute; má»™t sá»©c khá»e tá»‘t v&agrave; má»™t&nbsp;giáº¥c&nbsp;ngá»§&nbsp;ngon</h2>\r\n\r\n<hr />\r\n<p><strong>Yoga gi&uacute;p tÄƒng cÆ°á»ng há»‡ miá»…n dá»‹ch,</strong>&nbsp;linh hoáº¡t c&aacute;c khá»›p xÆ°Æ¡ng v&agrave; th&uacute;c Ä‘áº©y tuáº§n ho&agrave;n m&aacute;u. HÆ¡i thá»Ÿ trong Yoga v&agrave; cáº£i thiá»‡n tuáº§n ho&agrave;n m&aacute;u gi&uacute;p cÆ¡ thá»ƒ loáº¡i bá» Ä‘á»™c tá»‘ v&agrave; duy tr&igrave; má»™t cuá»™c sá»‘ng háº¡nh ph&uacute;c.&nbsp;<br />\r\n<br />\r\nC&aacute;c lá»›p Yoga ph&ugrave; há»£p gi&uacute;p báº¡n c&oacute; giáº¥c ngá»§ s&acirc;u:&nbsp;<strong>Hatha, Gentle, Therapy, Stretch v&agrave; Sun Series</strong></p>\r\n\r\n<p><a href=\"http://www.cfyc.com.vn/yoga.html#form\">ÄÄ‚NG K&Yacute; Táº¬P THá»¬</a></p>\r\n\r\n<h2>CÆ¡ thá»ƒ linh hoáº¡t hÆ¡n v&agrave; giáº£m c&aacute;c cÆ¡n Ä‘au nhanh&nbsp;hÆ¡n</h2>\r\n\r\n<hr />\r\n<p><strong>Yoga l&agrave;m giáº£m Ä‘au</strong>&nbsp;báº±ng c&aacute;ch giáº£m bá»›t sá»± cÄƒng tháº³ng v&agrave; cáº£i thiá»‡n t&iacute;nh linh hoáº¡t cá»§a báº¡n. Má»™t trong nhá»¯ng nguy&ecirc;n nh&acirc;n ch&iacute;nh cho lÆ°ng v&agrave; cá»• Ä‘au l&agrave; t&igrave;nh tráº¡ng cÄƒng cÆ¡ v&agrave; thiáº¿u linh hoáº¡t trong cÆ¡ báº¯p.&nbsp;<br />\r\n<br />\r\n[ThÆ°á»ng xuy&ecirc;n luyá»‡n táº­p Yoga c&oacute; thá»ƒ gi&uacute;p loáº¡i bá» ho&agrave;n to&agrave;n nhá»¯ng cÆ¡n Ä‘au. Táº¥t cáº£ c&aacute;c lá»›p Yoga táº¡i trung t&acirc;m lu&ocirc;n ph&ugrave; há»£p Ä‘á»ƒ l&agrave;m giáº£m cÄƒng tháº³ng v&agrave; cáº£i thiá»‡n t&iacute;nh linh hoáº¡t.]</p>\r\n\r\n<p><a href=\"http://www.cfyc.com.vn/yoga/loi-ich-yoga.html\">XEM TH&Ecirc;M Lá»¢I &Iacute;CH YOGA</a></p>\r\n\r\n<h2>Studio d&agrave;nh cho yoga Ä‘áº¡t ti&ecirc;u chuáº©n quá»‘c&nbsp;táº¿</h2>\r\n\r\n<p><strong>Ch&uacute;ng t&ocirc;i tá»± h&agrave;o mang Ä‘áº¿n nhá»¯ng tráº£i nghiá»‡m yoga tuyá»‡t vá»i nháº¥t.</strong>&nbsp;Táº¥t cáº£ studio Ä‘Æ°á»£c thiáº¿t káº¿ Ä‘áº¡t ti&ecirc;u chuáº©n quá»‘c táº¿ vá»›i sá»± káº¿t há»£p h&agrave;i h&ograve;a giá»¯a &aacute;nh s&aacute;ng, nhiá»‡t Ä‘á»™, s&agrave;n táº­p sáº½ má»Ÿ ra kh&ocirc;ng gian tÄ©nh táº¡i v&agrave; ho&agrave;n to&agrave;n thÆ° th&aacute;i cho báº¡n</p>\r\n',0,0,100,'NEW','2017-11-23 11:06:59',0),
(8,'','dfdfd','E_VOUCHER','http://222.252.16.132:8080/loyalty/voucher/yoga1.jpg','<p>dffÄ‘fdf</p>\r\n',NULL,NULL,100,'NEW','2017-11-23 11:19:58',0),
(9,'','Æ°e','E_VOUCHER','http://222.252.16.132:8080/loyalty/voucher/yoga1.jpg','<p>cvc</p>\r\n',0,0,100,'NEW','2017-11-23 11:23:35',0),
(10,NULL,'Buffet Láº©u NÆ°á»›ng VÃ  Sashimi Äáº³ng Cáº¥p Táº¡i AGrill Beer House & BBQ - 40 Tráº§n Duy HÆ°ng','PHYSICAL_VOUCHER','http://222.252.16.132:8080/loyalty/voucher/agrill1.jpg','Äiá»u kiá»‡n sá»­ dá»¥ng Thá»i háº¡n sá»­ dá»¥ng voucher: 31/12/2017 Ãp dá»¥ng cho Buffet: Buffet láº©u nÆ°á»›ng vÃ  Sashimi Ä‘áº³ng cáº¥p táº¡i AGrill Beer House & BBQ. Äáº·c biá»‡t táº·ng 01 ly Ä‘á»“ uá»‘ng/ 01 voucher (chá»n chanh tÆ°Æ¡i/ dÆ°a háº¥u Ã©p/ bia tÆ°Æ¡i Tiá»‡p vÃ ng) vÃ o táº¥t cáº£ cÃ¡c buá»•i trÆ°a Thá»i gian sá»­ dá»¥ng: Tá»« 10h00 Ä‘áº¿n 14h00 vÃ  18h00 Ä‘áº¿n 22h00 hÃ ng ngÃ y. KhÃ´ng Ã¡p dá»¥ng ngÃ y 18/11, 19/11, 20/11, 24/12. NgÃ y 30/12 vÃ  31/12 phá»¥ thu 40.000 VND/ 01 voucher. Sá»‘ lÆ°á»£ng Voucher Ã¡p dá»¥ng: 01 voucher/ 01 suáº¥t buffet/ 01 ngÆ°á»i (khÃ´ng giá»›i háº¡n voucher/ hÃ³a Ä‘Æ¡n thanh toÃ¡n, khÃ´ng tÃ¡ch hÃ³a Ä‘Æ¡n). NhÃ  hÃ ng phá»¥c vá»¥ tá»‘i thiá»ƒu bÃ n tá»« 02 khÃ¡ch trá»Ÿ lÃªn (tÃ­nh khÃ¡ch cao trÃªn 1,3m trá»Ÿ lÃªn) KhÃ¡ch hÃ ng cÃ³ thá»ƒ mua nhiá»u voucher Ä‘á»ƒ sá»­ dá»¥ng nhiá»u láº§n ChÃ­nh sÃ¡ch dÃ nh cho tráº» em: Tráº» em cao dÆ°á»›i 1,0m: Miá»…n phÃ­ (Miá»…n phÃ­ sá»‘ lÆ°á»£ng tráº» em Ä‘i kÃ¨m tÆ°Æ¡ng á»©ng vá»›i sá»‘ lÆ°á»£ng ngÆ°á»i lá»›n vÃ  tráº» em vÆ°á»£t quÃ¡ sá»‘ lÆ°á»£ng ngÆ°á»i lá»›n Ä‘i kÃ¨m phá»¥ thu 129.000 VND/ 01 tráº»). Tráº» em cao tá»« 1,0m Ä‘áº¿n 1,3m: phá»¥ thu 129.000 VND/ 01 tráº» (chÆ°a bao gá»“m VAT vÃ  thu trá»±c tiáº¿p táº¡i nhÃ  hÃ ng). Tráº» em cao trÃªn 1,3m: TÃ­nh nhÆ° ngÆ°á»i lá»›n Bao gá»“m: Thá»©c Äƒn theo Menu Ä‘Ã­nh kÃ¨m Â  KhÃ´ng bao gá»“m: NÆ°á»›c uá»‘ng theo Menu Ä‘Ã­nh kÃ¨m Â  Äiá»u kiá»‡n khÃ¡c: KhÃ¡ch hÃ ng khÃ´ng mang theo Ä‘á»“ uá»‘ng, náº¿u mang sáº½ tÃ­nh phÃ­ dá»‹ch vá»¥ theo quy Ä‘á»‹nh cá»§a nhÃ  hÃ ng. KhÃ¡ch hÃ ng muá»‘n sá»­ dá»¥ng phÃ²ng Vip vui lÃ²ng liÃªn há»‡ vá»›i hotline Ä‘á»ƒ Ä‘Æ°á»£c há»— trá»£ (phá»¥ thu 50.000 VND/ 01 ngÆ°á»i, chá»‰ Ã¡p dá»¥ng cho nhÃ³m khÃ¡ch tá»« 05 ngÆ°á»i trá»Ÿ lÃªn) Voucher chÆ°a bao gá»“m VAT NhÃ  hÃ ng chá»‹u trÃ¡ch nhiá»‡m xuáº¥t hoÃ¡ Ä‘Æ¡n tÃ i chÃ­nh theo giÃ¡ bÃ¡n voucher vÃ  giÃ¡ trá»‹ vÆ°á»£t trá»™i khi khÃ¡ch hÃ ng yÃªu cáº§u Äiá»u kiá»‡n hÃ³a Ä‘Æ¡n: KhÃ¡ch hÃ ng vui lÃ²ng thanh toÃ¡n thÃªm VAT khi cÃ³ nhu cáº§u xuáº¥t hÃ³a Ä‘Æ¡n. KhÃ´ng Ã¡p dá»¥ng cho mua mang vá» KhÃ´ng Ã¡p dá»¥ng cho cÃ¡c chÆ°Æ¡ng trÃ¬nh khuyáº¿n mÃ£i khÃ¡c KhÃ´ng cÃ³ giÃ¡ trá»‹ quy Ä‘á»•i thÃ nh tiá»n, khÃ´ng hoÃ n tráº£ tiá»n thá»«a ThÃ´ng tin Ä‘áº·t háº¹n: 096.2133.883 - 088.891.3883. Vui lÃ²ng Ä‘áº·t bÃ n trÆ°á»›c Ä‘á»ƒ Ä‘Æ°á»£c phá»¥c vá»¥ tá»‘t nháº¥t Xem báº£ng giÃ¡ chi tiáº¿t ThÃ´ng tin chi tiáº¿t HÃ²a chung khÃ´ng khÃ­ nhá»™n nhá»‹p vÃ  táº¥t báº­t cá»§a nhá»¯ng ngÃ y cuá»‘i nÄƒm cÅ©ng nhÆ° chÃ o Ä‘Ã³n nÄƒm má»›i sáº¯p Ä‘áº¿n,Â AGrill Beer House & BBQÂ Ä‘á»“ng hÃ nh cÃ¹ng AdayroiÂ mang Ä‘áº¿n Æ°u Ä‘Ã£i choÂ Buffet Láº©u NÆ°á»›ng Ä‚n Tháº£ Ga.Â Click Mua vÃ  cÃ¹ng báº¡n bÃ¨, ngÆ°á»i thÃ¢n lÃªn káº¿ hoáº¡ch thÆ°á»Ÿng thá»©c nhá»¯ng mÃ³n Äƒn ngon trong khÃ´ng gian áº¥m cÃºng vÃ  sang trá»ng cá»§aÂ AGrill Beer House & BBQ ngay tá»« bÃ¢y giá» báº¡n nhÃ©! Â  Â  Â  Â  Khai vá»‹ Ä‘Ãºng Ä‘iá»‡u HÃ£y báº¯t Ä‘áº§u bá»¯a tiá»‡c buffet cá»§a báº¡n vá»›i cÃ¡c mÃ³n khai vá»‹ thanh mÃ¡t, nháº¹ nhÃ ngÂ trong má»™t bá»¯a tiá»‡c nÆ°á»›ng: salad dÆ°a chuá»™t, salad hoa quáº£, rau tá»•ng há»£p. Â  Â  Salad hoa quáº£ Â  Â  Â  Â  Salad rau tá»•ng há»£p Â  Äáº¿n vá»›iÂ AGrill Beer House & BBQ, bá»¯a tiá»‡c buffetÂ cá»§a báº¡n cÃ²n Ä‘Æ°á»£c thÃªm vá»‹, thÃªm sáº¯c vá»›iÂ cÃ¡c mÃ³nÂ sushi,Â sashimiÂ tÆ°Æ¡i sá»‘ng, Ä‘áº£m báº£o vá»‡ sinh an toÃ n thá»±c pháº©m. YÃªu cáº§u cao cÃ¹ng sá»± cÃ´ng phu, tá»‰ má»‰ giÃºp cho má»—i mÃ³n Äƒn Ä‘Æ°á»£c phá»¥c vá»¥ cho thá»±c khÃ¡ch Ä‘á»u nhÆ° má»™t tÃ¡c pháº©m nghá»‡ thuáº­t nhá» vá»›i sá»± hÃ i hÃ²a tuyá»‡t Ä‘á»‘i vá» mÃ u sáº¯c vÃ  hÆ°Æ¡ng vá»‹. Äáº·c biá»‡t, cÃ¡ há»“i,Â cÃ¡ ngá»« Ä‘áº¡i dÆ°Æ¡ng biá»ƒn sÃ¢u tÆ°Æ¡i nháº­p trá»±c tiáº¿p má»—i ngÃ y Ä‘á»ƒ lÃ m sashimiÂ sáº½ mang Ä‘áº¿n mÃ¹i vá»‹ tÆ°Æ¡i ngon. Cháº¯c cháº¯n báº¡n sáº½ khÃ³ lÃ²ng mÃ  rá»i máº¯t khá»i nhá»¯ng lÃ¡t cÃ¡ há»“i, cÃ¡ ngá»« hay báº¡ch tuá»™c tÆ°Æ¡i rÃ³i, Ä‘áº§y kÃ­ch thÃ­ch. Â  Â  Äa dáº¡ng sashimi tÆ°Æ¡i ngon Â  Â  Â  Â  Â  Â  Â  Thá»±c Ä‘Æ¡n mang Ä‘áº¿n má»™t danh sÃ¡ch cÃ¡c mÃ³n sushi háº¥p dáº«n vÃ  Ä‘áº§y mÃ u sáº¯c: Sushi trá»©ng, sushi thanh cua, sushi rau cá»§, sushi xÃºc xÃ­ch, maki trá»©ng, maki thanh cua, maki bÃ², maki tÃ´m, sushi cáº£i vÃ ng, sushi dÆ°a chuá»™t...Â  Â  Â  Â  Â  Â  Â  Â  MÃ³n nÆ°á»›ng phong phÃº mang hÆ°Æ¡ng vá»‹ Ä‘áº­m Ä‘Ã  â€‹Má»™t list cÃ¡c danh sÃ¡ch cÃ¡c mÃ³n thá»‹t nÆ°á»›ng vá»›i nguyÃªn liá»‡u háº£o háº¡ng, nhá»¯ng lÃ¡t thá»‹t Ä‘Æ°á»£c thÃ¡i vá»›i mÃ u sáº¯c Ä‘áº¹p máº¯t, vÃ´ cÃ¹ng háº¥p dáº«n, Ä‘Æ°á»£c táº©m Æ°á»›p theo phong cÃ¡ch vÃ  nÆ°á»›c sá»‘t khÃ¡c nhau:Â GÃ u bÃ² Má»¹, ba chá»‰ heo, ba chá»‰ bÃ² Má»¹, mÃ¡ heo, náº¡c vai heo, ba chá»‰ cuá»™n náº¥m kim chÃ¢m,Â á»©c bÃ² Má»¹, thÄƒn bÃ² Má»¹, sÆ°á»n heo, náº§m, Ä‘Ã¹i gÃ  xiÃªn nÆ°á»›ng... CÃ¹ng vá»›i 03 phong cÃ¡ch Æ°á»›p khÃ¡c biá»‡t nhÆ° nÆ°á»›ng muá»‘i, nÆ°á»›ngÂ sá»‘t BBQ, nÆ°á»›ng sá»‘t Galbi, cháº¯c háº³n báº¡n sáº½ cÃ³ nhiá»u tráº£i nghiá»‡m vá» hÆ°Æ¡ng vá»‹ mÃ³n nÆ°á»›ng táº¡iÂ AGrill Beer House & BBQ.Â  Â  Â  Â  Â  Náº¿u muá»‘n cáº£m nháº­n hÆ°Æ¡ng vá»‹ tÆ°Æ¡i nguyÃªn vÃ  truyá»n thá»‘ng cá»§a mÃ³n nÆ°á»›ng, báº¡n cÃ³ thá»ƒ chá»n cÃ¡c loáº¡i nguyÃªn liá»‡u Æ°á»›p muá»‘i Ä‘Æ¡n giáº£n, vá»‹ Ä‘áº­m Ä‘Ã . Vá»›i nhá»¯ng ai yÃªu thÃ­ch mÃ³n nÆ°á»›ng HÃ n thÃ¬ sá»‘t BBQ cháº¯c háº³n lÃ  lá»±a chá»n khÃ´ng thá»ƒ bá» qua. Sá»‘t BBQ lÃ  má»™t trong nhá»¯ng nÆ°á»›c sá»‘t ná»•i tiáº¿ng lÃ m nÃªn thÃ nh cÃ´ng cho mÃ³n nÆ°á»›ng HÃ n Quá»‘c. Loáº¡i nÆ°á»›c sá»‘t Ä‘Æ°á»£c lÃ m theo cÃ´ng thá»©c bÃ­ truyá»n cá»§a cÃ¡c Ä‘áº§u báº¿p xá»© HÃ n cÃ³ vá»‹ thÆ¡m vÃ  ngá»t ráº¥t Ä‘áº·c trÆ°ng, dá»… lÃ m \"xiÃªu lÃ²ng\" nhá»¯ng tÃ­n Ä‘á»“ yÃªu thÃ­ch mÃ³n nÆ°á»›ng. Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Sá»‘t galbi cÅ©ng lÃ  má»™t trong nhá»¯ng loáº¡i nÆ°á»›c sá»‘t cÃ³ xuáº¥t xá»© tá»« HÃ n Quá»‘c, Ä‘Æ°á»£c cháº¿ biáº¿n tá»« nhá»¯ng nguyÃªn liá»‡u cá»‘t tÃ¡o, lÃª, nho thÃ¢n thiá»‡n káº¿t há»£p vá»›i vá» cam, cá»‘t xÆ°Æ¡ng bÃ², dáº§u olive, dáº§u mÃ¨, tÆ°Æ¡ng cÃ , gáº¡o rang, tÆ°Æ¡ng Ä‘áº­u, sÃ¬ dáº§u...cÃ³ vá»‹ thÆ¡m ngáº­y mÃ¹i bÃ², ngá»t vÃ  bÃ©o. Hy vá»ng thá»±c khÃ¡ch cÃ³ thá»ƒ thÆ°á»Ÿng thá»©c trá»n váº¹n vÃ  cáº£m nháº­n sá»± Ä‘á»™c Ä‘Ã¡o cÅ©ng nhÆ° má»›i láº¡ cá»§a vá»‹ sá»‘t nÃ y qua cÃ¡c mÃ³n Äƒn táº¡iÂ AGrill Beer House & BBQ. Â  Â  Â  Â  Â  Â  Â  Ba chá»‰ cuá»‘n náº¥m kim chÃ¢m Â  Â  Â  Â  TÃ´m nÆ°á»›ng Â  Â  Â  Â  Báº¡ch tuá»™c nÆ°á»›ng Â  Â  Â  Â  Má»±c nÆ°á»›ng Â  Â  Â  Â  ÄÃ¹i gÃ  xiÃªn nÆ°á»›ng Â  Â  Â  Â  XÃºc xÃ­ch nÆ°á»›ng Â  Â  Â  Â  Rau cá»§ tá»•ng há»£p Â  CÃ¡c mÃ³n panchan Äƒn kÃ¨m vá»›i mÃ³n nÆ°á»›ng lÃ  má»™t pháº§n quan trá»ng khÃ´ng thá»ƒ thiáº¿u: Panchan cháº£i tháº£o, hÃ nh háº¹, dÆ°a chuá»™t cay, cá»§ cáº£i... Â  Â  Panchan cáº£i tháº£o (kim chi) Â  NgoÃ i ra menu cÃ²n mang Ä‘áº¿n cÃ¡c mÃ³n Äƒn kÃ¨m mang phong cÃ¡ch áº©m thá»±c HÃ n: CÆ¡m bÃ¡t Ä‘Ã¡, canh rong biá»ƒn, canh kim chi. Sau khi thÆ°á»Ÿng thá»©c cÃ¡c mÃ³n nÆ°á»›ng Ä‘áº­m Ä‘Ã , cÃ¡c mÃ³n láº©u thÆ¡m ngon sáº½ giÃºp báº¡n cÃ¢n báº±ng láº¡i vá»‹ giÃ¡c. NhÃ  hÃ ngÂ phá»¥c vá»¥ báº¡n láº©u ThÃ¡i chua cay vÃ  láº©u Miso rong biá»ƒn.Â BÃªn cáº¡nh nhá»¯ng mÃ³n nÆ°á»›ng, láº©u thÆ¡m ngon, báº¡n cÃ³ thá»ƒ thÆ°á»Ÿng thá»©c cÃ¡c mÃ³n Äƒn kÃ¨m Ä‘a dáº¡ng Ä‘Æ°á»£c cháº¿ biáº¿n Ä‘Ãºng vá»‹, mang Ä‘áº¿n hÆ°Æ¡ng vá»‹ Ä‘áº·c sáº¯c cho thá»±c khÃ¡ch thÆ°á»Ÿng thá»©c. Â  Â  Â  Â  Giá»›i thiá»‡u NhÃ  hÃ ngÂ AGrill Beer House & BBQ AGrill Beer House & BBQÂ lÃ  nhÃ  hÃ ng chuyÃªn Ä‘á»“ nÆ°á»›ng Ä‘Æ°á»£c biáº¿t Ä‘áº¿n vá»›i phong cÃ¡ch phá»¥c vá»¥ Ä‘á»™c Ä‘Ã¡o hÆ¡n háº¿t lÃ  luÃ´n cáº©n tháº­n tá»« khÃ¢u cháº¿ biáº¿n tá»›i khi Ä‘em cho quÃ½Â khÃ¡ch thÆ°á»Ÿng thá»©c.Â  Â  Â  Â  Â  Â  Â  Â  AGrill Beer House & BBQ cÃ²n ná»•i tiáº¿ng vá»›i thá»±c Ä‘Æ¡n chá»n sáºµn, nghá»‡ thuáº­t cÃ¢n báº±ng tuyá»‡t vá»i giá»¯a hÆ°Æ¡ng vá»‹, mÃ u sáº¯c vÃ  cÃ¡ch bÃ i trÃ­ mÃ³n Äƒn. ChÃ­nh vÃ¬ váº­y, nhÃ  hÃ ng thÆ°á»ng xuyÃªn Ä‘Æ°á»£c xáº¿p vÃ o danh sÃ¡ch cÃ¡c Ä‘á»‹a Ä‘iá»ƒm phá»¥c vá»¥ cÃ¡c mÃ³n Äƒn ngonÂ táº¡i HÃ  Ná»™i. Äiá»ƒm ná»•i báº­t cá»§a nhÃ  hÃ ng Ä‘Ã³ lÃ  phong cÃ¡ch phá»¥c vá»¥ khÃ´ng quÃ¡ phÃ´ trÆ°Æ¡ng, ráº¥t thanh lá»‹ch vÃ  tinh táº¿ theo Ä‘Ãºng tiÃªu chuáº©n phá»¥c vá»¥ cá»§a quáº£n lÃ½ AGrill Beer House & BBQ. Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  Â  KhÃ¡ch hÃ ng vui lÃ²ng liÃªn há»‡ trÆ°á»›c Ä‘á»ƒ Ä‘Æ°á»£c phá»¥c vá»¥ tá»‘t hÆ¡n!',369000,295000,199,'ACTIVE','2017-11-23 14:26:25',1600);

/*Table structure for table `voucher_codes` */

DROP TABLE IF EXISTS `voucher_codes`;

CREATE TABLE `voucher_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucherId` int(11) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `isDeliver` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `voucher_codes` */

insert  into `voucher_codes`(`id`,`voucherId`,`code`,`isDeliver`) values 
(1,1,'ADNGFHJJDH',1),
(2,1,'SFFGGHSGG',0);

/*Table structure for table `voucher_images` */

DROP TABLE IF EXISTS `voucher_images`;

CREATE TABLE `voucher_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucherId` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'NEW',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

/*Data for the table `voucher_images` */

insert  into `voucher_images`(`id`,`voucherId`,`image`,`order`,`status`,`createdDate`) values 
(1,1,'http://222.252.16.132:8080/loyalty/voucher/agrill1.jpg',1,'ACTIVE','2017-11-10 16:14:09'),
(2,1,'http://222.252.16.132:8080/loyalty/voucher/agrill2.jpg',2,'ACTIVE','2017-11-10 16:16:02'),
(3,1,'http://222.252.16.132:8080/loyalty/voucher/agrill3.jpg',3,'ACTIVE','2017-11-10 16:16:03'),
(4,1,'http://222.252.16.132:8080/loyalty/voucher/agrill4.jpg',4,'ACTIVE','2017-11-10 16:16:45'),
(5,1,'http://222.252.16.132:8080/loyalty/voucher/agrill5.jpg',5,'ACTIVE','2017-11-10 16:16:46'),
(6,1,'http://222.252.16.132:8080/loyalty/voucher/agrill6.jpg',6,'ACTIVE','2017-11-10 16:16:46'),
(7,1,'http://222.252.16.132:8080/loyalty/voucher/agrill7.jpg',7,'ACTIVE','2017-11-10 16:16:48'),
(8,2,'http://222.252.16.132:8080/loyalty/voucher/yukssam1.jpg',1,'ACTIVE','2017-11-10 16:22:30'),
(9,2,'http://222.252.16.132:8080/loyalty/voucher/yukssam2.jpg',2,'ACTIVE','2017-11-10 16:22:31'),
(10,2,'http://222.252.16.132:8080/loyalty/voucher/yukssam3.jpg',3,'ACTIVE','2017-11-10 16:22:33'),
(11,2,'http://222.252.16.132:8080/loyalty/voucher/yukssam4.jpg',4,'ACTIVE','2017-11-10 16:22:34'),
(12,2,'http://222.252.16.132:8080/loyalty/voucher/yukssam5.jpg',5,'ACTIVE','2017-11-10 16:22:36'),
(13,2,'http://222.252.16.132:8080/loyalty/voucher/yukssam6.jpg',6,'ACTIVE','2017-11-10 16:22:38'),
(14,2,'http://222.252.16.132:8080/loyalty/voucher/yukssam7.jpg',7,'ACTIVE','2017-11-10 16:22:39'),
(15,3,'http://222.252.16.132:8080/loyalty/voucher/trebaida1.jpg',1,'ACTIVE','2017-11-10 16:22:42'),
(16,3,'http://222.252.16.132:8080/loyalty/voucher/trebaida2.jpg',2,'ACTIVE','2017-11-10 16:22:43'),
(17,3,'http://222.252.16.132:8080/loyalty/voucher/trebaida3.jpg',3,'ACTIVE','2017-11-10 16:22:45'),
(18,3,'http://222.252.16.132:8080/loyalty/voucher/trebaida4.jpg',4,'ACTIVE','2017-11-10 16:22:46'),
(19,3,'http://222.252.16.132:8080/loyalty/voucher/trebaida5.jpg',5,'ACTIVE','2017-11-10 16:22:47'),
(20,4,'http://222.252.16.132:8080/loyalty/voucher/flamingo1.jpg',1,'ACTIVE','2017-11-10 16:22:50'),
(21,4,'http://222.252.16.132:8080/loyalty/voucher/flamingo2.png',2,'ACTIVE','2017-11-10 16:22:51'),
(22,4,'http://222.252.16.132:8080/loyalty/voucher/flamingo3.jpg',3,'ACTIVE','2017-11-10 16:22:52'),
(23,4,'http://222.252.16.132:8080/loyalty/voucher/flamingo4.jpg',4,'ACTIVE','2017-11-10 16:22:53'),
(24,4,'http://222.252.16.132:8080/loyalty/voucher/flamingo5.jpg',5,'ACTIVE','2017-11-10 16:22:55'),
(25,4,'http://222.252.16.132:8080/loyalty/voucher/flamingo6.jpg',6,'ACTIVE','2017-11-10 16:22:56'),
(26,4,'http://222.252.16.132:8080/loyalty/voucher/flamingo7.jpg',7,'ACTIVE','2017-11-10 16:22:57'),
(27,5,'http://222.252.16.132:8080/loyalty/voucher/dart1.jpg',1,'ACTIVE','2017-11-10 16:24:21'),
(28,5,'http://222.252.16.132:8080/loyalty/voucher/dart2.jpg',2,'ACTIVE','2017-11-10 16:24:22'),
(29,5,'http://222.252.16.132:8080/loyalty/voucher/dart3.jpg',3,'ACTIVE','2017-11-10 16:24:24'),
(30,5,'http://222.252.16.132:8080/loyalty/voucher/dart4.jpg',4,'ACTIVE','2017-11-10 16:24:25'),
(31,5,'http://222.252.16.132:8080/loyalty/voucher/dart5.jpg',5,'ACTIVE','2017-11-10 16:24:26'),
(32,5,'http://222.252.16.132:8080/loyalty/voucher/dart6.jpg',6,'ACTIVE','2017-11-10 16:24:28'),
(33,5,'http://222.252.16.132:8080/loyalty/voucher/dart7.jpg',7,'ACTIVE','2017-11-10 16:24:17');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
