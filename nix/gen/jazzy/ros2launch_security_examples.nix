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
        rev = "ffa975e487020ef5c667a0e2c5950fbf9a0fcfca";
        hash = "sha256-NWaQ/UIv5e//ahvk4u8zBHDsw6po6o9VLTnHTmXsQR8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2launch_security_examples";
  version = "1.0.0-5";
  src = sources.ros2launch_security_examples;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_nodl example_interfaces rclcpp rclcpp_components rclpy ros2launch_security sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}