{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  backward_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    moveit_common = substituteSource {
      src = fetchgit {
        name = "moveit_common-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "275d2376bb4449b908587033ee872c21826d9efd";
        hash = "sha256-aVSA1vClO9jzsaz//tEO2eFLo2X1ZIdZdKoyimMBPhk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_common";
  version = "2.5.5-1";
  src = sources.moveit_common;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
