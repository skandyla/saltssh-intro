# Install some basic packages for Debian systems
{% if grains['os_family'] == 'Debian' %}
basepackages:
  pkg.installed:
    - pkgs:
      - lsof
      - sysstat
      - telnet
{% endif %}
