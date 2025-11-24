--========================================--
-- DAY 18 (21 Days SQL Challenge)
-- Topic: UNION & UNION ALL
--========================================--

--========================================--
-- PRACTICE QUESTION 1
-- Combine patient names and staff names into a single list.
--========================================--
SELECT 
      name AS combined_name
FROM patients
UNION
SELECT
      staff_name
FROM staff;

--========================================--
-- PRACTICE QUESTION 2
-- Create a union of high satisfaction patients (>90) 
-- and low satisfaction patients (<50).
--========================================--
SELECT 
      patient_id,
      name AS patient_name,
      satisfaction,
      'High Satisfaction' AS category
FROM patients
WHERE satisfaction > 90
UNION
SELECT 
      patient_id,
      name AS patient_name,
      satisfaction,
      'Low Satisfaction' AS category
FROM patients
WHERE satisfaction < 50;

--========================================--
-- PRACTICE QUESTION 3
-- List all unique names from both patients and staff tables.
--========================================--
SELECT 
      name AS combined_name
FROM patients
UNION
SELECT 
      staff_name
FROM staff;

--========================================--
-- DAILY CHALLENGE (DAY 18)
-- Create a comprehensive personnel and patient list showing:
-- identifier (patient_id or staff_id),
-- full name, type ('Patient' or 'Staff'),
-- and service. Include only 'surgery' or 'emergency'.
-- Order by type, service, name.
--========================================--
SELECT
      p.patient_id AS identifier,
      p.name AS full_name,
      'Patient' AS type,
      p.service
FROM patients AS p
WHERE p.service IN ('surgery', 'emergency')
UNION ALL
SELECT
      s.staff_id AS identifier,
      s.staff_name AS full_name,
      'Staff' AS type,
      s.service
FROM staff AS s
WHERE s.service IN ('surgery', 'emergency')
ORDER BY 
      type,
      service,
      full_name;
