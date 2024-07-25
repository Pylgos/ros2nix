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
  gz_math_vendor,
  gz_tools_vendor,
  protobuf,
  python3,
  python3Packages,
  substituteSource,
  tinyxml-2,
}:
let
  sources = rec {
    gz_msgs_vendor = substituteSource {
      src = fetchgit {
        name = "gz_msgs_vendor-source";
        url = "https://github.com/ros2-gbp/gz_msgs_vendor-release.git";
        rev = "00d3d27aedcd53deb0dd5636019e4a4ba4e73726";
        hash = "sha256-UeZCsC0B8FRuDCPwrSk72qIR2hBbols2kmWYWPLWB/g=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_msgs_vendor-vendor_source-gz-msgs-0}";
        }
      ];
    };
    gz_msgs_vendor-vendor_source-gz-msgs-0 = substituteSource {
      src = fetchgit {
        name = "gz_msgs_vendor-vendor_source-gz-msgs-0-source";
        url = "https://github.com/gazebosim/gz-msgs.git";
        rev = "876b89d5cab32d9ddfd5f95ce8cf365ce77f27ef";
        hash = "sha256-I08PdFwmORA8d0Ggt/JHHivDigRLvc6TJNNum8HcBQ0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_msgs_vendor";
  version = "0.1.1-1";
  src = sources.gz_msgs_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gz_cmake_vendor gz_math_vendor gz_tools_vendor protobuf python3 python3Packages.protobuf tinyxml-2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
