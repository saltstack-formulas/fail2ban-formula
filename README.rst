salt-fail2ban-formula
=====================

``fail2ban`` scans log files for malicious activity and executes actions based on what it finds.

Configuration
=============
First, ``fail2ban`` uses settings defined in ``/etc/fail2ban/jail.conf``. ``jail.conf`` is provided by the package, and should not be changed.

Next, it uses ``/etc/fail2ban/jail.local`` to override settings from ``jail.conf``. This formula populates the ``jail.local`` file using data from pillar.

Gotchas
=======
In the ``pillar.example``, note that the iptable action uses ``port=ssh``, not ``port=SSH`` (uppercase).
