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
        rev = "17ade65a99bd2a8bd9165f7dd74971daaa5a2b2b";
        hash = "sha256-KZyyPJ+d130napDrvvc50O3+oZFZnW8ROLijimBhFTs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_gmock";
  version = "2.0.5-1";
  src = sources.ament_cmake_gmock;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_gtest ament_cmake_test gmock_vendor gtest ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [ ament_cmake_gtest ament_cmake_test gmock_vendor gtest ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
