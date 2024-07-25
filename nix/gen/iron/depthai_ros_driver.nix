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
        rev = "c5d59b5c500bba376b1f0f4e1addcf935ce3e9d4";
        hash = "sha256-Lj6P2DCpaXnV13DdMKkeMEq2ydBQU3Kj0AGq/JQEnB4=";
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
