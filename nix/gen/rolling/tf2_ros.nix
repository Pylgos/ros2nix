{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  message_filters,
  rcl_interfaces,
  rclcpp,
  rclcpp_action,
  rclcpp_components,
  rosgraph_msgs,
  substituteSource,
  tf2,
  tf2_msgs,
}:
let
  sources = rec {
    tf2_ros = substituteSource {
      src = fetchgit {
        name = "tf2_ros-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "17f4a1adf5d689082beffc9d116447a855fb68af";
        hash = "sha256-zz3C3BAfApvI7CfTHWh028ZibEHexSAgCcJ/ST9/0ec=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_ros";
  version = "0.38.0-1";
  src = sources.tf2_ros;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs message_filters rcl_interfaces rclcpp rclcpp_action rclcpp_components tf2 tf2_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
