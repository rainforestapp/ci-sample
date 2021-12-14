# Continuous Delivery with Rainforest QA [![Rainforest QA](https://circleci.com/gh/rainforestapp/ci-sample.svg?style=shield)](https://circleci.com/gh/rainforestapp/workflows/ci-sample) ![release](https://github.com/rainforestapp/ci-sample/actions/workflows/release.yml/badge.svg)

Common CI tools can be configured to automatically run your Rainforest tests as part of your release process, allowing you to prevent regressions that aren't caught by unit tests before they reach your users.
## How does this work?

This repository provides several examples of how you might configure your CI tool of choice to automatically run Rainforest tests as part of your release process.
There are working sample configurations for three common CI tools ([CircleCI](./.circleci/config.yml), [GitHub Actions](./.github/workflows/release.yml), [Jenkins](./Jenkinsfile) and [Travis CI](./.travis.yml)), all of which assume the following workflow:

- All developers start new work by branching off of `develop`. Devs would create a new feature branch for each shippable piece of code.

- When code is complete, Devs would merge their feature branch into the develop branch via a pull request or the git command line tool.

- When the `develop` branch is updated, the CI server will be triggered to start the build and release process, requiring each step to pass before the subsequent step is triggered. This process includes running unit tests and Rainforest tests to ensure that changes haven't broken any existing functionality.

- The build and release process runs in the following order:
  - Unit tests are run
  - The code is deployed to a staging environment (hosted in Heroku in our example)
  - A Rainforest run is triggered against the staging environment
  - Once the Rainforest run is successful, the master branch deployed to production.

This is a simple and effective way of preventing regressions by automatically running both unit tests and your Rainforest test suite. The sample workflows can be modified for your application and run as-is, or can be easily extended to fit the requirements for your specific release workflow.

## CI Server Tested
We test our sample configuration nightly via [CircleCI](https://circleci.com/). View our [configuration file](./.circleci/config.yml).
