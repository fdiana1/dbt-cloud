-- models/ridership_pattern_analysis.sql
SELECT 
    sc.station_complex_id,
    sc.station_complex,
    EXTRACT(HOUR FROM sr.transit_time) AS hour_of_day,
    SUM(sr.ridership) AS total_ridership
FROM 
    {{ ref('fact_subway_transit_ridership') }} AS sr
JOIN 
    {{ ref('dim_station_complex') }} AS sc
    ON sr.station_complex_id = sc.station_complex_id
GROUP BY 
    sc.station_complex_id, sc.station_complex, hour_of_day
ORDER BY 
    sc.station_complex, hour_of_day