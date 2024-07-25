{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_clang_format,
  ament_cmake_copyright,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_lint_cmake,
  ament_cmake_ros,
  ament_cmake_xmllint,
  buildRosPackage,
  camera_info_manager,
  event_camera_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  libcaer_vendor,
  rclcpp,
  rclcpp_components,
  ros_environment,
  sensor_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    libcaer_driver = substituteSource {
      src = fetchgit {
        name = "libcaer_driver-source";
        url = "https://github.com/ros2-gbp/libcaer_driver-release.git";
        rev = "9c38a50a041ebb6edc266aded2f4b0397015a346";
        hash = "sha256-/3D75DhTxCkrpa2PFIqxoLiW5Kwrw3jrsqAs55CQ414=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libcaer_driver";
  version = "1.1.3-1";
  src = sources.libcaer_driver;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ament_cmake_ros ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_info_manager event_camera_msgs image_transport libcaer_vendor rclcpp rclcpp_components sensor_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
