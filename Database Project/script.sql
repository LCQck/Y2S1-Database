--         table creation script

CREATE TABLE `citizen`(
    `id` INT UNIQUE KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `age` INT NOT NULL,
    `gender` TINYINT NOT NULL,
    `mobile` int(11) PRIMARY KEY NOT NULL
    )

CREATE TABLE `testresult`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `citizen_id` INT NOT NULL,
    `sample_type` INT NOT NULL,
    `is_positive_result` TINYINT NOT NULL,
    `sample_collect_time` DATETIME,
    `sample_report_time` DATETIME,
    `sample_test_time` DATETIME,
    `doctor_name` VARCHAR(255),
    `hospital_name` VARCHAR(255),
    `district_id` INT NOT NULL,

    CONSTRAINT FOREIGN KEY (citizen_id) REFERENCES citizen (id),
    CONSTRAINT FOREIGN KEY (sample_type) REFERENCES sampletype (id)
	ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT FOREIGN KEY (doctor_name) REFERENCES doctor_name (`name`)
ON UPDATE SET NULL
ON DELETE SET NULL)

CREATE TABLE `SampleType`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `type_name` VARCHAR(100) NOT NULL,
    `description` TEXT
)

CREATE TABLE `doctor_name`(
    `ID` INT AUTO_INCREMENT UNIQUE KEY NOT NULL,
    `name` VARCHAR(255) PRIMARY KEY,
    `hospital_name` VARCHAR(255)
)

CREATE TABLE `tracking`(
    `id` BIGINT PRIMARY KEY AUTO_INCREMENT,
    `district_id` INT ,
    `mobile` INT(11) NOT NULL,
    `move_in_time` DATETIME,
    `move_out_time` DATETIME,
    
    CONSTRAINT FOREIGN KEY(district_id) REFERENCES basetower (district_id)
    ON UPDATE CASCADE
    ON DELETE SET NULL,
    CONSTRAINT FOREIGN KEY(mobile) REFERENCES citizen(mobile)
    ON UPDATE CASCADE
    ON DELETE CASCADE
)

CREATE TABLE `basetower`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `district_id` INT ,
    `longitude` DECIMAL(10,7) NOT NULL,
    `latitude` DECIMAL(10,7) NOT NULL,

    CONSTRAINT FOREIGN KEY (district_id) REFERENCES district (id)
    ON UPDATE SET NULL
    ON DELETE SET NULL
)

CREATE TABLE `district`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `district_name` VARCHAR(255) NOT NULL,
    `region` INT NOT NULL,
    `risk_level` TINYINT NOT NULL,
    `risk_level_name` VARCHAR(10)
)




--         Important use cases
--  !!! both test data and SELECT statements are needed
-- use case 1
INSERT INTO `district`( `district_name`, `region`, `risk_level`, `risk_level_name`)
VALUES( "N-n", 1, 3, "high"),
      ( "N-w", 1, 1, "low"),
      ( "N-m", 1, 1, "low"),
      ( "N-e", 1, 1, "low"),
      ( "N-s", 1, 1, "low"),
      
      ( "W-n", 2, 2, "mid"),
      ( "W-w", 2, 1, "low"),
      ( "W-m", 2, 1, "low"),
      ( "W-e", 2, 1, "low"),
      ( "W-s", 2, 1, "low"),
      
      ( "M-n", 3, 2, "mid"),
      ( "M-w", 3, 3, "high"),
      ( "M-m", 3, 1, "low"),
      ( "M-e", 3, 1, "low"),
      ( "M-s", 3, 1, "low"),
      
      ( "E-n", 4, 1, "low"),
      ( "E-w", 4, 2, "mid"),
      ( "E-m", 4, 1, "low"),
      ( "E-e", 4, 1, "low"),
      ( "E-s", 4, 1, "low"),
      
      ( "S-n", 5, 1, "low"),
      ( "S-w", 5, 1, "low"),
      ( "S-m", 5, 1, "low"),
      ( "S-e", 5, 1, "low"),
      ( "S-s", 5, 1, "low")

