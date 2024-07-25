{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_python,
  ament_lint_auto,
  as2_core,
  as2_msgs,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  libusb1,
  nav_msgs,
  rclcpp,
  rclpy,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    as2_platform_crazyflie = substituteSource {
      src = fetchgit {
        name = "as2_platform_crazyflie-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "877180b81fca6da042b87ad478cfdaa0a128c7dd";
        hash = "sha256-WfTvR+56eRGOjV+nJ6g4+ul7POddz/238hbJhfdyzxo=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/miferco97/crazyflie_cpp.git";
          to = "URL ${as2_platform_crazyflie-vendor_source-crazyflie_cpp-0}";
        }
      ];
    };
    as2_platform_crazyflie-vendor_source-crazyflie_cpp-0 = substituteSource {
      src = fetchgit {
        name = "as2_platform_crazyflie-vendor_source-crazyflie_cpp-0-source";
        url = "https://github.com/miferco97/crazyflie_cpp.git";
        rev = "b1aac13077633f7b505ed6c8029d587f18dece70";
        hash = "sha256-2vfisbhvW0JWdVLI+LmCsOe58iYySYlR62HT8S6ziOA=";
      };
      substitutions = [
        {
          path = "crazyflie-link-cpp/tools/build/Findlibusb.cmake";
          from = "DOWNLOAD\n                https://sourceforge.net/projects/libusb/files/libusb-1.0/libusb-\${LIBUSB_WIN_VERSION}/libusb-\${LIBUSB_WIN_VERSION}.7z/download";
          to = "DOWNLOAD file://${as2_platform_crazyflie-vendor_source-crazyflie_cpp-0-vendor_source-download-0}";
        }
      ];
    };
    as2_platform_crazyflie-vendor_source-crazyflie_cpp-0-vendor_source-download-0 = substituteSource {
      src = fetchurl {
        name = "as2_platform_crazyflie-vendor_source-crazyflie_cpp-0-vendor_source-download-0-source";
        url = "https://sourceforge.net/projects/libusb/files/libusb-1.0/libusb-1.0.24/libusb-1.0.24.7z/download";
        hash = "sha256-sfplupJI4stfBCxK6kL6TwJuGiNVP27TJdkK6rjCe8w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_platform_crazyflie";
  version = "1.0.9-1";
  src = sources.as2_platform_crazyflie;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ as2_core as2_msgs eigen geometry_msgs libusb1 nav_msgs rclcpp rclpy sensor_msgs std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
