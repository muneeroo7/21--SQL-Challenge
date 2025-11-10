select 
      patient_id,
      upper(name) as upper_case_name,
      lower(service) as service_in_lower_case,
      length(name) AS name_length,
      age,
case
    when age>=65 then 'Senior'
    when age>=18 then 'Adult' 
    else 'Minor'
end as age_category
from patients
where length(name)>10
order by upper_case_name,service_in_lower_case;