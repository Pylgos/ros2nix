{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    create_msgs = substituteSource {
      src = fetchgit {
        name = "create_msgs-source";
        url = "https://github.com/AutonomyLab/create_autonomy-release.git";
        rev = "f7e87a6a6d181842d222db53f7dc24c912d156ba";
        hash = "sha256-73JO3cpeq8Lctv3gHY4nHPvOrtjWk4CT4ksV9nT/xfA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "create_msgs";
  version = "3.1.0-1";
  src = sources.create_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
