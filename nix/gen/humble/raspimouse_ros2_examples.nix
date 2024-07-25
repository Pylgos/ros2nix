{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  hls_lfcd_lds_driver,
  joy_linux,
  nav2_map_server,
  opencv,
  raspimouse,
  raspimouse_msgs,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  rt_usb_9axisimu_driver,
  sensor_msgs,
  slam_toolbox,
  std_msgs,
  std_srvs,
  substituteSource,
  usb_cam,
  v4l-utils,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    raspimouse_ros2_examples = substituteSource {
      src = fetchgit {
        name = "raspimouse_ros2_examples-source";
        url = "https://github.com/ros2-gbp/raspimouse_ros2_examples-release.git";
        rev = "ad8a3cfc696b678883c4aaa488b0e6b660df28d9";
        hash = "sha256-WaoiQ6M3BzQe9q0DMhNa+8nMGid/krw0locRW6z7MhU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "raspimouse_ros2_examples";
  version = "2.2.0-2";
  src = sources.raspimouse_ros2_examples;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge geometry_msgs hls_lfcd_lds_driver joy_linux nav2_map_server opencv raspimouse raspimouse_msgs rclcpp rclcpp_components rclcpp_lifecycle rt_usb_9axisimu_driver sensor_msgs slam_toolbox std_msgs std_srvs usb_cam v4l-utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
