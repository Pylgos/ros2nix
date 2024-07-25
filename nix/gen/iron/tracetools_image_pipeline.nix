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
        rev = "63e5b29a1b8dbb18b778a881aeea5b518e911d1c";
        hash = "sha256-ajj0+ELuTFU0qlOkBfTzbHP/vo6RTSapmB8yFEN3KJ8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_image_pipeline";
  version = "4.0.1-1";
  src = sources.tracetools_image_pipeline;
  nativeBuildInputs = [ ament_cmake_ros pkg-config ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
