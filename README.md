# image-build-tools

This repo contains sources for a simple builder image that can be used to build images with following tools:

* [distgen](http://distgen.readthedocs.io/en/latest/)
* [go-md2man](https://github.com/cpuguy83/go-md2man/)
* [make](http://www.gnu.org/software/make/)
* [mtf](http://meta-test-family.readthedocs.io/en/latest/)

## Usage

An example of usage is [Makefile](https://github.com/container-images/container-image-template/blob/master/Makefile) in [container-images-template](https://github.com/container-images/container-image-template) repo.

To build and/or test other images using this image (including generating Dockerfile with distgen), you need to mount in docker socket from host and directory with your sources for the image. For example:

```
docker run -v /var/run/docker.sock:/var/run/docker.sock:Z -v $(pwd):/src:Z modularitycontainers/image-build-tools bash -c 'cd tests; MODULE=docker URL="docker=fedora/awesome:2.4" DOCKERFILE="../Dockerfile" VERSION=2.4 DISTRO=fedora-26-x86_64 mtf -l *.py'
```

If you need to add additional tools to the image, you can create another image using this image as base.
