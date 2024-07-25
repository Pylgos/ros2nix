{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_gz_sim_demos,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    ros_ign_gazebo_demos = substituteSource {
      src = fetchgit {
        name = "ros_ign_gazebo_demos-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "88ab8d02e56133de601de2b5a45fc3b1ac243a31";
        hash = "sha256-YVxKkriAuMjUxBEcxvDET2zppE81EhfaYsN65h1Saro=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_ign_gazebo_demos";
  version = "0.244.15-1";
  src = sources.ros_ign_gazebo_demos;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros_gz_sim_demos ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
