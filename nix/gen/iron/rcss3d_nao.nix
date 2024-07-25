{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nao_command_msgs,
  nao_sensor_msgs,
  rclcpp_components,
  rcss3d_agent,
  rcss3d_agent_msgs_to_soccer_interfaces,
  soccer_vision_3d_msgs,
  substituteSource,
}:
let
  sources = rec {
    rcss3d_nao = substituteSource {
      src = fetchgit {
        name = "rcss3d_nao-source";
        url = "https://github.com/ros2-gbp/rcss3d_nao-release.git";
        rev = "995f6827d8c3d23082feb8bcc906ec534cf502b6";
        hash = "sha256-kiydlR35nLodRNpS+Qbo+TMTCXy8cFfUK4qSPpTk0NA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcss3d_nao";
  version = "0.1.1-3";
  src = sources.rcss3d_nao;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nao_command_msgs nao_sensor_msgs rclcpp_components rcss3d_agent rcss3d_agent_msgs_to_soccer_interfaces soccer_vision_3d_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
