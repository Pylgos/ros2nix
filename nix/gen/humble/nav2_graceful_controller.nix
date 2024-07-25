{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_common,
  nav2_controller,
  nav2_core,
  nav2_costmap_2d,
  nav2_msgs,
  nav2_util,
  nav_2d_utils,
  pluginlib,
  rclcpp,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    nav2_graceful_controller = substituteSource {
      src = fetchgit {
        name = "nav2_graceful_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "078fb620ca3b56dd39aae3069fe92d98f7c19bd7";
        hash = "sha256-OYhXJMomMYqbnNSTvppnIQZlZC3bcwzFSOkYrONm4xU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_graceful_controller";
  version = "1.1.15-1";
  src = sources.nav2_graceful_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles geometry_msgs nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util nav_2d_utils pluginlib rclcpp tf2 tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
