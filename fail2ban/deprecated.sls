# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Evaluating as `False` by default, using this method since `defaults.yaml` not available in this repo #}
{%- if not salt['config.get']('fail2ban', {}).get('warning_messages', {}).get('v1.0.0', {}).get('mute_critical', False) %}
fail2ban-deprecated-in-v1.0.0-test-succeed:
  test.succeed_without_changes:
    - name: |

        ################################################################################
        #                                                                              #
        #            WARNING: BREAKING CHANGES IN UPCOMING VERSION `v1.0.0`            #
        #                                                                              #
        ################################################################################
        #                                                                              #
        # This formula currently provides two methods for managing Fail2Ban; the old   #
        # method under `fail2ban` and the new method under `fail2ban.ng`. In upcoming  #
        # `v1.0.0`, the old method will be removed and `fail2ban.ng` will be promoted  #
        # to `fail2ban` in its place.                                                  #
        #                                                                              #
        # If you are not in a position to migrate, you will need to pin your repo to   #
        # the final release tag before `v1.0.0`, which is expected to be `v0.16.3`.    #
        #                                                                              #
        # If you are currently using `fail2ban.ng`, there is nothing to do until       #
        # `v1.0.0` is released.                                                        #
        #                                                                              #
        # To migrate from the old `fail2ban`, the first step is to convert to          #
        # `fail2ban.ng`, before `v1.0.0` is released.                                  #
        #                                                                              #
        # To prevent this message being displayed again, set the pillar/config value:  #
        #                                                                              #
        # ```                                                                          #
        # fail2ban:                                                                    #
        #   warning_messages:                                                          #
        #     v1.0.0:                                                                  #
        #       mute_critical: true                                                    #
        # ```                                                                          #
        #                                                                              #
        ################################################################################
    # - failhard: True
{%- endif %}
