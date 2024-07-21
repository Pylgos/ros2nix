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
        url = "https://github.com/ros2-gbp/flir_camera_driver-release.git";
        rev = "7c6a3104f5cc1e7f807d2533cda87da5bf75e416";
        hash = "sha256-MTLkSEO/NkdU6Fa/1zhCvcWbcyRFQ58qqX66+pGBmdk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "spinnaker_camera_driver";
  version = "2.0.20-1";
  src = sources.spinnaker_camera_driver;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros curl ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ dpkg python3Packages.distro ];
  propagatedBuildInputs = [ camera_info_manager ffmpeg flir_camera_msgs image_transport libusb1 libyamlcpp rclcpp rclcpp_components sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
