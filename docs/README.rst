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

   * - WARNING: BREAKING CHANGES SINCE ``v1.0.0``
   * - Prior to
       `v1.0.0 <https://github.com/saltstack-formulas/fail2ban-formula/releases/tag/v1.0.0>`_,
       this formula provided two methods for managing Fail2Ban;
       the old method under ``fail2ban`` and the new method under ``fail2ban.ng``.
       The old method has now been removed and ``fail2ban.ng`` has been promoted to
       be ``fail2ban`` in its place.

       If you are not in a position to migrate, please pin your repo to the final
       release tag before
       `v1.0.0 <https://github.com/saltstack-formulas/fail2ban-formula/releases/tag/v1.0.0>`_,
       i.e.
       `v0.17.2 <https://github.com/saltstack-formulas/fail2ban-formula/releases/tag/v0.17.2>`_.

       To migrate from ``fail2ban.ng``, simply modify your pillar to promote the
       entire section under ``fail2ban:ng`` so that it is under ``fail2ban`` instead.
       So with the editor of your choice, highlight the entire section and then
       unindent one level.  Finish by removing the ``ng:`` line.

       To migrate from the old ``fail2ban``, first convert to ``fail2ban.ng`` under
       `v0.17.2 <https://github.com/saltstack-formulas/fail2ban-formula/releases/tag/v0.17.2>`_.
       and then follow the steps laid out in the paragraph directly above.

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

Meta state for inclusion of all states.

``fail2ban.install``
^^^^^^^^^^^^^^^^^^^^

Install the ``fail2ban`` package.

``fail2ban.config``
^^^^^^^^^^^^^^^^^^^

Configure fail2ban creating a ``jail.local`` file based on pillar data that overrid ``jail.conf``. It also creates a ``file.local`` per action/filter. Either in jails, actions or filters is possible to setup a ``source_path`` options to upload your configuration directly (see ``pillar.example``). It is also possible to remove either actions or filters setting up ``enabled: False`` in it section (see ``pillar.example``).

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

``fail2ban.service``
^^^^^^^^^^^^^^^^^^^^

Manage fail2ban service. It is also possible to disable the service using the following pillar configuration:

.. code-block:: yaml

  fail2ban:
    enabled: false


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
