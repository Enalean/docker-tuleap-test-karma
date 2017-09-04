[![](https://badge.imagelayers.io/enalean/tuleap-test-karma:latest.svg)](https://imagelayers.io/?images=enalean/tuleap-test-karma:latest 'Get your own badge on imagelayers.io')

# Docker image to execute Tuleap Karma tests


## How to use

In order to execute tests, all you have to do is to execute this command:

```bash
$ docker run --rm --security-opt seccomp=seccomp_chrome.json \
    -v $PWD:/tuleap:ro enalean/tuleap-test-karma \
    --path PathToFolderContainingPackageJsonFile
```

You need to have defined `npm run test` that runs unit tests.
It is expected that all dependencies have been downloaded and built if necessary
before launching the tests. This Docker image will not take care of the download/
build step.

## Use with your CI

Please, be sure that your karma configuration returns a file called `test-results.xml`
that can be found in `PathToFolderContainingPackageJsonFile`.

Usage:

```bash
$ docker run --rm --security-opt seccomp=seccomp_chrome.json \
    -v $PWD:/tuleap:ro enalean/tuleap-test-karma \
    --path PathToFolderContainingPackageJsonFile \
    --output-dir /someFolderToPutReportIn
```
