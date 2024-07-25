{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  as2_core,
  as2_msgs,
  behaviortree_cpp_v3,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_behavior_tree,
  nav2_msgs,
  rclcpp,
  rclcpp_action,
  sensor_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    as2_behavior_tree = substituteSource {
      src = fetchgit {
        name = "as2_behavior_tree-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "375073b46eb5d48620fd61cac2623d644d360b7a";
        hash = "sha256-+iS3gNV57DiqPm+GJ+YkZ7pyzXgrqPlckBaSD3V6Bao=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_behavior_tree";
  version = "1.0.9-1";
  src = sources.as2_behavior_tree;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ as2_core as2_msgs behaviortree_cpp_v3 geometry_msgs nav2_behavior_tree nav2_msgs rclcpp rclcpp_action sensor_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
