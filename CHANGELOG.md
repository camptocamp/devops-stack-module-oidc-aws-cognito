# Changelog

## [1.1.1](https://github.com/camptocamp/devops-stack-module-oidc-aws-cognito/compare/v1.1.0...v1.1.1) (2024-08-14)


### Bug Fixes

* ignore any schema changes made on the remote side ([42937cf](https://github.com/camptocamp/devops-stack-module-oidc-aws-cognito/commit/42937cfed72e2a67c011e2100476e5a57459dc9d))

## [1.1.0](https://github.com/camptocamp/devops-stack-module-oidc-aws-cognito/compare/v1.0.1...v1.1.0) (2024-02-23)


### Features

* add a subdomain variable ([70fb1ff](https://github.com/camptocamp/devops-stack-module-oidc-aws-cognito/commit/70fb1ff754bd96855aaba1a8c6f7b70fc9366564))
* add callback URLs without cluster_name ([b0b70e7](https://github.com/camptocamp/devops-stack-module-oidc-aws-cognito/commit/b0b70e7ea260deac7977c80e5df1b75bae086c96))


### Bug Fixes

* make subdomain variable non-nullable ([d567d8c](https://github.com/camptocamp/devops-stack-module-oidc-aws-cognito/commit/d567d8c2d7e982dfee5d7d52c9902bd8dd92b911))

## [1.0.1](https://github.com/camptocamp/devops-stack-module-oidc-aws-cognito/compare/v1.0.0...v1.0.1) (2023-10-19)


### Bug Fixes

* remove optional from variable used to create users ([#8](https://github.com/camptocamp/devops-stack-module-oidc-aws-cognito/issues/8)) ([a01ff4f](https://github.com/camptocamp/devops-stack-module-oidc-aws-cognito/commit/a01ff4ff18dea37d77757cf4904441df5bb94003))

## [1.0.0](https://github.com/camptocamp/devops-stack-module-oidc-aws-cognito/compare/v1.0.0-alpha.1...v1.0.0) (2023-03-27)


### Features

* add improvements and documentation ([#5](https://github.com/camptocamp/devops-stack-module-oidc-aws-cognito/issues/5)) ([28276e8](https://github.com/camptocamp/devops-stack-module-oidc-aws-cognito/commit/28276e84fe5ad9f08f7ef0ed4ad4e24e6e8247c7))

## 1.0.0-alpha.1 (2022-11-18)


### ⚠ BREAKING CHANGES

* move Terraform module at repository root

### Features

* add thanos callback urls ([1b97631](https://github.com/camptocamp/devops-stack-module-oidc-aws-cognito/commit/1b976314bce4e9647b5dfdf99dd08f8f839df5df))


### Bug Fixes

* corrected default value ([7be32b2](https://github.com/camptocamp/devops-stack-module-oidc-aws-cognito/commit/7be32b2480cd5e7b52bf086950abc5b779347c2e))
* do not delay Helm values evaluation ([b841360](https://github.com/camptocamp/devops-stack-module-oidc-aws-cognito/commit/b84136003a9e6eb74e6b23bfc0ec7063734dd976))


### Code Refactoring

* move Terraform module at repository root ([9eb25e6](https://github.com/camptocamp/devops-stack-module-oidc-aws-cognito/commit/9eb25e6ae8104984d851a88a6aedf89fedd1100e))


### Continuous Integration

* add central workflows including release-please ([#3](https://github.com/camptocamp/devops-stack-module-oidc-aws-cognito/issues/3)) ([a832d72](https://github.com/camptocamp/devops-stack-module-oidc-aws-cognito/commit/a832d72e6bca2c53a02114fc108e3b6b9f337bbc))
