SELECT
    service,
    event,
    COUNT(*) AS occurrence_count
FROM services_weekly
WHERE event IS NOT NULL
  AND LOWER(event) <> 'none'
GROUP BY service, event
ORDER BY occurrence_count DESC;
