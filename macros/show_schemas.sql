{% macro get_schemas() %}
  {% set results = run_query('SHOW SCHEMAS IN DATABASE MARIO_AMAYA') %}
  {% do log(results.columns[1].values() | join(", "), info=true) %}
{% endmacro %}
