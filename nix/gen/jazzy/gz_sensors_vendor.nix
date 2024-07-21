{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_cmake_vendor,
  gz_common_vendor,
  gz_math_vendor,
  gz_msgs_vendor,
  gz_rendering_vendor,
  gz_tools_vendor,
  gz_transport_vendor,
  sdformat_vendor,
  substituteSource,
  xorg,
}:
let
  sources = rec {
    gz_sensors_vendor = substituteSource {
      src = fetchgit {
        name = "gz_sensors_vendor-source";
        url = "https://github.com/ros2-gbp/gz_sensors_vendor-release.git";
        rev = "faa054907e5b2168e7f5513877938e6635bb4463";
        hash = "sha256-8L5/tSyH6kkVWR1hK3tjTTehcWK6UTcrzwfo74BoBzU=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_sensors_vendor-vendor_source0}";
        }
      ];
    };
    gz_sensors_vendor-vendor_source0 = substituteSource {
      src = fetchgit {
        name = "gz_sensors_vendor-vendor_source0-source";
        url = "https://github.com/gazebosim/gz-sensors.git";
        rev = "27239b4ac9877d87273a18010a307172899dd7a6";
        hash = "sha256-JK2xOQKvX+0fcnN0e1JcARMx+Lsq8DfkXDHDRiTfuw0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_sensors_vendor";
  version = "0.0.3-1";
  src = sources.gz_sensors_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gz_cmake_vendor gz_common_vendor gz_math_vendor gz_msgs_vendor gz_rendering_vendor gz_tools_vendor gz_transport_vendor sdformat_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
