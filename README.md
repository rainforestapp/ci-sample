# Continuous Delivery with Rainforest QA

The goal of this repository is to show how to configure various CI servers to work with Rainforest.

## CI Server Tested 
- [![Rainforest QA](https://circleci.com/gh/rainforestapp/ci-sample.svg?style=shield)](https://circleci.com/gh/rainforestapp/workflows/ci-sample)

- [Circle CI](https://circleci.com/) - [View Config](https://github.com/rainforestapp/ci-sample/blob/master/.circleci/config.yml)

## How does this work?

This repository serves as an example of how you might configure your application to automatically run Rainforest tests upon commits.

You can find several examples for common CI tools, all of which assume the following workflow: 

- All developers start new work by branching off of `develop`. Devs would create a new feature branch for each shippable piece of code.

- When code is complete, Devs would merge their feature branch into the develop branch via a pull request or the git command line tool.

- When the `develop` branch is updated, the CI server will be triggered to start the build and release process, requiring each step to pass before the subsequent step is triggered. 

- The build and release process runs in the following order:
  - Unit tests are run
  - The code is deployed to a staging environment (hosted in Heroku in our example)
  - A Rainforest run is triggered against the staging environment
  - Once the Rainforest run is successful, the master branch deployed to production.

This is our recommended way of deploying code if your Rainforest test suite is comprehensive enough. This flow can easily be adapted to fit your needs.
