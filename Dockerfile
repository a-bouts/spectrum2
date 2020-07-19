FROM debian:buster-backports as base

ARG DEBIAN_FRONTEND=noninteractive
ARG APT_LISTCHANGES_FRONTEND=none

RUN apt-get update -qq
RUN apt-get install --no-install-recommends -y dpkg-dev devscripts curl git
#RUN echo "deb https://packages.spectrum.im/spectrum2/ buster main" | tee -a /etc/apt/sources.list
#RUN echo "deb-src https://packages.spectrum.im/spectrum2/ buster main" | tee -a /etc/apt/sources.list
#RUN curl https://packages.spectrum.im/packages.key | apt-key add -




RUN apt-get update -qq
#RUN apt-get build-dep --no-install-recommends -y spectrum2
RUN apt-get install --no-install-recommends -y autoconf automake autopoint autotools-dev bsdmainutils build-essential cmake cmake-data cpp cpp-8 dbus dbus-user-session dconf-gsettings-backend dconf-service debhelper default-libmysqlclient-dev dh-autoreconf dh-python dh-strip-nondeterminism \
  dmsetup dwz fontconfig fontconfig-config fonts-dejavu-core g++ g++-8 gcc gcc-8 gettext gettext-base glib-networking glib-networking-common glib-networking-services groff-base gsettings-desktop-schemas ibverbs-providers icu-devtools intltool-debian \
  iso-codes libapparmor1 libapr1 libapr1-dev libaprutil1 libaprutil1-dev libarchive-zip-perl libarchive13 libargon2-1 libasan5 libatomic1 libavahi-client-dev libavahi-client3 libavahi-common-data libavahi-common-dev libavahi-common3 libavahi-glib1 \
  libblkid-dev libboost-all-dev libboost-atomic-dev libboost-atomic1.67-dev libboost-atomic1.67.0 libboost-chrono-dev libboost-chrono1.67-dev libboost-chrono1.67.0 libboost-container-dev libboost-container1.67-dev libboost-container1.67.0 \
  libboost-context-dev libboost-context1.67-dev libboost-context1.67.0 libboost-coroutine-dev libboost-coroutine1.67-dev libboost-coroutine1.67.0 libboost-date-time-dev libboost-date-time1.67-dev libboost-date-time1.67.0 libboost-dev \
  libboost-exception-dev libboost-exception1.67-dev libboost-fiber-dev libboost-fiber1.67-dev libboost-fiber1.67.0 libboost-filesystem-dev libboost-filesystem1.67-dev libboost-filesystem1.67.0 libboost-graph-dev libboost-graph-parallel-dev \
  libboost-graph-parallel1.67-dev libboost-graph-parallel1.67.0 libboost-graph1.67-dev libboost-graph1.67.0 libboost-iostreams-dev libboost-iostreams1.67-dev libboost-iostreams1.67.0 libboost-locale-dev libboost-locale1.67-dev libboost-locale1.67.0 \
  libboost-log-dev libboost-log1.67-dev libboost-log1.67.0 libboost-math-dev libboost-math1.67-dev libboost-math1.67.0 libboost-mpi-dev libboost-mpi-python-dev libboost-mpi-python1.67-dev libboost-mpi-python1.67.0 libboost-mpi1.67-dev \
  libboost-mpi1.67.0 libboost-numpy-dev libboost-numpy1.67-dev libboost-numpy1.67.0 libboost-program-options-dev libboost-program-options1.67-dev libboost-program-options1.67.0 libboost-python-dev libboost-python1.67-dev libboost-python1.67.0 \
  libboost-random-dev libboost-random1.67-dev libboost-random1.67.0 libboost-regex-dev libboost-regex1.67-dev libboost-regex1.67.0 libboost-serialization-dev libboost-serialization1.67-dev libboost-serialization1.67.0 libboost-signals-dev \
  libboost-signals1.67-dev libboost-signals1.67.0 libboost-stacktrace-dev libboost-stacktrace1.67-dev libboost-stacktrace1.67.0 libboost-system-dev libboost-system1.67-dev libboost-system1.67.0 libboost-test-dev libboost-test1.67-dev \
  libboost-test1.67.0 libboost-thread-dev libboost-thread1.67-dev libboost-thread1.67.0 libboost-timer-dev libboost-timer1.67-dev libboost-timer1.67.0 libboost-tools-dev libboost-type-erasure-dev libboost-type-erasure1.67-dev \
  libboost-type-erasure1.67.0 libboost-wave-dev libboost-wave1.67-dev libboost-wave1.67.0 libboost1.67-dev libboost1.67-tools-dev libbsd0 libc-dev-bin libc6-dev libcc1-0 libcroco3 libcryptsetup12 libcups2 libcurl4-openssl-dev \
  libdbus-1-3 libdbus-1-dev libdbus-glib-1-2 libdbus-glib-1-dev libdbus-glib-1-dev-bin libdconf1 libdevmapper1.02.1 libdouble-conversion1 libdrm-amdgpu1 libdrm-common libdrm-dev libdrm-nouveau2 libdrm-radeon1 libdrm2 libedit2 libegl-mesa0 \
  libegl1 libev-dev libev-libevent-dev libev4 libevdev2 libevent-2.1-6 libevent-core-2.1-6 libevent-pthreads-2.1-6 libexpat1-dev libfarstream-0.2-5 libffi-dev libfile-stripnondeterminism-perl libfontconfig1 libfreetype6 libgadu3 libgbm1 \
  libgcc-8-dev libgfortran5 libgl1 libgl1-mesa-dev libgl1-mesa-dri libglapi-mesa libgles1 libgles2 libglib2.0-0 libglib2.0-bin libglib2.0-data libglib2.0-dev libglib2.0-dev-bin libglu1-mesa libglu1-mesa-dev libglvnd-core-dev libglvnd-dev libglvnd0 \
  libglx-mesa0 libglx0 libgmp-dev libgmpxx4ldbl libgnutls-dane0 libgnutls-openssl27 libgnutls28-dev libgnutlsxx28 libgomp1 libgraphite2-3 libgssdp-1.0-3 libgstreamer-plugins-base1.0-0 libgstreamer1.0-0 libgudev-1.0-0 libgupnp-1.0-4 libgupnp-igd-1.0-4 \
  libharfbuzz0b libhwloc-dev libhwloc-plugins libhwloc5 libibverbs-dev libibverbs1 libice6 libicu-dev libicu63 libidn11 libidn11-dev libidn2-dev libinput-bin libinput10 libip4tc0 libisl19 libjpeg62-turbo libjson-c3 libjsoncpp-dev libjsoncpp1 \
  libkmod2 libldap2-dev libllvm7 liblog4cxx-dev liblog4cxx10v5 libltdl-dev libltdl7 libmariadb-dev libmariadb-dev-compat libmariadb3 libmeanwhile1 libminiupnpc17 libmount-dev libmpc3 libmpfr6 libmtdev1 libnatpmp1 libncurses6 libnice10 \
  libnl-3-200 libnl-3-dev libnl-route-3-200 libnl-route-3-dev libnm0 libnspr4 libnss3 libnuma-dev libnuma1 libopengl0 libopenmpi-dev libopenmpi3 liborc-0.4-0 libp11-kit-dev libpam-systemd libpciaccess0 libpcre16-3 libpcre2-16-0 libpcre3-dev libpcre32-3 \
  libpcrecpp0v5 libpipeline1 libpmix2 libpng16-16 libpopt-dev libpopt0 libpq-dev libpq5 libpqxx-6.2 libpqxx-dev libprocps7 libprotobuf-c1 libprotobuf-dev libprotobuf-lite17 libprotobuf17 libprotoc17 libproxy1v5 \
  libpthread-stubs0-dev libpurple-dev libpurple0 libpython-dev libpython-stdlib libpython2-dev libpython2-stdlib libpython2.7 libpython2.7-dev libpython2.7-minimal libpython2.7-stdlib libpython3-dev libpython3.7 libpython3.7-dev libqt5concurrent5 \
  libqt5core5a libqt5dbus5 libqt5gui5 libqt5network5 libqt5printsupport5 libqt5qml5 libqt5sql5 libqt5test5 libqt5widgets5 libqt5xml5 librdmacm1 librhash0 libsasl2-modules libsctp-dev libsctp1 libselinux1-dev libsensors-config libsensors5 \
  libsepol1-dev libsigsegv2 libsm6 libsoup2.4-1 libsqlite3-dev libstdc++-8-dev libtasn1-6-dev libtool libubsan1 libuchardet0 libunbound8 libuv1 libvulkan-dev libvulkan1 libwacom-common libwacom2 libwayland-client0 \
  libwayland-server0 libx11-6 libx11-data libx11-dev libx11-xcb-dev libx11-xcb1 libxau-dev libxau6 libxcb-dri2-0 libxcb-dri2-0-dev libxcb-dri3-0 libxcb-dri3-dev libxcb-glx0 libxcb-glx0-dev libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-present-dev \
  libxcb-present0 libxcb-randr0 libxcb-randr0-dev libxcb-render-util0 libxcb-render0 libxcb-render0-dev libxcb-shape0 libxcb-shape0-dev libxcb-shm0 libxcb-sync-dev libxcb-sync1 libxcb-util0 libxcb-xfixes0 libxcb-xfixes0-dev libxcb-xinerama0 libxcb-xkb1 \
  libxcb1 libxcb1-dev libxdamage-dev libxdamage1 libxdmcp-dev libxdmcp6 libxext-dev libxext6 libxfixes-dev libxfixes3 libxi6 libxkbcommon-x11-0 libxkbcommon0 libxml2 libxml2-dev libxrender1 libxshmfence-dev libxshmfence1 libxxf86vm-dev libxxf86vm1 \
  libzephyr4 linux-libc-dev m4 man-db mariadb-common mesa-common-dev mpi-default-bin mpi-default-dev mysql-common nettle-dev ocl-icd-libopencl1 openmpi-bin openmpi-common openssh-client pidgin-data pkg-config po-debconf procps protobuf-compiler python \
  python-dev python-minimal python2 python2-dev python2-minimal python2.7 python2.7-dev python2.7-minimal python3-dev python3-distutils python3-lib2to3 python3.7-dev qt5-qmake qt5-qmake-bin qtbase5-dev qtbase5-dev-tools qtchooser shared-mime-info \
  systemd systemd-sysv ucf uuid-dev x11-common x11proto-core-dev x11proto-damage-dev x11proto-dev x11proto-fixes-dev x11proto-xext-dev x11proto-xf86vidmode-dev xkb-data xorg-sgml-doctools xtrans-dev zlib1g-dev
