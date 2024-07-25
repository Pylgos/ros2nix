{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  buildRosPackage,
  builtin_interfaces,
  cv_bridge,
  diagnostic_updater,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  image_transport,
  launch_pytest,
  launch_ros,
  launch_testing,
  librealsense2,
  nav_msgs,
  python3Packages,
  rclcpp,
  rclcpp_components,
  realsense2_camera_msgs,
  ros2topic,
  ros_environment,
  sensor_msgs,
  sensor_msgs_py,
  std_msgs,
  substituteSource,
  tf2,
  tf2_ros,
  tf2_ros_py,
}:
let
  sources = rec {
    realsense2_camera = substituteSource {
      src = fetchgit {
        name = "realsense2_camera-source";
        url = "https://github.com/IntelRealSense/realsense-ros-release.git";
        rev = "d5f4b990f3c0442ae3ebdeb3b4d3c7f3418eee37";
        hash = "sha256-c2wfa1utlBJZz2+I1RxAkJ0nCgphhWnnx612ltPXNMo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "realsense2_camera";
  version = "4.55.1-1";
  src = sources.realsense2_camera;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces cv_bridge diagnostic_updater eigen geometry_msgs image_transport launch_ros librealsense2 nav_msgs rclcpp rclcpp_components realsense2_camera_msgs sensor_msgs std_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
