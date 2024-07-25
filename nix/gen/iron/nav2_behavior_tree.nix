{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  behaviortree_cpp_v3,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  lifecycle_msgs,
  nav2_common,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  test_msgs,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    nav2_behavior_tree = substituteSource {
      src = fetchgit {
        name = "nav2_behavior_tree-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "6b2d931e443c05fb871c1ccf9233aa6279026c51";
        hash = "sha256-V2CnkUmy2i5qxS5C1O9W7jj2BmqfvNVCuYDaFkW0Bro=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_behavior_tree";
  version = "1.2.9-1";
  src = sources.nav2_behavior_tree;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ behaviortree_cpp_v3 builtin_interfaces geometry_msgs lifecycle_msgs nav2_common nav2_msgs nav2_util nav_msgs rclcpp rclcpp_action rclcpp_lifecycle sensor_msgs std_msgs std_srvs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
