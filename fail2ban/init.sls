{% from "fail2ban/map.jinja" import fail2ban with context %}

fail2ban:
  pkg.installed:
    - name: {{ fail2ban.package }}
  service:
    - running
    - enable: True
    - watch:
      - file: fail2ban_jails_config
    - require:
      - pkg: fail2ban

fail2ban_jails_config:
  file.managed:
    - name: {{ fail2ban.jails_config }}
    - source: {{ fail2ban.jails_config_src }}
    - template: jinja
    - user: root
    - group: root
    - mode: 644
