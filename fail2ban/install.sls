# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "fail2ban/map.jinja" import fail2ban with context %}

fail2ban.install:
  pkg.installed:
    - name: {{ fail2ban.package }}
