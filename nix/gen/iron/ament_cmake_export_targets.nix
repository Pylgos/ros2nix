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
        rev = "082fbb9e73208138b612a51034315ab051c37e53";
        hash = "sha256-svQkz5d1O1XX6k0D3+CP/ElsKnatSEDUH1vDpGwn/xs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_export_targets";
  version = "2.0.5-1";
  src = sources.ament_cmake_export_targets;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_export_libraries ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_export_libraries ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
