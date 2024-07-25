{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  camera_calibration_parsers,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  message_filters,
  rclcpp,
  rclcpp_components,
  rclpy,
  sensor_msgs,
  std_srvs,
  stereo_msgs,
  substituteSource,
}:
let
  sources = rec {
    image_view = substituteSource {
      src = fetchgit {
        name = "image_view-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "2fbeb5a06febda543f5353f7e85ac5584b600bcf";
        hash = "sha256-3rImHbozxjZSS3yY0mXcG9/QUFTFlx6sLmegjx4uq7k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_view";
  version = "6.0.0-2";
  src = sources.image_view;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_calibration_parsers cv_bridge image_transport message_filters rclcpp rclcpp_components rclpy sensor_msgs std_srvs stereo_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
