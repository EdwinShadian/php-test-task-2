-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: ri_test
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hash` char(128) NOT NULL,
  `type` tinyint DEFAULT '0' COMMENT '0 - Файл пользователя\n1 - Файл репетитора',
  `is_delete` tinyint(1) DEFAULT '0',
  `size` int DEFAULT NULL,
  `local_name` varchar(100) DEFAULT NULL,
  `typefile` text,
  `time` int DEFAULT NULL,
  `real_size` int DEFAULT '0',
  `real_hash` char(128) DEFAULT NULL,
  `dir` text,
  `server_id` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `files_server_id_fk` (`server_id`),
  KEY `files_hash_index` (`hash`),
  KEY `files_local_name_index` (`local_name`),
  KEY `files_real_hash_index` (`real_hash`),
  CONSTRAINT `files_server_id_fk` FOREIGN KEY (`server_id`) REFERENCES `server` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2159589 DEFAULT CHARSET=utf8mb3 COMMENT='Таблица файлов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (93,'e00c0a067b3ba286cd78c371bf7b6935ccbd7545b6d025a9925353a9fdadac025e4469fe5b7c1fa2455896500965971e11363c22029f64fd39863fcc44c8978f',1,0,143189,'1597142924745529172.jpg','image/jpeg',1597142924,53751,NULL,'hdd2/',1),(1937984,'1b160d2fe3263504e4e7de5f4b58b5bcbd4df7b23cb106b04d8f1203343b38c8c51f4a98683747815d71fbf3d7c0ea5d2724fddae0b9b2ae870b6ca96de0d472',1,0,13795,'1625771873142432598.jpg','image/jpeg',1625771873,4151,NULL,'hdd2/',2);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_course_info`
--

