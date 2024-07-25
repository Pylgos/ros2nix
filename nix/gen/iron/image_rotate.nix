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
        rev = "a8f428d218413afd06a2048b36995950e82e61bc";
        hash = "sha256-VkeK9ju/ZcfnoW400dVyBMtxVbvTCrEnVXDELDqmNxg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_rotate";
  version = "4.0.1-1";
  src = sources.image_rotate;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ class_loader cv_bridge geometry_msgs image_transport opencv rcl_interfaces rclcpp rclcpp_components sensor_msgs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
