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
        rev = "e36b47c7a817f4f13a53124a0fcc0a4230d24589";
        hash = "sha256-YkqOrcqMX8vmBZm2llfopDtrE75rah4TxGZCAiDfWpo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "keyboard_handler";
  version = "0.0.5-1";
  src = sources.keyboard_handler;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
