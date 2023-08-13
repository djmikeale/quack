{% macro country_to_flag(country_name) %}
    {%- set flag_mapping = {
        'Denmark': '🇩🇰',
        'Indonesia': '🇮🇩',
        'Singapore': '🇸🇬'
    } -%}
    CASE {{ country_name }}
        {% for country, flag in flag_mapping.items() -%}
            WHEN '{{ country }}' THEN '{{ flag }}'
        {% endfor -%}
        ELSE NULL END
{%- endmacro %}
