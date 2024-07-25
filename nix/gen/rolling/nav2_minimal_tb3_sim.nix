{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  robot_state_publisher,
  ros_gz_bridge,
  ros_gz_image,
  ros_gz_interfaces,
  ros_gz_sim,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    nav2_minimal_tb3_sim = substituteSource {
      src = fetchgit {
        name = "nav2_minimal_tb3_sim-source";
        url = "https://github.com/ros-navigation/nav2_minimal_turtlebot_simulation-release.git";
        rev = "54c4b2648499e75baf33be986998e108f50d6490";
        hash = "sha256-ooAXS+KL4tKLDGNN5Esp22qX9t3i+RPs0BYlWK40mng=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_minimal_tb3_sim";
  version = "1.0.1-1";
  src = sources.nav2_minimal_tb3_sim;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ robot_state_publisher ros_gz_bridge ros_gz_image ros_gz_interfaces ros_gz_sim xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}