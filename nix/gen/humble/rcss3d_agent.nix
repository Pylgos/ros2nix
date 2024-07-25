{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rcss3d_agent_msgs,
  substituteSource,
}:
let
  sources = rec {
    rcss3d_agent = substituteSource {
      src = fetchgit {
        name = "rcss3d_agent-source";
        url = "https://github.com/ros2-gbp/rcss3d_agent-release.git";
        rev = "8cdfd925ac37a95d8ad28ccb7f91f023adc7cc92";
        hash = "sha256-20VvRemKR1Wv/aezwF9TAU3NH/pYY1sABOAOXXO1ggE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcss3d_agent";
  version = "0.2.2-1";
  src = sources.rcss3d_agent;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rcss3d_agent_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
