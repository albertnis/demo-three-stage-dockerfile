# Three-stage Dockerfile

![Docker build](https://github.com/albertnis/demo-three-stage-dockerfile/workflows/Docker%20build/badge.svg)

A minimal repository with two features:
* Building and running possible with Docker
* GitHub Actions for automated builds, releases and Docker pushes

All building in Docker is done using the main Dockerfile.

See [albertnis/mqcontrol](https://github.com/albertnis/mqcontrol) for a more real-world example.

### Rationale

Read the upcoming blog post for more context.

## Build it for the output

### Normally

```shell
npm i
npm run-script build
```

### With Docker

```shell
DOCKER_BUILDKIT=1 docker build --target export -o dist .
```

## Build it to run it

### Normally

```shell
npm i
npm run-script build
node dist/helloworld.js Albert
```

### With Docker

```shell
docker build -t helloworld .
docker run --rm helloworld Albert
```

## Release it

Upon tagging, GitHub will create a release with the build output attached and push a new docker image. Check [Releases](https://github.com/albertnis/demo-three-stage-dockerfile/releases) and [Packages](https://github.com/albertnis/demo-three-stage-dockerfile/packages) respectively.

```shell
git tag v0.1.1
git push origin v0.1.1
```