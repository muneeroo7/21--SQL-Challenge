with service_stats as(
     select
	       service,
		   avg(patients_admitted) as avg_service_admitted
	 from services_weekly
	 group by service
)
select
      sw.service,
	  sw.week,
	  sw.patients_admitted,
	  sum(patients_admitted) over (partition by sw.service order by sw.week) as running_total_admitted,
	  round(avg(sw.patient_satisfaction)over( partition by sw.service order by sw.week rows between 2 preceding and current row),2) as satisfaction_moving_avg,
	  (sw.patients_admitted-ss.avg_service_admitted) as admission_difference
from services_weekly as sw
inner join service_stats as ss
on sw.service=ss.service
where sw.week between 10 and 20
order by sw.service,sw.week;