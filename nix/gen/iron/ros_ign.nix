{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_gz,
  ros_ign_bridge,
  ros_ign_gazebo,
  ros_ign_gazebo_demos,
  ros_ign_image,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    ros_ign = substituteSource {
      src = fetchgit {
        name = "ros_ign-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "45ea092243a47119dffbc53db8cd7fb4e8f7f94d";
        hash = "sha256-Q2nPVBLC4M0t5TTUlhWYNDv+bIQZoz3Ri6rAl7Dk34Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_ign";
  version = "0.254.1-1";
  src = sources.ros_ign;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros_gz ros_ign_bridge ros_ign_gazebo ros_ign_gazebo_demos ros_ign_image ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
