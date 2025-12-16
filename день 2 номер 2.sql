WITH dates AS (
    SELECT DATE '2022-01-01' AS visit_date
    UNION ALL
    SELECT DATE '2022-01-02'
    UNION ALL
    SELECT DATE '2022-01-03'
),

persons AS (
    SELECT DISTINCT 
        COALESCE(person_name, '-') AS person_name
    FROM your_table 
),
pizzerias AS (
    SELECT DISTINCT 
        COALESCE(pizzeria_name, '-') AS pizzeria_name
    FROM your_table
)

SELECT 
    COALESCE(p.person_name, '-') AS person_name,
    d.visit_date,
    COALESCE(pz.pizzeria_name, '-') AS pizzeria_name
FROM 
    dates d
CROSS JOIN persons p
CROSS JOIN pizzerias pz
LEFT JOIN your_table visits
    ON visits.person_name = p.person_name
    AND visits.pizzeria_name = pz.pizzeria_name
    AND visits.visit_date = d.visit_date
ORDER BY person_name, visit_date, pizzeria_name;