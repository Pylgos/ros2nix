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
    gtsam-vendor_source0 = substituteSource {
      src = fetchurl {
        name = "gtsam-vendor_source0-source";
        url = "http://downloads.tuxfamily.org/eigen/lapack_addons_3.4.1.tgz";
        hash = "sha256-vZntt9xHKapjGQQapStG2/erraGkP3oj/iYm2yTFJDw=";
      };
      substitutions = [
      ];
    };
    librealsense2-vendor_source0 = substituteSource {
      src = fetchurl {
        name = "librealsense2-vendor_source0-source";
        url = "https://raw.githubusercontent.com/gabomdq/SDL_GameControllerDB/master/gamecontrollerdb.txt";
        hash = "sha256-503gvcBDasNM51wI3gwzpt5H6u3KXEJtXagvQe0hits=";
      };
      substitutions = [
      ];
    };
    mrpt2 = substituteSource {
      src = fetchgit {
        name = "mrpt2-source";
        url = "https://github.com/ros2-gbp/mrpt2-release.git";
        rev = "13832bbaec2d6710e0f9fc44f87f86461c2d0fb6";
        hash = "sha256-rVrQK4cNuaGYOlHTI1EEnTCZKUVq2/emy4aTVWpxc+o=";
      };
      substitutions = [
        {
          path = "3rdparty/nanogui/ext/glfw/CMake/GenerateMappings.cmake";
          from = "DOWNLOAD \"\${source_url}\"";
          to = "DOWNLOAD file://${librealsense2-vendor_source0}";
        }
        {
          path = "cmakemodules/script_assimp.cmake";
          from = "URL               \"https://github.com/assimp/assimp/archive/v5.3.1.tar.gz\"";
          to = "URL ${mrpt2-vendor_source0}";
        }
        {
          path = "cmakemodules/script_eigen.cmake";
          from = "URL               \"https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.bz2\"";
          to = "URL ${mrpt2-vendor_source0}";
        }
        {
          path = "cmakemodules/script_jpeg.cmake";
          from = "URL               \"https://github.com/libjpeg-turbo/libjpeg-turbo/archive/1.5.90.tar.gz\"";
          to = "URL ${mrpt2-vendor_source0}";
        }
        {
          path = "cmakemodules/script_octomap.cmake";
          from = "URL               \"\${OCTOMAP_EP_URL}\"";
          to = "URL ${mrpt2-vendor_source0}";
        }
        {
          path = "cmakemodules/script_tinyxml2.cmake";
          from = "DOWNLOAD\n			https://github.com/leethomason/tinyxml2/raw/\${TINYXML2_VERSION_TO_DOWNLOAD}/tinyxml2.cpp";
          to = "DOWNLOAD file://${mrpt2-vendor_source1}";
        }
        {
          path = "cmakemodules/script_tinyxml2.cmake";
          from = "DOWNLOAD\n			https://github.com/leethomason/tinyxml2/raw/\${TINYXML2_VERSION_TO_DOWNLOAD}/tinyxml2.h";
          to = "DOWNLOAD file://${mrpt2-vendor_source0}";
        }
      ];
    };
    mrpt2-vendor_source0 = substituteSource {
      src = fetchurl {
        name = "mrpt2-vendor_source0-source";
        url = "https://github.com/leethomason/tinyxml2/raw/7.1.0/tinyxml2.h";
        hash = "sha256-C3cg/6R4k8QXqGEc3RKJ7Yd5STPSuiWTTmQt3k2FTQk=";
      };
      substitutions = [
      ];
    };
    mrpt2-vendor_source1 = substituteSource {
      src = fetchurl {
        name = "mrpt2-vendor_source1-source";
        url = "https://github.com/leethomason/tinyxml2/raw/7.1.0/tinyxml2.cpp";
        hash = "sha256-EMotGRcFLQY9PO9Lle62yoRQNNMBxUoR1ttfAWpKT44=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt2";
  version = "2.13.2-1";
  src = sources.mrpt2;
  nativeBuildInputs = [ ament_cmake cmake pkg-config ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ assimp ffmpeg freenect jsoncpp libjpeg libpcap libusb1 python3Packages.pip python3Packages.pybind11 tinyxml-2 udev wxGTK zlib ];
  propagatedBuildInputs = [ cv_bridge eigen freeglut geometry_msgs glfw3 libGL libGLU nav_msgs opencv rclcpp rosbag2_storage sensor_msgs std_msgs stereo_msgs suitesparse tf2 tf2_msgs xorg.libXrandr ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