RUN apt-get install --no-install-recommends -y libminiupnpc-dev libnatpmp-dev

RUN apt-get install -t buster-backports --no-install-recommends -y cmake

#TODO include in Build-Depends
RUN apt-get install --no-install-recommends -y libssl-dev


# libCommuni
RUN apt-get install --no-install-recommends -y autoconf automake autopoint autotools-dev bsdmainutils build-essential cpp cpp-8 debhelper dh-autoreconf dh-strip-nondeterminism dwz g++ g++-8 gcc gcc-8 gettext gettext-base groff-base intltool-debian libarchive-zip-perl libasan5 libatomic1 \
  libc-dev-bin libc6-dev libcc1-0 libcroco3 libdouble-conversion1 libevdev2 libfile-stripnondeterminism-perl libgcc-8-dev libgomp1 libgraphite2-3 libgudev-1.0-0 libharfbuzz0b libinput-bin libinput10 libisl19 libmpc3 libmpfr6 \
  libmtdev1 libncurses6 libpcre2-16-0 libpipeline1 libqt5concurrent5 libqt5core5a libqt5dbus5 libqt5gui5 libqt5network5 libqt5printsupport5 libqt5qml5 libqt5quick5 libqt5quickparticles5 libqt5quicktest5 libqt5quickwidgets5 libqt5sql5 libqt5test5 \
  libqt5widgets5 libqt5xml5 libsigsegv2 libstdc++-8-dev libtool libubsan1 libuchardet0 libvulkan-dev libvulkan1 libwacom-common libwacom2 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-render-util0 libxcb-shm0 libxcb-util0 \
  libxcb-xinerama0 libxcb-xkb1 libxi6 libxkbcommon-x11-0 libxkbcommon0 linux-libc-dev m4 man-db po-debconf qt5-qmake qt5-qmake-bin qt5-qmltooling-plugins qtbase5-dev qtbase5-dev-tools qtdeclarative5-dev qtdeclarative5-dev-tools xkb-data qt5-default

