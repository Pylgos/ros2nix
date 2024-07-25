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
        rev = "cbbb6b61985fc3dcfbdcefa0061022402c7f6b58";
        hash = "sha256-GtRpf3sXI2sMbpQzTcH5E262p+GcNIQH/u8RsBGWRkY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_pipeline";
  version = "3.0.4-1";
  src = sources.image_pipeline;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_calibration depth_image_proc image_proc image_publisher image_rotate image_view stereo_image_proc ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
