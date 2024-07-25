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
  nav2_util,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    nav2_collision_monitor = substituteSource {
      src = fetchgit {
        name = "nav2_collision_monitor-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "b2b485771f4415656a34ac53fda0d03d5e8b7db9";
        hash = "sha256-TszqKq/xUgqPQCyXXYuSCl+0guPexg7q+8aD0R1bBbs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_collision_monitor";
  version = "1.1.15-1";
  src = sources.nav2_collision_monitor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav2_common nav2_costmap_2d nav2_util rclcpp rclcpp_components sensor_msgs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
