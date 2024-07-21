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
  geometry_msgs,
  image_transport,
  opencv,
  rcl_interfaces,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    image_rotate = substituteSource {
      src = fetchgit {
        name = "image_rotate-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "84c4621d08f01cbe11bcf140676d9151f389adc0";
        hash = "sha256-YDukvBMdCCegsNqlFs3t7+DZR6n+9j4bNtBxdlviiSQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_rotate";
  version = "5.0.1-3";
  src = sources.image_rotate;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_auto ];
  buildInputs = [  ];
  propagatedBuildInputs = [ class_loader cv_bridge geometry_msgs image_transport opencv rcl_interfaces rclcpp rclcpp_components sensor_msgs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
