{% from "fail2ban/map.jinja" import fail2ban with context %}

fail2ban:
  pkg.installed:
    - name: {{ fail2ban.package }}
  service.running:
    - name: {{ fail2ban.service }}
    - enable: True
    - require:
      - pkg: fail2ban

