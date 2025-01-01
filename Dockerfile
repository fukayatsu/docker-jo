FROM alpine:3.21 AS base
FROM base AS build
ENV JO_VERSION=1.9
RUN apk --no-cache add --virtual build-dependencies curl make automake autoconf gcc g++ \
  && curl -L -O https://github.com/jpmens/jo/releases/download/$JO_VERSION/jo-$JO_VERSION.tar.gz \
  && tar xvzf jo-$JO_VERSION.tar.gz \
  && cd jo-$JO_VERSION \
  && autoconf -i \
  && ./configure \
  && make check \
  && make install

FROM base
COPY --from=build /usr/local/bin/jo /usr/local/bin/jo
ENTRYPOINT ["/usr/local/bin/jo"]
