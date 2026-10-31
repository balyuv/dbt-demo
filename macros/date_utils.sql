{% macro function1(x) %}

case when to_timestamp({{x}}) < current_date then 'PAST' ELSE 'FUTURE' END

{% endmacro %}


{% macro function2(x) %}

  CASE WHEN MONTH(to_timestamp({{x}})) IN (12,1,2) THEN 'WINTER'
        WHEN MONTH(to_timestamp({{x}})) IN (3,4,5) THEN 'SPRING'
        WHEN MONTH(to_timestamp({{x}})) IN (6,7,8) THEN 'SUMMER'
        WHEN MONTH(to_timestamp({{x}})) IN (9,10,11) THEN 'FALL'
    END 

{% endmacro %}

{% macro function3(x) %}

   CASE WHEN DAYNAME(to_timestamp({{x}})) IN ('SAT','SUN')
    THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
    END

{% endmacro %}