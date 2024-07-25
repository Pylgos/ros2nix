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
    splsm_8 = substituteSource {
      src = fetchgit {
        name = "splsm_8-source";
        url = "https://github.com/ros2-gbp/r2r_spl-release.git";
        rev = "8aa4ae2d8d259a4e06f107876c1437b77270f00c";
        hash = "sha256-XDetfFxQq54TPu+JxVhWKwXPY8kcByRu75kLCh5ukdE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "splsm_8";
  version = "3.1.0-1";
  src = sources.splsm_8;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
