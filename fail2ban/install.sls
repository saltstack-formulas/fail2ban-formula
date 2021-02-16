# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "fail2ban/map.jinja" import fail2ban with context %}

{%-   if salt['grains.get']('osfinger', '') in ['Amazon Linux-2'] %}
fail2ban_epel_repo:
  pkgrepo.managed:
    - name: epel
    - humanname: Extra Packages for Enterprise Linux 7 - $basearch
    - mirrorlist: https://mirrors.fedoraproject.org/metalink?repo=epel-7&arch=$basearch
    - enabled: 1
    - gpgcheck: 1
    - gpgkey: https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7
    - failovermethod: priority
    - require_in:
      - pkg: fail2ban.install
{%-   endif %}

fail2ban.install:
  pkg.installed:
    - name: {{ fail2ban.package }}
