{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pkg-config,
  substituteSource,
}:
let
  sources = rec {
    tracetools_image_pipeline = substituteSource {
      src = fetchgit {
        name = "tracetools_image_pipeline-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "aa5d9209d9f6dad33ae4d6708dd8ed30a5bdb99e";
        hash = "sha256-8np7N5q5alXqiCKQu6WipE6aZSSY4xMZ5bGkXYJVOlU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_image_pipeline";
  version = "5.0.1-3";
  src = sources.tracetools_image_pipeline;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_ros pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
