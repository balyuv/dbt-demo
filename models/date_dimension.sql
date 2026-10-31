WITH CTE AS 
(
    select to_timestamp(started_at) as STARTED_AT,    
    DATE(started_at) as DATE_STARTED_AT,
    HOUR(to_timestamp(started_at)) as HOUR_STARTED_AT  ,

    {{function3('STARTED_AT')}} as TYPE_OF_DAY,

     {{function2('STARTED_AT')}} as SEASON_MACRO,

    {{function1('STARTED_AT')}} as TENSE


from {{ source('demo', 'bike') }}
where started_at != 'started_at'
)

SELECT * FROM CTE
