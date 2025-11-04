🧠 \*\*Day 2 — 21 Days SQL Challenge (Indian Data Club)\*\*

📅 \*\*Date:\*\* November 4, 2025

🎯 \*\*Challenge:\*\* Find all patients admitted to 'Surgery' service with a satisfaction score below 70, showing their patient\_id, name, age, and satisfaction score.



🧾 \*\*Queries Practiced:\*\*

-- 1. Find all patients who are older than 60 years



```sql

SELECT \* 

FROM patients 

WHERE age > 60;

```



-- 2. Retrieve all staff members who work in the 'Emergency' service



```sql

SELECT \* 

FROM staff 

WHERE service = 'Emergency';

```



-- 3. List all weeks where more than 100 patients requested admission in any service



```sql

SELECT week 

FROM services\_weekly 

WHERE patients\_admitted > 100;

```



-- 💪 \*\*Daily Challenge Query\*\*



```sql

SELECT patient\_id, name, age, satisfaction 

FROM patients 

WHERE service = 'Surgery' AND satisfaction < 70;

```



