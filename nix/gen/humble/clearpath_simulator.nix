{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  clearpath_generator_gz,
  clearpath_gz,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    clearpath_simulator = substituteSource {
      src = fetchgit {
        name = "clearpath_simulator-source";
        url = "https://github.com/clearpath-gbp/clearpath_simulator-release.git";
        rev = "b364a0fa4802fac5747addc151f754780ebbf3ca";
        hash = "sha256-Fa8J0C7HH+90Z/vvLuW7a9rc4bg7vYEh+MwZbpNxOuk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "clearpath_simulator";
  version = "0.2.5-1";
  src = sources.clearpath_simulator;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ clearpath_generator_gz clearpath_gz ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
