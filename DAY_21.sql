WITH 
service_stats AS (
    SELECT
        service,
        SUM(patients_admitted) AS total_admissions,
        SUM(patients_refused) AS total_refusals,
        ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction,
        ROUND(
            SUM(patients_admitted)::decimal 
            / NULLIF(SUM(patients_admitted + patients_refused), 0),2) AS admission_rate
    FROM services_weekly
    GROUP BY service
),
staff_stats AS (
    SELECT
        service,
        COUNT(DISTINCT staff_id) AS total_staff,
        ROUND(AVG(present), 2) AS avg_weeks_present
    FROM staff_schedule
    GROUP BY service
),
patient_demo AS (
    SELECT
        service,
        ROUND(AVG(age), 1) AS avg_age,
        COUNT(*) AS patient_count
    FROM patients
    GROUP BY service
),
final_dashboard AS (
    SELECT
        ss.service,
        ss.total_admissions,
        ss.total_refusals,
        ss.avg_satisfaction,
        ss.admission_rate,
        st.total_staff,
        st.avg_weeks_present,
        pd.avg_age,
        pd.patient_count,
        ROUND(
            (0.6 * ss.admission_rate) + 
            (0.4 * ss.avg_satisfaction / 10),3) AS performance_score
    FROM service_stats ss
    LEFT JOIN staff_stats st USING (service)
    LEFT JOIN patient_demo pd USING (service)
)
SELECT *
FROM final_dashboard
ORDER BY performance_score DESC;
