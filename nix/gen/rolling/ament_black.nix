{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    ament_black = substituteSource {
      src = fetchgit {
        name = "ament_black-source";
        url = "https://github.com/ros2-gbp/ament_black-release.git";
        rev = "b934e213509dad7b8fdec675384669bdb0e06f07";
        hash = "sha256-iiaYQXm/NThNO/Whm7mnXwjMt8Tv0BadacnpthQ+t8g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_black";
  version = "0.2.4-2";
  src = sources.ament_black;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.black buildPackages.python3Packages.unidiff ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.black python3Packages.unidiff ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
