{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  behaviortree_cpp,
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
        rev = "4194188ae497e71da48bb64a1f24ab2bbea5188e";
        hash = "sha256-0+wrWPtw2GqubuDNVIOPHvDxcxxiHWjUJKECRvej0yc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_behavior_tree";
  version = "1.3.1-1";
  src = sources.nav2_behavior_tree;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ nav2_common ];
  propagatedBuildInputs = [ behaviortree_cpp builtin_interfaces geometry_msgs lifecycle_msgs nav2_msgs nav2_util nav_msgs rclcpp rclcpp_action rclcpp_lifecycle sensor_msgs std_msgs std_srvs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}