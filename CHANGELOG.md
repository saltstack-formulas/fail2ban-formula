# Changelog

## [0.16.2](https://github.com/saltstack-formulas/fail2ban-formula/compare/v0.16.1...v0.16.2) (2019-10-09)


### Bug Fixes

* **config.jinja:** fix `salt-lint` errors ([](https://github.com/saltstack-formulas/fail2ban-formula/commit/ddbac67))
* **config.sls:** fix `salt-lint` errors ([](https://github.com/saltstack-formulas/fail2ban-formula/commit/0f668ca))


### Continuous Integration

* **kitchen:** change `log_level` to `debug` instead of `info` ([](https://github.com/saltstack-formulas/fail2ban-formula/commit/44247c1))
* **kitchen:** install required packages to bootstrapped `opensuse` [skip ci] ([](https://github.com/saltstack-formulas/fail2ban-formula/commit/410f589))
* **kitchen:** use bootstrapped `opensuse` images until `2019.2.2` [skip ci] ([](https://github.com/saltstack-formulas/fail2ban-formula/commit/e8ffbb6))
* **kitchen+travis:** replace EOL pre-salted images ([](https://github.com/saltstack-formulas/fail2ban-formula/commit/f33c864))
* **platform:** add `arch-base-latest` ([](https://github.com/saltstack-formulas/fail2ban-formula/commit/ab09eda))
* **yamllint:** add rule `empty-values` & use new `yaml-files` setting ([](https://github.com/saltstack-formulas/fail2ban-formula/commit/e592919))
* merge travis matrix, add `salt-lint` & `rubocop` to `lint` job ([](https://github.com/saltstack-formulas/fail2ban-formula/commit/3b1c31a))
* use `dist: bionic` & apply `opensuse-leap-15` SCP error workaround ([](https://github.com/saltstack-formulas/fail2ban-formula/commit/2ca74f9))

## [0.16.1](https://github.com/saltstack-formulas/fail2ban-formula/compare/v0.16.0...v0.16.1) (2019-08-25)


### Documentation

* **readme:** update testing section ([3ae625f](https://github.com/saltstack-formulas/fail2ban-formula/commit/3ae625f))

# [0.16.0](https://github.com/saltstack-formulas/fail2ban-formula/compare/v0.15.0...v0.16.0) (2019-08-10)


### Continuous Integration

* **kitchen+travis:** modify matrix to include `develop` platform ([4af0301](https://github.com/saltstack-formulas/fail2ban-formula/commit/4af0301))


### Features

* **yamllint:** include for this repo and apply rules throughout ([ee23eaf](https://github.com/saltstack-formulas/fail2ban-formula/commit/ee23eaf))

# [0.15.0](https://github.com/saltstack-formulas/fail2ban-formula/compare/v0.14.0...v0.15.0) (2019-05-18)


### Continuous Integration

* **travis:** enabling only 5 builds for Salt 2019.2 on py3 ([d588774](https://github.com/saltstack-formulas/fail2ban-formula/commit/d588774))


### Features

* implement an automated changelog ([9ab601c](https://github.com/saltstack-formulas/fail2ban-formula/commit/9ab601c))
