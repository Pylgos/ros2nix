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
    nav_2d_msgs = substituteSource {
      src = fetchgit {
        name = "nav_2d_msgs-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "9c9e7f1b1117a8bb5cd844760e30cd0b01255cb7";
        hash = "sha256-bT1bwMMjH+p/tv77zURol3eguN2lkb3rhKtTzjrArIE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav_2d_msgs";
  version = "1.1.15-1";
  src = sources.nav_2d_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
