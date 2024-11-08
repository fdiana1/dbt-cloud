SELECT
    station_complex_id,
    station_complex,
    borough,
    latitude,
    longitude,
    georeference
FROM {{ ref('stg_tb_subway_ridership') }}
GROUP BY station_complex_id, station_complex, borough, latitude, longitude, georeference