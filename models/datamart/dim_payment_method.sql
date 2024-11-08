SELECT
    MD5(payment_method) AS payment_method_id,
    payment_method
FROM {{ ref('stg_tb_subway_ridership') }}
GROUP BY payment_method