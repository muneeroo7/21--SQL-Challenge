🧠 **Day 3 — 21 Days SQL Challenge (Indian Data Club)**
📅 **Date:** November 5, 2025
🎯 **Challenge:** Retrieve the top 5 weeks with the highest patient refusals across all services, showing week, service, patients_refused, and patients_request. Sort by patients_refused in descending order.

🧾 **Queries Practiced:**
-- 1. List all patients sorted by age in descending order

```sql
SELECT * 
FROM patients 
ORDER BY age DESC;
```

-- 2. Show all services_weekly data sorted by week number ascending and patients_request descending

```sql
SELECT * 
FROM services_weekly 
ORDER BY week ASC, patients_request DESC;
```

-- 3. Display staff members sorted alphabetically by their names

```sql
SELECT staff_name 
FROM staff 
ORDER BY staff_name ASC;
```

-- 💪 **Daily Challenge Query**

```sql
SELECT week, service, patients_refused, patients_request 
FROM services_weekly 
ORDER BY patients_refused DESC 
LIMIT 5;
```
