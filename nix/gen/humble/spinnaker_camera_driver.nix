{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  camera_info_manager,
  curl,
  dpkg,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg,
  flir_camera_msgs,
  image_transport,
  libusb1,
  libyamlcpp,
  python3Packages,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    spinnaker_camera_driver = substituteSource {
      src = fetchgit {
        name = "spinnaker_camera_driver-source";
        url = "https://github.com/ros-drivers-gbp/flir_camera_driver-release.git";
        rev = "eef1b8978b2501d5f059d769c52e50209e8342a1";
        hash = "sha256-6YwWp426a1i5tKgvfa2JH6tOFeKv/VaWEJDcHHG6DR8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "spinnaker_camera_driver";
  version = "2.1.17-1";
  src = sources.spinnaker_camera_driver;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ];
  propagatedNativeBuildInputs = [ curl ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_info_manager dpkg ffmpeg flir_camera_msgs image_transport libusb1 libyamlcpp python3Packages.distro rclcpp rclcpp_components sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
