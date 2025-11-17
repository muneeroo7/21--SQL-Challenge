with staff_count as(
                    select 
					      service,
						  sum(present) as total_staff
					from staff_schedule
					group by service
					having sum(present)>5
)
select 
      p.patient_id,
	  upper(p.name)as patient_name,
	  p.age,
	  p.service,
	  sc.total_staff
from patients as p
inner join staff_count as sc
on p.service=sc.service
order by sc.total_staff desc, patient_name;
	  