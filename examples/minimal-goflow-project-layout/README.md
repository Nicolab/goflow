#

## Getting Started

> TODO

* More about [Go Flow](goflow/README.md)

From your project directory:

1. `./goflow/build/dev/build-image # create goflow-dev image`
2. `./bin/dev/console # run the container and get a shell inside`

From the container:

1. `./goflow/scripts/dev/install-container-stack`
2. Run the server `./bin/dev/watch`

At the next uses, only `./bin/dev/console` (or `./bin/dc up`) and `./bin/dev/watch` are required.
