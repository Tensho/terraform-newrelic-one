# Changelog

## [2.3.1](https://github.com/Tensho/terraform-newrelic-one/compare/v2.3.0...v2.3.1) (2026-07-01)


### Bug Fixes

* **alert-notifications:** remove dead issues_filter type attribute ([#19](https://github.com/Tensho/terraform-newrelic-one/issues/19)) ([682f70f](https://github.com/Tensho/terraform-newrelic-one/commit/682f70fe0605a286851a95088c4e2de9b293351e))
* **alert-policies:** remove unsupported policy description attribute ([#17](https://github.com/Tensho/terraform-newrelic-one/issues/17)) ([0853d08](https://github.com/Tensho/terraform-newrelic-one/commit/0853d08ccb08d3d0b33477b88e653a46f8c752dd))
* **api-access-key:** target Example sub-account instead of parent ([5be8953](https://github.com/Tensho/terraform-newrelic-one/commit/5be89539fc96da4ba2371f27a72c75230a832407))
* **synthetic-monitors:** wire browsers into browser-class monitors ([#18](https://github.com/Tensho/terraform-newrelic-one/issues/18)) ([cf60571](https://github.com/Tensho/terraform-newrelic-one/commit/cf60571c250a053e3b7ab1163058cc9e4a2a09ab))

## [2.3.0](https://github.com/Tensho/terraform-newrelic-one/compare/v2.2.0...v2.3.0) (2026-07-01)


### Features

* **alert-notifications:** reference external destination by id on channels ([#15](https://github.com/Tensho/terraform-newrelic-one/issues/15)) ([06cb81d](https://github.com/Tensho/terraform-newrelic-one/commit/06cb81db6f6e2b12c2a7104f61239a61a6c6ea07))

## [2.2.0](https://github.com/Tensho/terraform-newrelic-one/compare/v2.1.0...v2.2.0) (2026-06-29)


### Features

* **api-access-key:** add module ([#13](https://github.com/Tensho/terraform-newrelic-one/issues/13)) ([ea5c02c](https://github.com/Tensho/terraform-newrelic-one/commit/ea5c02c1a2090af1a64f817acba043a9c721307b))

## [2.1.0](https://github.com/Tensho/terraform-newrelic-one/compare/v2.0.0...v2.1.0) (2026-06-25)


### Features

* **alert-policies:** add baseline and incident expiration condition attributes ([#11](https://github.com/Tensho/terraform-newrelic-one/issues/11)) ([9684148](https://github.com/Tensho/terraform-newrelic-one/commit/9684148457dd45a7eed9962e84a7f6cd9f1d2b92))

## [2.0.0](https://github.com/Tensho/terraform-newrelic-one/compare/v1.5.0...v2.0.0) (2026-06-23)


### ⚠ BREAKING CHANGES

* **synthetic-monitors:** rename from plural to singular

### Features

* **entities:** add data module ([#10](https://github.com/Tensho/terraform-newrelic-one/issues/10)) ([b9932ad](https://github.com/Tensho/terraform-newrelic-one/commit/b9932adf8c5149c371ad9ccf790868266e572809))


### Bug Fixes

* **synthetic-monitors:** rename from plural to singular ([f7c5ef7](https://github.com/Tensho/terraform-newrelic-one/commit/f7c5ef7c9efdb931516057de92f3b309a605cc26))

## [1.5.0](https://github.com/Tensho/terraform-newrelic-one/compare/v1.4.0...v1.5.0) (2026-06-17)


### Features

* **tags:** add per entity ([#7](https://github.com/Tensho/terraform-newrelic-one/issues/7)) ([0ef97ae](https://github.com/Tensho/terraform-newrelic-one/commit/0ef97aed8c6b7ff805d01567661958e8f5c66b0b))

## [1.4.0](https://github.com/Tensho/terraform-newrelic-one/compare/v1.3.0...v1.4.0) (2026-01-12)


### Features

* **account-management:** create/update subaccount ([1c454d4](https://github.com/Tensho/terraform-newrelic-one/commit/1c454d47d2d0b4c09397df77a641746ca54777a7))

## [1.3.0](https://github.com/Tensho/terraform-newrelic-one/compare/v1.2.0...v1.3.0) (2025-12-11)


### Features

* **synthetic-monitors:** add simple, basic, broken links, script browser, script api, cert check, step ([7a061a5](https://github.com/Tensho/terraform-newrelic-one/commit/7a061a5d1336b5cc529067e73f590d9d565e62e5))

## [1.2.0](https://github.com/Tensho/terraform-newrelic-one/compare/v1.1.1...v1.2.0) (2025-12-01)


### Features

* **dashboards:** add json dashboards ([fde82b2](https://github.com/Tensho/terraform-newrelic-one/commit/fde82b2a53fd36500a96dce529d82c9eda58ca4e))

## [1.1.1](https://github.com/Tensho/terraform-newrelic-one/compare/v1.1.0...v1.1.1) (2025-11-24)


### Bug Fixes

* gratify public module registry flat sub-module structure ([9c1ed28](https://github.com/Tensho/terraform-newrelic-one/commit/9c1ed28a8a25bc95a5143a641ab67aa2883e57d6))

## [1.1.0](https://github.com/Tensho/terraform-newrelic-one/compare/v1.0.0...v1.1.0) (2025-11-24)


### Features

* **alerts/notifications:** add destinations ([85e089e](https://github.com/Tensho/terraform-newrelic-one/commit/85e089e4f1729b77d03b138946a2ee666f44218e))
* **alerts/notifications:** add workflows ([00ed274](https://github.com/Tensho/terraform-newrelic-one/commit/00ed274b3674915752dac02ade4da4c01d51f92e))
* **alerts/policies:** add policy_ids output ([5756286](https://github.com/Tensho/terraform-newrelic-one/commit/57562861a0590bd72ab92ea36be212bc8fbd9fbe))


### Bug Fixes

* **alerts/notifications:** drop default "FILTER" type in workflow ([324a223](https://github.com/Tensho/terraform-newrelic-one/commit/324a2237534587de1b85aaf1d0494f415360e43d))
* **alerts/notifications:** reference to notification channel resource in workflow ([4bd1f0c](https://github.com/Tensho/terraform-newrelic-one/commit/4bd1f0cd00681f69969ec068b82f490c703db6dc))

## 1.0.0 (2024-11-11)

### Init

* Set module structure
* Add basic alert policy and NRQL conditions
* Add notification channels and workflows
