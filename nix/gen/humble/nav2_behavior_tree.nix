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
        rev = "93172344714dcafddea51de656ad4afcbf8a8b0c";
        hash = "sha256-xg0/IObiOmNJNNkIOargEpTBRhLwY/e8cgk7u07/Mho=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_behavior_tree";
  version = "1.1.15-1";
  src = sources.nav2_behavior_tree;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ behaviortree_cpp_v3 builtin_interfaces geometry_msgs lifecycle_msgs nav2_common nav2_msgs nav2_util nav_msgs rclcpp rclcpp_action rclcpp_lifecycle sensor_msgs std_msgs std_srvs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
