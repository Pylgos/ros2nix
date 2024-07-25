{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    pmb2_laser_sensors = substituteSource {
      src = fetchgit {
        name = "pmb2_laser_sensors-source";
        url = "https://github.com/pal-gbp/pmb2_navigation-gbp.git";
        rev = "12fadd8cdab9a66302a4b7c638c0159e8dfa208c";
        hash = "sha256-VFCcesxkFCoCpK2cMO91Bo656MG9agEOjq+meLmGNhM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pmb2_laser_sensors";
  version = "4.0.21-1";
  src = sources.pmb2_laser_sensors;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
