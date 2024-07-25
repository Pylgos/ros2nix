{
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  camera_info_manager,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg,
  image_transport,
  image_transport_plugins,
  rclcpp,
  rclcpp_components,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  v4l-utils,
}:
let
  sources = rec {
    usb_cam = substituteSource {
      src = fetchgit {
        name = "usb_cam-source";
        url = "https://github.com/ros2-gbp/usb_cam-release.git";
        rev = "ad40c2d26ff95b8a87f3f9b0e6772d125a44fe87";
        hash = "sha256-D4YStPBN+X8H0h6dWlVYgxuLYH5T7XWoyN0zLV5xN2E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "usb_cam";
  version = "0.8.1-1";
  src = sources.usb_cam;
  nativeBuildInputs = [ ament_cmake_auto rosidl_default_generators ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces camera_info_manager cv_bridge ffmpeg image_transport image_transport_plugins rclcpp rclcpp_components rosidl_default_runtime sensor_msgs std_msgs std_srvs v4l-utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}