INSERT INTO `basetower`( `district_id`, `longitude`,`latitude`)
VALUES 
       (1, 9,4),
       (2, 8,3),
       (3, 8,4),
       (4, 8,5),
       (5, 7,4),
       
       (6, 6,1),
       (7, 5,0),
       (8, 5,1),
       (9, 5,2),
       (10, 4,1),
       
       (11, 6,4),
       (12, 5,3),
       (13, 5,4),
       (14, 5,5),
       (15, 4,4),
       
       (16, 6,7),
       (17, 5,6),
       (18, 5,7),
       (19, 5,8),
       (20, 4,7),
       
       (21, 3,4),
       (22, 2,3),
       (23, 2,4),
       (24, 2,5),
       (25, 1,4)

INSERT INTO CITIZEN(`name`,`age`,`gender`,`mobile`)
VALUES
      ("Mark", 20, 1, 233636),
      ( "AA", 50, 1, 100000),
      ( "AB", 40, 1, 110000),
      ( "AC", 30, 1, 120000),
      ( "AD", 15, 1, 130000),
      ( "BA", 20, 0, 140000)

INSERT INTO tracking(district_id, mobile, move_in_time, move_out_time)
VALUES (1, 233636, "2021-10-09 19:30:00", "2021-10-10 10:00:00"),
       (1, 100000, "2021-10-06 14:00:00",NULL),
       (2, 110000, "2021-10-08 15:00:00", "2021-10-09 18:59:59"),
       (1, 120000, "2021-10-07 19:30:00", "2021-10-09 19:29:59"),
       (1, 130000, "2021-10-05 06:00:00", "2021-10-07 19:30:01"),
       (1, 140000, "2021-10-05 06:00:00", "2021-10-09 19:30:01")

SELECT mobile FROM tracking   
WHERE      move_in_time <= '2021-10-09 19:30:00'     
AND     (     ISNULL(move_out_time) = 1 OR (move_out_time > '2021-10-07 19:30:00')   )   
AND district_id =  (SELECT district_id   
FROM tracking  
WHERE mobile = 233636)

-- use case 2

INSERT INTO citizen(`name`, age, gender,mobile)
VALUES("BB", 30, 0, 111111)

INSERT INTO citizen(`name`, age, gender,mobile)
VALUES("BB", 30, 0, 111111)

 UPDATE tracking
 SET `move_out_time` = NOW()
 WHERE mobile = 111111 AND ISNULL(move_out_time)

-- use case 3

INSERT INTO sampletype( `type_name`, `description`)
VALUES ("Coughid-21", "Coughid-21 is a newly identified type of virus this year, all patients tested to be positive shuld rest well and avoid going outside.")

INSERT INTO doctor_name(`name`, `hospital_name`)
VALUES ("ZA", "1sthospital"),
       ("ZB", "2ndhospital"),
       ("ZC", "3rdhospital"),
       ("ZD", "4thhospital"),
       ("ZE", "5thhospital"),
       ("ZF", "6thhospital"),
       ("ZG", "7thhospital"),
       ("ZH", "8thhospital"),
       ("ZI", "9thhospital"),
       ("ZJ", "10thhospital"),
       ("ZK", "11thhospital"),
       ("ZL", "12thhospital")

INSERT INTO doctor_name(`name`, `hospital_name`) 
VALUES ("ZAA", "1sthospital"),        
("ZBB", "2ndhospital"),        
("ZCC", "3rdhospital"),        
("ZDD", "4thhospital"),        
("ZEE", "5thhospital"),        
("ZFF", "6thhospital"),        
("ZGG", "7thhospital"),        
("ZHH", "8thhospital"),        
("ZII", "9thhospital"),        
("ZJJ", "10thhospital"),        
("ZKK", "11thhospital"),        
("ZLL", "12thhospital")

INSERT INTO doctor_name(`name`, `hospital_name`) VALUES ("ZAAA", "1sthospital")

