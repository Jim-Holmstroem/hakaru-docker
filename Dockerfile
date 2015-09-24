FROM haskell:7.8

RUN apt-get update && apt-get install --assume-yes \
    pkg-config \
    libcairo2-dev \
    libblas-dev \
    liblapack-dev

RUN cabal update && cabal install --jobs gtk2hs-buildtools
RUN cabal install --jobs --force-reinstalls \
    Chart \
    cairo \
    Chart-cairo \
    data-default \
    hakaru
