# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "fail2ban/map.jinja" import fail2ban with context %}

fail2ban.service:
{% if ( 'enabled' in fail2ban and fail2ban.enabled ) or ('enabled' not in fail2ban ) %}
    service.running:
        - name: {{ fail2ban.service }}
        - enable: True
        - require:
            - pkg: {{ fail2ban.package }}
{% elif 'enabled' in fail2ban and not fail2ban.enabled %}
    service.dead:
        - name: {{ fail2ban.service }}
        - enable: False
{% endif %}
