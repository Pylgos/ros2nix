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
        rev = "e9a09c090104413b528d4159ae2f1809b21bcffe";
        hash = "sha256-A3UJH56L9RqM22VeUzSHDdu9vvgeJ853mhmhOu8faMo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_publisher";
  version = "3.0.4-1";
  src = sources.image_publisher;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_info_manager cv_bridge image_transport rcl_interfaces rclcpp rclcpp_components ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
