FROM haskell:7.8

RUN apt-get update && apt-get install --assume-yes \
    pkg-config \
    libcairo2-dev \
    libblas-dev \
    liblapack-dev \
    gtk+-2.0

RUN cabal update && cabal install --jobs gtk2hs-buildtools
RUN cabal install --jobs --force-reinstalls \
    Chart \
    cairo \
    Chart-cairo \
    Chart-gtk \
    data-default

ADD https://github.com/hakaru-dev/hakaru/archive/master.tar.gz /pkg/
RUN cd /pkg/ && tar -xvf master.tar.gz && cd hakaru-master && \
    cabal install --only-dependencies --jobs && \
    cabal install
