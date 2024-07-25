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
        rev = "01c507088be4d5fbea9ff0c56f1182f94cc8ed4b";
        hash = "sha256-k78UkzMDS+eZh3WI/oQSFKXzSSLeUrD7D4mjCIb1ci0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_pipeline";
  version = "4.0.1-1";
  src = sources.image_pipeline;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_calibration depth_image_proc image_proc image_publisher image_rotate image_view stereo_image_proc ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
