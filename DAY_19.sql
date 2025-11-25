--========================================--
-- DAY 19 (21 Days SQL Challenge)
-- Topic: Window Functions (ROW_NUMBER, RANK, DENSE_RANK)
--========================================--

-------------------------------
-- PRACTICE QUESTION 1
-- Rank patients by satisfaction score within each service.
-------------------------------
SELECT
      patient_id,
      UPPER(name) AS patient_name,
      service,
      satisfaction,
      RANK() OVER (
            PARTITION BY service
            ORDER BY satisfaction DESC
      ) AS satisfaction_rank
FROM patients
ORDER BY service, satisfaction_rank;

-------------------------------
-- PRACTICE QUESTION 2
-- Assign row numbers to staff ordered by their name.
-------------------------------
SELECT
      staff_id,
      UPPER(staff_name) AS staff_name,
      role,
      service,
      ROW_NUMBER() OVER (
            ORDER BY staff_name
      ) AS row_number
FROM staff
ORDER BY row_number;

-------------------------------
-- PRACTICE QUESTION 3
-- Rank services by total patients admitted.
-------------------------------
SELECT
      service,
      SUM(patients_admitted) AS total_admitted,
      DENSE_RANK() OVER (
            ORDER BY SUM(patients_admitted) DESC
      ) AS admission_rank
FROM services_weekly
GROUP BY service
ORDER BY admission_rank;

-------------------------------
-- DAILY CHALLENGE (DAY 19)
-- Rank weeks by satisfaction within each service, show top 3.
-------------------------------
WITH ranked_weeks AS (
    SELECT
          service,
          week,
          patient_satisfaction,
          patients_admitted,
          RANK() OVER (
                PARTITION BY service
                ORDER BY patient_satisfaction DESC
          ) AS satisfaction_rank
    FROM services_weekly
)
SELECT
      service,
      week,
      patient_satisfaction,
      patients_admitted,
      satisfaction_rank
FROM ranked_weeks
WHERE satisfaction_rank <= 3
ORDER BY service, satisfaction_rank, week;
