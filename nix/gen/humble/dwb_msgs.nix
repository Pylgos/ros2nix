{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_2d_msgs,
  nav_msgs,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    dwb_msgs = substituteSource {
      src = fetchgit {
        name = "dwb_msgs-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "51e6cf72362d0722d45dfcb556609832f262f0ca";
        hash = "sha256-MA6z7h6zQtVnNAkgdCuKrDQuTAMl1nJ2H5RjDP0zjso=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dwb_msgs";
  version = "1.1.15-1";
  src = sources.dwb_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs nav_2d_msgs nav_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
