# Bootiful Micro Pizza

** Note: This README and repository is still in progress! **

## Introduction

Bootiful Micro Pizza is an online fictitious pizza company. It was created by [Ian Collington](https://www.iancollington.com/), a contract Java developer based in Northamptonshire, to learn about microservice frameworks, tools and architecture.

...

## Architecture

Details about the architecture can be viewed [here](/infrastructure/).

## Building from source

```
$ git clone https://github.com/bootifulmicropizza/_project bootifulmicropizza
$ cd bootifulmicropizza
$ git submodule init
$ git submodule update
$ ./build.sh --all
```

## Running locally using Docker Compose

```
$ ./start.sh --all
```

### Shutdown locally using Docker Compose

```
$ ./stop.sh --all
```

### TODO

- Running locally using MiniKube
