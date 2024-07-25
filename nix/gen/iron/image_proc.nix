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
        rev = "676b0cc5047c540b2d5ebcc48bc0c06fd17f793b";
        hash = "sha256-tKziDyjvG8Kk70xzI2RkLHsfEOi0oA4Y8wizQwRqEDI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_proc";
  version = "4.0.1-1";
  src = sources.image_proc;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_geometry image_transport opencv rclcpp rclcpp_components rcutils sensor_msgs tracetools_image_pipeline ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
