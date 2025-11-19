with staff_count as(
    select 
          service,
          count(*) as total_staff
    from staff
    group by service
),
staff_present as(
    select 
          service,
          count(*) as staff_present_week20
    from staff_schedule
    where(week = 20 and present = 1)
    group by service
),
service_week20 as(
    select
        service,
        sum(patients_admitted) as total_admitted,
        sum(patients_refused) as total_refused,
        round(avg(patient_satisfaction), 2) as avg_satisfaction
    from services_weekly
    where week = 20
    group by service
)

select
      sw.service,
      sw.total_admitted,
      sw.total_refused,
      sw.avg_satisfaction,
      coalesce(sc.total_staff, 0) as staff_assigned,
      coalesce(sp.staff_present_week20, 0) as staff_present
from service_week20 as sw
left join staff_count as sc
      on sw.service = sc.service
left join staff_present as sp
      on sw.service = sp.service
order by sw.total_admitted desc;
