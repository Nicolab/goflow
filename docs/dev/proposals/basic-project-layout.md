# Basic layout of a Go project

A base layout and workflow for Golang projects, layout inspired by the [Golang standards](https://github.com/golang-standards/project-layout).

Docker + Golang + inspiration from standards.

## NOTES

 * Create (or not?) a `Makefile` for running docker commands like build, run, etc.

### Dev

* Require a toolchain for debugging and profiling.

### Prod

* [Gox](https://github.com/mitchellh/gox): if needed, parallelize builds for multiple platforms.