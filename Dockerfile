FROM debian:buster-backports as base

ARG DEBIAN_FRONTEND=noninteractive
ARG APT_LISTCHANGES_FRONTEND=none

RUN apt-get update -qq
RUN apt-get install --no-install-recommends -y git ca-certificates g++

# libCommuni dependencies
RUN apt-get install --no-install-recommends -y debhelper libssl-dev qtbase5-dev qtdeclarative5-dev qt5-default

RUN echo "---> Installing libCommuni" && \
		git clone https://github.com/communi/libcommuni.git && \
		cd libcommuni && \
		qmake && \
		make && \
		make DESTDIR=/tmp/out install

# Swiften dependencies
RUN apt-get install --no-install-recommends -y debhelper docbook-xml docbook-xsl help2man libboost-date-time-dev libboost-dev libboost-filesystem-dev libboost-program-options-dev libboost-regex-dev libboost-signals-dev libboost-system-dev libboost-thread-dev libhunspell-dev libidn11-dev libminiupnpc-dev libnatpmp-dev libqt5svg5-dev libqt5webkit5-dev libqt5x11extras5-dev libsqlite3-dev libssl-dev libxml2-dev libxml2-utils libxss-dev qt5-image-formats-plugins qtbase5-dev qtbase5-dev-tools qtchooser qtmultimedia5-dev qttools5-dev-tools scons xsltproc zlib1g-dev

RUN echo "---> Installing swiften" && \
		git clone git://swift.im/swift && \
		cd swift && \
		git checkout swift-4.0 && \
		./scons V=1 swiften_dll=1 Swiften SWIFTEN_INSTALLDIR=/tmp/out force-configure=1 && \
		./scons V=1 swiften_dll=1 Swiften SWIFTEN_INSTALLDIR=/tmp/out /tmp/out



FROM base as staging

ARG DEBIAN_FRONTEND=noninteractive
ARG APT_LISTCHANGES_FRONTEND=none

RUN apt-get install --no-install-recommends -y debhelper default-libmysqlclient-dev libavahi-client-dev libavahi-common-dev libboost-all-dev libcurl4-openssl-dev libdbus-glib-1-dev libev-libevent-dev libidn11-dev libjsoncpp-dev liblog4cxx-dev libpopt-dev libpqxx-dev libprotobuf-dev libpurple-dev libsqlite3-dev libxml2-dev protobuf-compiler qtbase5-dev

RUN apt-get install -t buster-backports --no-install-recommends -y cmake

ENV CMAKE_INCLUDE_PATH="${CMAKE_INCLUDE_PATH}:/tmp/out/include"
ENV CMAKE_LIBRARY_PATH="${CMAKE_LIBRARY_PATH}:/tmp/out/lib"
ENV PATH="${PATH}:/tmp/out/bin"

RUN echo "---> Installing Spectrum 2" \
	&& git clone https://github.com/SpectrumIM/spectrum2 \
	&& cd spectrum2 \
	&& git checkout tags/2.0.13 \
	&& cmake . -DENABLE_PQXX=Off -DENABLE_DOCS=Off -DCMAKE_BUILD_TYPE=Release \
	&& make \
	&& make DESTDIR=/tmp/out install

RUN apt-get install --no-install-recommends -y libjson-glib-dev \
		graphicsmagick-imagemagick-compat libsecret-1-dev libnss3-dev \
		libwebp-dev libgcrypt20-dev libpng-dev libglib2.0-dev \
		libprotobuf-c-dev protobuf-c-compiler

RUN echo "---> Installing purple-instagram" && \
		git clone https://github.com/EionRobb/purple-instagram.git && \
		cd purple-instagram && \
		make && \
		make DESTDIR=/tmp/out install

RUN echo "---> Installing icyque" && \
		git clone https://github.com/EionRobb/icyque.git && \
		cd icyque && \
		make && \
		make DESTDIR=/tmp/out install

RUN echo "---> Installing skype4pidgin" && \
		git clone https://github.com/EionRobb/skype4pidgin.git && \
		cd skype4pidgin/skypeweb && \
		make && \
		make DESTDIR=/tmp/out install

RUN echo "---> Install Steam" && \
		git clone https://github.com/EionRobb/pidgin-opensteamworks.git && \
		cd pidgin-opensteamworks/steam-mobile && \
		make && \
		make DESTDIR=/tmp/out install

RUN echo "---> purple-gowhatsapp" && \
		apt-get -y install golang && \
		git clone https://github.com/hoehermann/purple-gowhatsapp && \
		cd purple-gowhatsapp && \
		make && \
		make DESTDIR=/tmp/out install

RUN echo "---> purple-telegram" && \
git clone --recursive https://github.com/majn/telegram-purple && \
		cd telegram-purple && \
		./configure && \
		make && \
		make DESTDIR=/tmp/out install

RUN echo "---> purple-battlenet" && \
git clone --recursive https://github.com/EionRobb/purple-battlenet && \
		cd purple-battlenet && \
		make && \
		make DESTDIR=/tmp/out install

RUN echo "---> purple-hangout" && \
git clone --recursive https://github.com/EionRobb/purple-hangouts && \
		cd purple-hangouts && \
		make && \
		make DESTDIR=/tmp/out install



FROM debian:10.4-slim as production

EXPOSE 8080
VOLUME ["/etc/spectrum2/transports", "/var/lib/spectrum2"]

ARG DEBIAN_FRONTEND=noninteractive
ARG APT_LISTCHANGES_FRONTEND=none

RUN echo 'deb http://deb.debian.org/debian stable-backports main' > /etc/apt/sources.list.d/backports.list
RUN apt-get update -qq
RUN apt-get install --no-install-recommends -y curl ca-certificates gnupg1

COPY --from=staging /tmp/out/* /usr/

COPY --from=staging spectrum2/packaging/docker/run.sh /run.sh

RUN apt-get autoremove && apt-get clean

ENTRYPOINT ["/run.sh"]
