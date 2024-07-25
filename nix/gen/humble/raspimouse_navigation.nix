{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hls_lfcd_lds_driver,
  nav2_bringup,
  raspimouse,
  raspimouse_slam,
  rplidar_ros,
  rviz2,
  substituteSource,
  urg_node,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    raspimouse_navigation = substituteSource {
      src = fetchgit {
        name = "raspimouse_navigation-source";
        url = "https://github.com/ros2-gbp/raspimouse_slam_navigation_ros2-release.git";
        rev = "380c2be291c396b2d49add0f62076e8f0e81f08f";
        hash = "sha256-FRlSW5imRyO/tMJqBD0pK8LE2nkRLCocp68wfa+ZX+o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "raspimouse_navigation";
  version = "2.1.0-1";
  src = sources.raspimouse_navigation;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ hls_lfcd_lds_driver nav2_bringup raspimouse raspimouse_slam rplidar_ros rviz2 urg_node ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
