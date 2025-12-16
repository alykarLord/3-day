SELECT piz.name AS pizzeria_name, piz.rating FROM pizzeria piz LEFT JOIN person_visits v ON piz.id = v.pizzeria_id WHERE v.person_id IS NULL;
