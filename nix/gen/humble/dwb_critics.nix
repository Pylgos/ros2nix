{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  costmap_queue,
  dwb_core,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_common,
  nav2_costmap_2d,
  nav2_util,
  nav_2d_msgs,
  nav_2d_utils,
  pluginlib,
  rclcpp,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    dwb_critics = substituteSource {
      src = fetchgit {
        name = "dwb_critics-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "6cc93916efba4f96dcf6335967680905369cf567";
        hash = "sha256-JBNaxrVwsst4bBO5MoBgKg2bJKTCqmbzTeGrrjjlCW4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dwb_critics";
  version = "1.1.15-1";
  src = sources.dwb_critics;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles costmap_queue dwb_core geometry_msgs nav2_common nav2_costmap_2d nav2_util nav_2d_msgs nav_2d_utils pluginlib rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
