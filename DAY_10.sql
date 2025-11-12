select 
      service,
	  sum(patients_admitted) as total_patient_admitted,
	  round(avg(patient_satisfaction),2) as avg_satisfaction,
	  case  
	     when avg(patient_satisfaction)>=85 then'Excellent'
		 when avg(patient_satisfaction)>=75 then'Good'
		 when avg(patient_satisfaction)>=65 then'Fair'
		 else 'need_improvement'
	  end as performance_report
from services_weekly
group by service
order by avg_satisfaction desc;
	  