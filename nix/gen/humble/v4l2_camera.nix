{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  camera_info_manager,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    v4l2_camera = substituteSource {
      src = fetchgit {
        name = "v4l2_camera-source";
        url = "https://github.com/ros2-gbp/ros2_v4l2_camera-release.git";
        rev = "f4ec7fe46f373de96948d4d17ed7407757fe8148";
        hash = "sha256-pto+DWwkItusYVUr0vC5dJgNAYjQiCuYSwgqMjKEzD4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "v4l2_camera";
  version = "0.6.2-1";
  src = sources.v4l2_camera;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_info_manager cv_bridge image_transport rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
