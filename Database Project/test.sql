-- Table: citizen
CREATE TABLE citizen (
    id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    gender TINYINT NOT NULL,
    mobile INT(11) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (mobile)
);

-- Table: testresult
CREATE TABLE testresult (
    id INT AUTO_INCREMENT,
    citizen_id INT NOT NULL,
    sample_type INT NOT NULL,
    is_positive_result TINYINT NOT NULL,
    sample_collect_time DATETIME,
    sample_report_time DATETIME,
    sample_test_time DATETIME,
    doctor_name VARCHAR(255),
    hospital_name VARCHAR(255),
    district_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (citizen_id) REFERENCES citizen(id),
    FOREIGN KEY (sample_type) REFERENCES SampleType(id),
    FOREIGN KEY (doctor_name) REFERENCES doctor_name(name)
);

-- Rest of your SQL script...