DROP TABLE IF EXISTS `main_course_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_course_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_general_ci,
  `price_normal` int DEFAULT NULL,
  `price_top` int DEFAULT NULL,
  `description_list` text COLLATE utf8mb4_general_ci,
  `is_other` tinyint DEFAULT '0' COMMENT '0 - основной\n1 - группы для доступа к тестам',
  `alias` text COLLATE utf8mb4_general_ci,
  `type` tinyint(1) DEFAULT '0' COMMENT '0 - не курс\n1 - платный курс\n2 - доп курс\n3 - пробный курс\n4 - курс марафона\n5 - мотивация марафона\n6 - мегазабег\n7 - летняя школа\n8 - ТА\n9 - Интенсив',
  `lessons_count` tinyint DEFAULT '0',
  `is_public` tinyint(1) DEFAULT '0',
  `time_duration_hours` int DEFAULT '0',
  `title` text COLLATE utf8mb4_general_ci,
  `description` text COLLATE utf8mb4_general_ci,
  `name_case_1` tinytext COLLATE utf8mb4_general_ci,
  `img` int DEFAULT '2085763',
  `parent_id` int DEFAULT NULL,
  `bin_id` int DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT '0',
  `is_divided_by_level` tinyint(1) DEFAULT '0' COMMENT 'Есть ли разделение по уровням',
  `divided_by_level_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Текст который отображается если курс поддерживает разделение а юзер ещё не прошёл тестирование',
  `count_levels` tinyint DEFAULT '1',
  `id_ta_test` int DEFAULT NULL,
  `is_show_buy_top` tinyint(1) DEFAULT '1' COMMENT 'показать ли продажу этого курса',
  `is_show_buy_standard` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `main_course_info_main_course_info_id_fk` (`parent_id`),
  KEY `main_course_info_files_id_fk` (`img`),
  KEY `main_course_info_tests_id_fk` (`id_ta_test`),
  CONSTRAINT `main_course_info_files_id_fk` FOREIGN KEY (`img`) REFERENCES `files` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_course_info`
--

LOCK TABLES `main_course_info` WRITE;
/*!40000 ALTER TABLE `main_course_info` DISABLE KEYS */;
INSERT INTO `main_course_info` VALUES (1,'История',500,700,'\"<p>Полный курс подготовки по <b>истории<\\/b>&nbsp; к ЕГЭ с любого уровня до вуза мечты с профессиональным репетитором в мини-группах<\\/p>\\n<ul>\\n\\t<li><b>Продолжительность:<\\/b>&nbsp;8 месяцев<\\/li>\\n\\t<li><b>Старт:<\\/b>&nbsp;сентябрь-октябрь<\\/li>\\n\\t<li><b>Средний балл курса:<\\/b>&nbsp;82<\\/li>\\n<\\/ul>\"',0,'hist',1,NULL,1,NULL,'История',NULL,'Истории',NULL,NULL,1,0,0,NULL,1,852,1,1),(2,'Обществознание',500,700,'\"<p>Полный курс подготовки по <b>обществознанию<\\/b>&nbsp; к ЕГЭ с любого уровня до вуза мечты с профессиональным репетитором в мини-группах<\\/p>\\n<ul>\\n\\t<li><b>Продолжительность:<\\/b>&nbsp;8 месяцев<\\/li>\\n\\t<li><b>Старт:<\\/b>&nbsp;сентябрь-октябрь<\\/li>\\n\\t<li><b>Средний балл курса:<\\/b>&nbsp;82<\\/li>\\n<\\/ul>\"',0,'soc',1,NULL,1,NULL,'Обществознание',NULL,'Обществознанию',NULL,NULL,2,0,0,NULL,1,853,1,1),(3,'Литература',500,700,'\"<p>Полный курс подготовки по <b>литературе<\\/b>&nbsp; к ЕГЭ с любого уровня до вуза мечты с профессиональным репетитором в мини-группах<\\/p>\\n<ul>\\n\\t<li><b>Продолжительность:<\\/b>&nbsp;8 месяцев<\\/li>\\n\\t<li><b>Старт:<\\/b>&nbsp;сентябрь-октябрь<\\/li>\\n\\t<li><b>Средний балл курса:<\\/b>&nbsp;83<\\/li>\\n<\\/ul>\"',0,'lit',1,NULL,1,NULL,'Литература',NULL,'Литературе',NULL,NULL,4,0,0,NULL,1,854,1,1),(4,'Русский язык',500,700,'\"<p>Полный курс подготовки по <b>русскому языку<\\/b>&nbsp; к ЕГЭ с любого уровня до вуза мечты с профессиональным репетитором в мини-группах<\\/p>\\n<ul>\\n\\t<li><b>Продолжительность:<\\/b>&nbsp;8 месяцев<\\/li>\\n\\t<li><b>Старт:<\\/b>&nbsp;сентябрь-октябрь<\\/li>\\n\\t<li><b>Средний балл курса:<\\/b>&nbsp;90<\\/li>\\n<\\/ul>\"',0,'rus',1,NULL,1,NULL,'Русский язык',NULL,'Русскому языку',NULL,NULL,8,0,0,NULL,1,855,1,1),(5,'Английский язык',500,700,'\"<p>Полный курс подготовки по <b>английскому языку<\\/b>&nbsp; к ЕГЭ с любого уровня до вуза мечты с профессиональным репетитором в мини-группах<\\/p>\\n<ul>\\n\\t<li><b>Продолжительность:<\\/b>&nbsp;8 месяцев<\\/li>\\n\\t<li><b>Старт:<\\/b>&nbsp;сентябрь-октябрь<\\/li>\\n\\t<li><b>Средний балл курса:<\\/b>&nbsp;88<\\/li>\\n<\\/ul>\"',0,'eng',1,NULL,1,NULL,'Английский язык',NULL,'Английскому языку',NULL,NULL,16,0,1,'Список репетиторов будет доступен тебе после прохождения placement test (тестирование, которое определяет твой уровень)\n<br/><br/>\nПожалуйста, не переживай! Распределительное тестирование — это не оценка тебя и не приговор, мы же не в школе! 😉<br/>\nPlacement test помогает нам формировать группы так, что тебе было комфортно на занятиях. ❤\n<br/><br/>\nBreak a leg 🍀',2,856,1,1),(6,'Математика',500,700,'\"<p>Полный курс подготовки по <b>профильной математике<\\/b>&nbsp; к ЕГЭ с любого уровня до вуза мечты с профессиональным репетитором в мини-группах<\\/p>\\n<ul>\\n\\t<li><b>Продолжительность:<\\/b>&nbsp;8 месяцев<\\/li>\\n\\t<li><b>Старт:<\\/b>&nbsp;сентябрь-октябрь<\\/li>\\n\\t<li><b>Средний балл курса:<\\/b>&nbsp;80<\\/li>\\n<\\/ul>\"',0,'math',1,NULL,1,NULL,'Математика',NULL,'Профильной математике',NULL,NULL,32,0,1,'Список репетиторов будет доступен тебе после прохождения тестирования, которое определит твой сегодняшний уровень знаний! 💫\n<br/><br/>\nНе переживай! Распределительное тестирование нужно для того, чтобы сформировать группы так, чтобы тебе было комфортно на занятиях) 🙌🏻\n<br/><br/>\nГлавное — отвечай на вопросы честно. Пожалуйста, никуда не подглядывай и сделай весь тест за один раз, не затягивай его на несколько дней😴\n<br/><br/>\nВ зависимости от твоего балла и времени прохождения ты будешь закреплён или за базовым, или за продвинутым уровнем. Если в процессе обучения ты почувствуешь, что твой уровень изменился , то обязательно обратись к своему репетитору, при согласовании с ним можно будет перейти на другой уровень😎\n<br/><br/>\nЗнай, что уровень — не про разделение на «сильных» и «слабых» и не про объём работы, а про траекторию обучения и темп освоения информации. На любом из уровней тебя ждёт серьёзная подготовка, требующая упорства и трудолюбия. Успехов тебе🙏🏻',2,857,1,1),(7,'Информатика',500,700,'\"<p>Полный курс подготовки по <b>информатике<\\/b>&nbsp; к ЕГЭ с любого уровня до вуза мечты с профессиональным репетитором в мини-группах<\\/p>\\n<ul>\\n\\t<li><b>Продолжительность:<\\/b>&nbsp;8 месяцев<\\/li>\\n\\t<li><b>Старт:<\\/b>&nbsp;сентябрь-октябрь<\\/li>\\n\\t<li><b>Средний балл курса:<\\/b>&nbsp;80<\\/li>\\n<\\/ul>\"',0,'inf',1,NULL,1,NULL,'Информатика',NULL,'Информатике',NULL,NULL,64,0,0,NULL,1,858,0,1),(8,'Химия',500,700,'\"<p>Полный курс подготовки по <b>химии<\\/b>&nbsp; к ЕГЭ с любого уровня до вуза мечты с профессиональным репетитором в мини-группах<\\/p>\\n<ul>\\n\\t<li><b>Продолжительность:<\\/b>&nbsp;8 месяцев<\\/li>\\n\\t<li><b>Старт:<\\/b>&nbsp;сентябрь-октябрь<\\/li>\\n\\t<li><b>Средний балл курса:<\\/b>&nbsp;80<\\/li>\\n<\\/ul>\"',0,'him',1,NULL,1,NULL,'Химия',NULL,'Химии',NULL,NULL,128,0,0,NULL,1,859,0,1),(9,'Биология',500,700,'\"<p>Полный курс подготовки по <b>биологии<\\/b>&nbsp; к ЕГЭ с любого уровня до вуза мечты с профессиональным репетитором в мини-группах<\\/p>\\n<ul>\\n\\t<li><b>Продолжительность:<\\/b>&nbsp;8 месяцев<\\/li>\\n\\t<li><b>Старт:<\\/b>&nbsp;сентябрь-октябрь<\\/li>\\n\\t<li><b>Средний балл курса:<\\/b>&nbsp;80<\\/li>\\n<\\/ul>\"',0,'bio',1,NULL,1,NULL,'Биология',NULL,'Биология',NULL,NULL,256,0,0,NULL,1,860,0,1),(10,'Физика',500,700,'\"<p>Полный курс подготовки по <b>физики<\\/b>&nbsp; к ЕГЭ с любого уровня до вуза мечты с профессиональным репетитором в мини-группах<\\/p>\\n<ul>\\n\\t<li><b>Продолжительность:<\\/b>&nbsp;8 месяцев<\\/li>\\n\\t<li><b>Старт:<\\/b>&nbsp;сентябрь-октябрь<\\/li>\\n\\t<li><b>Средний балл курса:<\\/b>&nbsp;80<\\/li>\\n<\\/ul>\"',0,'fiz',1,72,1,0,'Физика',NULL,'Физика',NULL,NULL,512,0,0,NULL,1,861,0,1),(11,'География',500,700,'\"\"',0,'geo',1,0,0,0,'География',NULL,'География',NULL,NULL,1024,0,0,NULL,1,862,1,1),(12,'Полигон',500,700,'\"<p>Полный курс подготовки по <b>информатике<\\/b>&nbsp; к ЕГЭ с любого уровня до вуза мечты с профессиональным репетитором в мини-группах<\\/p>\\n<ul>\\n\\t<li><b>Продолжительность:<\\/b>&nbsp;8 месяцев<\\/li>\\n\\t<li><b>Старт:<\\/b>&nbsp;сентябрь-октябрь<\\/li>\\n\\t<li><b>Средний балл курса:<\\/b>&nbsp;80<\\/li>\\n<\\/ul>\"',0,'polyg',1,NULL,0,NULL,'Полигон',NULL,'Полигону',NULL,NULL,2048,0,0,NULL,1,874,1,1),(30,'Мотивация',NULL,NULL,NULL,0,'motivation',5,0,1,0,'Мотивация',NULL,NULL,NULL,NULL,63,0,0,NULL,1,NULL,1,1),(31,'История',NULL,NULL,NULL,0,'marathon_hist',4,0,1,0,'История','Полный курс подготовки к ЕГЭ по Истории за 4 месяца на 80+ в игровом формате',NULL,NULL,1,1,0,0,NULL,1,NULL,1,1),(32,'Обществознание',NULL,NULL,NULL,0,'marathon_soc',4,0,1,0,'Обществознание','Полный курс подготовки к ЕГЭ по Обществознанию за 4 месяца на 80+ в игровом формате',NULL,NULL,2,2,0,0,NULL,1,NULL,1,1),(33,'Литература',NULL,NULL,NULL,0,'marathon_lit',4,0,1,0,'Литература','Полный курс подготовки к ЕГЭ по Литературе за 4 месяца на 80+ в игровом формате',NULL,NULL,3,4,0,0,NULL,1,NULL,1,1),(34,'Русский язык',NULL,NULL,NULL,0,'marathon_rus',4,0,1,0,'Русский язык','Полный курс подготовки к ЕГЭ по Русскому языку за 4 месяца на 80+ в игровом формате',NULL,NULL,4,8,0,0,NULL,1,NULL,1,1),(35,'Английский язык',NULL,NULL,NULL,0,'marathon_eng',4,0,1,0,'Английский язык','Полный курс подготовки к ЕГЭ по Английскому языку за 4 месяца на 80+ в игровом формате',NULL,NULL,5,16,0,0,NULL,1,NULL,1,1),(36,'Математика',NULL,NULL,NULL,0,'marathon_math',4,0,1,0,'Математика','Полный курс подготовки к ЕГЭ по Математике за 4 месяца на 80+ в игровом формате',NULL,NULL,6,32,0,0,NULL,1,NULL,1,1),(41,'История',NULL,NULL,NULL,0,'mega_race_hist',6,0,1,0,'История','Мегазабег по Истории: финальный курс подготовки и повторения всего для ЕГЭ на 80+',NULL,NULL,1,1,0,0,NULL,1,NULL,1,1),(42,'Обществознание',NULL,NULL,NULL,0,'mega_race_soc',6,0,1,0,'Обществознание','Мегазабег по Обществознанию: финальный курс подготовки и повторения всего для ЕГЭ на 80+',NULL,NULL,2,2,0,0,NULL,1,NULL,1,1),(43,'Литература',NULL,NULL,NULL,0,'mega_race_lit',6,0,1,0,'Литература','Мегазабег по Литературе: финальный курс подготовки и повторения всего для ЕГЭ на 80+',NULL,NULL,3,4,0,0,NULL,1,NULL,1,1),(44,'Русский язык',NULL,NULL,NULL,0,'mega_race_rus',6,0,1,0,'Русский язык','Мегазабег по Русскому языку: финальный курс подготовки и повторения всего для ЕГЭ на 80+',NULL,NULL,4,8,0,0,NULL,1,NULL,1,1),(45,'Английский язык',NULL,NULL,NULL,0,'mega_race_eng',6,0,1,0,'Английский язык','Мегазабег по Английскому языку: финальный курс подготовки и повторения всего для ЕГЭ на 80+',NULL,NULL,5,16,0,0,NULL,1,NULL,1,1),(46,'Математика',NULL,NULL,NULL,0,'mega_race_math',6,0,1,0,'Математика','Мегазабег по Математике: финальный курс подготовки и повторения всего для ЕГЭ на 80+',NULL,NULL,6,32,0,0,NULL,1,NULL,1,1),(47,'История(тест)',NULL,NULL,NULL,0,'mega_race_hist2',6,0,0,0,'История (тестовый)','Мегазабег по истории тестовый',NULL,NULL,1,1,0,0,NULL,1,NULL,1,1),(51,'История',NULL,NULL,NULL,0,'summer_hist',7,0,1,0,'История',NULL,NULL,NULL,1,1,0,0,NULL,1,NULL,1,1),(52,'Обществознание',NULL,NULL,NULL,0,'summer_soc',7,0,1,0,'Обществознание',NULL,NULL,NULL,2,2,0,0,NULL,1,NULL,1,1),(53,'Литература',NULL,NULL,NULL,0,'summer_lit',7,0,1,0,'Литература',NULL,NULL,NULL,3,4,0,0,NULL,1,NULL,1,1),(54,'Русский язык',NULL,NULL,NULL,0,'summer_rus',7,0,1,0,'Русский язык',NULL,NULL,NULL,4,8,0,0,NULL,1,NULL,1,1),(55,'Английский язык',NULL,NULL,NULL,0,'summer_eng',7,0,1,0,'Английский язык',NULL,NULL,NULL,5,16,0,0,NULL,1,NULL,1,1),(56,'Математика',NULL,NULL,NULL,0,'summer_math',7,0,1,0,'Математика',NULL,NULL,NULL,6,32,0,0,NULL,1,NULL,1,1),(57,'Информатика',NULL,NULL,NULL,0,'summer_inf',7,0,1,0,'Информатика',NULL,NULL,NULL,7,64,0,0,NULL,1,NULL,1,1),(58,'Химия',NULL,NULL,NULL,0,'summer_him',7,0,1,0,'Химия',NULL,NULL,NULL,8,128,0,0,NULL,1,NULL,1,1),(59,'Биология',NULL,NULL,NULL,0,'summer_bio',7,0,1,0,'Биология',NULL,NULL,NULL,9,256,0,0,NULL,1,NULL,1,1),(101,'hist_tests',0,0,NULL,1,NULL,2,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,1,NULL,1,1),(102,'soc_tests',0,0,NULL,1,NULL,2,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,1,NULL,1,1),(103,'lit_tests',0,0,NULL,1,NULL,2,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,1,NULL,1,1),(104,'rus_tests',0,0,NULL,1,NULL,2,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,1,NULL,1,1),(105,'eng_tests',0,0,NULL,1,NULL,2,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,1,NULL,1,1),(106,'math_tests',0,0,NULL,1,NULL,2,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,1,NULL,1,1),(111,'hist_megaz',0,0,NULL,1,NULL,2,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,1,NULL,1,1),(117,'История пробный',NULL,NULL,NULL,1,'free_hist',3,35,1,21,'Пробный курс по истории','10 нескучных занятий по теории и практике. Пройдёмся по темам ЕГЭ, закрепим материал и научимся структурировать знания',NULL,NULL,3,NULL,1,0,NULL,1,NULL,1,1),(118,'Пробный курс по обществу',NULL,NULL,NULL,1,'free_soc',3,47,1,22,'Пробный курс по обществу','Курс позволяет освоить все теоретические разделы предмета - экономика, право, политика, человек и общество, социальные отношения.',NULL,NULL,5,NULL,1,0,NULL,1,NULL,1,1),(119,'Литература пробный',NULL,NULL,NULL,1,'free_lit',3,19,1,23,'Пробный курс по литературе','Курс позволяет освоить все теоретические разделы предмета - экономика, право, политика, человек и общество, социальные отношения.',NULL,NULL,3,NULL,1,0,NULL,1,NULL,1,1),(120,'Русский язык пробный',NULL,NULL,NULL,1,'free_rus',3,16,1,24,'Пробный курс по русскому языку','Курс позволяет освоить все теоретические разделы предмета - экономика, право, политика, человек и общество, социальные отношения.',NULL,NULL,5,NULL,1,0,NULL,1,NULL,1,1),(121,'Английский язык пробный',NULL,NULL,NULL,1,'free_eng',3,15,1,25,'Пробный курс по английскому языку','10 нескучных занятий по теории и практике. Пройдёмся по темам ЕГЭ, закрепим материал и научимся структурировать знания',NULL,NULL,5,NULL,1,0,NULL,1,NULL,1,1),(122,'Математика пробный',NULL,NULL,NULL,1,'free_math',3,20,1,26,'Пробный курс по математике','10 нескучных занятий по теории и практике. Пройдёмся по темам ЕГЭ, закрепим материал и научимся структурировать знания',NULL,NULL,5,NULL,1,0,NULL,1,NULL,1,1),(372,NULL,NULL,NULL,NULL,0,NULL,3,6,1,NULL,'fff32fg','r32r32r23t32',NULL,NULL,4,NULL,1,0,NULL,1,NULL,1,1),(373,NULL,NULL,NULL,NULL,0,NULL,3,2,1,NULL,'уацауцпцпцп','ауцпцйцкйап3йцв цйай у',NULL,NULL,5,NULL,1,0,NULL,1,NULL,1,1),(381,NULL,NULL,NULL,NULL,0,NULL,3,5,1,0,'уцпцпцпуцпуц','пуцпцупуцп',NULL,NULL,3,NULL,1,0,NULL,1,NULL,1,1),(429,NULL,NULL,NULL,NULL,0,NULL,3,11,1,0,'t4t43t34t34','t43t34t34t34',NULL,NULL,3,NULL,1,0,NULL,1,NULL,1,1),(431,'Lit',NULL,NULL,NULL,0,NULL,3,2,1,0,'Lit','gegwg',NULL,NULL,3,NULL,1,0,NULL,1,NULL,1,1),(433,'Русский язык lesson№3',NULL,NULL,NULL,0,NULL,3,1,1,0,'Русский язык lesson№3','Введите описание этого курса',NULL,NULL,4,NULL,1,0,NULL,1,NULL,1,1),(441,'r43r43r43',NULL,NULL,NULL,0,NULL,3,79,1,0,'r43r43r43','r43r34r43',NULL,NULL,5,NULL,1,0,NULL,1,NULL,1,1),(442,'fewfewfewfewfew',NULL,NULL,NULL,0,NULL,3,8,1,0,'fewfewfewfewfew','fewfwegwefew',NULL,NULL,3,NULL,1,0,NULL,1,NULL,1,1),(443,'ffewfewf',NULL,NULL,NULL,0,NULL,3,28,1,0,'ffewfewf','fewfewfew',NULL,NULL,3,NULL,1,0,NULL,1,NULL,1,1),(444,'History',NULL,NULL,NULL,0,NULL,3,3,1,0,'History','gg4g45g54g54g54g54',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(445,'цуауцауцацу',NULL,NULL,NULL,0,NULL,3,1,1,0,'цуауцауцацу','ауцауцпкц ауцауц ауцауца',NULL,NULL,4,NULL,1,0,NULL,1,NULL,1,1),(446,'gergerger',NULL,NULL,NULL,0,NULL,3,5,1,0,'gergerger','gerergerger',NULL,NULL,2,NULL,1,0,NULL,1,NULL,1,1),(448,'ссуссуцсуцс',NULL,NULL,NULL,0,NULL,3,1,1,0,'ссуссуцсуцс','ьсулцтсоуц суцтшстуц суцтстуц',NULL,NULL,5,NULL,1,0,NULL,1,NULL,1,1),(454,'Математика',NULL,NULL,NULL,0,NULL,3,5,1,0,'Математика','Это небольшой трехдневный курс, в котором вы можете познакомиться с механизмами и инструментами обучения в РИ.',NULL,NULL,6,NULL,1,0,NULL,1,NULL,1,1),(455,'wdqwqdqwd',NULL,NULL,NULL,0,NULL,3,1,1,0,'wdqwqdqwd','dwqdwqdqwdwqdqw',NULL,NULL,3,NULL,1,0,NULL,1,NULL,1,1),(457,'dwqdqw',NULL,NULL,NULL,0,NULL,3,1,1,0,'dwqdqw','dwqdqwdq',NULL,NULL,2,NULL,1,0,NULL,1,NULL,1,1),(459,'fewfewfew',NULL,NULL,NULL,0,NULL,3,1,1,0,'fewfewfew','fwwffw wfew fewfewfwe',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(466,'Math Course',NULL,NULL,NULL,0,NULL,3,9,1,0,'Math Course','cascsac',NULL,NULL,4,NULL,1,0,NULL,1,NULL,1,1),(467,'Математика урок 22',NULL,NULL,NULL,0,NULL,3,11,1,0,'Математика урок 22','fewfewfew ewf qwde',NULL,NULL,5,NULL,1,0,NULL,1,NULL,1,1),(470,'bdbdbHistory',NULL,NULL,NULL,0,NULL,3,1,1,0,'bdbdbHistory','dggegregerg',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(490,'dwqdwqdq',NULL,NULL,NULL,0,NULL,3,2,1,0,'dwqdwqdq','dwqdqwdqwdq fqfewf',NULL,NULL,6,NULL,1,0,NULL,1,NULL,1,1),(501,'Математика пробный курс 21',NULL,NULL,NULL,0,NULL,3,1,1,0,'Математика пробный курс 21','пробный курс создан для проверки',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(510,'Физика',NULL,NULL,NULL,0,'summer_fiz',7,0,1,0,'Физика',NULL,NULL,NULL,10,512,0,0,NULL,1,NULL,1,1),(512,'Полигон',NULL,NULL,NULL,0,'summer_polyg',7,0,0,0,'Полигон',NULL,NULL,NULL,12,2048,0,0,NULL,1,NULL,1,1),(545,'История',NULL,NULL,NULL,0,NULL,3,8,1,0,'История','Это небольшой трехдневный курс, в котором вы можете познакомиться с механизмами и инструментами обучения в РИ.',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(563,'dwqdqwd',NULL,NULL,NULL,0,NULL,3,1,1,0,'dwqdqwd','dwqdwqdwqd',NULL,NULL,3,NULL,1,0,NULL,1,NULL,1,1),(566,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(567,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(568,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(569,'',NULL,NULL,NULL,0,NULL,3,3,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(570,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(571,'ауцацуауцацу',NULL,NULL,NULL,0,NULL,3,1,0,0,'ауцацуауцацу','ауцацуауцацуацауц',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(572,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(573,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(574,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(575,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(576,'Пробный курс по истории',NULL,NULL,NULL,0,NULL,3,1,1,0,'Пробный курс по истории','fewfwfewfwfewfwefwe',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(577,'cascascascascasc',NULL,NULL,NULL,0,NULL,3,2,0,0,'cascascascascasc','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(578,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,2,NULL,1,0,NULL,1,NULL,1,1),(579,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(580,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(581,'',NULL,NULL,NULL,0,NULL,3,1,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(582,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(583,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,5,NULL,1,0,NULL,1,NULL,1,1),(584,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(585,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(586,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(587,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(588,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(589,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(590,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(591,'',NULL,NULL,NULL,0,NULL,3,1,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(592,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(593,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(594,'',NULL,NULL,NULL,0,NULL,3,1,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(595,'',NULL,NULL,NULL,0,NULL,3,1,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(596,'',NULL,NULL,NULL,0,NULL,3,1,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(597,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(598,'fwef fewfwe fwefwefwef',NULL,NULL,NULL,0,NULL,3,0,0,0,'fwef fewfwe fwefwefwef','fwe jqdwjdqwd dwqdhqjwidjqw dqwjdiqwjdiqwj odkwqdjq\ndqwjdqwdqw dqwdoqwkdqw dqwjodqwkdqw dkwqo',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(599,'dwqdwqdq',NULL,NULL,NULL,0,NULL,3,0,0,0,'dwqdwqdq','dwqdwq',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(600,'fqfwqfqw',NULL,NULL,NULL,0,NULL,3,0,0,0,'fqfwqfqw','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(601,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(602,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,1,0,NULL,1,NULL,1,1),(603,'fewfewfew',NULL,NULL,NULL,0,NULL,3,1,1,0,'fewfewfew','fwefewfewfew',NULL,NULL,1,NULL,0,0,NULL,1,NULL,1,1),(604,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,0,0,NULL,1,NULL,1,1),(605,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,0,0,NULL,1,NULL,1,1),(606,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,0,0,NULL,1,NULL,1,1),(607,'тест',NULL,NULL,NULL,0,NULL,3,0,0,0,'тест','',NULL,NULL,3,NULL,0,0,NULL,1,NULL,1,1),(608,'История',NULL,NULL,NULL,0,NULL,3,1,0,0,'История','Какое-то описание',NULL,NULL,1,NULL,0,0,NULL,1,NULL,1,1),(609,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,0,0,NULL,1,NULL,1,1),(999,'Курс для ОП',500,700,'\"<p>Полный курс подготовки по <b>профильной математике<\\/b>&nbsp; к ЕГЭ с любого уровня до вуза мечты с профессиональным репетитором в мини-группах<\\/p>\\n<ul>\\n\\t<li><b>Продолжительность:<\\/b>&nbsp;8 месяцев<\\/li>\\n\\t<li><b>Старт:<\\/b>&nbsp;сентябрь-октябрь<\\/li>\\n\\t<li><b>Средний балл курса:<\\/b>&nbsp;80<\\/li>\\n<\\/ul>\"',0,'op',1,NULL,0,NULL,'Курс для ОП',NULL,'Курсу для ОП',NULL,NULL,64,0,0,NULL,1,863,1,1),(5999,'Курс для ОП',NULL,NULL,NULL,0,'op_inf',7,0,0,0,'Курс для ОП',NULL,NULL,NULL,999,64,0,0,NULL,1,NULL,1,1),(6003,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,0,0,NULL,1,NULL,1,1),(6004,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,0,0,NULL,1,NULL,1,1),(6005,'',NULL,NULL,NULL,0,NULL,3,0,0,0,'','',NULL,NULL,1,NULL,0,0,NULL,1,NULL,1,1),(6006,'Годовой курс',NULL,NULL,NULL,0,NULL,3,1,0,0,'Годовой курс','',NULL,NULL,1,NULL,0,0,NULL,1,NULL,1,1),(6007,'',NULL,NULL,NULL,0,NULL,3,2,0,0,'','',NULL,NULL,1,NULL,0,0,NULL,1,NULL,1,1),(6008,'Занятие по грамотности',NULL,NULL,NULL,0,NULL,3,0,0,0,'Занятие по грамотности','',NULL,NULL,999,NULL,0,0,NULL,1,NULL,1,1);
/*!40000 ALTER TABLE `main_course_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_tests`
--

DROP TABLE IF EXISTS `reports_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports_tests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `test_id` int NOT NULL,
  `score` double DEFAULT '0',
  `score_max` double DEFAULT NULL,
  `mistake` int DEFAULT '0',
  `time_duration` int DEFAULT '0',
  `time_finished` bigint DEFAULT NULL,
  `count_opening` int DEFAULT '1',
  `order` tinyint(1) NOT NULL COMMENT '1 - первое прохождение\n0 - промежуточное\n2 - последнее\n3 - не завершённое',
  `is_deadline` tinyint(1) DEFAULT '0',
  `is_time_close` tinyint(1) DEFAULT NULL COMMENT '1 - тест завершён по причине нихватки времени',
  `is_passed` tinyint(1) DEFAULT NULL COMMENT 'Пройден ли проходной балл теста (по баллу в тесте)',
  PRIMARY KEY (`id`),
  KEY `users_in_group_id` (`user_id`),
  KEY `test_id` (`test_id`),
  CONSTRAINT `reports_tests_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reports_tests_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=931242 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_tests`
