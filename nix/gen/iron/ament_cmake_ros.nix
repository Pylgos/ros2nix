{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  domain_coordinator,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_ros = substituteSource {
      src = fetchgit {
        name = "ament_cmake_ros-source";
        url = "https://github.com/ros2-gbp/ament_cmake_ros-release.git";
        rev = "28e47b373a89c9d785f8d2fee4c9f3ad6daf1905";
        hash = "sha256-xeyQa+UOb2cRFCae72YJN1rCZFTrYVNFSkojFlsVzO0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_ros";
  version = "0.11.2-4";
  src = sources.ament_cmake_ros;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_cmake_gmock ament_cmake_gtest ament_cmake_pytest domain_coordinator ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake ament_cmake_gmock ament_cmake_gtest ament_cmake_pytest domain_coordinator ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
