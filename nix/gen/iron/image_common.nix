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
        rev = "897ef32e3da0fd08cff4eb10d213697c322d14fe";
        hash = "sha256-SAPhY41aFYSEQbOrxOA5GKDI2ou2Q8T+eImE92lm2jQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_common";
  version = "4.2.4-1";
  src = sources.image_common;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_calibration_parsers camera_info_manager image_transport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