INSERT INTO testresult(citizen_id, sample_type, is_positive_result, sample_collect_time, sample_test_time,sample_report_time, doctor_name, hospital_name, district_id)
VALUES ( 1, 1, 0, "2021-10-09 19:30:00", "2021-10-10 08:00:00","2021-10-10 10:00:00", "ZA", "1sthospital", 1),
       ( 1, 1, 0, "2021-10-11 19:00:00", "2021-10-12 08:00:00","2021-10-12 09:00:00", "ZB", "1sthospital", 2),
       ( 1, 1, 0, "2021-10-13 19:30:00", "2021-10-14 08:00:00","2021-10-14 09:30:00", "ZAA", "2ndhospital", 1),
       ( 1, 1, 0, "2021-10-15 19:30:00", "2021-10-16 08:00:00","2021-10-16 08:49:50", "ZD", "4thhospital", 7),
       ( 1, 1, 0, "2021-10-17 19:30:00", "2021-10-18 08:00:00","2021-10-18 09:27:40", "ZBB", "2ndhospital", 2),
       ( 1, 1, 0, "2021-10-19 19:30:00", "2021-10-20 08:00:00","2021-10-20 11:23:27", "ZDD", "4thhospital", 7),
       ( 1, 1, 0, "2021-10-21 19:30:00", "2021-10-22 08:00:00","2021-10-22 12:45:00", "ZAAA", "1sthospital", 1)

SELECT AVG(testresult.sample_report_time-testresult.sample_test_time) avg_time, doctor_name.`hospital_name` hospital_name     
FROM testresult,  doctor_name       
WHERE testresult.doctor_name = doctor_name.`name` 
GROUP BY doctor_name.`hospital_name`

-- use case 4
N/A
-- use case 5

INSERT INTO district( district_name, region, risk_level, risk_level_name)
VALUES ("N-n", 1,3, "high"),
       ("E-w", 4,2, "mid"),
       ("M-w", 3,3, "high"),
       ("S-w", 5,1, "low"),
       ("W-n", 2,2, "mid")

SELECT district_name, risk_level_name
FROM district 
ORDER BY risk_level DESC

-- use case 6

UPDATE district SET district_name = "Centre Lukewarm Hillside" WHERE id=1

INSERT INTO testresult(citizen_id, sample_type, is_positive_result, sample_collect_time, sample_test_time,sample_report_time, doctor_name, hospital_name, district_id)
VALUES ( 1, 1, 1, "2021-10-04 19:30:00", "2021-10-05 08:00:00","2021-10-05 10:00:00", "ZA", "1sthospital", 1),
       ( 2, 1, 0, "2021-10-04 19:30:00", "2021-10-05 08:00:00","2021-10-05 09:00:00", "ZA", "1sthospital", 1),
       ( 3, 1, 1, "2021-10-04 19:30:00", "2021-10-05 08:00:00","2021-10-05 09:30:00", "ZAA", "1sthospital", 1),
       ( 4, 1, 0, "2021-10-05 19:30:00", "2021-10-06 08:00:00","2021-10-06 08:49:50", "ZA", "1sthospital", 1),
       ( 2, 1, 1, "2021-10-05 19:30:00", "2021-10-06 08:00:00","2021-10-06 09:27:40", "ZAA", "1stdhospital", 1),
       ( 5, 1, 0, "2021-10-05 19:30:00", "2021-10-06 08:00:00","2021-10-06 11:23:27", "ZA", "1sthospital", 1),
       ( 6, 1, 1, "2021-10-06 19:30:00", "2021-10-07 08:00:00","2021-10-07 12:45:00", "ZAAA", "1sthospital", 1)

SELECT citizen.`name`, citizen.mobile
FROM citizen , testresult , district 
WHERE citizen.id = testresult.citizen_id AND testresult.district_id = district.id
AND testresult.is_positive_result = 1 
AND (testresult.sample_collect_time BETWEEN '2021-10-04 00:00:00' AND '2021-10-04 23:59:59') 
AND district.district_name = "Centre Lukewarm Hillside"


-- use case 7

