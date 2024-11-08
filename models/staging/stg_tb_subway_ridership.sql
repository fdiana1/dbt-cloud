WITH base AS (
    SELECT
        transit_timestamp,
        transit_mode,
        station_complex_id,
        station_complex,
        borough,
        payment_method,
        fare_class_category,
        ridership,
        transfers,
        latitude,
        longitude,
        georeference
    FROM {{ source('raw_data', 'tb_subway_ridership') }}
)
SELECT * FROM base
