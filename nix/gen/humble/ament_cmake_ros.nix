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
        rev = "6acf4d960db2b92025ba4ca3e86b5d5240f817d1";
        hash = "sha256-fCRDap4nVGju+HLPT86v9gsHtGkQq/S3TyttMg+ykbI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_ros";
  version = "0.10.0-3";
  src = sources.ament_cmake_ros;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_cmake_gmock ament_cmake_gtest ament_cmake_pytest domain_coordinator ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake ament_cmake_gmock ament_cmake_gtest ament_cmake_pytest domain_coordinator ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
