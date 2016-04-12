# Docker image to execute Tuleap Karma tests

## How to use

In order to execute tests, all you have to do is to execute this command:

    $ docker run --rm -v $PWD:/tuleap enalean/tuleap-test-karma --path PathToFolderContainingGruntFile

Please, make sure you have defined an npm script named `test` that runs the unit tests.

## Use with your CI

Please, be sure that your karma configuration returns a file called `test-results.xml`
that can be found in `PathToFolderContainingGruntFile`

Usage:

    $ docker run --rm -v $PWD:/tuleap enalean/tuleap-test-karma --path PathToFolderContainingGruntFile --output-dir /someFolderToPutReportIn

## Build packages

It can also build rpms, for that, specify the .spec filename:

    $ docker run --rm -v $PWD:/tuleap enalean/tuleap-test-karma --path PathToFolderContainingGruntFile --output-dir /someFolderToPutReportIn --build mysuperspecfile.spec
