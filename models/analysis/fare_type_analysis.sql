-- models/analysis/fare_type_analysis.sql

WITH fare_type_ridership AS (
    SELECT 
        fare.fare_class_category,
        SUM(fact.ridership) AS total_ridership
    FROM 
        {{ ref('fact_subway_transit_ridership') }} AS fact
    JOIN 
        {{ ref('dim_fare_class_category') }} AS fare 
    ON 
        fact.fare_class_id = fare.fare_class_id
    GROUP BY 
        fare.fare_class_category
)

SELECT * FROM fare_type_ridership
ORDER BY total_ridership DESC