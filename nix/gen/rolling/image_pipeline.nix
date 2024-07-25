{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  camera_calibration,
  depth_image_proc,
  fetchgit,
  fetchurl,
  fetchzip,
  image_proc,
  image_publisher,
  image_rotate,
  image_view,
  stereo_image_proc,
  substituteSource,
}:
let
  sources = rec {
    image_pipeline = substituteSource {
      src = fetchgit {
        name = "image_pipeline-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "7bd70b1cb4961fe8905b6b18176e4fe6cd3c63d7";
        hash = "sha256-JLPYHYgnIqmk+jMg9qSMG1tW/KHJFvEUeM7DVbZjtrc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_pipeline";
  version = "6.0.0-2";
  src = sources.image_pipeline;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_calibration depth_image_proc image_proc image_publisher image_rotate image_view stereo_image_proc ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
