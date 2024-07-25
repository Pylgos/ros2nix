{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  clearpath_config,
  clearpath_generator_common,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    clearpath_generator_gz = substituteSource {
      src = fetchgit {
        name = "clearpath_generator_gz-source";
        url = "https://github.com/clearpath-gbp/clearpath_simulator-release.git";
        rev = "6891fa424a34f7dcbc30fa8b90abcbcb4360f9d5";
        hash = "sha256-ovMQvu4pbviWMwBc+r4GB0BUhbLymCRw2B0AwOl8GoI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "clearpath_generator_gz";
  version = "0.2.5-1";
  src = sources.clearpath_generator_gz;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ clearpath_config clearpath_generator_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
