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
        rev = "08b2e1790425830ec2222fc4af40e8f5e4d7c1d4";
        hash = "sha256-Qm75h4oCQYJkfeX9zkHyo+YaSVzVNStI5X3cBapurNs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_publisher";
  version = "4.0.1-1";
  src = sources.image_publisher;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_info_manager cv_bridge image_transport rcl_interfaces rclcpp rclcpp_components ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
