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
        rev = "fb613a74c7be864c5ad08ebddbb273f0cbaff2e2";
        hash = "sha256-aAN1Fk+lI3Mp7VOS2cmzyYcmUfJBgtWlnXKs4Y2yVDk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_transport";
  version = "5.3.0-1";
  src = sources.image_transport;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ message_filters pluginlib rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
