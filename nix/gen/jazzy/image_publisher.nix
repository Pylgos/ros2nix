{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  camera_info_manager,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  rcl_interfaces,
  rclcpp,
  rclcpp_components,
  substituteSource,
}:
let
  sources = rec {
    image_publisher = substituteSource {
      src = fetchgit {
        name = "image_publisher-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "c4e0f661bfb6b8d580dd97dbc9da6659bee9657f";
        hash = "sha256-rCvf6YYtux2EQ6ZvJRxfSpkT2C2O820QhuvOUN2jBNg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_publisher";
  version = "5.0.1-3";
  src = sources.image_publisher;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_auto ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_info_manager cv_bridge image_transport rcl_interfaces rclcpp rclcpp_components ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
