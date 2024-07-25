{
  ament_cmake,
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
    tlsf = substituteSource {
      src = fetchgit {
        name = "tlsf-source";
        url = "https://github.com/ros2-gbp/tlsf-release.git";
        rev = "7343faeacbd482de59c5b354142c9768dbefd5cf";
        hash = "sha256-LlSOBxVaivTLUWDXxw8htxFqfRTn3hQ96vU2rW6XVM4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tlsf";
  version = "0.10.0-1";
  src = sources.tlsf;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
