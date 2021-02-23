FROM alpine

RUN apk update && apk --no-cache add \
  alpine-sdk \
  gcc \
  git \
  libressl-dev \
  make \
  ruby \
  ruby-dev \
  ruby-bigdecimal \
  ruby-etc \
  ruby-json \
  ruby-webrick

RUN gem install bundler
RUN git clone https://github.com/GTFOBins/GTFOBins.github.io /opt/GTFOBins
RUN cd /opt/GTFOBins &&  make bundle

RUN apk del \
  alpine-sdk \
  gcc \
  git

EXPOSE 4000
WORKDIR /opt/GTFOBins
CMD ["make", "serve-public"]
