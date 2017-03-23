-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: cbcs
-- ------------------------------------------------------
-- Server version	5.7.12-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `faculty_choice`
--

DROP TABLE IF EXISTS `faculty_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty_choice` (
  `choice_id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `exprience` int(11) DEFAULT NULL,
  PRIMARY KEY (`choice_id`),
  KEY `fk_facultychoice_faculty_id_idx` (`faculty_id`),
  KEY `fk_facultychoice_subject_id_idx` (`subject_id`),
  CONSTRAINT `fk_facultychoice_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `timetable_faculty` (`faculty_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_facultychoice_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `timetable_subject` (`subject_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_choice`
--

LOCK TABLES `faculty_choice` WRITE;
/*!40000 ALTER TABLE `faculty_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `faculty_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_choice`
--

DROP TABLE IF EXISTS `timetable_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_choice` (
  `choice_id` int(11) NOT NULL,
  `choice_studid` int(11) DEFAULT NULL,
  `choice_subjectid` varchar(45) DEFAULT NULL,
  `choice_credit` int(11) DEFAULT NULL,
  `choice_sem` varchar(45) DEFAULT NULL,
  `choice_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`choice_id`),
  UNIQUE KEY `choice_studid_UNIQUE` (`choice_studid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_choice`
--

LOCK TABLES `timetable_choice` WRITE;
/*!40000 ALTER TABLE `timetable_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `timetable_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_course`
--

DROP TABLE IF EXISTS `timetable_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(45) DEFAULT NULL,
  `course_academic_year` varchar(45) DEFAULT NULL,
  `course_academic_sem` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_course`
--

LOCK TABLES `timetable_course` WRITE;
/*!40000 ALTER TABLE `timetable_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `timetable_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_faculty`
--

DROP TABLE IF EXISTS `timetable_faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_faculty` (
  `faculty_id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_empid` varchar(45) DEFAULT NULL,
  `faculty_designation` varchar(45) DEFAULT NULL,
  `faculty_experience` varchar(45) DEFAULT NULL,
  `faculty_qualification` varchar(45) DEFAULT NULL,
  `faculty_workinghour` int(11) DEFAULT NULL,
  `faculty_email` varchar(45) DEFAULT NULL,
  `faculty_password` varchar(45) DEFAULT NULL,
  `faculty_name` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`faculty_id`),
  UNIQUE KEY `faculty_empid_UNIQUE` (`faculty_empid`),
  UNIQUE KEY `faculty_email_UNIQUE` (`faculty_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_faculty`
--

LOCK TABLES `timetable_faculty` WRITE;
/*!40000 ALTER TABLE `timetable_faculty` DISABLE KEYS */;
INSERT INTO `timetable_faculty` VALUES (1,'10','asch','4','dfh',16,'r@gmail.com','r','Ram'),(2,'45148','H.O.D.','15','Dr.',10,'vishal@gmail.com','12','Vishal');
/*!40000 ALTER TABLE `timetable_faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_incharge`
--

DROP TABLE IF EXISTS `timetable_incharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_incharge` (
  `incharge_id` int(11) NOT NULL AUTO_INCREMENT,
  `incharge_name` varchar(45) DEFAULT NULL,
  `incharge_email` varchar(45) DEFAULT NULL,
  `incharge_designation` varchar(45) DEFAULT NULL,
  `incharge_password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`incharge_id`),
  UNIQUE KEY `incharge_email_UNIQUE` (`incharge_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_incharge`
--

LOCK TABLES `timetable_incharge` WRITE;
/*!40000 ALTER TABLE `timetable_incharge` DISABLE KEYS */;
INSERT INTO `timetable_incharge` VALUES (1,'r','r@gmail.com','senior','r');
/*!40000 ALTER TABLE `timetable_incharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_student`
--

DROP TABLE IF EXISTS `timetable_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(45) DEFAULT NULL,
  `student_rollno` int(11) DEFAULT NULL,
  `student_email` varchar(45) DEFAULT NULL,
  `student_password` varchar(45) DEFAULT NULL,
  `student_course` varchar(45) DEFAULT NULL,
  `student_sem` varchar(45) DEFAULT NULL,
  `student_maxcredit` int(11) DEFAULT NULL,
  `student_mincredit` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `student_email_UNIQUE` (`student_email`),
  UNIQUE KEY `student_rollno_UNIQUE` (`student_rollno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_student`
--

LOCK TABLES `timetable_student` WRITE;
/*!40000 ALTER TABLE `timetable_student` DISABLE KEYS */;
INSERT INTO `timetable_student` VALUES (1,'raa',1454007,'raa@gmail.com','raa',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `timetable_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_subject`
--

DROP TABLE IF EXISTS `timetable_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_subject` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(45) DEFAULT NULL,
  `subject_semester` varchar(45) DEFAULT NULL,
  `subject_maxstudent` int(11) DEFAULT NULL,
  `subject_minstudent` int(11) DEFAULT NULL,
  `subject_credit` int(11) DEFAULT NULL,
  `academic_year` varchar(45) DEFAULT NULL,
  `course_name` varchar(45) DEFAULT NULL,
  `lacture_credit` int(11) DEFAULT '0',
  `practical_credit` int(11) DEFAULT '0',
  `tutorial_credit` int(11) DEFAULT '0',
  `subject_code` varchar(45) DEFAULT NULL,
  `subject_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`subject_id`),
  UNIQUE KEY `subject_code_UNIQUE` (`subject_code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_subject`
--

LOCK TABLES `timetable_subject` WRITE;
/*!40000 ALTER TABLE `timetable_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `timetable_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_time`
--

DROP TABLE IF EXISTS `timetable_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_time` (
  `time_id` int(11) NOT NULL AUTO_INCREMENT,
  `time_day` varchar(45) DEFAULT NULL,
  `time_time` datetime DEFAULT NULL,
  `time_lecture` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`time_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_time`
--

LOCK TABLES `timetable_time` WRITE;
/*!40000 ALTER TABLE `timetable_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `timetable_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_venue`
--

DROP TABLE IF EXISTS `timetable_venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_venue` (
  `vanue_id` int(11) NOT NULL AUTO_INCREMENT,
  `venue_name` varchar(45) DEFAULT NULL,
  `venue_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`vanue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_venue`
--

LOCK TABLES `timetable_venue` WRITE;
/*!40000 ALTER TABLE `timetable_venue` DISABLE KEYS */;
/*!40000 ALTER TABLE `timetable_venue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-23  9:57:23
