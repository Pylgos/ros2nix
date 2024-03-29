{ nixpkgs
, py3version
, py2version
, ...
}:
let
  python3Packages = nixpkgs."python${py3version}Packages";
  pythonPackages = nixpkgs."python${py2version}Packages";
  boost = nixpkgs.boost.override {
    python = nixpkgs."python${py3version}";
    enablePython = true;
  };
in {
  "ace" = nixpkgs.ace;
  "ack" = nixpkgs.ack;
  "ack-grep" = nixpkgs.ack;
  "acl" = nixpkgs.acl;
  "acpi" = nixpkgs.acpi;
  "acpitool" = nixpkgs.acpitool;
  "alsa-oss" = nixpkgs.alsaOss;
  "alsa-utils" = nixpkgs.alsaUtils;
  "ant" = nixpkgs.ant;
  "antlr" = nixpkgs.antlr;
  "apache2" = nixpkgs.apacheHttpd;
  "apr" = nixpkgs.apr;
  "aravis" = nixpkgs.aravis;
  "aravis-dev" = nixpkgs.aravis;
  "arduino-core" = nixpkgs.arduino;
  "armadillo" = nixpkgs.armadillo;
  "asio" = nixpkgs.asio;
  "assimp" = nixpkgs.assimp;
  "assimp-dev" = nixpkgs.assimp;
  "at-spi2-core" = nixpkgs.at-spi2-core;
  "autoconf" = nixpkgs.autoconf;
  "automake" = nixpkgs.automake;
  "autossh" = nixpkgs.autossh;
  "avahi-daemon" = nixpkgs.avahi;
  "avahi-utils" = nixpkgs.avahi;
  "avr-libc" = nixpkgs.avrlibc;
  "avrdude" = nixpkgs.avrdude;
  "awscli" = nixpkgs.awscli;
  "babeltrace" = nixpkgs.babeltrace;
  "bazaar" = nixpkgs.breezy;
  "beep" = nixpkgs.beep;
  "benchmark" = nixpkgs.gbenchmark;
  "binutils" = nixpkgs.binutils;
  "bison" = nixpkgs.bison;
  "black" = python3Packages.black;
  "blender" = nixpkgs.blender;
  "bluez" = nixpkgs.bluez;
  "boost" = boost;
  "box2d-dev" = nixpkgs.box2d;
  "bullet" = nixpkgs.bullet;
  "bullet-extras" = nixpkgs.bullet;
  "bzip2" = nixpkgs.bzip2;
  "ca-certificates" = nixpkgs.cacert;
  "can-utils" = nixpkgs.can-utils;
  "cargo" = nixpkgs.cargo;
  "cccc" = nixpkgs.cccc;
  "cdk" = nixpkgs.cdk;
  "cdk-dev" = nixpkgs.cdk;
  "cgal" = nixpkgs.cgal_5;
  "checkinstall" = nixpkgs.checkinstall;
  "chromium-browser" = nixpkgs.chromium;
  "chrony" = nixpkgs.chrony;
  "clang" = nixpkgs.clang;
  "clang-format" = nixpkgs.clang;
  "clang-tidy" = nixpkgs.clang;
  "cmake" = nixpkgs.cmake;
  "collada-dom" = nixpkgs.collada-dom;
  "coreutils" = nixpkgs.coreutils;
  "couchdb" = nixpkgs.couchdb3;
  "cppcheck" = nixpkgs.cppcheck;
  "cppunit" = nixpkgs.cppunit;
  "curl" = nixpkgs.curl;
  "curlpp-dev" = nixpkgs.curlpp;
  "cvs" = nixpkgs.cvs;
  "cwiid" = nixpkgs.cwiid;
  "cwiid-dev" = nixpkgs.cwiid;
  "cython" = pythonPackages.cython;
  "cython3" = python3Packages.cython;
  "daemontools" = nixpkgs.daemontools;
  "devilspie2" = nixpkgs.devilspie2;
  "dfu-util" = nixpkgs.dfu-util;
  "disper" = nixpkgs.disper;
  "dkms" = [ ];
  "dnsmasq" = nixpkgs.dnsmasq;
  "docker-compose" = nixpkgs.docker-compose;
  "doxygen" = nixpkgs.doxygen;
  "dpkg" = nixpkgs.dpkg;
  "dpkg-dev" = nixpkgs.dpkg;
  "e2fsprogs" = nixpkgs.e2fsprogs;
  "ed" = nixpkgs.ed;
  "eigen" = nixpkgs.eigen;
  "eigen2" = nixpkgs.eigen2;
  "emacs" = nixpkgs.emacs;
  "embree" = nixpkgs.embree;
  "enblend" = nixpkgs.enblend-enfuse;
  "enet" = nixpkgs.enet;
  "espeak" = nixpkgs.espeak;
  "exfat-utils" = nixpkgs.exfat;
  "f2c" = nixpkgs.libf2c;
  "fakeroot" = nixpkgs.fakeroot;
  "ffmpeg" = nixpkgs.ffmpeg;
  "file" = nixpkgs.file;
  "filezilla" = nixpkgs.filezilla;
  "flac" = nixpkgs.flac;
  "flex" = nixpkgs.flex;
  "fltk" = nixpkgs.fltk;
  "fluid" = nixpkgs.fltk;
  "fmt" = nixpkgs.fmt;
  "freeimage" = nixpkgs.freeimage;
  "freetype" = nixpkgs.freetype;
  "fsharp" = nixpkgs.fsharp;
  "fswebcam" = nixpkgs.fswebcam;
  "ftdi-eeprom" = nixpkgs.libftdi;
  "g++-static" = [ ];
  "gawk" = nixpkgs.gawk;
  "gdal-bin" = nixpkgs.gdal;
  "geographiclib" = nixpkgs.geographiclib;
  "geos" = nixpkgs.geos;
  "gettext-base" = nixpkgs.gettext;
  "gforth" = nixpkgs.gforth;
  "gfortran" = nixpkgs.gfortran;
  "ghc" = nixpkgs.ghc;
  "gifsicle" = nixpkgs.gifsicle;
  "gimp" = nixpkgs.gimp;
  "git" = nixpkgs.git;
  "git-lfs" = nixpkgs.git-lfs;
  "gitg" = nixpkgs.gitg;
  "gksu" = nixpkgs.gksu;
  "glc" = nixpkgs.quesoglc;
  "glut" = nixpkgs.freeglut;
  "gnat" = nixpkgs.gnat;
  "gnome-terminal" = nixpkgs.gnome.gnome-terminal;
  "gnuplot" = nixpkgs.gnuplot;
  "golang-go" = nixpkgs.go;
  "google-mock" = nixpkgs.gtest;
  "gpac" = nixpkgs.gpac;
  "gperftools" = nixpkgs.gperftools;
  "gphoto2" = nixpkgs.gphoto2;
  "gpsd" = nixpkgs.gpsd;
  "gradle" = nixpkgs.gradle;
  "graphicsmagick" = nixpkgs.graphicsmagick;
  "graphviz" = nixpkgs.graphviz;
  "graphviz-dev" = nixpkgs.graphviz;
  "gringo" = nixpkgs.gringo;
  "gstreamer1.0" = nixpkgs.gst_all_1.gstreamer;
  "gstreamer1.0-alsa" = nixpkgs.gst_all_1.gst-plugins-base;
  "gstreamer1.0-gl" = nixpkgs.gst_all_1.gst-plugins-base;
  "gstreamer1.0-libav" = nixpkgs.gst_all_1.gst-libav;
  "gstreamer1.0-plugins-bad" = nixpkgs.gst_all_1.gst-plugins-bad;
  "gstreamer1.0-plugins-base" = nixpkgs.gst_all_1.gst-plugins-base;
  "gstreamer1.0-plugins-good" = nixpkgs.gst_all_1.gst-plugins-good;
  "gstreamer1.0-plugins-ugly" = nixpkgs.gst_all_1.gst-plugins-ugly;
  "gtest" = nixpkgs.gtest;
  "gtk-doc-tools" = nixpkgs.gtk-doc;
  "gtk2" = nixpkgs.gtk2;
  "gtk3" = nixpkgs.gtk3;
  "gv" = nixpkgs.gv;
  "hddtemp" = nixpkgs.hddtemp;
  "hdf5" = nixpkgs.hdf5;
  "hostapd" = nixpkgs.hostapd;
  "hostname" = nixpkgs.hostname;
  "htop" = nixpkgs.htop;
  "hugin-tools" = nixpkgs.hugin;
  "i2c-tools" = nixpkgs.i2c-tools;
  "ifstat" = nixpkgs.ifstat-legacy;
  "imagemagick" = nixpkgs.imagemagick;
  "intltool" = nixpkgs.intltool;
  "iperf" = nixpkgs.iperf;
  "ipmitool" = nixpkgs.ipmitool;
  "iproute2" = nixpkgs.iproute2;
  "iputils-ping" = nixpkgs.unixtools.ping;
  "ipython" = pythonPackages.ipython;
  "ipython3" = python3Packages.ipython;
  "iwyu" = nixpkgs.include-what-you-use;
  "jack" = nixpkgs.jack2;
  "jasper" = nixpkgs.jasper;
  "java" = nixpkgs.openjdk;
  "joystick" = nixpkgs.linuxConsoleTools;
  "jq" = nixpkgs.jq;
  "jupyter-nbconvert" = python3Packages.nbconvert;
  "jupyter-notebook" = nixpkgs.jupyter;
  "jython" = nixpkgs.jython;
  "kakasi" = nixpkgs.kakasi;
  "kate" = nixpkgs.plasma5Packages.kate;
  "kgraphviewer" = nixpkgs.kgraphviewer;
  "konsole" = nixpkgs.plasma5Packages.konsole;
  "lcov" = nixpkgs.lcov;
  "leveldb" = nixpkgs.leveldb;
  "libabsl-dev" = nixpkgs.abseil-cpp;
  "libasound2-dev" = nixpkgs.alsaLib;
  "libatomic" = [ ];
  "libav" = nixpkgs.libav;
  "libavahi-client-dev" = nixpkgs.avahi;
  "libavahi-core-dev" = nixpkgs.avahi;
  "libb64-dev" = nixpkgs.libb64;
  "libbison-dev" = nixpkgs.bison;
  "libblas-dev" = nixpkgs.blas;
  "libbluetooth" = nixpkgs.bluez;
  "libbluetooth-dev" = nixpkgs.bluez;
  "libboost-atomic" = boost;
  "libboost-atomic-dev" = boost;
  "libboost-chrono" = boost;
  "libboost-chrono-dev" = boost;
  "libboost-date-time" = boost;
  "libboost-date-time-dev" = boost;
  "libboost-dev" = boost;
  "libboost-filesystem" = boost;
  "libboost-filesystem-dev" = boost;
  "libboost-iostreams" = boost;
  "libboost-iostreams-dev" = boost;
  "libboost-math" = boost;
  "libboost-math-dev" = boost;
  "libboost-numpy-dev" = boost;
  "libboost-program-options" = boost;
  "libboost-program-options-dev" = boost;
  "libboost-python" = boost;
  "libboost-python-dev" = boost;
  "libboost-random" = boost;
  "libboost-random-dev" = boost;
  "libboost-regex" = boost;
  "libboost-regex-dev" = boost;
  "libboost-serialization" = boost;
  "libboost-serialization-dev" = boost;
  "libboost-system" = boost;
  "libboost-system-dev" = boost;
  "libboost-thread" = boost;
  "libboost-thread-dev" = boost;
  "libboost-timer" = boost;
  "libboost-timer-dev" = boost;
  "libbsd-dev" = nixpkgs.libbsd;
  "libcairo2-dev" = nixpkgs.cairo;
  "libcap-dev" = nixpkgs.libcap;
  "libcap-ng-dev" = nixpkgs.libcap_ng;
  "libcap-ng0" = nixpkgs.libcap_ng;
  "libcap2" = nixpkgs.libcap;
  "libcap2-bin" = nixpkgs.libcap;
  "libccd-dev" = nixpkgs.libccd;
  "libcdd-dev" = nixpkgs.cddlib;
  "libcegui-mk2-dev" = nixpkgs.cegui;
  "libceres-dev" = nixpkgs.ceres-solver;
  "libcgroup-dev" = nixpkgs.libcgroup;
  "libclang-dev" = nixpkgs.clang;
  "libconfig++-dev" = nixpkgs.libconfig;
  "libconfig-dev" = nixpkgs.libconfig;
  "libconsole-bridge-dev" = nixpkgs.console-bridge;
  "libcunit-dev" = nixpkgs.cunit;
  "libcurl" = nixpkgs.curl;
  "libcurl-dev" = nixpkgs.curl;
  "libdbus-dev" = nixpkgs.dbus;
  "libdc1394-dev" = nixpkgs.libdc1394;
  "libdevil-dev" = nixpkgs.libdevil;
  "libdlib-dev" = nixpkgs.dlib;
  "libdmtx-dev" = nixpkgs.libdmtx;
  "libdpkg-dev" = nixpkgs.dpkg;
  "libdrm-dev" = nixpkgs.libdrm;
  "libdw-dev" = nixpkgs.elfutils;
  "libdxflib-dev" = nixpkgs.libsForQt5.dxflib;
  "libedit" = nixpkgs.libedit;
  "libedit-dev" = nixpkgs.libedit;
  "libespeak-dev" = nixpkgs.espeak;
  "libev-dev" = nixpkgs.libev;
  "libevdev-dev" = nixpkgs.libevdev;
  "libfcl-dev" = nixpkgs.fcl;
  "libffi-dev" = nixpkgs.libffi;
  "libfftw3" = [ nixpkgs.fftw nixpkgs.fftwSinglePrec ];
  "libflann-dev" = nixpkgs.flann;
  "libfltk-dev" = nixpkgs.fltk;
  "libfreenect-dev" = nixpkgs.freenect;
  "libfreetype-dev" = nixpkgs.freetype;
  "libfreetype6" = nixpkgs.freetype;
  "libfreetype6-dev" = nixpkgs.freetype;
  "libftdi-dev" = nixpkgs.libftdi;
  "libftdi1-dev" = nixpkgs.libftdi1;
  "libgconf2" = nixpkgs.gnome2.GConf;
  "libgdal-dev" = nixpkgs.gdal;
  "libgeos++-dev" = nixpkgs.geos;
  "libgeotiff-dev" = nixpkgs.libgeotiff;
  "libgflags-dev" = nixpkgs.gflags;
  "libgif-dev" = nixpkgs.giflib;
  "libglew-dev" = nixpkgs.glew;
  "libglfw3-dev" = nixpkgs.glfw3;
  "libglib-dev" = nixpkgs.glib;
  "libgmock-dev" = nixpkgs.gmock;
  "libgmp" = nixpkgs.gmp;
  "libgoogle-glog-dev" = nixpkgs.glog;
  "libgpgme-dev" = nixpkgs.gpgme;
  "libgphoto-dev" = nixpkgs.libgphoto2;
  "libgpiod-dev" = nixpkgs.libgpiod;
  "libgps" = nixpkgs.gpsd;
  "libgsl" = nixpkgs.gsl;
  "libgstreamer-plugins-base1.0-dev" = nixpkgs.gst_all_1.gst-plugins-base;
  "libgstreamer1.0-dev" = nixpkgs.gst_all_1.gstreamer;
  "libgstrtspserver-1.0-0" = nixpkgs.gst_all_1.gst-rtsp-server;
  "libgstrtspserver-1.0-dev" = nixpkgs.gst_all_1.gst-rtsp-server;
  "libgts" = nixpkgs.gts;
  "libhdf5-dev" = nixpkgs.hdf5;
  "libhidapi-dev" = nixpkgs.hidapi;
  "libi2c-dev" = nixpkgs.i2c-tools;
  "libicu-dev" = nixpkgs.icu;
  "libirrlicht-dev" = nixpkgs.irrlicht;
  "libiw-dev" = nixpkgs.wirelesstools;
  "libjansson-dev" = nixpkgs.jansson;
  "libjpeg" = nixpkgs.libjpeg;
  "libjson-glib" = nixpkgs.json-glib;
  "libjsoncpp" = nixpkgs.jsoncpp;
  "libjsoncpp-dev" = nixpkgs.jsoncpp;
  "libkml-dev" = nixpkgs.libkml;
  "liblapack-dev" = nixpkgs.liblapack;
  "libleptonica-dev" = nixpkgs.leptonica;
  "liblinear-dev" = nixpkgs.liblinear;
  "liblinphone-dev" = nixpkgs.liblinphone;
  "liblmdb-dev" = nixpkgs.lmdb;
  "liblttng-ust-dev" = nixpkgs.lttng-ust;
  "liblzma-dev" = nixpkgs.xz;
  "libmagick" = nixpkgs.imagemagick;
  "libmicrohttpd" = nixpkgs.libmicrohttpd;
  "libmodbus-dev" = nixpkgs.libmodbus;
  "libmodbus5" = nixpkgs.libmodbus;
  "libmongoc-1.0-0" = nixpkgs.mongoc;
  "libmongoc-dev" = nixpkgs.mongoc;
  "libmpg123-dev" = nixpkgs.mpg123;
  "libmpich-dev" = nixpkgs.mpich;
  "libmpich2-dev" = nixpkgs.mpich;
  "libncurses-dev" = nixpkgs.ncurses;
  "libnl-3" = nixpkgs.libnl;
  "libnl-3-dev" = nixpkgs.libnl;
  "libnlopt-cxx-dev" = nixpkgs.nlopt;
  "libnlopt-dev" = nixpkgs.nlopt;
  "libnlopt0" = nixpkgs.nlopt;
  "libnotify" = nixpkgs.libnotify;
  "libnss3-dev" = nixpkgs.nss;
  "libogg" = nixpkgs.libogg;
  "libogre" = nixpkgs.ogre1_9;
  "libogre-dev" = nixpkgs.ogre1_9;
  "libois-dev" = nixpkgs.ois;
  "libomp-dev" = nixpkgs.llvmPackages.openmp;
  "libopenal-dev" = nixpkgs.openal;
  "libopenblas-dev" = nixpkgs.openblas;
  "libopencv-dev" = nixpkgs.opencv;
  "libopenexr-dev" = nixpkgs.openexr;
  "libopenscenegraph" = nixpkgs.openscenegraph;
  "libopenvdb" = nixpkgs.openvdb;
  "libopenvdb-dev" = nixpkgs.openvdb;
  "liborocos-kdl" = nixpkgs.orocos-kdl;
  "liborocos-kdl-dev" = nixpkgs.orocos-kdl;
  "libpcap" = nixpkgs.libpcap;
  "libpcl-all" = nixpkgs.pcl;
  "libpcl-all-dev" = nixpkgs.pcl;
  "libpcsclite-dev" = nixpkgs.pcsclite;
  "libpng++-dev" = nixpkgs.pngpp;
  "libpng-dev" = nixpkgs.libpng;
  "libpng12-dev" = nixpkgs.libpng12;
  "libpoco-dev" = nixpkgs.poco;
  "libpopt-dev" = nixpkgs.popt;
  "libpq-dev" = nixpkgs.postgresql;
  "libpqxx" = nixpkgs.libpqxx;
  "libpqxx-dev" = nixpkgs.libpqxx;
  "libprocps-dev" = nixpkgs.procps;
  "libpulse-dev" = nixpkgs.pulseaudio;
  "libqglviewer-dev-qt5" = nixpkgs.libsForQt5.libqglviewer;
  "libqglviewer2-qt5" = nixpkgs.libsForQt5.libqglviewer;
  "libqhull" = nixpkgs.qhull;
  "libqrencode" = nixpkgs.qrencode;
  "libqrencode-dev" = nixpkgs.qrencode;
  "libqt4" = nixpkgs.qt4;
  "libqt4-dev" = nixpkgs.qt4;
  "libqt4-opengl" = nixpkgs.qt4;
  "libqt4-opengl-dev" = nixpkgs.qt4;
  "libqt4-sql-psql" = nixpkgs.qt4;
  "libqt5-concurrent" = nixpkgs.qt5.qtbase;
  "libqt5-core" = nixpkgs.qt5.qtbase;
  "libqt5-gui" = nixpkgs.qt5.qtbase;
  "libqt5-multimedia" = nixpkgs.qt5.qtmultimedia;
  "libqt5-network" = nixpkgs.qt5.qtbase;
  "libqt5-opengl" = nixpkgs.qt5.qtbase;
  "libqt5-opengl-dev" = nixpkgs.qt5.qtbase;
  "libqt5-printsupport" = nixpkgs.qt5.qtbase;
  "libqt5-qml" = nixpkgs.qt5.qtdeclarative;
  "libqt5-quick" = nixpkgs.qt5.qtdeclarative;
  "libqt5-serialport" = nixpkgs.qt5.qtserialport;
  "libqt5-sql" = nixpkgs.qt5.qtbase;
  "libqt5-svg-dev" = nixpkgs.qt5.qtsvg;
  "libqt5-websockets-dev" = nixpkgs.qt5.qtwebsockets;
  "libqt5-widgets" = nixpkgs.qt5.qtbase;
  "libqt5-xml" = nixpkgs.qt5.qtbase;
  "libqt5multimedia5-plugins" = nixpkgs.qt5.qtmultimedia;
  "libqt5x11extras5-dev" = nixpkgs.qt5.qtx11extras;
  "libqtgui4" = nixpkgs.qt4;
  "libqtwebkit-dev" = nixpkgs.qt5.qtwebkit;
  "libqwt-qt5-dev" = nixpkgs.libsForQt5.qwt;
  "libqwt6" = nixpkgs.libsForQt5.qwt;
  "libraw1394" = nixpkgs.libraw1394;
  "libraw1394-dev" = nixpkgs.libraw1394;
  "librdkafka-dev" = nixpkgs.rdkafka;
  "libreadline" = nixpkgs.readline;
  "libreadline-dev" = nixpkgs.readline;
  "librtaudio-dev" = nixpkgs.rtaudio;
  "libsensors4-dev" = nixpkgs.lm_sensors;
  "libsndfile1-dev" = nixpkgs.libsndfile;
  "libspatialindex-dev" = nixpkgs.libspatialindex;
  "libspatialite" = nixpkgs.libspatialite;
  "libspnav-dev" = nixpkgs.libspnav;
  "libsqlite3-dev" = nixpkgs.sqlite;
  "libssh-dev" = nixpkgs.libssh;
  "libssh2" = nixpkgs.libssh2;
  "libssh2-dev" = nixpkgs.libssh2;
  "libssl-dev" = nixpkgs.openssl;
  "libstdc++6" = [ ];
  "libsvm-dev" = nixpkgs.libsvm;
  "libsvm3" = nixpkgs.libsvm;
  "libswscale-dev" = nixpkgs.ffmpeg;
  "libtclap-dev" = nixpkgs.tclap;
  "libtesseract" = nixpkgs.tesseract;
  "libtheora" = nixpkgs.libtheora;
  "libtiff-dev" = nixpkgs.libtiff;
  "libtiff4-dev" = nixpkgs.libtiff;
  "libtool" = nixpkgs.libtool;
  "libturbojpeg" = nixpkgs.libjpeg_turbo;
  "libudev-dev" = nixpkgs.udev;
  "libunwind" = nixpkgs.libunwind;
  "libunwind-dev" = nixpkgs.libunwind;
  "liburdfdom-dev" = nixpkgs.urdfdom;
  "liburdfdom-headers-dev" = nixpkgs.urdfdom-headers;
  "liburdfdom-tools" = nixpkgs.urdfdom;
  "libusb" = nixpkgs.libusb-compat-0_1;
  "libusb-1.0" = nixpkgs.libusb1;
  "libusb-1.0-dev" = nixpkgs.libusb1;
  "libusb-dev" = nixpkgs.libusb1;
  "libuv1-dev" = nixpkgs.libuv;
  "libuvc-dev" = nixpkgs.libuvc;
  "libv4l-dev" = nixpkgs.libv4l;
  "libvlc" = nixpkgs.vlc;
  "libvlc-dev" = nixpkgs.vlc;
  "libvpx-dev" = nixpkgs.libvpx;
  "libvtk" = nixpkgs.vtk;
  "libvtk-qt" = nixpkgs.vtkWithQt5;
  "libvulkan-dev" = nixpkgs.vulkan-loader;
  "libwebp-dev" = nixpkgs.libwebp;
  "libwebsocketpp-dev" = nixpkgs.websocketpp;
  "libwebsockets-dev" = nixpkgs.libwebsockets;
  "libx11" = nixpkgs.xorg.libX11;
  "libx11-dev" = nixpkgs.xorg.libX11;
  "libx264-dev" = nixpkgs.x264;
  "libxaw" = nixpkgs.xorg.libXaw;
  "libxcursor-dev" = nixpkgs.xorg.libXcursor;
  "libxext" = nixpkgs.xorg.libXext;
  "libxft-dev" = nixpkgs.xorg.libXft;
  "libxi-dev" = nixpkgs.xorg.libXi;
  "libxinerama-dev" = nixpkgs.xorg.libXinerama;
  "libxml++-2.6" = nixpkgs.libxmlxx;
  "libxml2" = nixpkgs.libxml2;
  "libxml2-utils" = nixpkgs.libxml2;
  "libxmlrpc-c++" = nixpkgs.xmlrpc_c;
  "libxmu-dev" = nixpkgs.xorg.libXmu;
  "libxrandr" = nixpkgs.xorg.libXrandr;
  "libxslt" = nixpkgs.libxslt;
  "libxss1" = nixpkgs.xorg.libXScrnSaver;
  "libxt-dev" = nixpkgs.xorg.libXtst;
  "libzmq3-dev" = nixpkgs.cppzmq;
  "libzstd-dev" = nixpkgs.zstd;
  "lighttpd" = nixpkgs.lighttpd;
  "linphone" = nixpkgs.linphone;
  "linux-headers-generic" = nixpkgs.linuxHeaders;
  "linux-kernel-headers" = nixpkgs.linuxHeaders;
  "llvm" = nixpkgs.llvm;
  "llvm-7" = nixpkgs.llvm_7;
  "llvm-7-dev" = nixpkgs.llvm_7;
  "llvm-dev" = nixpkgs.llvm;
  "lm-sensors" = nixpkgs.lm_sensors;
  "log4cplus" = nixpkgs.log4cplus;
  "log4cxx" = nixpkgs.log4cxx;
  "lttng-tools" = nixpkgs.lttng-tools;
  "lua-dev" = nixpkgs.lua;
  "lua5.2-dev" = nixpkgs.lua5;
  "lz4" = nixpkgs.lz4;
  "m4" = nixpkgs.m4;
  "matio" = nixpkgs.matio;
  "maven" = nixpkgs.maven;
  "meld" = nixpkgs.meld;
  "mercurial" = nixpkgs.mercurial;
  "meshlab" = nixpkgs.meshlab;
  "mkdocs" = nixpkgs.mkdocs;
  "mongodb" = nixpkgs.mongodb;
  "mongodb-dev" = nixpkgs.mongodb;
  "mosquitto" = nixpkgs.mosquitto;
  "mosquittopp-dev" = nixpkgs.mosquitto;
  "mpg123" = nixpkgs.mpg123;
  "mplayer" = nixpkgs.mplayer;
  "msgpack" = nixpkgs.msgpack;
  "muparser" = nixpkgs.muparser;
  "nasm" = nixpkgs.nasm;
  "net-tools" = nixpkgs.nettools;
  "netcdf" = nixpkgs.netcdf;
  "netpbm" = nixpkgs.netpbm;
  "network-manager" = nixpkgs.networkmanager;
  "ninja-build" = nixpkgs.ninja;
  "nkf" = nixpkgs.nkf;
  "nlohmann-json-dev" = nixpkgs.nlohmann_json;
  "nmap" = nixpkgs.nmap;
  "nodejs" = nixpkgs.nodejs;
  "nodejs-legacy" = nixpkgs.nodejs;
  "npm" = nixpkgs.nodePackages.npm;
  "ntp" = nixpkgs.ntp;
  "ntpdate" = nixpkgs.ntp;
  "omniidl" = nixpkgs.omniorb;
  "omniorb" = nixpkgs.omniorb;
  "opencl-headers" = nixpkgs.opencl-headers;
  "opende" = nixpkgs.ode;
  "opengl" = [ nixpkgs.libGL nixpkgs.libGLU ];
  "openmpi" = nixpkgs.openmpi;
  "openocd" = nixpkgs.openocd;
  "openssh-client" = nixpkgs.openssh;
  "openssh-server" = nixpkgs.openssh;
  "openssl" = nixpkgs.openssl;
  "optipng" = nixpkgs.optipng;
  "osm2pgsql" = nixpkgs.osm2pgsql;
  "osmium" = nixpkgs.libosmium;
  "pandoc" = nixpkgs.pandoc;
  "paramiko" = pythonPackages.paramiko;
  "pcre" = nixpkgs.pcre;
  "pcre-dev" = nixpkgs.pcre;
  "phantomjs" = nixpkgs.phantomjs;
  "php" = nixpkgs.php;
  "pkg-config" = nixpkgs.pkg-config;
  "pmount" = nixpkgs.pmount;
  "pocketsphinx-bin" = nixpkgs.pocketsphinx;
  "portaudio" = nixpkgs.portaudio;
  "portaudio19-dev" = nixpkgs.portaudio;
  "postgresql" = nixpkgs.postgresql;
  "powertop" = nixpkgs.powertop;
  "procps" = nixpkgs.procps;
  "proj" = nixpkgs.proj;
  "protobuf" = nixpkgs.protobuf;
  "protobuf-dev" = nixpkgs.protobuf;
  "pstoedit" = nixpkgs.pstoedit;
  "psutils" = nixpkgs.psutils;
  "pugixml-dev" = nixpkgs.pugixml;
  "pybind11-dev" = python3Packages.pybind11;
  "pydocstyle" = python3Packages.pydocstyle;
  "pyflakes3" = python3Packages.pyflakes;
  "python" = nixpkgs.python;
  "python-argcomplete" = pythonPackages.argcomplete;
  "python-argparse" = nixpkgs.python;
  "python-attrs" = pythonPackages.attrs;
  "python-autobahn" = pythonPackages.autobahn;
  "python-avahi" = pythonPackages.avahi;
  "python-backports.ssl-match-hostname" = pythonPackages.backports_ssl_match_hostname;
  "python-bcrypt" = pythonPackages.bcrypt;
  "python-bitstring" = pythonPackages.bitstring;
  "python-bluez" = pythonPackages.pybluez;
  "python-boto3" = pythonPackages.boto3;
  "python-bs4" = pythonPackages.beautifulsoup4;
  "python-bson" = pythonPackages.bson;
  "python-cairo" = pythonPackages.pycairo;
  "python-cairosvg" = pythonPackages.cairosvg;
  "python-chainer-pip" = pythonPackages.chainer;
  "python-cheetah" = pythonPackages.cheetah;
  "python-cherrypy" = pythonPackages.cherrypy;
  "python-click" = pythonPackages.click;
  "python-colorama" = pythonPackages.colorama;
  "python-cookiecutter-pip" = pythonPackages.cookiecutter;
  "python-coverage" = pythonPackages.coverage;
  "python-crcmod" = pythonPackages.crcmod;
  "python-crypto" = pythonPackages.pycrypto;
  "python-cvxopt" = pythonPackages.cvxopt;
  "python-dateutil" = pythonPackages.dateutil;
  "python-decorator" = pythonPackages.decorator;
  "python-defusedxml" = pythonPackages.defusedxml;
  "python-dev" = pythonPackages.python;
  "python-dlib" = pythonPackages.dlib;
  "python-docker" = pythonPackages.docker;
  "python-docopt" = pythonPackages.docopt;
  "python-docutils" = pythonPackages.docutils;
  "python-empy" = pythonPackages.empy;
  "python-enum34" = pythonPackages.enum34;
  "python-flake8" = python3Packages.flake8;
  "python-flask" = pythonPackages.flask;
  "python-flask-restful" = pythonPackages.flask-restful;
  "python-freezegun-pip" = pythonPackages.freezegun;
  "python-future" = pythonPackages.future;
  "python-geographiclib" = pythonPackages.geographiclib;
  "python-gi" = pythonPackages.pygobject3;
  "python-gi-cairo" = pythonPackages.pygobject3;
  "python-gnupg" = pythonPackages.python-gnupg;
  "python-gobject" = pythonPackages.pygobject2;
  "python-grpc-tools" = pythonPackages.grpcio-tools;
  "python-gtk2" = pythonPackages.pygtk;
  "python-h5py" = pythonPackages.h5py;
  "python-imageio" = pythonPackages.imageio;
  "python-imaging" = pythonPackages.pillow;
  "python-impacket" = pythonPackages.impacket;
  "python-influxdb" = pythonPackages.influxdb;
  "python-jinja2" = pythonPackages.jinja2;
  "python-joblib" = pythonPackages.joblib;
  "python-kitchen" = pythonPackages.kitchen;
  "python-lxml" = pythonPackages.lxml;
  "python-matplotlib" = pythonPackages.matplotlib;
  "python-mechanize" = pythonPackages.mechanize;
  "python-mock" = pythonPackages.mock;
  "python-monotonic" = pythonPackages.monotonic;
  "python-msgpack" = pythonPackages.msgpack;
  "python-netcdf4" = pythonPackages.netcdf4;
  "python-netifaces" = pythonPackages.netifaces;
  "python-nose" = pythonPackages.nose;
  "python-numpy" = pythonPackages.numpy;
  "python-opencv" = pythonPackages.opencv3;
  "python-opengl" = pythonPackages.pyopengl;
  "python-packaging" = pythonPackages.packaging;
  "python-pandas" = pythonPackages.pandas;
  "python-paramiko" = pythonPackages.paramiko;
  "python-pastedeploy" = pythonPackages.PasteDeploy;
  "python-pathlib" = pythonPackages.pathlib;
  "python-pathlib2" = pythonPackages.pathlib2;
  "python-pep8" = pythonPackages.pep8;
  "python-percol" = pythonPackages.percol;
  "python-pip" = pythonPackages.pip;
  "python-pkg-resources" = pythonPackages.setuptools;
  "python-progressbar" = pythonPackages.progressbar;
  "python-psutil" = pythonPackages.psutil;
  "python-pyaudio" = pythonPackages.pyaudio;
  "python-pycodestyle" = pythonPackages.pycodestyle;
  "python-pycryptodome" = pythonPackages.pycryptodomex;
  "python-pydot" = pythonPackages.pydot;
  "python-pygame" = pythonPackages.pygame;
  "python-pygraphviz" = pythonPackages.pygraphviz;
  "python-pymongo" = pythonPackages.pymongo;
  "python-pyproj" = pythonPackages.pyproj;
  "python-pyqtgraph" = pythonPackages.pyqtgraph;
  "python-pyquery" = pythonPackages.pyquery;
  "python-pytest" = pythonPackages.pytest;
  "python-pytest-cov" = pythonPackages.pytestcov;
  "python-pyudev" = pythonPackages.pyudev;
  "python-pyusb-pip" = pythonPackages.pyusb;
  "python-qt5-bindings" = pythonPackages.pyqt5;
  "python-qt5-bindings-gl" = pythonPackages.pyqt5;
  "python-qt5-bindings-webkit" = pythonPackages.pyqt5_with_qtwebkit;
  "python-requests" = pythonPackages.requests;
  "python-ruamel.yaml" = pythonPackages.ruamel_yaml;
  "python-schedule" = pythonPackages.schedule;
  "python-scipy" = pythonPackages.scipy;
  "python-selenium-pip" = pythonPackages.selenium;
  "python-semantic-version" = pythonPackages.semantic-version;
  "python-serial" = pythonPackages.pyserial;
  "python-setuptools" = pythonPackages.setuptools;
  "python-simplejson" = pythonPackages.simplejson;
  "python-sip" = pythonPackages.sip_4;
  "python-six" = pythonPackages.six;
  "python-skimage" = pythonPackages.scikitimage;
  "python-sklearn" = pythonPackages.scikitlearn;
  "python-sphinx" = pythonPackages.sphinx;
  "python-sympy" = pythonPackages.sympy;
  "python-systemd" = pythonPackages.systemd;
  "python-tabulate" = pythonPackages.tabulate;
  "python-tabulate-pip" = pythonPackages.tabulate;
  "python-termcolor" = pythonPackages.termcolor;
  "python-texttable" = pythonPackages.texttable;
  "python-tilestache" = pythonPackages.tilestache;
  "python-tk" = pythonPackages.tkinter;
  "python-tornado" = pythonPackages.tornado;
  "python-twisted-core" = pythonPackages.twisted;
  "python-twisted-web" = pythonPackages.twisted;
  "python-typing" = pythonPackages.typing;
  "python-tz" = pythonPackages.pytz;
  "python-tzlocal-pip" = pythonPackages.tzlocal;
  "python-ujson" = pythonPackages.ujson;
  "python-unittest2" = pythonPackages.unittest2;
  "python-urlgrabber" = pythonPackages.urlgrabber;
  "python-urllib3" = pythonPackages.urllib3;
  "python-usb" = pythonPackages.pyusb;
  "python-virtualenv" = pythonPackages.virtualenv;
  "python-voluptuous" = pythonPackages.voluptuous;
  "python-waitress" = pythonPackages.waitress;
  "python-webob" = pythonPackages.webob;
  "python-websocket" = pythonPackages.websocket_client;
  "python-werkzeug" = pythonPackages.werkzeug;
  "python-whichcraft" = pythonPackages.whichcraft;
  "python-xlib" = pythonPackages.xlib;
  "python-yaml" = pythonPackages.pyyaml;
  "python-zmq" = pythonPackages.pyzmq;
  "python3" = nixpkgs.python3;
  "python3-alembic" = python3Packages.alembic;
  "python3-argcomplete" = python3Packages.argcomplete;
  "python3-autobahn" = python3Packages.autobahn;
  "python3-bitarray" = python3Packages.bitarray;
  "python3-boto3" = python3Packages.boto3;
  "python3-bs4" = python3Packages.beautifulsoup4;
  "python3-bson" = python3Packages.pymongo;
  "python3-cairo" = python3Packages.pycairo;
  "python3-cairosvg" = python3Packages.cairosvg;
  "python3-cffi" = python3Packages.cffi;
  "python3-chainer-pip" = pythonPackages.chainer;
  "python3-cherrypy3" = python3Packages.cherrypy;
  "python3-click" = python3Packages.click;
  "python3-collada" = python3Packages.pycollada;
  "python3-colorama" = python3Packages.colorama;
  "python3-construct" = python3Packages.construct;
  "python3-coverage" = python3Packages.coverage;
  "python3-crcmod" = python3Packages.crcmod;
  "python3-cryptography" = python3Packages.cryptography;
  "python3-dateutil" = python3Packages.python-dateutil;
  "python3-dbus" = python3Packages.dbus-python;
  "python3-decorator" = python3Packages.decorator;
  "python3-defusedxml" = python3Packages.defusedxml;
  "python3-dev" = nixpkgs.python3;
  "python3-distro" = python3Packages.distro;
  "python3-distutils" = nixpkgs.python3;
  "python3-docker" = python3Packages.docker;
  "python3-docopt" = python3Packages.docopt;
  "python3-docutils" = python3Packages.docutils;
  "python3-empy" = python3Packages.empy;
  "python3-ezdxf" = python3Packages.ezdxf;
  "python3-fiona" = python3Packages.fiona;
  "python3-flake8" = python3Packages.flake8;
  "python3-flask" = python3Packages.flask;
  "python3-flask-jwt-extended" = python3Packages.flask-jwt-extended;
  "python3-future" = python3Packages.future;
  "python3-geographiclib" = python3Packages.geographiclib;
  "python3-geopy" = python3Packages.geopy;
  "python3-gi" = python3Packages.pygobject3;
  "python3-gi-cairo" = python3Packages.pygobject3;
  "python3-git" = python3Packages.GitPython;
  "python3-github" = python3Packages.PyGithub;
  "python3-gnupg" = python3Packages.python-gnupg;
  "python3-grpc-tools" = python3Packages.grpcio-tools;
  "python3-grpcio" = python3Packages.grpcio;
  "python3-h5py" = python3Packages.h5py;
  "python3-imageio" = python3Packages.imageio;
  "python3-importlib-metadata" = python3Packages.importlib-metadata;
  "python3-importlib-resources" = python3Packages.importlib-resources;
  "python3-interpreter" = nixpkgs.python3;
  "python3-jinja2" = python3Packages.jinja2;
  "python3-jmespath" = python3Packages.jmespath;
  "python3-joblib" = python3Packages.joblib;
  "python3-jsonschema" = python3Packages.jsonschema;
  "python3-kitchen" = python3Packages.kitchen;
  "python3-lark-parser" = python3Packages.lark;
  "python3-lockfile" = python3Packages.lockfile;
  "python3-lxml" = python3Packages.lxml;
  "python3-mapnik" = python3Packages.python-mapnik;
  "python3-markdown" = python3Packages.markdown;
  "python3-matplotlib" = python3Packages.matplotlib;
  "python3-mechanize" = python3Packages.mechanize;
  "python3-mock" = python3Packages.mock;
  "python3-msgpack" = python3Packages.msgpack;
  "python3-mypy" = python3Packages.mypy;
  "python3-netcdf4" = python3Packages.netcdf4;
  "python3-netifaces" = python3Packages.netifaces;
  "python3-networkx" = python3Packages.networkx;
  "python3-nose" = python3Packages.nose;
  "python3-numpy" = python3Packages.numpy;
  "python3-numpy-stl" = python3Packages.numpy-stl;
  "python3-opencv" = python3Packages.opencv3;
  "python3-opengl" = python3Packages.pyopengl;
  "python3-packaging" = python3Packages.packaging;
  "python3-pandas" = python3Packages.pandas;
  "python3-paramiko" = python3Packages.paramiko;
  "python3-pep8" = python3Packages.pep8;
  "python3-pil" = python3Packages.pillow;
  "python3-pip" = python3Packages.pip;
  "python3-pkg-resources" = python3Packages.setuptools;
  "python3-prettytable" = python3Packages.prettytable;
  "python3-progressbar" = python3Packages.progressbar;
  "python3-protobuf" = python3Packages.protobuf;
  "python3-psutil" = python3Packages.psutil;
  "python3-pyaudio" = python3Packages.pyaudio;
  "python3-pyclipper" = python3Packages.pyclipper;
  "python3-pycodestyle" = python3Packages.pycodestyle;
  "python3-pycryptodome" = python3Packages.pycryptodomex;
  "python3-pydot" = python3Packages.pydot;
  "python3-pygame" = python3Packages.pygame;
  "python3-pygraphviz" = python3Packages.pygraphviz;
  "python3-pykdl" = python3Packages.pykdl;
  "python3-pymongo" = python3Packages.pymongo;
  "python3-pyosmium" = python3Packages.pyosmium;
  "python3-pyparsing" = python3Packages.pyparsing;
  "python3-pyproj" = python3Packages.pyproj;
  "python3-pyqrcode" = python3Packages.pyqrcode;
  "python3-pyqt5.qtwebengine" = python3Packages.pyqtwebengine;
  "python3-pyqtgraph" = python3Packages.pyqtgraph;
  "python3-pystemd" = python3Packages.pystemd;
  "python3-pytest" = python3Packages.pytest;
  "python3-pytest-asyncio" = python3Packages.pytest-asyncio;
  "python3-pytest-cov" = python3Packages.pytestcov;
  "python3-pytest-mock" = python3Packages.pytest-mock;
  "python3-pytest-timeout" = python3Packages.pytest-timeout;
  "python3-qt5-bindings" = python3Packages.pyqt5;
  "python3-qt5-bindings-gl" = python3Packages.pyqt5;
  "python3-qt5-bindings-webkit" = python3Packages.pyqt5_with_qtwebkit;
  "python3-qtpy" = python3Packages.qtpy;
  "python3-rdflib" = python3Packages.rdflib;
  "python3-requests" = python3Packages.requests;
  "python3-requests-oauthlib" = python3Packages.requests_oauthlib;
  "python3-retrying" = python3Packages.retrying;
  "python3-ruamel.yaml" = python3Packages.ruamel_yaml;
  "python3-schedule" = python3Packages.schedule;
  "python3-schema" = python3Packages.schema;
  "python3-scipy" = python3Packages.scipy;
  "python3-selenium" = python3Packages.selenium;
  "python3-semantic-version" = python3Packages.semantic-version;
  "python3-serial" = python3Packages.pyserial;
  "python3-setuptools" = python3Packages.setuptools;
  "python3-sexpdata" = python3Packages.sexpdata;
  "python3-sh" = python3Packages.sh;
  "python3-shapely" = python3Packages.shapely;
  "python3-simplejson" = python3Packages.simplejson;
  "python3-sip" = python3Packages.sip_4;
  "python3-six" = python3Packages.six;
  "python3-skimage" = python3Packages.scikitimage;
  "python3-sklearn" = python3Packages.scikitlearn;
  "python3-sphinx" = python3Packages.sphinx;
  "python3-sphinx-argparse" = python3Packages.sphinx-argparse;
  "python3-sphinx-rtd-theme" = python3Packages.sphinx_rtd_theme;
  "python3-sqlalchemy" = python3Packages.sqlalchemy;
  "python3-sqlalchemy-utils" = python3Packages.sqlalchemy-utils;
  "python3-sympy" = python3Packages.sympy;
  "python3-systemd" = python3Packages.systemd;
  "python3-tabulate" = python3Packages.tabulate;
  "python3-termcolor" = python3Packages.termcolor;
  "python3-texttable" = python3Packages.texttable;
  "python3-tk" = python3Packages.tkinter;
  "python3-toml" = python3Packages.toml;
  "python3-tornado" = python3Packages.tornado;
  "python3-tqdm" = python3Packages.tqdm;
  "python3-twilio" = python3Packages.twilio;
  "python3-twisted" = python3Packages.twisted;
  "python3-tz" = python3Packages.pytz;
  "python3-unidiff" = python3Packages.unidiff;
  "python3-urllib3" = python3Packages.urllib3;
  "python3-usb" = python3Packages.pyusb;
  "python3-venv" = nixpkgs.python3;
  "python3-watchdog" = python3Packages.watchdog;
  "python3-webargs" = python3Packages.webargs;
  "python3-websockets" = python3Packages.websockets;
  "python3-whichcraft" = python3Packages.whichcraft;
  "python3-wrapt" = python3Packages.wrapt;
  "python3-wxgtk4.0" = python3Packages.wxPython_4_0;
  "python3-xmlschema" = python3Packages.xmlschema;
  "python3-xmltodict" = python3Packages.xmltodict;
  "python3-yaml" = python3Packages.pyyaml;
  "python3-zmq" = python3Packages.pyzmq;
  "qhull-bin" = nixpkgs.qhull;
  "qrencode" = nixpkgs.qrencode;
  "qt4-dev-tools" = nixpkgs.qt4;
  "qt4-qmake" = nixpkgs.qt4;
  "qt5-image-formats-plugins" = nixpkgs.qt5.qtimageformats;
  "qt5-qmake" = nixpkgs.qt5.qtbase;
  "qtbase5-dev" = nixpkgs.qt5.qtbase;
  "qtdeclarative5-dev" = nixpkgs.qt5.qtdeclarative;
  "qtmultimedia5-dev" = nixpkgs.qt5.qtmultimedia;
  "qttools5-dev" = nixpkgs.qt5.qttools;
  "qttools5-dev-tools" = nixpkgs.qt5.qttools.dev;
  "rapidjson-dev" = nixpkgs.rapidjson;
  "readline-dev" = nixpkgs.readline;
  "recode" = nixpkgs.recode;
  "redis-server" = nixpkgs.redis;
  "rsync" = nixpkgs.rsync;
  "rti-connext-dds-5.3.1" = [ ];
  "rti-connext-dds-6.0.1" = [ ];
  "rtmidi" = nixpkgs.rtmidi;
  "sbcl" = nixpkgs.sbcl;
  "scons" = nixpkgs.scons;
  "screen" = nixpkgs.screen;
  "sdl" = nixpkgs.SDL;
  "sdl-gfx" = nixpkgs.SDL_gfx;
  "sdl-image" = nixpkgs.SDL_image;
  "sdl-mixer" = nixpkgs.SDL_mixer;
  "sdl-ttf" = nixpkgs.SDL_ttf;
  "sdl2" = nixpkgs.SDL2;
  "sdl2-ttf" = nixpkgs.SDL2_ttf;
  "setserial" = nixpkgs.setserial;
  "sfml-dev" = nixpkgs.sfml;
  "smartmontools" = nixpkgs.smartmontools;
  "smbclient" = nixpkgs.samba;
  "snappy" = nixpkgs.snappy;
  "socat" = nixpkgs.socat;
  "sox" = nixpkgs.sox;
  "spacenavd" = nixpkgs.spacenavd;
  "sparsehash" = nixpkgs.sparsehash;
  "spdlog" = nixpkgs.spdlog;
  "speex" = nixpkgs.speex;
  "spirv-headers" = nixpkgs.spirv-headers;
  "spirv-tools" = nixpkgs.spirv-tools;
  "sqlite3" = nixpkgs.sqlite;
  "sshpass" = nixpkgs.sshpass;
  "stress" = nixpkgs.stress;
  "subversion" = nixpkgs.subversion;
  "suitesparse" = nixpkgs.suitesparse;
  "swig" = nixpkgs.swig;
  "sysstat" = nixpkgs.sysstat;
  "tango-icon-theme" = nixpkgs.tango-icon-theme;
  "tar" = nixpkgs.libtar;
  "tbb" = nixpkgs.tbb;
  "tcsh" = nixpkgs.tcsh;
  "terminator" = nixpkgs.terminator;
  "texmaker" = nixpkgs.texmaker;
  "time" = nixpkgs.time;
  "tinyxml" = nixpkgs.tinyxml;
  "tinyxml2" = nixpkgs.tinyxml-2;
  "tix" = nixpkgs.tix;
  "tmux" = nixpkgs.tmux;
  "touchegg" = nixpkgs.touchegg;
  "tree" = nixpkgs.tree;
  "udev" = nixpkgs.udev;
  "uncrustify" = nixpkgs.uncrustify;
  "unison" = nixpkgs.unison;
  "unoconv" = nixpkgs.unoconv;
  "unrar" = nixpkgs.unrar;
  "unzip" = nixpkgs.unzip;
  "usbutils" = nixpkgs.usbutils;
  "util-linux" = nixpkgs.util-linux;
  "uuid" = nixpkgs.util-linux;
  "uvcdynctrl" = nixpkgs.uvcdynctrl;
  "v4l-utils" = nixpkgs.v4l-utils;
  "valgrind" = nixpkgs.valgrind;
  "vim" = nixpkgs.vim;
  "virtualenv" = python3Packages.virtualenv;
  "vlc" = nixpkgs.vlc;
  "vorbis-tools" = nixpkgs.vorbis-tools;
  "wget" = nixpkgs.wget;
  "wireguard" = nixpkgs.wireguard-tools;
  "wireless-tools" = nixpkgs.wirelesstools;
  "wireshark" = nixpkgs.wireshark;
  "wireshark-common" = nixpkgs.wireshark-cli;
  "wx-common" = nixpkgs.wxGTK;
  "wxwidgets" = nixpkgs.wxGTK;
  "xclip" = nixpkgs.xclip;
  "xdg-utils" = nixpkgs.xdg-utils;
  "xdotool" = nixpkgs.xdotool;
  "xfonts-100dpi" = [ nixpkgs.xorg.fontadobe100dpi nixpkgs.xorg.fontbh100dpi nixpkgs.xorg.fontbhlucidatypewriter100dpi nixpkgs.xorg.fontbitstream100dpi ];
  "xfonts-75dpi" = [ nixpkgs.xorg.fontadobe75dpi nixpkgs.xorg.fontbh75dpi nixpkgs.xorg.fontbhlucidatypewriter75dpi nixpkgs.xorg.fontbitstream75dpi ];
  "xsltproc" = nixpkgs.libxslt;
  "xterm" = nixpkgs.xterm;
  "xvfb" = nixpkgs.xorg.xorgserver;
  "yaml" = nixpkgs.libyaml;
  "yaml-cpp" = nixpkgs.libyamlcpp;
  "yamllint" = nixpkgs.yamllint;
  "yapf" = python3Packages.yapf;
  "yapf3" = python3Packages.yapf;
  "yarn" = nixpkgs.yarn;
  "yasm" = nixpkgs.yasm;
  "zbar" = nixpkgs.zbar;
  "zenity" = nixpkgs.gnome.zenity;
  "zeromq3" = nixpkgs.zeromq;
  "zip" = nixpkgs.zip;
  "zlib" = nixpkgs.zlib;
  "zziplib" = nixpkgs.zziplib;
}
