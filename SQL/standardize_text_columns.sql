-- ========================================
-- Standaradize text columns to lower case and trim
-- ========================================

-- Standardize and trim text columns in courses
UPDATE oulad_courses
SET code_module = LOWER(TRIM(code_module)),
    code_presentation = LOWER(TRIM(code_presentation));

-- Standardize and trim text columns in studentInfo
UPDATE oulad_studentInfo
SET age_band = LOWER(TRIM(age_band)),
    disability = LOWER(TRIM(disability)),
    final_result = LOWER(TRIM(final_result)),
    gender = LOWER(TRIM(gender)),
    highest_education = LOWER(TRIM(highest_education)),
    imd_band = LOWER(TRIM(imd_band)),
    region = LOWER(TRIM(region)),
    code_module = LOWER(TRIM(code_module)),
    code_presentation = LOWER(TRIM(code_presentation));

-- Standardize and trim text columns in studentRegistration
UPDATE oulad_studentRegistration
SET code_module = LOWER(TRIM(code_module)),
    code_presentation = LOWER(TRIM(code_presentation));

-- Standardize and trim text columns in studentVle
UPDATE oulad_studentVle
SET code_module = LOWER(TRIM(code_module)),
    code_presentation = LOWER(TRIM(code_presentation));

-- Standardize and trim text columns in vle
UPDATE oulad_vle
SET activity_type = LOWER(TRIM(activity_type)),
    code_module = LOWER(TRIM(code_module)),
    code_presentation = LOWER(TRIM(code_presentation));