SELECT (
		(SELECT COUNT(*) FROM (SELECT c.`name`, c.mobile 
	FROM citizen c, testresult tr, district d 
	WHERE c.id = tr.citizen_id AND tr.district_id = d.id 
		AND tr.is_positive_result = 1 
		AND (tr.sample_collect_time BETWEEN '2021-10-05 00:00:00' AND '2021-10-05 23:59:59') 
	AND d.district_name = "Centre Lukewarm Hillside") as tmp1) - 
 		(SELECT COUNT(*) FROM (SELECT c.`name`, c.mobile 
		FROM citizen c, testresult tr, district d 
		WHERE c.id = tr.citizen_id AND tr.district_id = d.id 
		AND tr.is_positive_result = 1 
		AND (tr.sample_collect_time BETWEEN '2021-10-04 00:00:00' AND '2021-10-4 23:59:59') 
 		AND d.district_name = "Centre Lukewarm Hillside") as tmp2)
) result

-- use case 8

SELECT 
    ((SELECT 
            COUNT(mobile) total_num
        FROM tracking
        WHERE move_in_time <= '2021-10-09 19:30:00'
                AND (ISNULL(move_out_time) = 1
                OR (move_out_time > '2021-10-07 19:30:00'))
                AND district_id = (SELECT 
                    district_id
                FROM tracking
                WHERE
                    mobile = 233636)) / (SELECT 
            COUNT(citizen.mobile)
        FROM
            citizen,
            testresult,
            district
        WHERE citizen.id = testresult.citizen_id
                AND testresult.district_id = district.id
                AND testresult.is_positive_result = 1
                AND (testresult.sample_report_time BETWEEN '2021-10-09' AND '2021-10-24'))) transmission_rate


--          Extended use cases
--  !!! both test data and SELECT statements are needed
-- use case 1

SELECT `name`, age
FROM citizen
ORDER BY age DESC

-- use case 2

INSERT INTO tracking(district_id, mobile, move_in_time, move_out_time)
VALUES (1, 233636, "2021-10-29 19:30:00", NULL),
       (1, 100000, "2021-10-28 14:00:00",NULL),
       (1, 120000, "2021-10-29 19:30:00", NULL),
       (1, 130000, "2021-10-30 06:00:00", NULL),
       (1, 140000, "2021-10-29 06:00:00", NULL)

SELECT citizen.`name`, citizen.mobile
FROM citizen , tracking , district 
WHERE citizen.mobile = tracking.mobile AND tracking.district_id = district.id
AND (tracking.move_in_time <= '2021-10-30 19:30:00' AND ISNULL(tracking.move_out_time)) 
AND district.district_name = "Centre Lukewarm Hillside"
AND citizen.age BETWEEN 20 AND 40
AND citizen.gender = 1

-- use case 3

TURNCAT TABLE tracking

INSERT INTO tracking(district_id, mobile, move_in_time, move_out_time)
VALUES (1, 233636, "2021-10-29 19:30:00", NULL),
       (1, 100000, "2021-10-28 14:00:00",NULL),
       (1, 110000, "2021-10-29 19:30:00", NULL),
       (1, 120000, "2021-10-30 06:00:00", NULL),
       (1, 130000, "2021-10-29 06:00:00", NULL),
       (1, 140000, "2021-10-30 06:00:00", NULL),
       (1, 111111, "2021-10-29 06:00:00", NULL)

SELECT 
    (SELECT 
            COUNT(gender) total_num
        FROM
            citizen,
            tracking,
            district
        WHERE
            citizen.gender = 1
                AND tracking.district_id = district.id
                AND tracking.mobile = citizen.mobile
                AND district.district_name = 'Centre Lukewarm Hillside') / (SELECT 
            COUNT(gender) total_num
        FROM
            citizen,
            tracking,
            district
        WHERE
            citizen.gender = 0
                AND tracking.district_id = district.id
                AND tracking.mobile = citizen.mobile
                AND district.district_name = 'Centre Lukewarm Hillside') `gender ratio`



-- use case 4


-- use case 5
-- use case 6
-- use case 7
-- use case 8
-- use case 9
-- use case 10