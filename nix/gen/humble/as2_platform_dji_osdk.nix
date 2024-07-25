{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_cppcheck,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  as2_core,
  as2_msgs,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  libusb1,
  nav_msgs,
  rclcpp,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    as2_platform_dji_osdk = substituteSource {
      src = fetchgit {
        name = "as2_platform_dji_osdk-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "2d5f0a6c8d021bc52ba1895d61523d26e6951c13";
        hash = "sha256-GTXeg3rPs84bHPM+jSXr7I3uBhlKnUPLqrCt/BKzEu4=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/aerostack2/Onboard-SDK.git";
          to = "URL ${as2_platform_dji_osdk-vendor_source-Onboard-SDK-0}";
        }
      ];
    };
    as2_platform_dji_osdk-vendor_source-Onboard-SDK-0 = substituteSource {
      src = fetchgit {
        name = "as2_platform_dji_osdk-vendor_source-Onboard-SDK-0-source";
        url = "https://github.com/aerostack2/Onboard-SDK.git";
        rev = "0c4906b8341461835424a2ab87042d90fcf829bd";
        hash = "sha256-xzHCT8UGsXMVt8GqAy89wYIpichGkbqPSPfkzwpvg44=";
      };
      substitutions = [
        {
          path = "osdk-core/advanced-sensing/ori-osdk-core/cmake-modules/External_AdvancedSensing.cmake";
          from = "GIT_REPOSITORY https://github.com/dji-sdk/Onboard-SDK-Resources.git";
          to = "URL ${as2_platform_dji_osdk-vendor_source-Onboard-SDK-0-vendor_source-Onboard-SDK-Resources-0}";
        }
        {
          path = "osdk-core/advanced-sensing/ori-osdk-core/cmake-modules/External_WaypointV2Core.cmake";
          from = "GIT_REPOSITORY https://github.com/dji-sdk/Onboard-SDK-Resources.git";
          to = "URL ${as2_platform_dji_osdk-vendor_source-Onboard-SDK-0-vendor_source-Onboard-SDK-Resources-0}";
        }
        {
          path = "osdk-core/cmake-modules/External_AdvancedSensing.cmake";
          from = "GIT_REPOSITORY https://github.com/dji-sdk/Onboard-SDK-Resources.git";
          to = "URL ${as2_platform_dji_osdk-vendor_source-Onboard-SDK-0-vendor_source-Onboard-SDK-Resources-0}";
        }
        {
          path = "osdk-core/cmake-modules/External_WaypointV2Core.cmake";
          from = "GIT_REPOSITORY https://github.com/dji-sdk/Onboard-SDK-Resources.git";
          to = "URL ${as2_platform_dji_osdk-vendor_source-Onboard-SDK-0-vendor_source-Onboard-SDK-Resources-0}";
        }
      ];
    };
    as2_platform_dji_osdk-vendor_source-Onboard-SDK-0-vendor_source-Onboard-SDK-Resources-0 = substituteSource {
      src = fetchgit {
        name = "as2_platform_dji_osdk-vendor_source-Onboard-SDK-0-vendor_source-Onboard-SDK-Resources-0-source";
        url = "https://github.com/dji-sdk/Onboard-SDK-Resources.git";
        rev = "18044c5cce6745b65b6a5d09f9d1a109ad072a57";
        hash = "sha256-zoJNS0B8RsHBQ/FxnNc+h45ymUb2HM3E2DEJl28j1jY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_platform_dji_osdk";
  version = "1.0.9-1";
  src = sources.as2_platform_dji_osdk;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ as2_core as2_msgs geometry_msgs libusb1 nav_msgs rclcpp sensor_msgs std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
