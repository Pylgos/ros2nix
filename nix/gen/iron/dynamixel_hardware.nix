{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  dynamixel_workbench_toolbox,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  lifecycle_msgs,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  substituteSource,
}:
let
  sources = rec {
    dynamixel_hardware = substituteSource {
      src = fetchgit {
        name = "dynamixel_hardware-source";
        url = "https://github.com/ros2-gbp/dynamixel_hardware-release.git";
        rev = "6897eaa85a4238225b807475c251f4b1d0dce4f3";
        hash = "sha256-uTKSmD6pAlytbDC+UB3MUn7vyLbKhZYPPajMIhZumrU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dynamixel_hardware";
  version = "0.4.0-1";
  src = sources.dynamixel_hardware;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dynamixel_workbench_toolbox hardware_interface lifecycle_msgs pluginlib rclcpp rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
