[![](https://badge.imagelayers.io/enalean/tuleap-test-karma:latest.svg)](https://imagelayers.io/?images=enalean/tuleap-test-karma:latest 'Get your own badge on imagelayers.io')

# Docker image to execute Tuleap Karma tests


## How to use

In order to execute tests, all you have to do is to execute this command:

```bash
$ docker run --rm \
    -v $PWD:/tuleap:ro enalean/tuleap-test-karma \
    --path PathToFolderContainingGruntFile
```

You need to have defined `npm run test` that runs unit tests.

## Use with your CI

Please, be sure that your karma configuration returns a file called `test-results.xml`
that can be found in `PathToFolderContainingGruntFile`.

Usage:

```bash
$ docker run --rm \
    -v $PWD:/tuleap:ro enalean/tuleap-test-karma \
    --path PathToFolderContainingGruntFile \
    --output-dir /someFolderToPutReportIn
```

## Choose your NPM registry and NPM login

You can use a different NPM registry and log in with the user of your choice using
the following environment variables:
  * ``NPM_REGISTRY``: registry address
  * ``NPM_USER``: user name used to log in into the registry
  * ``NPM_PASSWORD``: password of the user
  * ``NPM_EMAIL``: public mail that will be used if you publish a package
