FROM centos:centos7.9.2009
ENV CMAKE_VERSION 3.6.2
RUN set -ex \
  && curl -fsSLO --compressed https://cmake.org/files/v3.6/cmake-${CMAKE_VERSION}-Linux-x86_64.tar.gz \
  && tar xzf cmake-${CMAKE_VERSION}-Linux-x86_64.tar.gz -C /usr/local --strip-components=1 --no-same-owner \
  && rm -rf cmake-${CMAKE_VERSION}*

RUN mkdir /sample
WORKDIR /sample
COPY command.sh /sample
RUN chmod +x ./command.sh
RUN ./command.sh -x -f ./
