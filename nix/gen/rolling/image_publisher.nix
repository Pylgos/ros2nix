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
        rev = "b533353f9cf2dfb499165fe5c7c4da989b145050";
        hash = "sha256-YEv9QMtRRp53Asc0TYsUdRbfT9cmt3GIKdi518KnROM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_publisher";
  version = "6.0.0-2";
  src = sources.image_publisher;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_info_manager cv_bridge image_transport rcl_interfaces rclcpp rclcpp_components ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
