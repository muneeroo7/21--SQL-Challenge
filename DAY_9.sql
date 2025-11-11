select
      upper(service) as service,
	  count(*) as patients_count,
	  round(avg(departure_date-arrival_date),2) as avg_length_of_stay
from patients
group by service
having  avg(departure_date-arrival_date)>7
order by avg_length_of_stay desc;