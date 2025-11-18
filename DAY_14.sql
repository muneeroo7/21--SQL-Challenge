select
      s.staff_id,
	  s.staff_name as name,
	  s.role,
	  s.service,
	  count(ss.week) as week_present
from staff as s
left join staff_schedule as ss
ON s.staff_id=ss.staff_id and ss.present=1
group by 
        s.staff_id,
		s.staff_name,
		s.role,
		s.service
ORDER BY week_present desc,s.staff_name;