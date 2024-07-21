{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  buildPackages,
  buildRosPackage,
  cppzmq,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_cmake_vendor,
  gz_math_vendor,
  gz_msgs_vendor,
  gz_tools_vendor,
  gz_utils_vendor,
  pkg-config,
  protobuf,
  python3,
  python3Packages,
  sqlite,
  substituteSource,
  util-linux,
}:
let
  sources = rec {
    gz_transport_vendor = substituteSource {
      src = fetchgit {
        name = "gz_transport_vendor-source";
        url = "https://github.com/ros2-gbp/gz_transport_vendor-release.git";
        rev = "33e5a3ebe1a76d899169a83140aec80998f19d36";
        hash = "sha256-2yv5Vn9MfAl0aHX9K8souz0y2RLiCXxvhgLeQIZUWns=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_transport_vendor-vendor_source0}";
        }
      ];
    };
    gz_transport_vendor-vendor_source0 = substituteSource {
      src = fetchgit {
        name = "gz_transport_vendor-vendor_source0-source";
        url = "https://github.com/gazebosim/gz-transport.git";
        rev = "8cfecd0469e409b7af82725727eb0efade731504";
        hash = "sha256-B6YvpZ8nSgAkhX9VXbxRHjYc9yfFE+qO1hw3S8xeXJc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_transport_vendor";
  version = "0.0.4-1";
  src = sources.gz_transport_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [ pkg-config python3 buildPackages.python3Packages.pytest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cppzmq gz_cmake_vendor gz_math_vendor gz_msgs_vendor gz_tools_vendor gz_utils_vendor protobuf python3Packages.psutil python3Packages.pybind11 sqlite util-linux ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
