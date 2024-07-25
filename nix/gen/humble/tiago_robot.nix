{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  tiago_bringup,
  tiago_controller_configuration,
  tiago_description,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    tiago_robot = substituteSource {
      src = fetchgit {
        name = "tiago_robot-source";
        url = "https://github.com/pal-gbp/tiago_robot-release.git";
        rev = "89a4928896e626bad8cb03df9be5142ed9a01294";
        hash = "sha256-5rl/kJjJOCHP4dZvBWNJW9PT5KAUbDPha7Yc+OOKFI8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tiago_robot";
  version = "4.2.16-1";
  src = sources.tiago_robot;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ tiago_bringup tiago_controller_configuration tiago_description ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
