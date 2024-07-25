{
  ament_cmake,
  ament_cmake_gmock,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    keyboard_handler = substituteSource {
      src = fetchgit {
        name = "keyboard_handler-source";
        url = "https://github.com/ros2-gbp/keyboard_handler-release.git";
        rev = "5d080d5a961577002ce700f91ce3327daf7c9a7a";
        hash = "sha256-fkpRaQUbznewITMBQDBbm300KUlbGpzm11LxI1Qc+1w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "keyboard_handler";
  version = "0.1.0-3";
  src = sources.keyboard_handler;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
