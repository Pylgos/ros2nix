{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    gc_spl_interfaces = substituteSource {
      src = fetchgit {
        name = "gc_spl_interfaces-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "8a8f52cc53fe2489e2143ad6d9c8bbdd1ed6e6a3";
        hash = "sha256-zib/AEpu2CDmpEXFyiedKxZD52Ub6+OPzPJpw/a2jqE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gc_spl_interfaces";
  version = "4.0.1-1";
  src = sources.gc_spl_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}