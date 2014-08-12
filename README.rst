fail2ban
=====================

``fail2ban`` scans log files for malicious activity and executes actions based on what it finds.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``fail2ban``
------------

Install the ``fail2ban`` package and enable the service.

``fail2ban.config``
-------------------

Creates a ``jail.local`` config file based on pillar data to override configuration in the default ``jail.conf`` file.

``fail2ban.config-pt``
----------------------

Enables creation of all configuration files based on content blocks in pillar. See ``pillar-pt.example`` for reference
and consult the fail2ban documentation.

Configuration
=============

Simple:
-------
First, ``fail2ban`` uses settings defined in ``/etc/fail2ban/jail.conf``. ``jail.conf`` is provided by the package, and should not be changed.

Next, it uses ``/etc/fail2ban/jail.local`` to override settings from ``jail.conf``. The ``fail2ban.config`` state populates the ``jail.local`` file using data from pillar. The ``jail.local`` file is only created if you use the ``fail2ban.config`` state.

Advanced (via config blocks in pillar):
---------------------------------------

The ``fail2ban.config-pt`` state populates the ``jail.local``, ``fail2ban.local`` and the ``.conf`` files in ``action.d`` and ``filter.d`` via content blocks in pillar.


Gotchas
=======
In the ``pillar.example``, note that the iptable action uses ``port=ssh`` (lowercase), not ``port=SSH`` (uppercase).
