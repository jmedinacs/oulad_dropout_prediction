-- =================================================
-- Title        : Dropout Prediction Schema
-- Author       : John Medina
-- Created On   : 2025-05-22
-- Description  : Creates the tables used for dropout prediction analysis,
--                including studentInfo, studentRegistration, studentVle,
--                courses, and vle.
-- =================================================

-- Drop tables in reverse dependency order
DROP TABLE IF EXISTS oulad_studentVle;
DROP TABLE IF EXISTS oulad_studentRegistration;
DROP TABLE IF EXISTS oulad_studentInfo;
DROP TABLE IF EXISTS oulad_vle;
DROP TABLE IF EXISTS oulad_courses;

-- -------------------------------------------------
-- Table: oulad_courses
-- -------------------------------------------------
CREATE TABLE oulad_courses(  
    code_module TEXT,
    code_presentation TEXT,
    module_presentation_length INTEGER,
    PRIMARY KEY(code_module, code_presentation)
);

-- -------------------------------------------------
-- Table: oulad_studentInfo
-- -------------------------------------------------
CREATE TABLE oulad_studentInfo( 
    code_module TEXT,
    code_presentation TEXT,
    id_student INTEGER,
    gender TEXT,
    region TEXT,
    highest_education TEXT,
    imd_band TEXT,
    age_band TEXT,
    num_of_prev_attempts INTEGER,
    studied_credits INTEGER,
    disability TEXT,
    final_result TEXT,
    PRIMARY KEY(code_module, code_presentation, id_student),
    FOREIGN KEY (code_module, code_presentation)
        REFERENCES oulad_courses(code_module, code_presentation)
);

-- -------------------------------------------------
-- Table: oulad_studentRegistration
-- -------------------------------------------------
CREATE TABLE oulad_studentRegistration( 
    code_module TEXT, 
    code_presentation TEXT,
    id_student INTEGER,
    date_registration INTEGER,
    date_unregistration INTEGER,
    PRIMARY KEY(code_module, code_presentation, id_student),
    FOREIGN KEY(code_module, code_presentation)
        REFERENCES oulad_courses(code_module, code_presentation),
    FOREIGN KEY(id_student)
        REFERENCES oulad_studentInfo(id_student)
);

-- -------------------------------------------------
-- Table: oulad_vle
-- -------------------------------------------------
CREATE TABLE oulad_vle( 
    id_site INTEGER PRIMARY KEY,
    code_module TEXT,
    code_presentation TEXT,
    activity_type TEXT,
    week_from INTEGER,
    week_to INTEGER
);

-- -------------------------------------------------
-- Table: oulad_studentVle
-- -------------------------------------------------
CREATE TABLE oulad_studentVle (
    row_id INTEGER PRIMARY KEY AUTOINCREMENT,
    code_module TEXT,
    code_presentation TEXT,
    id_student INTEGER,
    id_site INTEGER,
    date INTEGER,
    sum_click INTEGER,
    FOREIGN KEY (code_module, code_presentation) REFERENCES oulad_courses(code_module, code_presentation),
    FOREIGN KEY (id_student) REFERENCES oulad_studentInfo(id_student),
    FOREIGN KEY (id_site) REFERENCES oulad_vle(id_site)
);

