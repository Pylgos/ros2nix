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
        rev = "bfef3f5632d841c321d2209afafc9ed9a0375c7e";
        hash = "sha256-SUowQaQbHpPMbkighp3Tn4EH9ubUZGTG+Wms/jfb11Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_ign_gazebo_demos";
  version = "0.254.1-1";
  src = sources.ros_ign_gazebo_demos;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros_gz_sim_demos ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
