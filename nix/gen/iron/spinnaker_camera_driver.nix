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
        rev = "986c11c67cb93ffa5fb6fbbf90690760ba653316";
        hash = "sha256-Mu72TxRZJ2TAReEoOJuXk2PfS03yfcZPKunV/bNj9zE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "spinnaker_camera_driver";
  version = "2.2.17-1";
  src = sources.spinnaker_camera_driver;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ];
  propagatedNativeBuildInputs = [ curl ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_info_manager dpkg ffmpeg flir_camera_msgs image_transport libusb1 libyamlcpp python3Packages.distro rclcpp rclcpp_components sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
