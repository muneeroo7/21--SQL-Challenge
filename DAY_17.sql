SELECT
    sw.service,
    sw.total_admitted,
    (sw.total_admitted - avg_stats.avg_admitted) AS admission_difference,
    CASE
        WHEN sw.total_admitted > avg_stats.avg_admitted THEN 'Above Average'
        WHEN sw.total_admitted = avg_stats.avg_admitted THEN 'Average'
        ELSE 'Below Average'
    END AS rank_indicator
FROM (
        SELECT 
            service,
            SUM(patients_admitted) AS total_admitted
        FROM services_weekly
        GROUP BY service
     ) AS sw,
     (
        SELECT AVG(total_admitted) AS avg_admitted
        FROM (
                SELECT 
                    service,
                    SUM(patients_admitted) AS total_admitted
                FROM services_weekly
                GROUP BY service
             ) AS x
     ) AS avg_stats
ORDER BY sw.total_admitted DESC;
