-- models/station_performance_evaluation.sql
SELECT 
    sc.station_complex_id,
    sc.station_complex,
    SUM(sr.ridership) AS total_ridership
FROM 
    {{ ref('fact_subway_transit_ridership') }} AS sr
JOIN 
    {{ ref('dim_station_complex') }} AS sc
    ON sr.station_complex_id = sc.station_complex_id
GROUP BY 
    sc.station_complex_id, sc.station_complex
ORDER BY 
    total_ridership DESC 
