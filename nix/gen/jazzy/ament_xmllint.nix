{
  ament_copyright,
  ament_flake8,
  ament_lint,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libxml2,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    ament_xmllint = substituteSource {
      src = fetchgit {
        name = "ament_xmllint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "e9ba8180050ef6c9cc988053dc002c12a649d3f9";
        hash = "sha256-hEPWBk0jFXWmN31PEl3WknzxY1V5ToOead2AJ1xNJUA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_xmllint";
  version = "0.17.1-1";
  src = sources.ament_xmllint;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_lint libxml2 ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint libxml2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
