SELECT
    MD5(CONCAT(transit_timestamp, station_complex_id, payment_method, fare_class_category)) AS subway_ridership_id,
    MD5(CONCAT(CAST(station_complex_id AS STRING), georeference)) AS station_complex_id,
    MD5(payment_method) AS payment_method_id,
    MD5(fare_class_category) AS fare_class_id,
    transit_timestamp,
    transit_mode,
    ridership,
    transfers
FROM {{ ref('stg_tb_subway_ridership') }}