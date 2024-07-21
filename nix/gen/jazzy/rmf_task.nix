{
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  buildRosPackage,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  rmf_battery,
  rmf_utils,
  substituteSource,
}:
let
  sources = rec {
    rmf_task = substituteSource {
      src = fetchgit {
        name = "rmf_task-source";
        url = "https://github.com/ros2-gbp/rmf_task-release.git";
        rev = "b42a6d47b406d4534212fd4bdce519fc6fc0ad7d";
        hash = "sha256-elrSBRSbYp9FkGt6dvo70RwbBEtr6WBTzywkr0W01uc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_task";
  version = "2.5.1-1";
  src = sources.rmf_task;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen rmf_battery rmf_utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
