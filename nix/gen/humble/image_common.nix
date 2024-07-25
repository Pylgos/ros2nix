{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  camera_calibration_parsers,
  camera_info_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  substituteSource,
}:
let
  sources = rec {
    image_common = substituteSource {
      src = fetchgit {
        name = "image_common-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "074cd45db37673a0f00fb6a7ef231ebbc0f26203";
        hash = "sha256-gCE4cUTso+J98qlCaFNVzGR+ubfP+hFYR8zsnMgwZ1A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_common";
  version = "3.1.9-1";
  src = sources.image_common;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_calibration_parsers camera_info_manager image_transport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
