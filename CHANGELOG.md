# Changelog

## [1.0.1](https://github.com/saltstack-formulas/fail2ban-formula/compare/v1.0.0...v1.0.1) (2020-05-04)


### Bug Fixes

* **config:** add jails config filename also to fallback file.absent ([167a0d6](https://github.com/saltstack-formulas/fail2ban-formula/commit/167a0d60664328a925cf80862e2c402a63f2997f))


### Continuous Integration

* **gemfile.lock:** add to repo with updated `Gemfile` [skip ci] ([1604f1e](https://github.com/saltstack-formulas/fail2ban-formula/commit/1604f1ea52c28cc5e61630587d1648b124bda859))
* **kitchen:** avoid using bootstrap for `master` instances [skip ci] ([9ae8e09](https://github.com/saltstack-formulas/fail2ban-formula/commit/9ae8e0946efa6be827e1013935b74c32b4066c26))
* **kitchen+travis:** remove `master-py2-arch-base-latest` [skip ci] ([4c957f0](https://github.com/saltstack-formulas/fail2ban-formula/commit/4c957f0ec1e3ab14d01ed2c1f7d068a46edb3162))
* **workflows/commitlint:** add to repo [skip ci] ([6f3a950](https://github.com/saltstack-formulas/fail2ban-formula/commit/6f3a950e9b5b742719ff01e12a45a5d2fe72cf57))

# [1.0.0](https://github.com/saltstack-formulas/fail2ban-formula/compare/v0.17.2...v1.0.0) (2020-01-13)


### Features

* promote `ng` ([fb1ae56](https://github.com/saltstack-formulas/fail2ban-formula/commit/fb1ae56f460f2cabdf0f7b9b0bccdde309d698ca)), closes [#34](https://github.com/saltstack-formulas/fail2ban-formula/issues/34) [#35](https://github.com/saltstack-formulas/fail2ban-formula/issues/35)


### BREAKING CHANGES

* all previous `fail2ban` based configurations must be
reviewed; `fail2ban.ng` usage must be promoted to `fail2ban` and any
uses of the original `fail2ban` will have to be converted.

## [0.17.2](https://github.com/saltstack-formulas/fail2ban-formula/compare/v0.17.1...v0.17.2) (2020-01-10)


### Bug Fixes

* **ng/map.jinja:** use `ng:lookup` rather than `lookup` ([cb76484](https://github.com/saltstack-formulas/fail2ban-formula/commit/cb76484142d192dc3c0f2903231b97793e5b216e))


### Continuous Integration

* **kitchen:** use `fail2ban.ng` in `state_top` ([#35](https://github.com/saltstack-formulas/fail2ban-formula/issues/35)) ([10b403f](https://github.com/saltstack-formulas/fail2ban-formula/commit/10b403f8b445f65118e88872229a978cdae90a4c))

## [0.17.1](https://github.com/saltstack-formulas/fail2ban-formula/compare/v0.17.0...v0.17.1) (2020-01-10)


### Bug Fixes

* **pillar.example:** declare ignoreip (whitelist) in jail section (ng) ([00661cb](https://github.com/saltstack-formulas/fail2ban-formula/commit/00661cbca978e5b6344427bd688fcfae9789f3db))


### Continuous Integration

* **gemfile:** restrict `train` gem version until upstream fix [skip ci] ([4a10cd6](https://github.com/saltstack-formulas/fail2ban-formula/commit/4a10cd695764fb551aea91688625576dbb046ba9))
* **travis:** quote pathspecs used with `git ls-files` [skip ci] ([b4affad](https://github.com/saltstack-formulas/fail2ban-formula/commit/b4affadfd7f1227aea0dc96101e560553af12c8a))
* **travis:** use `major.minor` for `semantic-release` version [skip ci] ([d41fe3f](https://github.com/saltstack-formulas/fail2ban-formula/commit/d41fe3f2051e2f63dbae9cfd343103f5b3228dc0))

# [0.17.0](https://github.com/saltstack-formulas/fail2ban-formula/compare/v0.16.3...v0.17.0) (2019-11-27)


### Bug Fixes

* **release.config.js:** use full commit hash in commit link [skip ci] ([37439c8](https://github.com/saltstack-formulas/fail2ban-formula/commit/37439c81a79428a3ea66fcba0ea9f389daf78caa))


### Continuous Integration

* **kitchen:** use `debian-10-master-py3` instead of `develop` [skip ci] ([14629b9](https://github.com/saltstack-formulas/fail2ban-formula/commit/14629b96f38e79143899944f0ec2508171d196c8))
* **kitchen:** use `develop` image until `master` is ready (`amazonlinux`) [skip ci] ([6652ff9](https://github.com/saltstack-formulas/fail2ban-formula/commit/6652ff9d9563bc5454e48b16ccdea579100ff3f3))
* **kitchen+travis:** upgrade matrix after `2019.2.2` release [skip ci] ([9968b09](https://github.com/saltstack-formulas/fail2ban-formula/commit/9968b09784e4b2d3e9e5055b9f7dce6306d5eb80))
* **travis:** apply changes from build config validation [skip ci] ([885c517](https://github.com/saltstack-formulas/fail2ban-formula/commit/885c517e8a17b54d2966e475919f10378f7b99e9))
* **travis:** opt-in to `dpl v2` to complete build config validation [skip ci] ([5112d76](https://github.com/saltstack-formulas/fail2ban-formula/commit/5112d760e403fe8e9e56324445fab75a669e81c7))
* **travis:** run `shellcheck` during lint job ([527cf1e](https://github.com/saltstack-formulas/fail2ban-formula/commit/527cf1e9717964d794356b1dbbad0037356773fe))
* **travis:** update `salt-lint` config for `v0.0.10` [skip ci] ([52eb62c](https://github.com/saltstack-formulas/fail2ban-formula/commit/52eb62c8f9e8703889f8c9d97f68df794e4a644c))
* **travis:** use build config validation (beta) [skip ci] ([2ae5e8c](https://github.com/saltstack-formulas/fail2ban-formula/commit/2ae5e8cc167d9596bb07d094cf7dae2e7655a77f))


### Documentation

* **contributing:** remove to use org-level file instead [skip ci] ([2688f64](https://github.com/saltstack-formulas/fail2ban-formula/commit/2688f64efb58ef9091fdc56328ec6ad303727fcc))
* **readme:** update link to `CONTRIBUTING` [skip ci] ([37c0dd1](https://github.com/saltstack-formulas/fail2ban-formula/commit/37c0dd1fcdfd8bfb424490a7b680d0fc04150261))


### Features

* update deprecation version number in `semantic-release` run ([11d748a](https://github.com/saltstack-formulas/fail2ban-formula/commit/11d748abd67f1603b99a7804436d7ad6970d3411))
* **deprecated.sls:** prepare warning state for `ng` promotion ([#35](https://github.com/saltstack-formulas/fail2ban-formula/issues/35)) ([4c702bc](https://github.com/saltstack-formulas/fail2ban-formula/commit/4c702bc5a57b55abe8bdcc5096d5aa9a04233bb5))
* **deprecation:** include `ng` promotion warning to all state files ([4348b59](https://github.com/saltstack-formulas/fail2ban-formula/commit/4348b5966240878ec3959dfaa661e696384ca833))


### Performance Improvements

* **travis:** improve `salt-lint` invocation [skip ci] ([5a14047](https://github.com/saltstack-formulas/fail2ban-formula/commit/5a14047dae331c973e3a0f7384c5f1e135604e8f))

## [0.16.3](https://github.com/saltstack-formulas/fail2ban-formula/compare/v0.16.2...v0.16.3) (2019-10-11)


### Bug Fixes

* **rubocop:** add fixes using `rubocop --safe-auto-correct` ([](https://github.com/saltstack-formulas/fail2ban-formula/commit/0a420da))


### Continuous Integration

* merge travis matrix, add `salt-lint` & `rubocop` to `lint` job ([](https://github.com/saltstack-formulas/fail2ban-formula/commit/269a220))
* **travis:** merge `rubocop` linter into main `lint` job ([](https://github.com/saltstack-formulas/fail2ban-formula/commit/19f6faa))

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
