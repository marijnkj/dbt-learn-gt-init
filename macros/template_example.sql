{% macro template_example() %}
    {% set query %}
SELECT
    TRUE AS BOOLEAN {% endset %}
    {% if execute %}
        {% set results = run_query(query).columns [0].values() [0] %}
        {{ log (
            'The query result is: ' ~ results,
            info = True
        ) }}
    SELECT
        {{ results }} AS IS_REAL
    {% endif %}
{% endmacro %}
