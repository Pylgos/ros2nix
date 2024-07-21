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
        rev = "18c035d7f59a0e73283468dcd3cf8c7022d3315f";
        hash = "sha256-N0N+HMjbSycAwW2nS20h/zbMe6ZMUEqDsZ7pDUV9jZU=";
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
        rev = "78e664a544cdc17e39a86507eec8aaf753a3dbc4";
        hash = "sha256-/RFzosggLDq5eGfvrcF4Ka/VfHQtZIQprMkY7rd8cZg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_msgs_vendor";
  version = "0.0.3-1";
  src = sources.gz_msgs_vendor;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gz_cmake_vendor gz_math_vendor gz_tools_vendor protobuf python3 python3Packages.protobuf tinyxml-2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
