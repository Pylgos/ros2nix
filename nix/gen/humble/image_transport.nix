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
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    image_transport = substituteSource {
      src = fetchgit {
        name = "image_transport-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "4bfb3aeeca73a54ca6c89f3037a9dbd7a6c29cf6";
        hash = "sha256-s3PLoqTwm0GNFwHBA211XkWjdz0xJ/bEwwI1zRw/FuY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_transport";
  version = "3.1.9-1";
  src = sources.image_transport;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ message_filters pluginlib rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
