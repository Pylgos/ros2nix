{
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  nlohmann_json,
  nlohmann_json_schema_validator_vendor,
  rmf_api_msgs,
  rmf_task,
  substituteSource,
}:
let
  sources = rec {
    rmf_task_sequence = substituteSource {
      src = fetchgit {
        name = "rmf_task_sequence-source";
        url = "https://github.com/ros2-gbp/rmf_task-release.git";
        rev = "ad9a28be80e7d6b9c4215d356ce2db985094ebbb";
        hash = "sha256-dfQl9tKpQB6ppy8MiY2lynX92uI34nEnLNuKdMoGlZo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_task_sequence";
  version = "2.2.5-1";
  src = sources.rmf_task_sequence;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nlohmann_json nlohmann_json_schema_validator_vendor rmf_api_msgs rmf_task ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
