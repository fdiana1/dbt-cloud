-- models/peak_hour_analysis.sql
SELECT 
    sc.station_complex_id,
    sc.station_complex,
    EXTRACT(DAYOFWEEK FROM sr.transit_date) AS day_of_week,
    EXTRACT(HOUR FROM sr.transit_time) AS hour_of_day,
    SUM(sr.ridership) AS total_ridership
FROM 
    {{ ref('fact_subway_transit_ridership') }} AS sr
JOIN 
    {{ ref('dim_station_complex') }} AS sc
    ON sr.station_complex_id = sc.station_complex_id
GROUP BY 
    sc.station_complex_id, sc.station_complex, day_of_week, hour_of_day
ORDER BY 
    sc.station_complex, day_of_week, total_ridership DESC 