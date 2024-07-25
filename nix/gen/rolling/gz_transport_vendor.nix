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
        rev = "da35d0deb0a969653a599d67162940dd15995fe5";
        hash = "sha256-o0QdGiK+YZ3Qqcmq1P+0VvMBEXSam6viWkAE2HDj7B4=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_transport_vendor-vendor_source-gz-transport-0}";
        }
      ];
    };
    gz_transport_vendor-vendor_source-gz-transport-0 = substituteSource {
      src = fetchgit {
        name = "gz_transport_vendor-vendor_source-gz-transport-0-source";
        url = "https://github.com/gazebosim/gz-transport.git";
        rev = "a5af52592810c2aa4f2fec417cc736a18f616e93";
        hash = "sha256-4loRx7OU3RxVKggHUDLmbs9VGv0ZRKT+7J0ZDst/Xho=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_transport_vendor";
  version = "0.1.1-1";
  src = sources.gz_transport_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [ pkg-config python3 buildPackages.python3Packages.pytest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cppzmq gz_cmake_vendor gz_math_vendor gz_msgs_vendor gz_tools_vendor gz_utils_vendor protobuf python3Packages.psutil python3Packages.pybind11 sqlite util-linux ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
