{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo_gz_bringup,
  leo_gz_plugins,
  leo_gz_worlds,
  substituteSource,
}:
let
  sources = rec {
    leo_simulator = substituteSource {
      src = fetchgit {
        name = "leo_simulator-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "6055585e0dcff6f15fc0f4cb999879fb36faccc0";
        hash = "sha256-M4M/qyTHylCAho8fw1Pi98FVmuugTEN20kVSxhnJ9Hg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_simulator";
  version = "1.1.0-1";
  src = sources.leo_simulator;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ leo_gz_bringup leo_gz_plugins leo_gz_worlds ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
