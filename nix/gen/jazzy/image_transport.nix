{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  message_filters,
  pluginlib,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    image_transport = substituteSource {
      src = fetchgit {
        name = "image_transport-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "d1ebdfe1ed0dc2c90d16fa624fc21fe23bce6122";
        hash = "sha256-01/wzTSHt4s99cW7SmDH6W+kpY4ehCc4WbIcsq8Uws8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_transport";
  version = "5.1.4-1";
  src = sources.image_transport;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_ros ];
  buildInputs = [  ];
  propagatedBuildInputs = [ message_filters pluginlib rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
