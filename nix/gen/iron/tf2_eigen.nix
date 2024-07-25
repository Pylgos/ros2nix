{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    tf2_eigen = substituteSource {
      src = fetchgit {
        name = "tf2_eigen-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "c9a37b69fa9e657dca490e299d0f9262c931cb10";
        hash = "sha256-SsenzqbR6TLgvPLR3WZa03ICVrjyjXT9za4WjhvI8MI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_eigen";
  version = "0.31.7-1";
  src = sources.tf2_eigen;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometry_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
