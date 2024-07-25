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
        rev = "ea0e558b9e202cece88915db5a1dd4ed5afe817d";
        hash = "sha256-xgiQE809rdtR+M631XwAm8i3ebrPuHWiXxrDmhXi/yQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_transport";
  version = "4.2.4-1";
  src = sources.image_transport;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ message_filters pluginlib rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
