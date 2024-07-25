{
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  can_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  ros2_socketcan_msgs,
  substituteSource,
}:
let
  sources = rec {
    ros2_socketcan = substituteSource {
      src = fetchgit {
        name = "ros2_socketcan-source";
        url = "https://github.com/ros2-gbp/ros2_socketcan-release.git";
        rev = "ecad993bfe40dbc23aa278c7e233ba92842e2467";
        hash = "sha256-C7sHXShjAPuT3+vpDoihoprvWh93i9HpJyVHbnZFfkY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2_socketcan";
  version = "1.2.0-2";
  src = sources.ros2_socketcan;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ can_msgs lifecycle_msgs rclcpp rclcpp_components rclcpp_lifecycle ros2_socketcan_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
