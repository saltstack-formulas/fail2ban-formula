salt-fail2ban-formula
=====================
``fail2ban`` scans log files for malicious activity and executes actions based on what it finds.

Configuration
-------------
First, ``fail2ban`` uses settings defined in ``/etc/fail2ban/jail.conf``. ``jail.conf`` is provided by the package, and should not be changed.

Next, it uses ``/etc/fail2ban/jail.local`` to override settings from ``jail.conf``. The ``fail2ban.config`` state populates the ``jail.local`` file using data from pillar. The ``jail.local`` file is only created if you use the ``fail2ban.config`` state.

States
------
``fail2ban``
    Install the ``fail2ban`` package and enable the service.
``fail2ban.config``
    Creates a ``jail.local`` config file based on pillar data to override config in the default ``jail.conf`` file.

Gotchas
-------
In the ``pillar.example``, note that the iptable action uses ``port=ssh``, not ``port=SSH`` (uppercase).
