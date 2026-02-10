{% macro is_valid_json(column_name) %}
{{column_name}} is not null and {{column_name}} :: jsonb is not null
{% endmacro %}