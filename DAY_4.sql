select patient_id,name,service,satisfaction
from patients 
order by satisfaction desc
limit 5 offset 2 

