# 🧠 21 Days SQL Challenge — Indian Data Club

Welcome to my **21 Days SQL Challenge** journey organized by **Indian Data Club**!
I’m documenting each day’s SQL practice and daily challenge here with queries and explanations.
This challenge helps strengthen my SQL fundamentals with real-world hospital database examples.

---

## 📅 **Day 1 — November 3, 2025**

**🎯 Challenge:** Retrieve all unique hospital services offered in the hospital database.

**💻 Challenge Query:**

```sql
SELECT DISTINCT service
FROM services_weekly;
```

**🧾 Additional Practice Queries:**

```sql
-- 1. Retrieve all columns from the patients table
SELECT * FROM patients;

-- 2. Select only the patient_id, name, and age columns from the patients table
SELECT patient_id, name, age FROM patients;

-- 3. Display the first 10 records from the services_weekly table
SELECT * FROM services_weekly LIMIT 10;
```

---

## 📅 **Day 2 — November 4, 2025**

**🎯 Challenge:** Find all patients admitted to 'Surgery' service with a satisfaction score below 70, showing their patient_id, name, age, and satisfaction score.

**💻 Challenge Query:**

```sql
SELECT patient_id, name, age, satisfaction 
FROM patients 
WHERE service = 'Surgery' AND satisfaction < 70;
```

**🧾 Practice Queries:**

```sql
-- 1. Find all patients who are older than 60 years
SELECT * FROM patients WHERE age > 60;

-- 2. Retrieve all staff members who work in the 'Emergency' service
SELECT * FROM staff WHERE service = 'Emergency';

-- 3. List all weeks where more than 100 patients requested admission in any service
SELECT week FROM services_weekly WHERE patients_admitted > 100;
```

---

## 📅 **Day 3 — November 5, 2025**

**🎯 Challenge:** Retrieve the top 5 weeks with the highest patient refusals across all services, showing week, service, patients_refused, and patients_request. Sort by patients_refused in descending order.

**💻 Challenge Query:**

```sql
SELECT week, service, patients_refused, patients_request 
FROM services_weekly 
ORDER BY patients_refused DESC 
LIMIT 5;
```

**🧾 Practice Queries:**

```sql
-- 1. List all patients sorted by age in descending order
SELECT * FROM patients ORDER BY age DESC;

-- 2. Show all services_weekly data sorted by week number ascending and patients_request descending
SELECT * FROM services_weekly ORDER BY week ASC, patients_request DESC;

-- 3. Display staff members sorted alphabetically by their names
SELECT staff_name FROM staff ORDER BY staff_name ASC;
```

---

## 🚀 Progress Summary

| Day | Date        | Challenge Description                     | Focus Area                  |
| --- | ----------- | ----------------------------------------- | --------------------------- |
| 1   | Nov 3, 2025 | Unique hospital services                  | DISTINCT, SELECT basics     |
| 2   | Nov 4, 2025 | Patients in Surgery with low satisfaction | WHERE, comparison operators |
| 3   | Nov 5, 2025 | Top 5 weeks with highest refusals         | ORDER BY, LIMIT, sorting    |

---

### 📘 Author

**Syed Hussain**
21 Days SQL Challenge Participant | Indian Data Club
💡 *Building strong SQL foundations, one query at a time.*
