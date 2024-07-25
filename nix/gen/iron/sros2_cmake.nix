{
  ament_cmake,
  ament_cmake_test,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros2cli,
  sros2,
  substituteSource,
}:
let
  sources = rec {
    sros2_cmake = substituteSource {
      src = fetchgit {
        name = "sros2_cmake-source";
        url = "https://github.com/ros2-gbp/sros2-release.git";
        rev = "a42d9fb726c1289383f67305eebd0b8420ca3a5b";
        hash = "sha256-AbsUOeYCQ9NvCvLYise6Q6MwZGvhRcZlYNEgX8GYQrY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sros2_cmake";
  version = "0.11.3-1";
  src = sources.sros2_cmake;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_test ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2cli sros2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
