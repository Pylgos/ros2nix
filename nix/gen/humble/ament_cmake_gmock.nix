{
  ament_cmake_core,
  ament_cmake_gtest,
  ament_cmake_test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gmock_vendor,
  gtest,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_gmock = substituteSource {
      src = fetchgit {
        name = "ament_cmake_gmock-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "594764d2cafd45716361d1dd6dedaa3845a14135";
        hash = "sha256-D3D8SnW5k7JTpAEOPyESB4U3XRD0gjNgWXrwm3x9sH4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_gmock";
  version = "1.3.9-1";
  src = sources.ament_cmake_gmock;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_gtest ament_cmake_test gmock_vendor gtest ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [ ament_cmake_gtest ament_cmake_test gmock_vendor gtest ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