RUN echo "---> Installing libCommuni" && \
		git clone https://github.com/communi/libcommuni.git && \
		cd libcommuni && \
		qmake && \
		make && \
		make DESTDIR=/tmp/out install

RUN echo "---> Installing swiften" && \
		git clone git://swift.im/swift && \
		cd swift && \
		git checkout swift-4.0 && \
		./scons V=1 swiften_dll=1 Swiften SWIFTEN_INSTALLDIR=/tmp/out force-configure=1 && \
		./scons V=1 swiften_dll=1 Swiften SWIFTEN_INSTALLDIR=/tmp/out /tmp/out

RUN ls -l /tmp/out

ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/tmp/out/lib"

RUN echo "/tmp/out/lib" > /etc/ld.so.conf.d/out.conf && ldconfig

RUN ldconfig -v

# Spectrum 2
COPY . spectrum2/


FROM base as staging

ARG DEBIAN_FRONTEND=noninteractive
ARG APT_LISTCHANGES_FRONTEND=none

WORKDIR /spectrum2/packaging/debian/

RUN /bin/bash ./build_spectrum2.sh

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
		git clone git://github.com/EionRobb/icyque.git && \
		cd icyque && \
		make && \
		make DESTDIR=/tmp/out install

RUN echo "---> Installing skype4pidgin" && \
		git clone git://github.com/EionRobb/skype4pidgin.git && \
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

