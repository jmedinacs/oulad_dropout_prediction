-- Check the oulad_studentInfo for empty/null values
SELECT 
	COUNT(*) as num_rows, 
	SUM(CASE WHEN code_module IS NULL THEN 1 ELSE 0 END) AS code_module_null,
	SUM(CASE WHEN code_module ='' THEN 1 ELSE 0 END) AS code_module_empty,
	SUM(CASE WHEN code_presentation IS NULL THEN 1 ELSE 0 END) AS code_presentation_null,
	SUM(CASE WHEN code_presentation ='' THEN 1 ELSE 0 END) AS code_presentation_empty,
	SUM(CASE WHEN id_student IS NULL THEN 1 ELSE 0 END) AS id_student_null,
	SUM(CASE WHEN id_student ='' THEN 1 ELSE 0 END) AS id_student_empty,
	SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS gender_null,
	SUM(CASE WHEN gender ='' THEN 1 ELSE 0 END) AS gender_empty,
	SUM(CASE WHEN region IS NULL THEN 1 ELSE 0 END) AS region_null,
	SUM(CASE WHEN region ='' THEN 1 ELSE 0 END) AS region_empty,
	SUM(CASE WHEN highest_education IS NULL THEN 1 ELSE 0 END) AS highest_education_null,
	SUM(CASE WHEN highest_education ='' THEN 1 ELSE 0 END) AS highest_education_empty,
	SUM(CASE WHEN imd_band IS NULL THEN 1 ELSE 0 END) AS imd_band_null,
	SUM(CASE WHEN imd_band ='' THEN 1 ELSE 0 END) AS imd_band_empty,
	SUM(CASE WHEN age_band IS NULL THEN 1 ELSE 0 END) AS age_band_null,
	SUM(CASE WHEN age_band ='' THEN 1 ELSE 0 END) AS age_band_empty,
	SUM(CASE WHEN num_of_prev_attempts IS NULL THEN 1 ELSE 0 END) AS num_of_prev_attempts_null,
	SUM(CASE WHEN num_of_prev_attempts ='' THEN 1 ELSE 0 END) AS num_of_prev_attempts_empty,
	SUM(CASE WHEN studied_credits IS NULL THEN 1 ELSE 0 END) AS studied_credits_null,
	SUM(CASE WHEN studied_credits ='' THEN 1 ELSE 0 END) AS studied_credits_empty,
	SUM(CASE WHEN disability IS NULL THEN 1 ELSE 0 END) AS disability_null,
	SUM(CASE WHEN disability ='' THEN 1 ELSE 0 END) AS disability_empty,
	SUM(CASE WHEN final_result IS NULL THEN 1 ELSE 0 END) AS final_result_null,
	SUM(CASE WHEN final_result ='' THEN 1 ELSE 0 END) AS final_result_empty		
FROM
 	oulad_studentInfo osi; 
 	
-- Check oulad_Registration for empty/null values
SELECT
	COUNT(*) as num_rows, 
	SUM(CASE WHEN code_module IS NULL THEN 1 ELSE 0 END) AS code_module_null,
	SUM(CASE WHEN code_module ='' THEN 1 ELSE 0 END) AS code_module_empty,
	SUM(CASE WHEN code_presentation IS NULL THEN 1 ELSE 0 END) AS code_presentation_null,
	SUM(CASE WHEN code_presentation ='' THEN 1 ELSE 0 END) AS code_presentation_empty,
	SUM(CASE WHEN id_student IS NULL THEN 1 ELSE 0 END) AS id_student_null,
	SUM(CASE WHEN id_student ='' THEN 1 ELSE 0 END) AS id_student_empty,
	SUM(CASE WHEN date_registration IS NULL THEN 1 ELSE 0 END) AS date_registration_null,
	SUM(CASE WHEN date_registration ='' THEN 1 ELSE 0 END) AS date_registration_empty,
	SUM(CASE WHEN date_unregistration IS NULL THEN 1 ELSE 0 END) AS date_unregistration_null,
	SUM(CASE WHEN date_unregistration ='' THEN 1 ELSE 0 END) AS date_unregistration_empty
