SELECT
    p.patient_id,
    UPPER(p.name) AS patient_name,
    UPPER(p.service) AS services,
    p.satisfaction AS patient_satisfaction
FROM patients AS p
WHERE p.service IN (
        SELECT DISTINCT service
        FROM services_weekly
        WHERE patients_refused>0)
  AND p.service IN (
        SELECT service
        FROM services_weekly
        GROUP BY service
        HAVING AVG(patient_satisfaction) < (
                 SELECT AVG(patient_satisfaction)
                 FROM services_weekly
              )
    )
ORDER BY services, p.satisfaction DESC,patient_name;