#RUN echo "deb https://packages.spectrum.im/spectrum2/ buster main" | tee -a /etc/apt/sources.list
#RUN curl -fsSL https://packages.spectrum.im/packages.key | apt-key add -
#RUN echo "deb http://download.opensuse.org/repositories/home:/jgeboski/Debian_10/ /" | tee /etc/apt/sources.list.d/home:jgeboski.list
#RUN curl -fsSL https://download.opensuse.org/repositories/home:jgeboski/Debian_10/Release.key | apt-key add
#RUN echo "deb http://download.opensuse.org/repositories/home:/ars3n1y/Debian_10/ /" | tee /etc/apt/sources.list.d/home:ars3n1y.list
#RUN curl -fsSL https://download.opensuse.org/repositories/home:ars3n1y/Debian_10/Release.key | apt-key add
#RUN apt-get update -qq

#RUN echo "---> Installing purple-facebook" && \
#		apt-get install --no-install-recommends -y purple-facebook
#RUN echo "---> Installing purple-telegram" && \
#		apt-get install --no-install-recommends -y libpurple-telegram-tdlib libtdjson1.6.0
#RUN echo "---> Installing purple-discord" && \
#                apt-get install --no-install-recommends -y -t buster-backports purple-discord

COPY --from=staging /tmp/out/* /usr/

COPY --from=staging spectrum2/packaging/docker/run.sh /run.sh
COPY --from=staging spectrum2/packaging/debian/*.deb /tmp/

RUN apt install --no-install-recommends -y /tmp/*.deb

RUN rm -rf /tmp/*.deb

RUN apt-get autoremove && apt-get clean

ENTRYPOINT ["/run.sh"]
