{
  ament_cmake_core,
  ament_cmake_export_libraries,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_export_targets = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_targets-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "28e27a57ac94cae88d805e0d21edd1aa9e5ffe4f";
        hash = "sha256-9PeCosWc1Z0NcV22mIdh/yv7Iw2FCOTxCh3A/UkqvZ0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_export_targets";
  version = "1.3.9-1";
  src = sources.ament_cmake_export_targets;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_export_libraries ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_export_libraries ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
