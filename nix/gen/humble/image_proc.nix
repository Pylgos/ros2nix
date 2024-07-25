{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
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
        rev = "8a88a095bf39e620b84e708fc14e665462d57ea5";
        hash = "sha256-6N8xpli7XhYcBON/CaKgF45Ywfxp073bO2IQIdoV5QY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_proc";
  version = "3.0.4-1";
  src = sources.image_proc;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_geometry image_transport opencv rclcpp rclcpp_components rcutils sensor_msgs tracetools_image_pipeline ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
