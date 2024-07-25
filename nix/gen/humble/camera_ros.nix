{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_cppcheck,
  ament_lint_auto,
  buildRosPackage,
  camera_info_manager,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  libcamera,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    camera_ros = substituteSource {
      src = fetchgit {
        name = "camera_ros-source";
        url = "https://github.com/ros2-gbp/camera_ros-release.git";
        rev = "b3a09a18a346563487686a911fac8cbffce9998b";
        hash = "sha256-sFVniUYfMlC1ONcJ9bLQUfenWI8kU57SCviAeY0P/58=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "camera_ros";
  version = "0.1.0-2";
  src = sources.camera_ros;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_info_manager cv_bridge libcamera rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
