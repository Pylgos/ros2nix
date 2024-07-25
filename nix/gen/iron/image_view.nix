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
        rev = "27f774d5dc634efdabdd9113ada49454491e9847";
        hash = "sha256-bMF7kr6HJJVK/1/2NOAiSJui/KvwL73LziLmNv0ONDg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_view";
  version = "4.0.1-1";
  src = sources.image_view;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_calibration_parsers cv_bridge image_transport message_filters python3Packages.boost rclcpp rclcpp_components sensor_msgs std_srvs stereo_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
