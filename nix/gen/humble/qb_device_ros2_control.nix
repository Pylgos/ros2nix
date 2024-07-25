{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  pluginlib,
  qb_device_msgs,
  rclcpp,
  rclcpp_lifecycle,
  substituteSource,
  transmission_interface,
}:
let
  sources = rec {
    qb_device_ros2_control = substituteSource {
      src = fetchgit {
        name = "qb_device_ros2_control-source";
        url = "https://bitbucket.org/qbrobotics/qbdevice-ros2-release.git";
        rev = "c2d59e97a7d37a1d8feb1a707158da5a42b6e264";
        hash = "sha256-f8MBOr6MpJ/o25Xo75t3zp81nO+Cx5q3n1xL5ZZWsPk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qb_device_ros2_control";
  version = "4.1.3-1";
  src = sources.qb_device_ros2_control;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager hardware_interface pluginlib qb_device_msgs rclcpp rclcpp_lifecycle transmission_interface ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
