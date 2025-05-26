-- =====================================================
-- DISTINCT VALUE COUNTS FOR TEXT COLUMNS (INITIAL PROFILING)
-- =====================================================

-- Count distinct values in all key text columns across tables
SELECT 'studentInfo' AS table_name, 'gender' AS column_name, COUNT(DISTINCT gender) AS unique_values FROM oulad_studentInfo
UNION ALL
SELECT 'studentInfo', 'region', COUNT(DISTINCT region) FROM oulad_studentInfo
UNION ALL
SELECT 'studentInfo', 'age_band', COUNT(DISTINCT age_band) FROM oulad_studentInfo
UNION ALL
SELECT 'studentInfo', 'code_module', COUNT(DISTINCT code_module) FROM oulad_studentInfo
UNION ALL
SELECT 'studentInfo', 'code_presentation', COUNT(DISTINCT code_presentation) FROM oulad_studentInfo
UNION ALL
SELECT 'studentInfo', 'disability', COUNT(DISTINCT disability) FROM oulad_studentInfo
UNION ALL
SELECT 'studentInfo', 'final_result', COUNT(DISTINCT final_result) FROM oulad_studentInfo
UNION ALL
SELECT 'studentInfo', 'highest_education', COUNT(DISTINCT highest_education) FROM oulad_studentInfo
UNION ALL
SELECT 'studentInfo', 'imd_band', COUNT(DISTINCT imd_band) FROM oulad_studentInfo
UNION ALL
SELECT 'courses', 'code_module', COUNT(DISTINCT code_module) FROM oulad_courses
UNION ALL
SELECT 'courses', 'code_presentation', COUNT(DISTINCT code_presentation) FROM oulad_courses
UNION ALL
SELECT 'studentRegistration', 'code_module', COUNT(DISTINCT code_module) FROM oulad_studentRegistration
UNION ALL
SELECT 'studentRegistration', 'code_presentation', COUNT(DISTINCT code_presentation) FROM oulad_studentRegistration
UNION ALL
SELECT 'studentVle', 'code_module', COUNT(DISTINCT code_module) FROM oulad_studentVle  
UNION ALL
SELECT 'studentVle', 'code_presentation', COUNT(DISTINCT code_presentation) FROM oulad_studentVle
UNION ALL
SELECT 'vle', 'activity_type', COUNT(DISTINCT activity_type) FROM oulad_vle 
UNION ALL
SELECT 'vle', 'code_module', COUNT(DISTINCT code_module) FROM oulad_vle  
UNION ALL
SELECT 'vle', 'code_presentation', COUNT(DISTINCT code_presentation) FROM oulad_vle;

-- =====================================================
-- FOREIGN KEY INTEGRITY CHECKS: Ensure code_module + code_presentation pairs match courses table
-- =====================================================

-- Check studentInfo
SELECT si.code_module, si.code_presentation
FROM oulad_studentInfo si
LEFT JOIN oulad_courses c ON si.code_module = c.code_module AND si.code_presentation = c.code_presentation
WHERE c.code_module IS NULL;

-- Check studentRegistration
SELECT sr.code_module, sr.code_presentation
FROM oulad_studentRegistration sr
LEFT JOIN oulad_courses c ON sr.code_module = c.code_module AND sr.code_presentation = c.code_presentation
WHERE c.code_module IS NULL;

-- Check studentVle
SELECT sv.code_module, sv.code_presentation
FROM oulad_studentVle sv
LEFT JOIN oulad_courses c ON sv.code_module = c.code_module AND sv.code_presentation = c.code_presentation
WHERE c.code_module IS NULL;

-- Check vle
SELECT v.code_module, v.code_presentation
FROM oulad_vle v
LEFT JOIN oulad_courses c ON v.code_module = c.code_module AND v.code_presentation = c.code_presentation
WHERE c.code_module IS NULL;

-- =====================================================
-- DETAILED CATEGORY COUNTS AND PERCENTAGES FOR SELECT COLUMNS
-- =====================================================

-- Distinct code_presentation counts in courses
SELECT code_presentation, COUNT(*)
FROM oulad_courses
GROUP BY code_presentation 
ORDER BY COUNT(*) DESC;

-- Distinct code_module counts in courses
SELECT code_module, COUNT(*)
FROM oulad_courses
GROUP BY code_module 
ORDER BY COUNT(*) DESC;

-- Distinct age_band distribution
SELECT 
    age_band, 
    COUNT(*) AS count,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM oulad_studentInfo), 2) AS percentage
FROM oulad_studentInfo
GROUP BY age_band
ORDER BY count DESC;

-- Distinct disability distribution
SELECT 
    disability, 
    COUNT(*) AS count,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM oulad_studentInfo), 2) AS percentage
FROM oulad_studentInfo
GROUP BY disability
ORDER BY count DESC;

-- Target feature distribution: final_result
SELECT 
    final_result, 
    COUNT(*) AS count,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM oulad_studentInfo), 2) AS percentage
FROM oulad_studentInfo
GROUP BY final_result
ORDER BY count DESC;

-- Distinct gender distribution
SELECT 
    gender, 
    COUNT(*) AS count,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM oulad_studentInfo), 2) AS percentage
FROM oulad_studentInfo
GROUP BY gender
ORDER BY count DESC;

-- Distinct highest_education distribution
SELECT 
    highest_education, 
    COUNT(*) AS count,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM oulad_studentInfo), 2) AS percentage
FROM oulad_studentInfo
GROUP BY highest_education
ORDER BY count DESC;

-- Distinct imd_band distribution
SELECT 
    imd_band, 
    COUNT(*) AS count,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM oulad_studentInfo), 2) AS percentage
FROM oulad_studentInfo
GROUP BY imd_band
ORDER BY count DESC;

-- =====================================================
-- CLEANING STEP: Convert ? in imd_band to NULL
-- =====================================================
UPDATE oulad_studentInfo
SET imd_band = NULL 
WHERE imd_band = '?';

-- Distinct region distribution
SELECT 
    region, 
    COUNT(*) AS count,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM oulad_studentInfo), 2) AS percentage
FROM oulad_studentInfo
GROUP BY region
ORDER BY count DESC;

-- Distinct activity_type distribution in vle
SELECT 
    activity_type, 
    COUNT(*) AS count,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM oulad_vle), 2) AS percentage
FROM oulad_vle
GROUP BY activity_type
ORDER BY count DESC;


-- =====================================================
-- EDA STEP: Inspect for ordinality instead of continuous
-- =====================================================

SELECT 
    module_presentation_length, 
    COUNT(*) AS count,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM course_summary), 2) AS percentage
FROM course_summary 
GROUP BY module_presentation_length
ORDER BY count DESC;

SELECT 
    num_of_prev_attempts, 
    COUNT(*) AS count,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM course_summary), 2) AS percentage
FROM course_summary 
GROUP BY num_of_prev_attempts
ORDER BY count DESC;


