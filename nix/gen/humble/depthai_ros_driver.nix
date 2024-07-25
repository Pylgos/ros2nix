{
  ament_cmake,
  ament_cmake_auto,
  buildRosPackage,
  camera_calibration,
  cv_bridge,
  depthai,
  depthai_bridge,
  depthai_descriptions,
  depthai_examples,
  depthai_ros_msgs,
  diagnostic_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  image_pipeline,
  image_transport,
  image_transport_plugins,
  pluginlib,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  vision_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    depthai_ros_driver = substituteSource {
      src = fetchgit {
        name = "depthai_ros_driver-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "10d71b86477217caa796fe92a5bc3579782d17d6";
        hash = "sha256-/S9dvxP9E0+4AfRjUTEzAFsWKwllijFyK28MdHAhe4I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthai_ros_driver";
  version = "2.9.0-1";
  src = sources.depthai_ros_driver;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_cmake_auto ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_calibration cv_bridge depthai depthai_bridge depthai_descriptions depthai_examples depthai_ros_msgs diagnostic_msgs diagnostic_updater image_pipeline image_transport image_transport_plugins pluginlib rclcpp rclcpp_components sensor_msgs std_msgs std_srvs vision_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
