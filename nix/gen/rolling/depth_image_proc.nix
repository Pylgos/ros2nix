{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  class_loader,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_geometry,
  image_transport,
  message_filters,
  opencv,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  stereo_msgs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_ros,
}:
let
  sources = rec {
    depth_image_proc = substituteSource {
      src = fetchgit {
        name = "depth_image_proc-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "2ee2764b7ec04931a457a19dac219317bab324de";
        hash = "sha256-7WE0F2AEPXe+Z6Uo6mAqlO7+7jXHGuDA1tNp1gD/vh4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depth_image_proc";
  version = "6.0.0-2";
  src = sources.depth_image_proc;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ class_loader cv_bridge image_geometry image_transport message_filters opencv rclcpp rclcpp_components sensor_msgs stereo_msgs tf2 tf2_eigen tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
