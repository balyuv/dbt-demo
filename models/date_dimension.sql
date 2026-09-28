WITH CTE AS 
(
    select   to_timestamp(started_at) as STARTED_AT,    
    DATE(started_at) as DATE_STARTED_AT,
        HOUR(to_timestamp(started_at)) as HOUR_STARTED_AT  ,

    CASE WHEN DAYNAME(to_timestamp(started_at)) IN ('SAT','SUN')
    THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
    END AS TYPE_OF_DAY,

    CASE WHEN MONTH(to_timestamp(STARTED_AT)) IN (12,1,2) THEN 'WINTER'
        WHEN MONTH(to_timestamp(STARTED_AT)) IN (3,4,5) THEN 'SPRING'
        WHEN MONTH(to_timestamp(STARTED_AT)) IN (6,7,8) THEN 'SUMMER'
        WHEN MONTH(to_timestamp(STARTED_AT)) IN (9,10,11) THEN 'FALL'
    END AS SEASON_OF_THE_YEAR


from {{ source('demo', 'bike') }}
where started_at != 'started_at'
)

SELECT * FROM CTE