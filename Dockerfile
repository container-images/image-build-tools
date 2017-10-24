FROM registry.fedoraproject.org/fedora:26

LABEL maintainer bkabrda@redhat.com

ENV NAME=image-build-tools VERSION=0 RELEASE=1 ARCH=x86_64

LABEL summary="A container used for building and testing container images." \
      com.redhat.component="$NAME" \
      name="$NAME" \
      version="$VERSION" \
      release="$RELEASE.$DISTTAG" \
      architecture="$ARCH" \
      usage="docker run -v /var/run/docker.sock:/var/run/docker.sock:Z -v $(pwd):/src:Z image-build-tools make test" \
      help="Run a build/test of a container inside this container." \
      description="Container that contains distgen, make, go-md2man and mtf, that you can use to build and test container images." \
      io.k8s.description="Container that contains distgen, make, go-md2man and mtf, that you can use to build and test container images." \
      io.k8s.display-name="image-build-tools" \
      io.openshift.tags="distgen,make,go-md2man,mtf"

RUN dnf install -y meta-test-family distgen make go-md2man && dnf clean all

RUN mkdir /src

VOLUME /src

WORKDIR /src
