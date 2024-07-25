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
        rev = "b8f1a9caa43541b1c537a7c5e9af9224b8d7dfc5";
        hash = "sha256-7FL4TRiuwtc6+KH+UKulskZGdwHR88/FF3aKBc5uthk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_common";
  version = "2.8.0-1";
  src = sources.moveit_common;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
