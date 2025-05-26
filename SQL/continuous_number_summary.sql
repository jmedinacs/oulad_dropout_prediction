-- ========================================
-- Find descriptive statistics for presentation length in oulad_courses
-- ========================================

-- Find min, max, and mean for module_presentation_length
SELECT 
    MIN(module_presentation_length) AS min_length,
    MAX(module_presentation_length) AS max_length,
    AVG(module_presentation_length) AS mean_length
FROM 
    oulad_courses;

-- Find median for module_presentation_length
SELECT 
    AVG(module_presentation_length) AS median_length
FROM ( 
    SELECT module_presentation_length
    FROM oulad_courses  
    WHERE module_presentation_length IS NOT NULL 
    ORDER BY module_presentation_length 
    LIMIT 2 - (SELECT COUNT(*) FROM oulad_courses WHERE module_presentation_length IS NOT NULL) % 2
    OFFSET (SELECT (COUNT(*) - 1) / 2 FROM oulad_courses WHERE module_presentation_length IS NOT NULL)
);

-- Find standard deviation for module_presentation_length
SELECT 
    SQRT(AVG((module_presentation_length - avg_length) * (module_presentation_length - avg_length))) AS stddev
FROM 
    (SELECT module_presentation_length, 
            (SELECT AVG(module_presentation_length) FROM oulad_courses WHERE module_presentation_length IS NOT NULL) AS avg_length
     FROM oulad_courses
     WHERE module_presentation_length IS NOT NULL);


-- ========================================
-- Find descriptive statistics for studentInfo table
-- ========================================

-- Find min, max, and mean for num_of_prev_attempts and studied_credits
SELECT 
    MIN(num_of_prev_attempts) AS min_att,
    MAX(num_of_prev_attempts) AS max_att,
    AVG(num_of_prev_attempts) AS mean_att,
    MIN(studied_credits) AS min_credits,
    MAX(studied_credits) AS max_credits,
    AVG(studied_credits) AS mean_credits
FROM 
    oulad_studentInfo;

-- Find median for num_of_prev_attempts
SELECT 
    AVG(num_of_prev_attempts) AS median_att
FROM ( 
    SELECT num_of_prev_attempts 
    FROM oulad_studentInfo 
    WHERE num_of_prev_attempts IS NOT NULL 
    ORDER BY num_of_prev_attempts 
    LIMIT 2 - (SELECT COUNT(*) FROM oulad_studentInfo WHERE num_of_prev_attempts IS NOT NULL) % 2
    OFFSET (SELECT (COUNT(*) - 1) / 2 FROM oulad_studentInfo WHERE num_of_prev_attempts IS NOT NULL)
);

-- Find median for studied_credits
SELECT 
    AVG(studied_credits) AS median_credits
FROM ( 
    SELECT studied_credits 
    FROM oulad_studentInfo 
    WHERE studied_credits IS NOT NULL 
    ORDER BY studied_credits 
    LIMIT 2 - (SELECT COUNT(*) FROM oulad_studentInfo WHERE studied_credits IS NOT NULL) % 2
    OFFSET (SELECT (COUNT(*) - 1) / 2 FROM oulad_studentInfo WHERE studied_credits IS NOT NULL)
);

-- Find standard deviation for studied_credits
SELECT 
    SQRT(AVG((studied_credits - avg_length) * (studied_credits - avg_length))) AS stddev
FROM 
    (SELECT studied_credits, 
            (SELECT AVG(studied_credits) FROM oulad_studentInfo WHERE studied_credits IS NOT NULL) AS avg_length
     FROM oulad_studentInfo
     WHERE studied_credits IS NOT NULL);

-- Find standard deviation for num_of_prev_attempts
SELECT 
    SQRT(AVG((num_of_prev_attempts - avg_length) * (num_of_prev_attempts - avg_length))) AS stddev
FROM 
    (SELECT num_of_prev_attempts, 
            (SELECT AVG(num_of_prev_attempts) FROM oulad_studentInfo WHERE num_of_prev_attempts IS NOT NULL) AS avg_length
     FROM oulad_studentInfo
     WHERE num_of_prev_attempts IS NOT NULL);

-- ========================================
-- Find descriptive statistics for studentRegistration table
-- ========================================

-- Find min, max, and mean for date_registration and date_unregistration
SELECT 
	MIN(date_registration) AS min__date_reg,
	MIN(date_unregistration) AS min__date_unreg,
	AVG(date_registration) AS mean_date_reg,
	AVG(date_unregistration) AS mean_date_unreg,
	MAX(date_registration) AS max_date_reg,
	MAX(date_unregistration) AS max_date_unreg
FROM oulad_studentRegistration;

-- ========================================
-- Convert '?' values in date columns to NULL for proper analysis
-- ========================================
UPDATE oulad_studentRegistration
SET date_unregistration = NULL
WHERE date_unregistration = '?';

UPDATE oulad_studentRegistration
SET date_registration = NULL 
WHERE date_registration  = '?';

-- ========================================
-- Find descriptive statistics for studentVle table
-- ========================================
SELECT 
	MIN(sum_click) AS min_sum_click,
	AVG(sum_click) AS avg_sum_click,
	MAX(sum_click) AS max_sum_click
FROM 
	oulad_studentVle;

-- Find the median for sum_click
SELECT 
    AVG(sum_click) AS median_sum_click
FROM ( 
    SELECT sum_click 
    FROM oulad_studentVle 
    WHERE sum_click IS NOT NULL 
    ORDER BY sum_click 
    LIMIT 2 - (SELECT COUNT(*) FROM oulad_studentVle WHERE sum_click IS NOT NULL) % 2
    OFFSET (SELECT (COUNT(*) - 1) / 2 FROM oulad_studentVle WHERE sum_click IS NOT NULL)
) AS median_values;

-- ========================================
-- Find descriptive statistics for vle table
-- ========================================
-- Find min, max, and mean for week_from and week_to

SELECT
	MIN(week_from) AS min_week_from,
	MIN(week_to) AS min_week_to,
	AVG(week_from) AS mean_week_from,
	AVG(week_to ) AS mean_weak_to,
	MAX(week_from) AS max_week_from,
	MAX(week_to ) AS max_weak_to
FROM 
	oulad_vle ov; 
	
-- ========================================
-- Convert '?' values in date columns to NULL for proper analysis
-- ========================================
UPDATE oulad_vle
SET week_from = NULL
WHERE week_from = '?';

UPDATE oulad_vle
SET week_to = NULL 
WHERE week_to = '?';


	


	
	











