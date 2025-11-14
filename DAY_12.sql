SELECT
    CASE
        WHEN event IS NOT NULL 
         AND event <> '' 
         AND LOWER(event) <> 'none'
            THEN 'With Event'
        ELSE 'No Event'
    END AS event_status,
    
    COUNT(DISTINCT week) AS week_count,
    ROUND(AVG(patient_satisfaction), 2) AS avg_patient_satisfaction,
    ROUND(AVG(staff_morale), 2) AS avg_staff_morale

FROM services_weekly
GROUP BY event_status
ORDER BY avg_patient_satisfaction DESC;
