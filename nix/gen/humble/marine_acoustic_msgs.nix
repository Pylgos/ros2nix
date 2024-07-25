{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    marine_acoustic_msgs = substituteSource {
      src = fetchgit {
        name = "marine_acoustic_msgs-source";
        url = "https://github.com/ros2-gbp/marine_msgs-release.git";
        rev = "27e865831e69bc1b126b5f426d2cfc7b47cfa5bb";
        hash = "sha256-ALbjKiPGNTichMtqbwwJIA4Y52MYdCELmDl3tLU3dC4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marine_acoustic_msgs";
  version = "2.1.0-1";
  src = sources.marine_acoustic_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
