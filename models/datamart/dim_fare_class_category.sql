SELECT
    MD5(fare_class_category) AS fare_class_id,
    fare_class_category
FROM {{ ref('stg_tb_subway_ridership') }}
GROUP BY fare_class_category;
