# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "fail2ban/map.jinja" import fail2ban with context %}

fail2ban.config.fail2ban:
{% if fail2ban.config is defined %}

{% set fail2ban_config = fail2ban.config.get('source_path',
                           'salt://fail2ban/files/config.jinja') %}

    file.managed:
        - name: {{ fail2ban.prefix }}/etc/fail2ban/fail2ban.local
        - source: {{ fail2ban_config }}
        - user: {{ fail2ban.user|default('root') }}
        - group: {{ fail2ban.group|default('root') }}
        - mode: '{{ fail2ban.mode|default("644") }}'
        - template: jinja
    {% if fail2ban.config.source_path is not defined %}
        - context:
            config:
                Definition: {{ fail2ban.config|yaml }}
    {% endif %}
{% else %}
    file.absent:
        - name: {{ fail2ban.prefix }}/etc/fail2ban/fail2ban.local
{% endif %}
        - watch_in:
            - service: {{ fail2ban.service }}

fail2ban.config.jails:
{% if fail2ban.jails is defined %}

{% set fail2ban_jails = fail2ban.jails.get('source_path',
                          'salt://fail2ban/files/config.jinja') %}

    file.managed:
        - name: {{ fail2ban.prefix }}/etc/fail2ban/jail.local
        - source: {{ fail2ban_jails }}
        - user: {{ fail2ban.user|default('root') }}
        - group: {{ fail2ban.group|default('root') }}
        - mode: '{{ fail2ban.mode|default("644") }}'
        - template: jinja
    {% if fail2ban.jails.source_path is not defined %}
        - context:
            config: {{ fail2ban.jails|yaml }}
    {% endif %}
{% else %}
    file.absent:
        - name: {{ fail2ban.prefix }}/etc/fail2ban/jail.local
{% endif %}
        - watch_in:
            - service: {{ fail2ban.service }}

{% for name, options in fail2ban.get('actions', {})|dictsort %}

{% set fail2ban_actions = options.config.get('source_path',
                            'salt://fail2ban/files/config.jinja') %}

fail2ban.config.action.{{ name }}:
{% if ( 'enabled' in options and options.enabled ) or ('enabled' not in options ) %}
    file.managed:
        - name: {{ fail2ban.prefix }}/etc/fail2ban/action.d/{{ name }}.local
        - source: {{ fail2ban_actions }}
        - user: {{ fail2ban.user|default('root') }}
        - group: {{ fail2ban.group|default('root') }}
        - mode: '{{ fail2ban.mode|default("644") }}'
        - template: jinja
        - watch_in:
            - service: {{ fail2ban.service }}
    {% if options.config.source_path is not defined %}
        - context:
            config: {{ options.config|yaml }}
    {% endif %}
{% elif 'enabled' in options and not options.enabled %}
    file.absent:
        - name: {{ fail2ban.prefix }}/etc/fail2ban/action.d/{{ name }}.local
{% endif %}
{% endfor %}

{% for name, options in fail2ban.get('filters', {})|dictsort %}

{% set fail2ban_filters = options.config.get('source_path',
                            'salt://fail2ban/files/config.jinja') %}

fail2ban.config.filter.{{ name }}:
{% if ( 'enabled' in options and options.enabled ) or ('enabled' not in options ) %}
    file.managed:
        - name: {{ fail2ban.prefix }}/etc/fail2ban/filter.d/{{ name }}.local
        - source: {{ fail2ban_filters }}
        - user: {{ fail2ban.user|default('root') }}
        - group: {{ fail2ban.group|default('root') }}
        - mode: '{{ fail2ban.mode|default("644") }}'
        - template: jinja
        - watch_in:
          - service: {{ fail2ban.service }}
    {% if options.config.source_path is not defined %}
        - context:
            config: {{ options.config|yaml }}
    {% endif %}
{% elif 'enabled' in options and not options.enabled %}
    file.absent:
        - name: {{ fail2ban.prefix }}/etc/fail2ban/filter.d/{{ name }}.local
{% endif %}
{% endfor %}
