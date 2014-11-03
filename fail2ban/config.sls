{% from "fail2ban/map.jinja" import fail2ban with context %}

include:
  - fail2ban

/etc/fail2ban/fail2ban.local:
  file.managed:
    - source: salt://fail2ban/files/fail2ban_conf.template
    - template: jinja
    - watch_in:
      - service: {{ fail2ban.service }}
    - context:
        config:
            Definition: {{ fail2ban.config|yaml }}

/etc/fail2ban/jail.local:
  file.managed:
    - source: salt://fail2ban/files/fail2ban_conf.template
    - template: jinja
    - watch_in:
      - service: {{ fail2ban.service }}
    - context:
        config: {{ fail2ban.jails|yaml }}

{% for name, config in fail2ban.actions|dictsort %}
/etc/fail2ban/action.d/{{ name }}.conf:
  file.managed:
    - source: salt://fail2ban/files/fail2ban_conf.template
    - template: jinja
    - watch_in:
      - service: {{ fail2ban.service }}
    - context:
        config: {{ config|yaml }}
{% endfor %}

{% for name, config in fail2ban.filters|dictsort %}
/etc/fail2ban/filter.d/{{ name }}.conf:
  file.managed:
    - source: salt://fail2ban/files/fail2ban_conf.template
    - template: jinja
    - watch_in:
      - service: {{ fail2ban.service }}
    - context:
        config: {{ config|yaml }}
{% endfor %}

