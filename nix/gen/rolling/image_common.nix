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
        rev = "f88ed22d4546732ac782cb09b0a9991e429a667a";
        hash = "sha256-6FsJj1fnuExnbAdpZk7xaqyYOOup8lDClRHuYtfVoeM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_common";
  version = "5.3.0-1";
  src = sources.image_common;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_calibration_parsers camera_info_manager image_transport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
