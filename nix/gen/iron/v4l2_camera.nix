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
        rev = "9cd9806d22eb951e2d926ee5dead89cd5a940de0";
        hash = "sha256-6S98n6I3/xURpJWEnmj4IbQ1MRqpVmM45olPZget7ac=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "v4l2_camera";
  version = "0.6.1-3";
  src = sources.v4l2_camera;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_info_manager cv_bridge image_transport rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
