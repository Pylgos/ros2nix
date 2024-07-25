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
    pal_hey5_controller_configuration = substituteSource {
      src = fetchgit {
        name = "pal_hey5_controller_configuration-source";
        url = "https://github.com/pal-gbp/pal_hey5-release.git";
        rev = "e0a898ab79770b5680999bb531dc593fe5ccab85";
        hash = "sha256-u/8U7JTA82MPjSF4gliwftTi7XCuLexf9wE+ngnDdwY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pal_hey5_controller_configuration";
  version = "4.1.0-1";
  src = sources.pal_hey5_controller_configuration;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
