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
  python3Packages,
  rclcpp,
  rclcpp_components,
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
        rev = "06a85ee4b771769cb4e791a8d3a58c2d12a97db0";
        hash = "sha256-l10b/RkNCOYBSiaqf+PRxrVAARf7lxnQNW+ovVkGQ6A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_view";
  version = "3.0.4-1";
  src = sources.image_view;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_calibration_parsers cv_bridge image_transport message_filters python3Packages.boost rclcpp rclcpp_components sensor_msgs std_srvs stereo_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
