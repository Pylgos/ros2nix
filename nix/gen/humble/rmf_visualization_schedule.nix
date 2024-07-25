{
  ament_cmake,
  ament_cmake_uncrustify,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  openssl,
  python3Packages,
  rclcpp,
  rclcpp_components,
  rmf_traffic,
  rmf_traffic_msgs,
  rmf_traffic_ros2,
  rmf_utils,
  rmf_visualization_msgs,
  rosidl_default_generators,
  substituteSource,
  visualization_msgs,
  websocketpp,
}:
let
  sources = rec {
    rmf_visualization_schedule = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_schedule-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "1878a788bfea6e620ff6b0b9012908dd8668f449";
        hash = "sha256-et7j5IfWd+n2YDwgGGZ8E1IQsWv2ZkWc2c2i/ySHCE4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_schedule";
  version = "2.0.2-1";
  src = sources.rmf_visualization_schedule;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces eigen geometry_msgs openssl python3Packages.boost rclcpp rclcpp_components rmf_traffic rmf_traffic_msgs rmf_traffic_ros2 rmf_visualization_msgs visualization_msgs websocketpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
