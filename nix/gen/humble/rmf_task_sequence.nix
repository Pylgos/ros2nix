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
        rev = "95baffef1b1d8ffc93d4cfdd61c1df177bc4e8f0";
        hash = "sha256-L5/0IECMXRueZ5tciRKxRvN/9sL7+NbIqnxQ6abP6JE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_task_sequence";
  version = "2.1.8-1";
  src = sources.rmf_task_sequence;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nlohmann_json nlohmann_json_schema_validator_vendor rmf_api_msgs rmf_task ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
