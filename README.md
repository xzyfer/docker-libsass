# docker-libsass

A [Libsass](https://github.com/sass/libsass) compiler

- built on top of `alpine` base image
- ~9 MB in size (5 MB alpine base + 4 MB sassc binary)

## Setup

If you don't already have docker setup you'll need to install VirtualBox and boot2docker.

### VirtualBox

You can get VirtualBox from their [download page](https://www.virtualbox.org/wiki/Downloads).

### boot2docker

##### OSX

You can install boot2docker by
- `brew install boot2docker` (osx only)
- download the [osx installer](https://github.com/boot2docker/osx-installer/releases)

Once installed follow [official setup instructions](http://docs.docker.com/installation/mac/#from-your-command-line)

##### Windows

Follow [official setup instructions](http://docs.docker.com/installation/windows/)

## Versions

When pulling or running an this container you can select which version of Libsass you want to use. The currently supported versions are:

- 3.1.0

## Usage

The image has the `sassc` binary as its entrypoint, so it should be invoked with whatever arguments you would normally pass to `sassc`. For example,

```bash
$ cat file.scss
$blue: #00f;
.foo { color: $blue; }
$ docker run --rm -v $(pwd):$(pwd) -w $(pwd) xzyfer/docker-libsass:<version> file.scss
.foo {
  color: #00f; }
```

You may also want to create a bash alias:

```bash
alias sassc="docker run -it --rm -v \$(pwd):\$(pwd) -w \$(pwd) xzyfer/docker-libsass:<version>"
```

so you will be able to simply run

```
$ sassc file.scss
.foo {
  color: #00f; }
```

## Generating the binary

The binary is compiled as part of the Dockerfile, and the build tools are subsequently removed.

## Credit

This was originally forked from [bergknoff/Dockerfile](https://github.com/jbergknoff/Dockerfile/blob/master/sass)
