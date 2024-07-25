{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hls_lfcd_lds_driver,
  joint_state_publisher,
  joy_linux,
  nav2_map_server,
  raspimouse,
  raspimouse_description,
  raspimouse_ros2_examples,
  robot_state_publisher,
  rplidar_ros,
  rviz2,
  slam_toolbox,
  substituteSource,
  urg_node,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    raspimouse_slam = substituteSource {
      src = fetchgit {
        name = "raspimouse_slam-source";
        url = "https://github.com/ros2-gbp/raspimouse_slam_navigation_ros2-release.git";
        rev = "b745809710e8cc86dd3f3aa56a3d4dfbd966884b";
        hash = "sha256-924w0qEgo+MpnXyzF6PouH18azVAGFQOoeM+gHZnWso=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "raspimouse_slam";
  version = "2.1.0-1";
  src = sources.raspimouse_slam;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ hls_lfcd_lds_driver joint_state_publisher joy_linux nav2_map_server raspimouse raspimouse_description raspimouse_ros2_examples robot_state_publisher rplidar_ros rviz2 slam_toolbox urg_node xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