FROM 
 	oulad_studentRegistration osr;

-- Check studentVle table for empty/null values
SELECT 
	COUNT(*) as num_rows, 
	SUM(CASE WHEN code_module IS NULL THEN 1 ELSE 0 END) AS code_module_null,
	SUM(CASE WHEN code_module ='' THEN 1 ELSE 0 END) AS code_module_empty,
	SUM(CASE WHEN code_presentation IS NULL THEN 1 ELSE 0 END) AS code_presentation_null,
	SUM(CASE WHEN code_presentation ='' THEN 1 ELSE 0 END) AS code_presentation_empty,
	SUM(CASE WHEN id_student IS NULL THEN 1 ELSE 0 END) AS id_student_null,
	SUM(CASE WHEN id_student ='' THEN 1 ELSE 0 END) AS id_student_null,
	SUM(CASE WHEN id_site IS NULL THEN 1 ELSE 0 END) AS id_site_null,
	SUM(CASE WHEN id_site ='' THEN 1 ELSE 0 END) AS id_site_empty,
	SUM(CASE WHEN "date" IS NULL THEN 1 ELSE 0 END) AS "date_null",
	SUM(CASE WHEN "date" ='' THEN 1 ELSE 0 END) AS "date_empty",
	SUM(CASE WHEN sum_click IS NULL THEN 1 ELSE 0 END) AS sum_click_null,
	SUM(CASE WHEN sum_click ='' THEN 1 ELSE 0 END) AS sum_click_empty
FROM 
	oulad_studentVle osv; 

-- Check the vle table for empty/null values
SELECT 
	COUNT(*) as num_rows, 
	SUM(CASE WHEN code_module IS NULL THEN 1 ELSE 0 END) AS code_module_null,
	SUM(CASE WHEN code_module ='' THEN 1 ELSE 0 END) AS code_module_empty,
	SUM(CASE WHEN code_presentation IS NULL THEN 1 ELSE 0 END) AS code_presentation_null,
	SUM(CASE WHEN code_presentation ='' THEN 1 ELSE 0 END) AS code_presentation_empty,
	SUM(CASE WHEN id_site IS NULL THEN 1 ELSE 0 END) AS id_site_null,
	SUM(CASE WHEN id_site ='' THEN 1 ELSE 0 END) AS id_site_empty,
	SUM(CASE WHEN activity_type IS NULL THEN 1 ELSE 0 END) AS activity_type_null,
	SUM(CASE WHEN activity_type ='' THEN 1 ELSE 0 END) AS activity_type_empty,
	SUM(CASE WHEN week_from IS NULL THEN 1 ELSE 0 END) AS week_from_null,
	SUM(CASE WHEN week_from ='' THEN 1 ELSE 0 END) AS week_from_empty,
	SUM(CASE WHEN week_to IS NULL THEN 1 ELSE 0 END) AS week_to_null,
	SUM(CASE WHEN week_to ='' THEN 1 ELSE 0 END) AS week_to_empty
FROM 
	oulad_vle ov; 
	
-- Check courses table for empty/null values
SELECT 
	COUNT(*) as num_rows, 
	SUM(CASE WHEN code_module IS NULL THEN 1 ELSE 0 END) AS code_module_null,
	SUM(CASE WHEN code_module ='' THEN 1 ELSE 0 END) AS code_module_empty,
	SUM(CASE WHEN code_presentation IS NULL THEN 1 ELSE 0 END) AS code_presentation_null,
	SUM(CASE WHEN code_presentation ='' THEN 1 ELSE 0 END) AS code_presentation_empty,
	SUM(CASE WHEN module_presentation_length IS NULL THEN 1 ELSE 0 END) AS module_presentation_length_null,
	SUM(CASE WHEN module_presentation_length ='' THEN 1 ELSE 0 END) AS module_presentation_length_empty
FROM 
	oulad_courses oc; 



	