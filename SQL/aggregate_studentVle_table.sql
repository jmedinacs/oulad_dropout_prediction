-- ========================================================
-- Create aggregated VLE interaction summary per student-course
-- Each row = 1 student in 1 course presentation
-- Features:
--   - total_clicks: total clicks across all resources and dates
--   - num_unique_resources: number of distinct resources accessed
--   - num_active_days: number of distinct days the student engaged
-- ========================================================

CREATE TABLE vle_aggregated AS
SELECT 
    id_student,
    code_module,
    code_presentation,
    SUM(sum_click) AS total_clicks,
    COUNT(DISTINCT id_site) AS num_unique_resources,
    COUNT(DISTINCT date) AS num_active_days
FROM 
    oulad_studentVle
GROUP BY 
    id_student, code_module, code_presentation;
