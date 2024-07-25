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
        rev = "8b68fd88444668244cdca00dff70254bfab3a1c9";
        hash = "sha256-cIyPOFbRWSQ2eXOMVvPqYm47TN5CR1sGgKZMIuRGLiM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_xmllint";
  version = "0.12.11-1";
  src = sources.ament_xmllint;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_lint libxml2 ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint libxml2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
