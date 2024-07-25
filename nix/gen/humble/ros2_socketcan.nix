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
  substituteSource,
}:
let
  sources = rec {
    ros2_socketcan = substituteSource {
      src = fetchgit {
        name = "ros2_socketcan-source";
        url = "https://github.com/ros2-gbp/ros2_socketcan-release.git";
        rev = "74aed3f47cf18318513287f579b6b307df719be7";
        hash = "sha256-5X1Zt8nQDN5Bp9dZgz8CzQW6gMNhDsjMt0D6P1X/JSg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2_socketcan";
  version = "1.1.0-3";
  src = sources.ros2_socketcan;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ can_msgs lifecycle_msgs rclcpp rclcpp_components rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
