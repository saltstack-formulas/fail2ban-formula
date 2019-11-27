.. _readme:

fail2ban-formula
================

|img_travis| |img_sr|

.. |img_travis| image:: https://travis-ci.com/saltstack-formulas/fail2ban-formula.svg?branch=master
   :alt: Travis CI Build Status
   :scale: 100%
   :target: https://travis-ci.com/saltstack-formulas/fail2ban-formula
.. |img_sr| image:: https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg
   :alt: Semantic Release
   :scale: 100%
   :target: https://github.com/semantic-release/semantic-release

``fail2ban`` scans log files for malicious activity and executes actions based on what it finds.

.. list-table::
   :name: banner-breaking-changes-v1.0.0
   :header-rows: 1
   :widths: 1

   * - WARNING: BREAKING CHANGES IN UPCOMING ``v1.0.0``
   * - This formula currently provides two methods for managing Fail2Ban; the old method
       under ``fail2ban`` and the new method under ``fail2ban.ng``.
       In upcoming `v1.0.0 <https://github.com/saltstack-formulas/fail2ban-formula/releases/tag/v1.0.0>`_,
       the old method will be removed and ``fail2ban.ng`` will be promoted to ``fail2ban`` in its place.

       If you are not in a position to migrate, you will need to pin your repo to
       the final release tag before
       `v1.0.0 <https://github.com/saltstack-formulas/fail2ban-formula/releases/tag/v1.0.0>`_,
       which is expected to be
       `v0.17.0 <https://github.com/saltstack-formulas/fail2ban-formula/releases/tag/v0.17.0>`_.

       If you are currently using ``fail2ban.ng``, there is nothing to do until
       `v1.0.0 <https://github.com/saltstack-formulas/fail2ban-formula/releases/tag/v1.0.0>`_
       is released.

       To migrate from the old ``fail2ban``, the first step is to convert to ``fail2ban.ng``,
       before `v1.0.0 <https://github.com/saltstack-formulas/fail2ban-formula/releases/tag/v1.0.0>`_
       is released.

.. contents:: **Table of Contents**

General notes
-------------

See the full `SaltStack Formulas installation and usage instructions
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

If you are interested in writing or contributing to formulas, please pay attention to the `Writing Formula Section
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#writing-formulas>`_.

If you want to use this formula, please pay attention to the ``FORMULA`` file and/or ``git tag``,
which contains the currently released version. This formula is versioned according to `Semantic Versioning <http://semver.org/>`_.

See `Formula Versioning Section <https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#versioning>`_ for more details.

Contributing to this repo
-------------------------

**Commit message formatting is significant!!**

Please see `How to contribute <https://github.com/saltstack-formulas/.github/blob/master/CONTRIBUTING.rst>`_ for more details.

Available states
----------------

.. contents::
   :local:


``fail2ban``
^^^^^^^^^^^^

Install the ``fail2ban`` package and enable the service.

``fail2ban.config``
^^^^^^^^^^^^^^^^^^^

Creates a ``jail.local`` config file based on pillar data to override configuration in the default ``jail.conf`` file and enables creation of all configuration files based on content blocks in pillar. See ``pillar.example`` for reference
and consult the fail2ban documentation.


The following states provide an alternate approach to managing fail2ban. Tested in Ubuntu 14/16 and CentOS 6/7.

.. contents::
    :local:

``fail2ban.ng``
^^^^^^^^^^^^^^^

Meta state for inclusion of all ng states.

``fail2ban.ng.install``
^^^^^^^^^^^^^^^^^^^^^^^

Install the ``fail2ban`` package.

``fail2ban.ng.config``
^^^^^^^^^^^^^^^^^^^^^^

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
^^^^^^^^^^^^^^^^^^^^^^^

Manage fail2ban service. It is also possible to disable the service using the following pillar configuration:

.. code-block:: yaml

  fail2ban:
    ng:
      enabled: False


Testing
-------

Linux testing is done with ``kitchen-salt``.

Requirements
^^^^^^^^^^^^

* Ruby
* Docker

.. code-block:: bash

   $ gem install bundler
   $ bundle install
   $ bin/kitchen test [platform]

Where ``[platform]`` is the platform name defined in ``kitchen.yml``,
e.g. ``debian-9-2019-2-py3``.

``bin/kitchen converge``
^^^^^^^^^^^^^^^^^^^^^^^^

Creates the docker instance and runs the ``fail2ban`` main state, ready for testing.

``bin/kitchen verify``
^^^^^^^^^^^^^^^^^^^^^^

Runs the ``inspec`` tests on the actual instance.

``bin/kitchen destroy``
^^^^^^^^^^^^^^^^^^^^^^^

Removes the docker instance.

``bin/kitchen test``
^^^^^^^^^^^^^^^^^^^^

Runs all of the stages above in one go: i.e. ``destroy`` + ``converge`` + ``verify`` + ``destroy``.

``bin/kitchen login``
^^^^^^^^^^^^^^^^^^^^^

Gives you SSH access to the instance for manual testing.
