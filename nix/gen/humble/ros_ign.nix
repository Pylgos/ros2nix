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
        rev = "41f996df4c9535d82c174d65a60f591a33e8f805";
        hash = "sha256-6l878qhg677Xoyksk+er1VWCObrcV0yX3OAmW78oz5w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_ign";
  version = "0.244.15-1";
  src = sources.ros_ign;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros_gz ros_ign_bridge ros_ign_gazebo ros_ign_gazebo_demos ros_ign_image ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
