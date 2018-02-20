# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "fail2ban/ng/map.jinja" import fail2ban with context %}

fail2ban.ng.install:
  pkg.installed:
    - name: {{ fail2ban.package }}
