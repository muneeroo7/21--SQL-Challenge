select
service,week,
sum(patients_admitted)as total_admitted,
sum(patients_refused) as total_refused,
round(avg(patient_satisfaction),2) as avg_patient_satisfaction
from services_weekly
group by service,week
order by week,service;
