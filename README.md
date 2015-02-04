# Continuous Delivery with Rainforest QA

The goal of this repository is to show how to configure various CI servers to work with Rainforest.

## CI Server Tested

- [Circle CI](https://circleci.com/) - [View Config](https://github.com/rainforestapp/ci-sample/blob/master/circle.yml)

## How does this work?

This repository assums the following workflow. All developers would start new work from the `develop` branch. They would create a new feature branch for each shippable piece of code.

When they are ready, they would merge that feature branch in the develop branch using a pull request or the git command line tool.

After the `develop` branch is updated, the CI server would notice the change and start a new build. The build would run the unit tests, deploy the code to a staging environment (hosted in Heroku in our example) and trigger a Rainforest run against that environment.

Once the Rainforest run is successful, the CI server will merge back the code in the `master` branch. This will in turn kick off another CI build of that branch. The master branch is in turned deploy to production.

This is our recommended way of deploying code if your Rainforest test suite is comprehensive enough. This flow can easily be adapted to fit your needs.