--

LOCK TABLES `reports_tests` WRITE;
/*!40000 ALTER TABLE `reports_tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `server` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alias` varchar(4) NOT NULL,
  `name` tinytext,
  `path_mount_disk` tinytext,
  `path_mount_root` tinytext,
  `service_url` tinytext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `server_alias_uindex` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
INSERT INTO `server` VALUES (1,'root','Fourier','/mnt','/home/api/main_2021','https://ri-ege.ru/lk/2021/service'),(2,'moon','Young','/mnt/moon','/home/api/main_2021/moon','https://moon.ri-ege.ru/service');
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `folder_id` int DEFAULT NULL,
  `name` text,
  `order_is_important` tinyint(1) DEFAULT '1',
  `is_delete` tinyint(1) DEFAULT '0',
  `score_passing` int DEFAULT '0',
  `max_bal` int DEFAULT NULL COMMENT 'Максимальный балл теста',
  `is_public` tinyint(1) DEFAULT '1',
  `old_db_id` int DEFAULT NULL,
  `old_path` text,
  `order_answers_is_important` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  KEY `tests_tests_folder_id_fk` (`folder_id`),
  CONSTRAINT `tests_main_course_info_id_fk` FOREIGN KEY (`course_id`) REFERENCES `main_course_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_tests_folder_id_fk` FOREIGN KEY (`folder_id`) REFERENCES `tests_folder` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2582 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (2558,12,401,'Тест всех типов',1,0,0,7,1,NULL,NULL,0);
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_folder`
--

DROP TABLE IF EXISTS `tests_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_folder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `tests_folder_main_course_info_id_fk` FOREIGN KEY (`course_id`) REFERENCES `main_course_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_folder`
--

LOCK TABLES `tests_folder` WRITE;
/*!40000 ALTER TABLE `tests_folder` DISABLE KEYS */;
INSERT INTO `tests_folder` VALUES (401,12,'Папка с тестами');
/*!40000 ALTER TABLE `tests_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_agreement`
--

DROP TABLE IF EXISTS `tests_p_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_agreement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_id` int DEFAULT NULL,
  `title` text,
  `text` text,
  `comment` text,
  `number` int DEFAULT NULL,
  `max_bal` int DEFAULT '1',
  `is_comment` tinyint(1) DEFAULT '0',
  `is_show_correct_answer` tinyint(1) DEFAULT '0',
  `is_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tests_p_agreement_tests_id_fk` (`test_id`),
  CONSTRAINT `tests_p_agreement_tests_id_fk` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb3 COMMENT='Вопрос теста на соответствия';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_agreement`
--

LOCK TABLES `tests_p_agreement` WRITE;
/*!40000 ALTER TABLE `tests_p_agreement` DISABLE KEYS */;
INSERT INTO `tests_p_agreement` VALUES (139,2558,'','<p>Высокий уровень вовлечения представителей целевой аудитории является четким доказательством простого факта: граница обучения кадров обеспечивает широкому кругу (специалистов) участие в формировании первоочередных требований. Но разбавленное изрядной долей эмпатии, рациональное мышление обеспечивает актуальность форм воздействия. Задача организации, в особенности же современная методология разработки напрямую зависит от благоприятных перспектив.</p>','',7,1,0,1,0);
/*!40000 ALTER TABLE `tests_p_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_agreement_answer`
--

DROP TABLE IF EXISTS `tests_p_agreement_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_agreement_answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tests_p_agreement_id` int DEFAULT NULL,
  `tests_p_agreement_query_id` int DEFAULT NULL COMMENT 'на какой конкретно вариант это ответ, если пуст то ответ не верный',
  `text` tinytext,
  `is_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tests_p_agreement_answer_tests_p_agreement_id_fk` (`tests_p_agreement_id`),
  KEY `tests_p_agreement_answer_tests_p_agreement_query_id_fk` (`tests_p_agreement_query_id`),
  CONSTRAINT `tests_p_agreement_answer_tests_p_agreement_id_fk` FOREIGN KEY (`tests_p_agreement_id`) REFERENCES `tests_p_agreement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_agreement_answer_tests_p_agreement_query_id_fk` FOREIGN KEY (`tests_p_agreement_query_id`) REFERENCES `tests_p_agreement_query` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=664 DEFAULT CHARSET=utf8mb3 COMMENT='Тест. Пункт соответствия. Ответ на вариант соответствия';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_agreement_answer`
--

LOCK TABLES `tests_p_agreement_answer` WRITE;
/*!40000 ALTER TABLE `tests_p_agreement_answer` DISABLE KEYS */;
INSERT INTO `tests_p_agreement_answer` VALUES (641,139,471,'Ответ 1',0),(642,139,472,'Ответ 2',0),(643,139,473,'Ответ 3',0),(644,139,474,'Ответ 4',0),(645,139,NULL,'Ответ 5 (пустой)',0),(646,139,NULL,'Ответ 6 (пустой)',0);
/*!40000 ALTER TABLE `tests_p_agreement_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_agreement_extend`
--

DROP TABLE IF EXISTS `tests_p_agreement_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_agreement_extend` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tests_p_agreement_id` int DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `file_name` text,
  PRIMARY KEY (`id`),
  KEY `tests_p_agreement_extend_files_id_fk` (`file_id`),
  KEY `tests_p_agreement_extend_tests_p_agreement_id_fk` (`tests_p_agreement_id`),
  CONSTRAINT `tests_p_agreement_extend_files_id_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_agreement_extend_tests_p_agreement_id_fk` FOREIGN KEY (`tests_p_agreement_id`) REFERENCES `tests_p_agreement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_agreement_extend`
--

LOCK TABLES `tests_p_agreement_extend` WRITE;
/*!40000 ALTER TABLE `tests_p_agreement_extend` DISABLE KEYS */;
INSERT INTO `tests_p_agreement_extend` VALUES (45,139,1937984,'user.jpg');
/*!40000 ALTER TABLE `tests_p_agreement_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_agreement_marker`
--

DROP TABLE IF EXISTS `tests_p_agreement_marker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_agreement_marker` (
  `report_id` int NOT NULL,
  `tests_p_agreement_id` int NOT NULL,
  PRIMARY KEY (`report_id`,`tests_p_agreement_id`),
  KEY `tests_p_agreement_marker_tests_p_agreement_id_fk` (`tests_p_agreement_id`),
  CONSTRAINT `tests_p_agreement_marker_reports_tests_id_fk` FOREIGN KEY (`report_id`) REFERENCES `reports_tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_agreement_marker_tests_p_agreement_id_fk` FOREIGN KEY (`tests_p_agreement_id`) REFERENCES `tests_p_agreement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_agreement_marker`
--

LOCK TABLES `tests_p_agreement_marker` WRITE;
/*!40000 ALTER TABLE `tests_p_agreement_marker` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests_p_agreement_marker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_agreement_query`
--

DROP TABLE IF EXISTS `tests_p_agreement_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_agreement_query` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tests_p_agreement_id` int DEFAULT NULL,
  `number` tinyint DEFAULT NULL,
  `text` tinytext,
  `is_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tests_p_agreement_quest_tests_p_agreement_id_fk` (`tests_p_agreement_id`),
  CONSTRAINT `tests_p_agreement_quest_tests_p_agreement_id_fk` FOREIGN KEY (`tests_p_agreement_id`) REFERENCES `tests_p_agreement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=492 DEFAULT CHARSET=utf8mb3 COMMENT='тест. вопрос на сопоставление. пункт вопроса';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_agreement_query`
--

LOCK TABLES `tests_p_agreement_query` WRITE;
/*!40000 ALTER TABLE `tests_p_agreement_query` DISABLE KEYS */;
INSERT INTO `tests_p_agreement_query` VALUES (471,139,1,'Впорос 1',0),(472,139,2,'Вопрос 2',0),(473,139,3,'Вопрос 3',0),(474,139,4,'Вопрос 4',0);
/*!40000 ALTER TABLE `tests_p_agreement_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_agreement_u_answer`
--

DROP TABLE IF EXISTS `tests_p_agreement_u_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_agreement_u_answer` (
  `report_id` int NOT NULL,
  `tests_p_agreement_id` int NOT NULL,
  `tests_p_agreement_query_id` int NOT NULL,
  `tests_p_agreement_answer_id` int DEFAULT NULL,
  PRIMARY KEY (`report_id`,`tests_p_agreement_id`,`tests_p_agreement_query_id`),
  KEY `tests_p_agreement_u_answer_tests_p_agreement_id_fk2` (`tests_p_agreement_id`),
  KEY `tests_p_agreement_u_answer_tests_p_agreement_query_id_fk2` (`tests_p_agreement_query_id`),
  KEY `tests_p_agreement_u_answer_tests_p_agreement_answer_id_fk` (`tests_p_agreement_answer_id`),
  CONSTRAINT `tests_p_agreement_u_answer_reports_tests_id_fk2` FOREIGN KEY (`report_id`) REFERENCES `reports_tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_agreement_u_answer_tests_p_agreement_answer_id_fk` FOREIGN KEY (`tests_p_agreement_answer_id`) REFERENCES `tests_p_agreement_answer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_agreement_u_answer_tests_p_agreement_id_fk2` FOREIGN KEY (`tests_p_agreement_id`) REFERENCES `tests_p_agreement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_agreement_u_answer_tests_p_agreement_query_id_fk2` FOREIGN KEY (`tests_p_agreement_query_id`) REFERENCES `tests_p_agreement_query` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_agreement_u_answer`
--

LOCK TABLES `tests_p_agreement_u_answer` WRITE;
/*!40000 ALTER TABLE `tests_p_agreement_u_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests_p_agreement_u_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_agreement_u_answer_report`
--

DROP TABLE IF EXISTS `tests_p_agreement_u_answer_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_agreement_u_answer_report` (
  `report_id` int NOT NULL,
  `tests_p_agreement_id` int NOT NULL,
  `correct` double DEFAULT NULL,
  PRIMARY KEY (`report_id`,`tests_p_agreement_id`),
  KEY `tests_p_agreement_u_answer_tests_p_agreement_id_fk` (`tests_p_agreement_id`),
  CONSTRAINT `tests_p_agreement_u_answer_reports_tests_id_fk` FOREIGN KEY (`report_id`) REFERENCES `reports_tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_agreement_u_answer_tests_p_agreement_id_fk` FOREIGN KEY (`tests_p_agreement_id`) REFERENCES `tests_p_agreement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Общее значение, сколько баллов получил ученик за вопрос';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_agreement_u_answer_report`
--

LOCK TABLES `tests_p_agreement_u_answer_report` WRITE;
/*!40000 ALTER TABLE `tests_p_agreement_u_answer_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests_p_agreement_u_answer_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_gap`
--

DROP TABLE IF EXISTS `tests_p_gap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_gap` (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_id` int DEFAULT NULL,
  `title` text,
  `text` text,
  `comment` text,
  `number` int DEFAULT NULL,
  `max_bal` int DEFAULT '1',
  `is_comment` tinyint(1) DEFAULT '0',
  `is_show_correct_answer` tinyint(1) DEFAULT '0',
  `is_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tests_p_gap_tests_id_fk` (`test_id`),
  CONSTRAINT `tests_p_gap_tests_id_fk` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4981 DEFAULT CHARSET=utf8mb3 COMMENT='Вопрос теста заполните пропуски в тексте';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_gap`
--

LOCK TABLES `tests_p_gap` WRITE;
/*!40000 ALTER TABLE `tests_p_gap` DISABLE KEYS */;
INSERT INTO `tests_p_gap` VALUES (4963,2558,'','<p>Предварительные выводы неутешительны: базовый вектор развития играет важную роль в формировании новых принципов формирования материально-технической и кадровой базы. Повседневная практика показывает, что разбавленное изрядной долей эмпатии <input id=\"custom_input_4963_4_8358\" class=\"custom_input\" contenteditable=\"false\" type=\"text\" value=\"ответ1\" placeholder=\"Добавьте ответ\" /> (ответ1, ответ2, ответ3) , рациональное мышление позволяет выполнить важные задания по разработке позиций, занимаемых участниками в отношении поставленных задач. <input id=\"custom_input_4963_4_8359\" class=\"custom_input\" contenteditable=\"false\" type=\"text\" value=\"ответ4\" placeholder=\"Добавьте ответ\" />(ответ4, ответ5, ответ6) Повседневная практика показывает, что высокотехнологичная концепция общественного уклада однозначно фиксирует необходимость соответствующих условий активизации. <input id=\"custom_input_4963_4_8360\" class=\"custom_input\" contenteditable=\"false\" type=\"text\" value=\"\" placeholder=\"Добавьте ответ\" /> ещё поле:&nbsp; ыв</p>','<p>выава ыва ыва ывавы</p>',4,1,1,0,0);
/*!40000 ALTER TABLE `tests_p_gap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_gap_extend`
--

DROP TABLE IF EXISTS `tests_p_gap_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_gap_extend` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tests_p_gap_id` int DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `file_name` text,
  PRIMARY KEY (`id`),
  KEY `tests_p_gap_extend_files_id_fk` (`file_id`),
  KEY `tests_p_gap_extend_tests_p_gap_id_fk` (`tests_p_gap_id`),
  CONSTRAINT `tests_p_gap_extend_files_id_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_gap_extend_tests_p_gap_id_fk` FOREIGN KEY (`tests_p_gap_id`) REFERENCES `tests_p_gap` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=756 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_gap_extend`
--

LOCK TABLES `tests_p_gap_extend` WRITE;
/*!40000 ALTER TABLE `tests_p_gap_extend` DISABLE KEYS */;
INSERT INTO `tests_p_gap_extend` VALUES (755,4963,1937984,'user.jpg');
/*!40000 ALTER TABLE `tests_p_gap_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_gap_input`
--

DROP TABLE IF EXISTS `tests_p_gap_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_gap_input` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tests_p_gap_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tests_p_gap_input_tests_p_gap_id_fk` (`tests_p_gap_id`),
  CONSTRAINT `tests_p_gap_input_tests_p_gap_id_fk` FOREIGN KEY (`tests_p_gap_id`) REFERENCES `tests_p_gap` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8412 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_gap_input`
--

LOCK TABLES `tests_p_gap_input` WRITE;
/*!40000 ALTER TABLE `tests_p_gap_input` DISABLE KEYS */;
INSERT INTO `tests_p_gap_input` VALUES (8358,4963),(8359,4963),(8360,4963);
/*!40000 ALTER TABLE `tests_p_gap_input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_gap_input_answer`
--

DROP TABLE IF EXISTS `tests_p_gap_input_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_gap_input_answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tests_p_gap_input_id` int DEFAULT NULL,
  `answer` text,
  PRIMARY KEY (`id`),
  KEY `tests_p_gap_input_answer_tests_p_gap_input_id_fk` (`tests_p_gap_input_id`),
  CONSTRAINT `tests_p_gap_input_answer_tests_p_gap_input_id_fk` FOREIGN KEY (`tests_p_gap_input_id`) REFERENCES `tests_p_gap_input` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10373 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_gap_input_answer`
--

LOCK TABLES `tests_p_gap_input_answer` WRITE;
/*!40000 ALTER TABLE `tests_p_gap_input_answer` DISABLE KEYS */;
INSERT INTO `tests_p_gap_input_answer` VALUES (10294,8358,'ответ1'),(10295,8358,'ответ2'),(10296,8358,'ответ3'),(10297,8359,'ответ4'),(10298,8359,'ответ5'),(10299,8359,'ответ6'),(10300,8360,'');
/*!40000 ALTER TABLE `tests_p_gap_input_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_gap_marker`
--

DROP TABLE IF EXISTS `tests_p_gap_marker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_gap_marker` (
  `report_id` int NOT NULL,
  `tests_p_gap_id` int NOT NULL,
  PRIMARY KEY (`report_id`,`tests_p_gap_id`),
  KEY `tests_p_gap_marker_tests_p_gap_id_fk` (`tests_p_gap_id`),
  CONSTRAINT `tests_p_gap_marker_reports_tests_id_fk` FOREIGN KEY (`report_id`) REFERENCES `reports_tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_gap_marker_tests_p_gap_id_fk` FOREIGN KEY (`tests_p_gap_id`) REFERENCES `tests_p_gap` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_gap_marker`
--

LOCK TABLES `tests_p_gap_marker` WRITE;
/*!40000 ALTER TABLE `tests_p_gap_marker` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests_p_gap_marker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_gap_select`
--

DROP TABLE IF EXISTS `tests_p_gap_select`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_gap_select` (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_id` int DEFAULT NULL,
  `title` text,
  `text` text,
  `comment` text,
  `number` int DEFAULT NULL,
  `max_bal` int DEFAULT '1',
  `is_comment` tinyint(1) DEFAULT '0',
  `is_show_correct_answer` tinyint(1) DEFAULT '0',
  `is_delete` tinyint(1) DEFAULT '0',
  `is_multiselect` tinyint(1) DEFAULT '1' COMMENT '1 - различные\n0 - одинаковые',
  PRIMARY KEY (`id`),
  KEY `tests_p_gap_select_tests_id_fk` (`test_id`),
  CONSTRAINT `tests_p_gap_select_tests_id_fk` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11219 DEFAULT CHARSET=utf8mb3 COMMENT='Вопрос теста заполните пропуски в тексте (выбор из списка)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_gap_select`
--

LOCK TABLES `tests_p_gap_select` WRITE;
/*!40000 ALTER TABLE `tests_p_gap_select` DISABLE KEYS */;
INSERT INTO `tests_p_gap_select` VALUES (11207,2558,'','<p>Мы вынуждены отталкиваться от того, что семантический разбор внешних противодействий является качественно новой ступенью анализа существующих паттернов поведения. В частности, синтетическое тестирование требует определения и уточнения экспериментов<input id=\"custom_input_11207_5_27439\" class=\"custom_input\" contenteditable=\"false\" type=\"text\" value=\"ответ2 (верный)\" placeholder=\"Добавьте ответ\" />, поражающих по своей масштабности и грандиозности. Как принято считать, базовые сценарии поведения пользователей, вне зависимости от их уровня, должны быть <input id=\"custom_input_11207_5_27440\" class=\"custom_input\" contenteditable=\"false\" type=\"text\" value=\"ответ3(верный)\" placeholder=\"Добавьте ответ\" />смешаны с не уникальными данными до степени совершенной неузнаваемости, из-за чего возрастает их статус бесполезности.</p>','',6,1,0,1,0,1);
/*!40000 ALTER TABLE `tests_p_gap_select` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_gap_select_extend`
--

DROP TABLE IF EXISTS `tests_p_gap_select_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_gap_select_extend` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tests_p_gap_select_id` int DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `file_name` text,
  PRIMARY KEY (`id`),
  KEY `tests_p_gap_select_extend_files_id_fk` (`file_id`),
  KEY `tests_p_gap_select_extend_tests_p_gap_select_id_fk` (`tests_p_gap_select_id`),
  CONSTRAINT `tests_p_gap_select_extend_files_id_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_gap_select_extend_tests_p_gap_select_id_fk` FOREIGN KEY (`tests_p_gap_select_id`) REFERENCES `tests_p_gap_select` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=974 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_gap_select_extend`
--

LOCK TABLES `tests_p_gap_select_extend` WRITE;
/*!40000 ALTER TABLE `tests_p_gap_select_extend` DISABLE KEYS */;
INSERT INTO `tests_p_gap_select_extend` VALUES (973,11207,93,'3ede12s-960.jpg');
/*!40000 ALTER TABLE `tests_p_gap_select_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_gap_select_input`
--

DROP TABLE IF EXISTS `tests_p_gap_select_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_gap_select_input` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tests_p_gap_select_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tests_p_gap_select_input_tests_p_gap_select_id_fk` (`tests_p_gap_select_id`),
  CONSTRAINT `tests_p_gap_select_input_tests_p_gap_select_id_fk` FOREIGN KEY (`tests_p_gap_select_id`) REFERENCES `tests_p_gap_select` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27502 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_gap_select_input`
--

LOCK TABLES `tests_p_gap_select_input` WRITE;
/*!40000 ALTER TABLE `tests_p_gap_select_input` DISABLE KEYS */;
INSERT INTO `tests_p_gap_select_input` VALUES (27439,11207),(27440,11207);
/*!40000 ALTER TABLE `tests_p_gap_select_input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_gap_select_input_answer`
--

DROP TABLE IF EXISTS `tests_p_gap_select_input_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_gap_select_input_answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tests_p_gap_select_input_id` int DEFAULT NULL,
  `answer` text,
  `correct` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tests_p_gap_select_input_answer_tests_p_gap_select_input_id_fk` (`tests_p_gap_select_input_id`),
  CONSTRAINT `tests_p_gap_select_input_answer_tests_p_gap_select_input_id_fk` FOREIGN KEY (`tests_p_gap_select_input_id`) REFERENCES `tests_p_gap_select_input` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=166957 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_gap_select_input_answer`
--

LOCK TABLES `tests_p_gap_select_input_answer` WRITE;
/*!40000 ALTER TABLE `tests_p_gap_select_input_answer` DISABLE KEYS */;
INSERT INTO `tests_p_gap_select_input_answer` VALUES (166740,27439,'ответ1',0),(166741,27439,'ответ2 (верный)',1),(166742,27439,'ответ3',0),(166743,27439,'ответ4',0),(166744,27440,'ответ1',0),(166745,27440,'ответ2',0),(166746,27440,'ответ3(верный)',1),(166747,27440,'ответ4',0);
/*!40000 ALTER TABLE `tests_p_gap_select_input_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_gap_select_marker`
--

DROP TABLE IF EXISTS `tests_p_gap_select_marker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_gap_select_marker` (
  `report_id` int NOT NULL,
  `tests_p_gap_select_id` int NOT NULL,
  PRIMARY KEY (`report_id`,`tests_p_gap_select_id`),
  KEY `tests_p_gap_select_marker_tests_p_gap_select_id_fk` (`tests_p_gap_select_id`),
  CONSTRAINT `tests_p_gap_select_marker_reports_tests_id_fk` FOREIGN KEY (`report_id`) REFERENCES `reports_tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_gap_select_marker_tests_p_gap_select_id_fk` FOREIGN KEY (`tests_p_gap_select_id`) REFERENCES `tests_p_gap_select` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_gap_select_marker`
--

LOCK TABLES `tests_p_gap_select_marker` WRITE;
/*!40000 ALTER TABLE `tests_p_gap_select_marker` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests_p_gap_select_marker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_gap_select_u_answer`
--

DROP TABLE IF EXISTS `tests_p_gap_select_u_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_gap_select_u_answer` (
  `report_id` int NOT NULL,
  `tests_p_gap_select_id` int NOT NULL,
  `correct` double DEFAULT NULL,
  PRIMARY KEY (`report_id`,`tests_p_gap_select_id`),
  KEY `tests_p_gap_select_u_answer_tests_p_gap_select_id_fk` (`tests_p_gap_select_id`),
  CONSTRAINT `tests_p_gap_select_u_answer_reports_tests_id_fk` FOREIGN KEY (`report_id`) REFERENCES `reports_tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_gap_select_u_answer_tests_p_gap_select_id_fk` FOREIGN KEY (`tests_p_gap_select_id`) REFERENCES `tests_p_gap_select` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Общее значение, сколько баллов получил ученик за вопрос';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_gap_select_u_answer`
--

LOCK TABLES `tests_p_gap_select_u_answer` WRITE;
/*!40000 ALTER TABLE `tests_p_gap_select_u_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests_p_gap_select_u_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_gap_select_u_input_answer`
--

DROP TABLE IF EXISTS `tests_p_gap_select_u_input_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_gap_select_u_input_answer` (
  `report_id` int NOT NULL,
  `tests_p_gap_select_input_answer_id` int NOT NULL,
  PRIMARY KEY (`report_id`,`tests_p_gap_select_input_answer_id`),
  KEY `tests_p_gap_select_u_input_answer_tests_p_gap_select_id_fk` (`tests_p_gap_select_input_answer_id`),
  CONSTRAINT `tests_p_gap_select_u_input_answer_reports_tests_id_fk` FOREIGN KEY (`report_id`) REFERENCES `reports_tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_gap_select_u_input_answer_tests_p_gap_select_id_fk` FOREIGN KEY (`tests_p_gap_select_input_answer_id`) REFERENCES `tests_p_gap_select_input_answer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_gap_select_u_input_answer`
--

LOCK TABLES `tests_p_gap_select_u_input_answer` WRITE;
/*!40000 ALTER TABLE `tests_p_gap_select_u_input_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests_p_gap_select_u_input_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_gap_u_answer`
--

DROP TABLE IF EXISTS `tests_p_gap_u_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_gap_u_answer` (
  `report_id` int NOT NULL,
  `tests_p_gap_id` int NOT NULL,
  `correct` double DEFAULT NULL,
  PRIMARY KEY (`report_id`,`tests_p_gap_id`),
  KEY `tests_p_gap_u_answer_tests_p_gap_id_fk` (`tests_p_gap_id`),
  CONSTRAINT `tests_p_gap_u_answer_reports_tests_id_fk` FOREIGN KEY (`report_id`) REFERENCES `reports_tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_gap_u_answer_tests_p_gap_id_fk` FOREIGN KEY (`tests_p_gap_id`) REFERENCES `tests_p_gap` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_gap_u_answer`
--

LOCK TABLES `tests_p_gap_u_answer` WRITE;
/*!40000 ALTER TABLE `tests_p_gap_u_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests_p_gap_u_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_gap_u_input_answer`
--

DROP TABLE IF EXISTS `tests_p_gap_u_input_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_gap_u_input_answer` (
  `report_id` int NOT NULL,
  `tests_p_gap_input_id` int NOT NULL,
  `tests_text_u_answer_id` int DEFAULT NULL,
  `correct` tinyint(1) DEFAULT NULL COMMENT '1 - правильно, 0 - нет',
  PRIMARY KEY (`report_id`,`tests_p_gap_input_id`),
  KEY `tests_p_gap_u_input_answer_tests_p_gap_input_id_fk` (`tests_p_gap_input_id`),
  KEY `tests_p_gap_u_input_answer_tests_text_u_answers_id_fk` (`tests_text_u_answer_id`),
  CONSTRAINT `tests_p_gap_u_input_answer_reports_tests_id_fk` FOREIGN KEY (`report_id`) REFERENCES `reports_tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_gap_u_input_answer_tests_p_gap_input_id_fk` FOREIGN KEY (`tests_p_gap_input_id`) REFERENCES `tests_p_gap_input` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_gap_u_input_answer_tests_text_u_answers_id_fk` FOREIGN KEY (`tests_text_u_answer_id`) REFERENCES `tests_text_u_answers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_gap_u_input_answer`
--

LOCK TABLES `tests_p_gap_u_input_answer` WRITE;
/*!40000 ALTER TABLE `tests_p_gap_u_input_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests_p_gap_u_input_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_sequence`
--

DROP TABLE IF EXISTS `tests_p_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_sequence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_id` int DEFAULT NULL,
  `number` int DEFAULT NULL,
  `is_show_correct_answer` tinyint(1) DEFAULT '0',
  `is_comment` tinyint(1) DEFAULT '0',
  `max_bal` int DEFAULT '1',
  `title` text,
  `text` text,
  `comment` text,
  `is_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tests_p_sequence_tests_id_fk` (`test_id`),
  CONSTRAINT `tests_p_sequence_tests_id_fk` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=658 DEFAULT CHARSET=utf8mb3 COMMENT='Тест вопроса верный порядок ответов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_sequence`
--

LOCK TABLES `tests_p_sequence` WRITE;
/*!40000 ALTER TABLE `tests_p_sequence` DISABLE KEYS */;
INSERT INTO `tests_p_sequence` VALUES (654,2558,5,0,1,1,'','<p>Современные технологии достигли такого уровня, что убеждённость некоторых оппонентов, а также свежий взгляд на привычные вещи &mdash; безусловно открывает новые горизонты для переосмысления внешнеэкономических политик. Вот вам яркий пример современных тенденций &mdash; высококачественный прототип будущего проекта способствует повышению качества поэтапного и последовательного развития общества. Безусловно, социально-экономическое развитие не оставляет шанса для экспериментов, поражающих по своей масштабности и грандиозности.</p>','<p>Это пояснение к ответу</p>',0);
/*!40000 ALTER TABLE `tests_p_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_sequence_extend`
--

DROP TABLE IF EXISTS `tests_p_sequence_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_sequence_extend` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tests_p_sequence_id` int DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `file_name` text,
  PRIMARY KEY (`id`),
  KEY `tests_p_sequence_extend_files_id_fk` (`file_id`),
  KEY `tests_p_sequence_extend_tests_p_sequence_id_fk` (`tests_p_sequence_id`),
  CONSTRAINT `tests_p_sequence_extend_files_id_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_sequence_extend_tests_p_sequence_id_fk` FOREIGN KEY (`tests_p_sequence_id`) REFERENCES `tests_p_sequence` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_sequence_extend`
--

LOCK TABLES `tests_p_sequence_extend` WRITE;
/*!40000 ALTER TABLE `tests_p_sequence_extend` DISABLE KEYS */;
INSERT INTO `tests_p_sequence_extend` VALUES (46,654,93,'3ede12s-960.jpg');
/*!40000 ALTER TABLE `tests_p_sequence_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_sequence_marker`
--

DROP TABLE IF EXISTS `tests_p_sequence_marker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_sequence_marker` (
  `report_id` int NOT NULL,
  `tests_p_sequence_id` int NOT NULL,
  PRIMARY KEY (`report_id`,`tests_p_sequence_id`),
  KEY `tests_p_sequence_marker_tests_p_sequence_id_fk` (`tests_p_sequence_id`),
  CONSTRAINT `tests_p_sequence_marker_reports_tests_id_fk` FOREIGN KEY (`report_id`) REFERENCES `reports_tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_sequence_marker_tests_p_sequence_id_fk` FOREIGN KEY (`tests_p_sequence_id`) REFERENCES `tests_p_sequence` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_sequence_marker`
--

LOCK TABLES `tests_p_sequence_marker` WRITE;
/*!40000 ALTER TABLE `tests_p_sequence_marker` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests_p_sequence_marker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_sequence_query`
--

DROP TABLE IF EXISTS `tests_p_sequence_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_sequence_query` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tests_p_sequence_id` int DEFAULT NULL,
  `number` int DEFAULT NULL,
  `answer` text,
  `is_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tests_p_sequence_query_tests_p_sequence_id_fk` (`tests_p_sequence_id`),
  CONSTRAINT `tests_p_sequence_query_tests_p_sequence_id_fk` FOREIGN KEY (`tests_p_sequence_id`) REFERENCES `tests_p_sequence` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2502 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_sequence_query`
--

LOCK TABLES `tests_p_sequence_query` WRITE;
/*!40000 ALTER TABLE `tests_p_sequence_query` DISABLE KEYS */;
INSERT INTO `tests_p_sequence_query` VALUES (2476,654,1,'ответ1',0),(2477,654,2,'ответ2',0),(2478,654,3,'ответ3',0),(2479,654,4,'ответ4',0);
/*!40000 ALTER TABLE `tests_p_sequence_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_sequence_u_answer`
--

DROP TABLE IF EXISTS `tests_p_sequence_u_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_sequence_u_answer` (
  `report_id` int NOT NULL,
  `tests_p_sequence_query_id` int NOT NULL,
  `number` int DEFAULT NULL,
  PRIMARY KEY (`report_id`,`tests_p_sequence_query_id`),
  KEY `tests_p_sequence_u_answer_tests_p_sequence_query_id_fk` (`tests_p_sequence_query_id`),
  CONSTRAINT `tests_p_sequence_answer_reports_tests_id_fk` FOREIGN KEY (`report_id`) REFERENCES `reports_tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_sequence_u_answer_tests_p_sequence_query_id_fk` FOREIGN KEY (`tests_p_sequence_query_id`) REFERENCES `tests_p_sequence_query` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_sequence_u_answer`
--

LOCK TABLES `tests_p_sequence_u_answer` WRITE;
/*!40000 ALTER TABLE `tests_p_sequence_u_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests_p_sequence_u_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_sequence_u_answer_report`
--

DROP TABLE IF EXISTS `tests_p_sequence_u_answer_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_sequence_u_answer_report` (
  `report_id` int NOT NULL,
  `tests_p_sequence_id` int NOT NULL,
  `score` double DEFAULT NULL,
  `is_change` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`report_id`,`tests_p_sequence_id`),
  KEY `tests_p_sequence_u_answer_report_tests_p_sequence_id_fk` (`tests_p_sequence_id`),
  CONSTRAINT `tests_p_sequence_u_answer_report_reports_tests_id_fk` FOREIGN KEY (`report_id`) REFERENCES `reports_tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_sequence_u_answer_report_tests_p_sequence_id_fk` FOREIGN KEY (`tests_p_sequence_id`) REFERENCES `tests_p_sequence` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_sequence_u_answer_report`
--

LOCK TABLES `tests_p_sequence_u_answer_report` WRITE;
/*!40000 ALTER TABLE `tests_p_sequence_u_answer_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests_p_sequence_u_answer_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_test`
--

DROP TABLE IF EXISTS `tests_p_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_test` (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_id` int DEFAULT NULL,
  `number` int DEFAULT NULL,
  `is_multi_response` tinyint(1) DEFAULT NULL COMMENT '0 - один ответ\n1 - несколько ответов',
  `is_show_correct_answer` tinyint(1) DEFAULT '0',
  `is_comment` tinyint(1) DEFAULT '0',
  `max_bal` int DEFAULT '1',
  `order_is_important` tinyint(1) DEFAULT '0',
  `title` text,
  `text` text,
  `comment` text,
  `is_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tests_type_test_tests_id_fk` (`test_id`),
  CONSTRAINT `tests_type_test_tests_id_fk` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22434 DEFAULT CHARSET=utf8mb3 COMMENT='Вопрос теста - выбрать верные ответы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_test`
--

LOCK TABLES `tests_p_test` WRITE;
/*!40000 ALTER TABLE `tests_p_test` DISABLE KEYS */;
INSERT INTO `tests_p_test` VALUES (22385,2558,1,0,0,0,1,0,'','<p>А также многие известные личности, которые представляют собой яркий пример континентально-европейского типа политической культуры, будут ограничены исключительно образом мышления. Имеется спорная точка зрения, гласящая примерно следующее: элементы политического процесса освещают чрезвычайно интересные особенности картины в целом, однако конкретные выводы, разумеется, объективно рассмотрены соответствующими инстанциями. В своём стремлении повысить качество жизни, они забывают, что граница обучения кадров предполагает независимые способы реализации вывода текущих активов.</p>','',0),(22386,2558,2,0,0,0,1,0,'','','',1),(22387,2558,2,1,0,0,1,0,'','<p>А также многие известные личности, которые представляют собой яркий пример континентально-европейского типа политической культуры, будут ограничены исключительно образом мышления. Имеется спорная точка зрения, гласящая примерно следующее: элементы политического процесса освещают чрезвычайно интересные особенности картины в целом, однако конкретные выводы, разумеется, объективно рассмотрены соответствующими инстанциями. В своём стремлении повысить качество жизни, они забывают, что граница обучения кадров предполагает независимые способы реализации вывода текущих активов.</p>','',0);
/*!40000 ALTER TABLE `tests_p_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_test_extend`
--

DROP TABLE IF EXISTS `tests_p_test_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_test_extend` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tests_p_test_id` int DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `file_name` text,
  PRIMARY KEY (`id`),
  KEY `tests_p_test_extend_files_id_fk` (`file_id`),
  KEY `tests_p_test_extend_tests_p_test_id_fk` (`tests_p_test_id`),
  CONSTRAINT `tests_p_test_extend_files_id_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_test_extend_tests_p_test_id_fk` FOREIGN KEY (`tests_p_test_id`) REFERENCES `tests_p_test` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2412 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_test_extend`
--

LOCK TABLES `tests_p_test_extend` WRITE;
/*!40000 ALTER TABLE `tests_p_test_extend` DISABLE KEYS */;
INSERT INTO `tests_p_test_extend` VALUES (2410,22385,1937984,'user.jpg'),(2411,22387,93,'3ede12s-960.jpg');
/*!40000 ALTER TABLE `tests_p_test_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_test_marker`
--

DROP TABLE IF EXISTS `tests_p_test_marker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_test_marker` (
  `report_id` int NOT NULL,
  `tests_p_test_id` int NOT NULL,
  PRIMARY KEY (`report_id`,`tests_p_test_id`),
  KEY `tests_p_test_marker_tests_p_test_id_fk` (`tests_p_test_id`),
  CONSTRAINT `tests_p_test_marker_reports_tests_id_fk` FOREIGN KEY (`report_id`) REFERENCES `reports_tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_test_marker_tests_p_test_id_fk` FOREIGN KEY (`tests_p_test_id`) REFERENCES `tests_p_test` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_test_marker`
--

LOCK TABLES `tests_p_test_marker` WRITE;
/*!40000 ALTER TABLE `tests_p_test_marker` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests_p_test_marker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_test_query`
--

DROP TABLE IF EXISTS `tests_p_test_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_test_query` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tests_p_test_id` int DEFAULT NULL,
  `number` int DEFAULT NULL,
  `answer` text,
  `correct` double DEFAULT '0',
  `is_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tests_p_test_query_tests_p_test_id_fk` (`tests_p_test_id`),
  CONSTRAINT `tests_p_test_query_tests_p_test_id_fk` FOREIGN KEY (`tests_p_test_id`) REFERENCES `tests_p_test` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90230 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_test_query`
--

LOCK TABLES `tests_p_test_query` WRITE;
/*!40000 ALTER TABLE `tests_p_test_query` DISABLE KEYS */;
INSERT INTO `tests_p_test_query` VALUES (89989,22385,1,'0',-0.33333333333333,0),(89991,22385,2,'1',-0.33333333333333,0),(89992,22385,3,'2 верно!',1,0),(89993,22385,4,'3',-0.33333333333333,0),(89994,22386,1,'',-1,0),(89995,22386,2,'',-1,0),(89996,22387,1,'1',-0.33333333333333,0),(89997,22387,2,'2',-0.33333333333333,0),(89998,22387,3,'3 (верно)',1,0),(89999,22387,4,'4',-0.33333333333333,0);
/*!40000 ALTER TABLE `tests_p_test_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_test_u_answer`
--

DROP TABLE IF EXISTS `tests_p_test_u_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_test_u_answer` (
  `report_id` int DEFAULT NULL,
  `tests_p_test_query_id` int DEFAULT NULL,
  KEY `tests_p_test_answer_reports_tests_id_fk` (`report_id`),
  KEY `tests_p_test_u_answer_tests_p_test_query_id_fk` (`tests_p_test_query_id`),
  CONSTRAINT `tests_p_test_answer_reports_tests_id_fk` FOREIGN KEY (`report_id`) REFERENCES `reports_tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_test_u_answer_tests_p_test_query_id_fk` FOREIGN KEY (`tests_p_test_query_id`) REFERENCES `tests_p_test_query` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_test_u_answer`
--

LOCK TABLES `tests_p_test_u_answer` WRITE;
/*!40000 ALTER TABLE `tests_p_test_u_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests_p_test_u_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_text`
--

DROP TABLE IF EXISTS `tests_p_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_text` (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_id` int DEFAULT NULL,
  `title` text,
  `text` text,
  `comment` text,
  `number` int DEFAULT NULL,
  `max_bal` int DEFAULT '1',
  `check_type` tinyint(1) DEFAULT '1' COMMENT '1 - простое совпадение\n2 - случайный порядок символов\n3 - нужный порядок символов',
  `is_multiline` tinyint(1) DEFAULT '0',
  `is_comment` tinyint(1) DEFAULT '0',
  `is_show_correct_answer` tinyint(1) DEFAULT '0',
  `is_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tests_p_text_tests_id_fk` (`test_id`),
  CONSTRAINT `tests_p_text_tests_id_fk` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17515 DEFAULT CHARSET=utf8mb3 COMMENT='Вопрос теста - написать верный ответ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_text`
--

LOCK TABLES `tests_p_text` WRITE;
/*!40000 ALTER TABLE `tests_p_text` DISABLE KEYS */;
INSERT INTO `tests_p_text` VALUES (17456,2558,'','<p>А также многие известные личности, которые представляют собой яркий пример континентально-европейского типа политической культуры, будут ограничены исключительно образом мышления. Имеется спорная точка зрения, гласящая примерно следующее: элементы политического процесса освещают чрезвычайно интересные особенности картины в целом, однако конкретные выводы, разумеется, объективно рассмотрены соответствующими инстанциями. В своём стремлении повысить качество жизни, они забывают, что граница обучения кадров предполагает независимые способы реализации вывода текущих активов.</p>\n<p>&nbsp;</p>\n<p>ОТВЕТ: ответ</p>','',3,1,1,0,0,0,0);
/*!40000 ALTER TABLE `tests_p_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_text_answer`
--

DROP TABLE IF EXISTS `tests_p_text_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_text_answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tests_p_text_id` int DEFAULT NULL,
  `answer` text,
  `correct` double DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `tests_p_text_answer_tests_p_text_id_fk` (`tests_p_text_id`),
  CONSTRAINT `tests_p_text_answer_tests_p_text_id_fk` FOREIGN KEY (`tests_p_text_id`) REFERENCES `tests_p_text` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28388 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_text_answer`
--

LOCK TABLES `tests_p_text_answer` WRITE;
/*!40000 ALTER TABLE `tests_p_text_answer` DISABLE KEYS */;
INSERT INTO `tests_p_text_answer` VALUES (28305,17456,'ответ',1);
/*!40000 ALTER TABLE `tests_p_text_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_text_extend`
--

DROP TABLE IF EXISTS `tests_p_text_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_text_extend` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tests_p_text_id` int DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `file_name` text,
  PRIMARY KEY (`id`),
  KEY `tests_p_text_extend_files_id_fk` (`file_id`),
  KEY `tests_p_text_extend_tests_p_text_id_fk` (`tests_p_text_id`),
  CONSTRAINT `tests_p_text_extend_files_id_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_text_extend_tests_p_text_id_fk` FOREIGN KEY (`tests_p_text_id`) REFERENCES `tests_p_text` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5185 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_text_extend`
--

LOCK TABLES `tests_p_text_extend` WRITE;
/*!40000 ALTER TABLE `tests_p_text_extend` DISABLE KEYS */;
INSERT INTO `tests_p_text_extend` VALUES (5184,17456,93,'3ede12s-960.jpg');
/*!40000 ALTER TABLE `tests_p_text_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_text_marker`
--

DROP TABLE IF EXISTS `tests_p_text_marker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_text_marker` (
  `report_id` int NOT NULL,
  `tests_p_text_id` int NOT NULL,
  PRIMARY KEY (`report_id`,`tests_p_text_id`),
  KEY `tests_p_text_marker_tests_p_text_id_fk` (`tests_p_text_id`),
  CONSTRAINT `tests_p_text_marker_reports_tests_id_fk` FOREIGN KEY (`report_id`) REFERENCES `reports_tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_text_marker_tests_p_text_id_fk` FOREIGN KEY (`tests_p_text_id`) REFERENCES `tests_p_text` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_text_marker`
--

LOCK TABLES `tests_p_text_marker` WRITE;
/*!40000 ALTER TABLE `tests_p_text_marker` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests_p_text_marker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_p_text_u_answer`
--

DROP TABLE IF EXISTS `tests_p_text_u_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_p_text_u_answer` (
  `report_id` int DEFAULT NULL,
  `tests_p_text_id` int DEFAULT NULL,
  `tests_text_u_answer_id` int DEFAULT NULL,
  `correct` double DEFAULT NULL,
  KEY `tests_p_text_u_answer_reports_tests_id_fk` (`report_id`),
  KEY `tests_p_text_u_answer_tests_p_text_id_fk` (`tests_p_text_id`),
  KEY `tests_p_text_u_answer_tests_text_u_answers_id_fk` (`tests_text_u_answer_id`),
  CONSTRAINT `tests_p_text_u_answer_reports_tests_id_fk` FOREIGN KEY (`report_id`) REFERENCES `reports_tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_text_u_answer_tests_p_text_id_fk` FOREIGN KEY (`tests_p_text_id`) REFERENCES `tests_p_text` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tests_p_text_u_answer_tests_text_u_answers_id_fk` FOREIGN KEY (`tests_text_u_answer_id`) REFERENCES `tests_text_u_answers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_p_text_u_answer`
--

LOCK TABLES `tests_p_text_u_answer` WRITE;
/*!40000 ALTER TABLE `tests_p_text_u_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests_p_text_u_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_text_u_answers`
--

DROP TABLE IF EXISTS `tests_text_u_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests_text_u_answers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63819 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_text_u_answers`
--

LOCK TABLES `tests_text_u_answers` WRITE;
/*!40000 ALTER TABLE `tests_text_u_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests_text_u_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_info`
--

DROP TABLE IF EXISTS `users_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vk_id` int DEFAULT NULL,
  `login` text,
  `password` text,
  `email` text,
  `grade` tinyint(1) DEFAULT NULL COMMENT 'Класс',
  `birthdate` int DEFAULT NULL COMMENT 'Дата рождения',
  `skype` text,
  `telephone` text,
  `name` text NOT NULL,
  `time_registration` int NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `gender` tinyint DEFAULT '0' COMMENT '0 - М / 1 - Ж',
  `is_subscribed` tinyint(1) DEFAULT '0',
  `avatar_id` int DEFAULT '1937984',
  `hash` text,
  `is_complete_training` tinyint(1) DEFAULT '0',
  `is_filled` tinyint(1) DEFAULT '0' COMMENT 'Профиль заполненный?',
  `is_filled_marathon` tinyint(1) DEFAULT '0',
  `is_accept_cookie` int DEFAULT '0',
  `is_confirm_email` tinyint(1) DEFAULT '0',
  `confirm_email_code` int DEFAULT NULL,
  `is_accept_contract` tinyint(1) DEFAULT '0',
  `is_accept_contract_marathon` tinyint(1) DEFAULT '0',
  `is_filled_mega_race` tinyint(1) DEFAULT '0',
  `is_accept_contract_megarace` tinyint(1) DEFAULT '0',
  `parent_name` tinytext,
  `parent_link` tinytext,
  `time_zone` tinyint DEFAULT NULL,
  `is_show_modal_select_teacher` tinyint DEFAULT '0',
  `is_send_to_senler` tinyint(1) DEFAULT '0' COMMENT 'Отправлено ли в сенлер',
  `field_moder_1` tinytext COMMENT 'Желаемое обучение',
  `field_moder_2` tinytext COMMENT 'Ключевые проблемы',
  `field_moder_3` tinytext COMMENT 'Откуда узнал про РИ',
  `field_moder_4` tinytext COMMENT 'Почему именно РИ',
  `field_moder_5` tinytext COMMENT 'Рекомендации друзей',
  PRIMARY KEY (`id`),
  UNIQUE KEY `vk_id` (`vk_id`),
  KEY `users_info_files_id_fk` (`avatar_id`),
  CONSTRAINT `users_info_files_id_fk` FOREIGN KEY (`avatar_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25566 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_info`
--

LOCK TABLES `users_info` WRITE;
/*!40000 ALTER TABLE `users_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `time_registration` BEFORE INSERT ON `users_info` FOR EACH ROW BEGIN
    IF (NEW.time_registration = 0) THEN
        SET NEW.time_registration = UNIX_TIMESTAMP(NOW());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-04 11:17:03
