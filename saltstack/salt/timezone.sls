{%- set timezone = salt['pillar.get']('timezone:name', 'Europe/Dublin') %}
{%- set utc = salt['pillar.get']('timezone:utc', True) %}
timezone_setting:
  timezone.system:
    - name: {{ timezone }}
    - utc: {{ utc }}

