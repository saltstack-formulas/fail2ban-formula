{% from "fail2ban/map.jinja" import fail2ban with context %}

include:
  - fail2ban

fail2ban_jails_config:
  file.managed:
    - name: {{ fail2ban.jails_config }}
    - source: {{ fail2ban.jails_config_src }}
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - watch_in:
      - service: {{ fail2ban.service }}
