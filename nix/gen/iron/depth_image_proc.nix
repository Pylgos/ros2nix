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
        rev = "1556a18dddc145428b01e668d72416304b64c3db";
        hash = "sha256-BL6BlUQnWqlUYcFDgRXPzr+MWhYcTbPMaUeE7t2b0JE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depth_image_proc";
  version = "4.0.1-1";
  src = sources.depth_image_proc;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ class_loader cv_bridge image_geometry image_transport message_filters opencv rclcpp rclcpp_components sensor_msgs stereo_msgs tf2 tf2_eigen tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}