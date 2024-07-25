{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  ament_nodl,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  nodl_python,
  nodl_to_policy,
  rclcpp,
  rclcpp_components,
  rclpy,
  ros2launch_security,
  sensor_msgs,
  sros2,
  substituteSource,
}:
let
  sources = rec {
    ros2launch_security_examples = substituteSource {
      src = fetchgit {
        name = "ros2launch_security_examples-source";
        url = "https://github.com/ros2-gbp/ros2launch_security-release.git";
        rev = "0a4348ea553fc4418d73c3fa687f4a16124bf2d6";
        hash = "sha256-NWaQ/UIv5e//ahvk4u8zBHDsw6po6o9VLTnHTmXsQR8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2launch_security_examples";
  version = "1.0.0-3";
  src = sources.ros2launch_security_examples;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_nodl example_interfaces rclcpp rclcpp_components rclpy ros2launch_security sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
