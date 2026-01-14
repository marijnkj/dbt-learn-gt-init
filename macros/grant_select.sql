{% macro grant_select(
        schema = target.schema,
        role = target.role
    ) %}
    {% set sql %}
    GRANT usage
    ON schema {{ schema }} TO role {{ role }};
GRANT
SELECT
    ON ALL tables IN schema {{ schema }} TO role {{ role }};
GRANT
SELECT
    ON ALL VIEWS IN schema {{ schema }} TO role {{ role }};
{% endset %}
    {{ log(
        'Granting select on all tables and views in schema ' ~ target.schema ~ ' to role ' ~ role,
        info = True
    ) }}

    {% do run_query(sql) %}
    {{ log(
        'Privileges granted',
        info = True
    ) }}
{% endmacro %}
