{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hls_lfcd_lds_driver,
  robot_state_publisher,
  rviz2,
  substituteSource,
  turtlebot3_description,
  turtlebot3_node,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot3_bringup = substituteSource {
      src = fetchgit {
        name = "turtlebot3_bringup-source";
        url = "https://github.com/robotis-ros2-release/turtlebot3-release.git";
        rev = "5121818f1c0142a7f7ad239ab6a2b90236f48c02";
        hash = "sha256-0m2+/8Oye5Qk19fp/cOQkyo72vulfnZKi0Gmq9DIJcg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_bringup";
  version = "2.1.5-1";
  src = sources.turtlebot3_bringup;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ hls_lfcd_lds_driver robot_state_publisher rviz2 turtlebot3_description turtlebot3_node ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
