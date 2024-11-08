SELECT
    MD5(CONCAT(CAST(station_complex_id AS STRING), georeference)) AS station_complex_id,
    station_complex,
    borough,
    latitude,
    longitude,
    georeference
FROM {{ ref('stg_tb_subway_ridership') }}
GROUP BY station_complex_id, station_complex, borough, latitude, longitude, georeference