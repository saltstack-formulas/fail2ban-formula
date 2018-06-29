{% from "fail2ban/map.jinja" import fail2ban with context %}

fail2ban:
  pkg.installed:
    - name: {{ fail2ban.package }}
  service.running:
    - name: {{ fail2ban.service }}
    - enable: True
    - require:
      - pkg: fail2ban

fail2ban_failure:
  cmd.run:
    - name: sleep 30 && sudo apt-get update
    - onfail:
      - pkg: fail2ban
  pkg.installed:
    - name: {{ fail2ban.package }}
    - require:
      - cmd: fail2ban_failure
    - onfail:
      - pkg: fail2ban
  service.running:
    - name: {{ fail2ban.service }}
    - enable: True
    - require:
      - pkg: fail2ban_failure
    - onfail:
      - pkg: fail2ban