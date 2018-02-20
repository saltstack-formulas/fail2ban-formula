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

Creates a ``jail.local`` config file based on pillar data to override configuration in the default ``jail.conf`` file and enables creation of all configuration files based on content blocks in pillar. See ``pillar-pt.example`` for reference
and consult the fail2ban documentation.

Configuration
=============

Simple:
-------
First, ``fail2ban`` uses settings defined in ``/etc/fail2ban/jail.conf``. ``jail.conf`` is provided by the package, and should not be changed.

Next, it uses ``/etc/fail2ban/jail.local`` to override settings from ``jail.conf``. The ``fail2ban.config`` state populates the ``jail.local`` file using data from pillar. The ``jail.local`` file is only created if you use the ``fail2ban.config`` state.

Advanced (via config blocks in pillar):
---------------------------------------

The ``fail2ban.config`` state also populates the ``jail.local``, ``fail2ban.local`` and the ``.conf`` files in ``action.d`` and ``filter.d`` via content blocks in pillar.


Gotchas
=======
In the ``pillar.example``, note that the iptable action uses ``port=ssh`` (lowercase), not ``port=SSH`` (uppercase).

Next-generation, alternate approach
===================================

The following states provide an alternate approach to managing fail2ban. Tested in Ubuntu 14/16 and CentOS 6/7.

.. contents::
    :local:

``fail2ban.ng``
---------------

Meta state for inclusion of all ng states.

``fail2ban.ng.install``
-----------------------

Install the ``fail2ban`` package.

``fail2ban.ng.config``
----------------------

Configure fail2ban creating a ``jail.local`` file based on pillar data that overrid ``jail.conf``. It also creates a ``file.local`` per action/filter. Either in jails, actions or filters is possible to setup a ``source_path`` options to upload your configuration directly (see ``pillar.example``). It is also possible to remove either actions or filters setting up ``enabled: False`` in it section (see ``pillar.example``).

Keep in mind that in ng states ``lookup``, ``config``, ``jails``, ``actions`` and ``filters`` are at the same level (in the old states, all the sections are under ``lookup``:

.. code-block:: yaml

  fail2ban:
    ng:
      lookup:
      config:
      jails:
      actions:
      filters:

Keep in mind also that in ng states change the syntax for the actions and filters adding a new `config` section and `enabled` option (optional):

.. code-block:: yaml

  fail2ban:
    ng:
      actions:
        name-of-action:
          enabled: True/False # OPTIONAL
          config:
            Definition:
                actionban:
                actionunban:
            Init:
                whatever:
      filters:
        name-of-filter:
          enabled: True/False # OPTIONAL
          config:
            Definition:
                failregex:

It is also possible to specify the source file for config, jails, actions and filters instead of using the template:

.. code-block:: yaml

  fail2ban:
    ng:
      config:
        source_path: salt://path-to-fail2ban-config-file
      jails:
        source_path: salt://path-to-fail2ban-config-file
      actions:
        name-of-action:
          config:
            source_path: salt://path-to-action-file
      filters:
        name-of-filter:
          config:
            source_path: salt://path-to-filter-file

``fail2ban.ng.service``
-----------------------

Manage fail2ban service. It is also possible to disable the service using the following pillar configuration:

.. code-block:: yaml

  fail2ban:
    ng:
      enabled: False
