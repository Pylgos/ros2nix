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
        rev = "e14efbc9b6638ad8d339a53d676f7b287ef0a20c";
        hash = "sha256-JLUuMsR3nloER8TAjS9lmJ9ZAlhA35ar8den4ei3WSE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_schedule";
  version = "2.1.2-1";
  src = sources.rmf_visualization_schedule;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces eigen geometry_msgs openssl python3Packages.boost rclcpp rclcpp_components rmf_traffic rmf_traffic_msgs rmf_traffic_ros2 rmf_visualization_msgs visualization_msgs websocketpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
