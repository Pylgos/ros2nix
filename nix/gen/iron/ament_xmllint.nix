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
        rev = "b9a9797ed4d5a9b4a554ed881c5120d71731c556";
        hash = "sha256-GZr3biaQTq1YF1wCKkRMZBh/I2pvgwTyNcnteWuKYTY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_xmllint";
  version = "0.14.3-1";
  src = sources.ament_xmllint;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_lint libxml2 ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint libxml2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
