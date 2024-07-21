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
  geometry_msgs,
  image_geometry,
  image_transport,
  opencv,
  rclcpp,
  rclcpp_components,
  rcutils,
  sensor_msgs,
  substituteSource,
  tracetools_image_pipeline,
}:
let
  sources = rec {
    image_proc = substituteSource {
      src = fetchgit {
        name = "image_proc-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "c5e017f304f10b5f50c80e0535098a386893c571";
        hash = "sha256-61ii9GHtv32LCTNpjAEzObW+P94iKkCgZXwweh8LnJ8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_proc";
  version = "5.0.1-3";
  src = sources.image_proc;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_calibration_parsers cv_bridge geometry_msgs image_geometry image_transport opencv rclcpp rclcpp_components rcutils sensor_msgs tracetools_image_pipeline ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
