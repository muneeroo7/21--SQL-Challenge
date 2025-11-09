select
      service,
	  sum(patients_refused) as no_of_patients_refused,
	  round(avg(patient_satisfaction),2) as avg_patient_satisfaction
from services_weekly
group by service
having 
       sum(patients_refused)>100 and round(avg(patient_satisfaction),2)<80
order by no_of_patients_refused desc,avg_patient_satisfaction;




	  