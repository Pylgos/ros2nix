{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_export_definitions = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_definitions-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "920c0cd6cf6bb8f09d09c51c0e6a60aaacb50360";
        hash = "sha256-nd7MaMtVnya1Vo6MPk/u4jSSowFlYrG9GaQhDHJuY/k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_export_definitions";
  version = "2.7.0-1";
  src = sources.ament_cmake_export_definitions;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}