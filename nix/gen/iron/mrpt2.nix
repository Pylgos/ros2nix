{
  ament_cmake,
  assimp,
  buildRosPackage,
  cmake,
  cv_bridge,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg,
  freeglut,
  freenect,
  geometry_msgs,
  glfw3,
  jsoncpp,
  libGL,
  libGLU,
  libjpeg,
  libpcap,
  libusb1,
  nav_msgs,
  opencv,
  pkg-config,
  python3Packages,
  rclcpp,
  ros_environment,
  rosbag2_storage,
  sensor_msgs,
  std_msgs,
  stereo_msgs,
  substituteSource,
  suitesparse,
  tf2,
  tf2_msgs,
  tinyxml-2,
  udev,
  wxGTK,
  xorg,
  zlib,
}:
let
  sources = rec {
    fast_gicp-vendor_source-lapack_addons_3-0 = substituteSource {
      src = fetchurl {
        name = "fast_gicp-vendor_source-lapack_addons_3-0-source";
        url = "http://downloads.tuxfamily.org/eigen/lapack_addons_3.4.1.tgz";
        hash = "sha256-vZntt9xHKapjGQQapStG2/erraGkP3oj/iYm2yTFJDw=";
      };
      substitutions = [
      ];
    };
    librealsense2-vendor_source-gamecontrollerdb-0 = substituteSource {
      src = fetchurl {
        name = "librealsense2-vendor_source-gamecontrollerdb-0-source";
        url = "https://raw.githubusercontent.com/gabomdq/SDL_GameControllerDB/master/gamecontrollerdb.txt";
        hash = "sha256-Dyl1eJi8aNkrg6mOqOhzuYNjcRzEELHqF8mXUWhU+3o=";
      };
      substitutions = [
      ];
    };
    mrpt2 = substituteSource {
      src = fetchgit {
        name = "mrpt2-source";
        url = "https://github.com/ros2-gbp/mrpt2-release.git";
        rev = "f8b024dd16bdc599c5deee5d6c1bb72a8cce583e";
        hash = "sha256-KeGqgnmOqUo+gmrvHRXeuRSY5+qykiFudMdieCBe6dc=";
      };
      substitutions = [
        {
          path = "3rdparty/nanogui/ext/glfw/CMake/GenerateMappings.cmake";
          from = "DOWNLOAD \"\${source_url}\"";
          to = "DOWNLOAD file://${librealsense2-vendor_source-gamecontrollerdb-0}";
        }
        {
          path = "cmakemodules/script_assimp.cmake";
          from = "URL               \"https://github.com/assimp/assimp/archive/v5.3.1.tar.gz\"";
          to = "URL ${mrpt2-vendor_source-v5-0}";
        }
        {
          path = "cmakemodules/script_eigen.cmake";
          from = "URL               \"https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.bz2\"";
          to = "URL ${mrpt2-vendor_source-eigen-3-0}";
        }
        {
          path = "cmakemodules/script_jpeg.cmake";
          from = "URL               \"https://github.com/libjpeg-turbo/libjpeg-turbo/archive/1.5.90.tar.gz\"";
          to = "URL ${mrpt2-vendor_source-1-0}";
        }
        {
          path = "cmakemodules/script_octomap.cmake";
          from = "URL               \"\${OCTOMAP_EP_URL}\"";
          to = "URL ${mrpt2-vendor_source-v1-0}";
        }
        {
          path = "cmakemodules/script_tinyxml2.cmake";
          from = "DOWNLOAD\n			https://github.com/leethomason/tinyxml2/raw/\${TINYXML2_VERSION_TO_DOWNLOAD}/tinyxml2.cpp";
          to = "DOWNLOAD file://${mrpt2-vendor_source-tinyxml2-1}";
        }
        {
          path = "cmakemodules/script_tinyxml2.cmake";
          from = "DOWNLOAD\n			https://github.com/leethomason/tinyxml2/raw/\${TINYXML2_VERSION_TO_DOWNLOAD}/tinyxml2.h";
          to = "DOWNLOAD file://${mrpt2-vendor_source-tinyxml2-0}";
        }
      ];
    };
    mrpt2-vendor_source-1-0 = substituteSource {
      src = fetchzip {
        name = "mrpt2-vendor_source-1-0-source";
        url = "https://github.com/libjpeg-turbo/libjpeg-turbo/archive/1.5.90.tar.gz";
        hash = "sha256-yw8qGdNf35VrplhI+Sq2xNuwk78Ld6wkF6IVF5V8nKQ=";
      };
      substitutions = [
      ];
    };
    mrpt2-vendor_source-eigen-3-0 = substituteSource {
      src = fetchzip {
        name = "mrpt2-vendor_source-eigen-3-0-source";
        url = "https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.bz2";
        hash = "sha256-oXJ4V5rakL9EPtQF0Geptl0HMR8700FdSrOB09DbbMQ=";
      };
      substitutions = [
        {
          path = "lapack/CMakeLists.txt";
          from = "DOWNLOAD \"http://downloads.tuxfamily.org/eigen/lapack_addons_3.4.1.tgz\"";
          to = "DOWNLOAD file://${fast_gicp-vendor_source-lapack_addons_3-0}";
        }
      ];
    };
    mrpt2-vendor_source-tinyxml2-0 = substituteSource {
      src = fetchurl {
        name = "mrpt2-vendor_source-tinyxml2-0-source";
        url = "https://github.com/leethomason/tinyxml2/raw/7.1.0/tinyxml2.h";
        hash = "sha256-C3cg/6R4k8QXqGEc3RKJ7Yd5STPSuiWTTmQt3k2FTQk=";
      };
      substitutions = [
      ];
    };
    mrpt2-vendor_source-tinyxml2-1 = substituteSource {
      src = fetchurl {
        name = "mrpt2-vendor_source-tinyxml2-1-source";
        url = "https://github.com/leethomason/tinyxml2/raw/7.1.0/tinyxml2.cpp";
        hash = "sha256-EMotGRcFLQY9PO9Lle62yoRQNNMBxUoR1ttfAWpKT44=";
      };
      substitutions = [
      ];
    };
    mrpt2-vendor_source-v1-0 = substituteSource {
      src = fetchzip {
        name = "mrpt2-vendor_source-v1-0-source";
        url = "https://github.com/OctoMap/octomap/archive/v1.9.6.zip";
        hash = "sha256-4KxVe1Ffu6GUmIY+SH/CHxRsy+phEOHqdxco51ogYw8=";
      };
      substitutions = [
      ];
    };
    mrpt2-vendor_source-v5-0 = substituteSource {
      src = fetchzip {
        name = "mrpt2-vendor_source-v5-0-source";
        url = "https://github.com/assimp/assimp/archive/v5.3.1.tar.gz";
        hash = "sha256-/1A8n7oe9WsF3FpbLZxhifzrdj38t9l5Kc8Q5jfDoyY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt2";
  version = "2.13.3-1";
  src = sources.mrpt2;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ament_cmake pkg-config ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ assimp cv_bridge eigen ffmpeg freeglut freenect geometry_msgs glfw3 jsoncpp libGL libGLU libjpeg libpcap libusb1 nav_msgs opencv python3Packages.pip python3Packages.pybind11 rclcpp rosbag2_storage sensor_msgs std_msgs stereo_msgs suitesparse tf2 tf2_msgs tinyxml-2 udev wxGTK xorg.libXrandr zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}