{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_common,
  nav2_costmap_2d,
  nav2_msgs,
  nav2_util,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    nav2_collision_monitor = substituteSource {
      src = fetchgit {
        name = "nav2_collision_monitor-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "ef155db44dfc3c411c4014dd389f51336b7c1a31";
        hash = "sha256-ARkbUHGFqtAY2Yba9jKhKWGIveAQtZbnBE8bLSA3LUo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_collision_monitor";
  version = "1.2.9-1";
  src = sources.nav2_collision_monitor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav2_common nav2_costmap_2d nav2_msgs nav2_util rclcpp rclcpp_components sensor_msgs tf2 tf2_geometry_msgs tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
