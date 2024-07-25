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
        rev = "dec69715fa679a6c1d023de2fcf371ddcb0cee48";
        hash = "sha256-Bki0/u4tKaJpIjlPl3LLTkQP0UUQEUQUkhAEZQIk+eU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dwb_msgs";
  version = "1.2.9-1";
  src = sources.dwb_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs nav_2d_msgs nav_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
