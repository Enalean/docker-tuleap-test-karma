[![](https://badge.imagelayers.io/enalean/tuleap-test-karma:latest.svg)](https://imagelayers.io/?images=enalean/tuleap-test-karma:latest 'Get your own badge on imagelayers.io')

# Docker image to execute Tuleap Karma tests


## How to use

In order to execute tests, all you have to do is to execute this command:

```bash
$ docker run --rm \
    -v $PWD:/tuleap enalean/tuleap-test-karma \
    --path PathToFolderContainingGruntFile
```

You need to have defined `npm run test` that runs unit tests.

## Use with your CI

Please, be sure that your karma configuration returns a file called `test-results.xml`
that can be found in `PathToFolderContainingGruntFile`.

Usage:

```bash
$ docker run --rm \
    -v $PWD:/tuleap enalean/tuleap-test-karma \
    --path PathToFolderContainingGruntFile \
    --output-dir /someFolderToPutReportIn
```

## Build packages

It can also build rpms, for that, specify the .spec filename:

```bash
$ docker run --rm \
    -v $PWD:/tuleap enalean/tuleap-test-karma \
    --path PathToFolderContainingGruntFile \
    --output-dir /someFolderToPutReportIn \
    --build mysuperspecfile.spec
```
