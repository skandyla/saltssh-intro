{% from "chrony/map.jinja" import chrony with context %}

chrony:
  pkg.installed:
    - name: {{ chrony.pkg }}
  service:
    - name: {{ chrony.service }}
    - enable: True
    - running
    - require:
      - pkg: {{ chrony.pkg }}
      - file: {{ chrony.conf }}

{{ chrony.conf }}:
  file.managed:
    - name: {{ chrony.conf }}
    - source: salt://chrony/files/chrony.conf.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - watch_in:
      - service: {{ chrony.service }}
    - require:
      - pkg: {{ chrony.pkg }}


