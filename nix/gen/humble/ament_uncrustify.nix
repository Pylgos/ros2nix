{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_pycodestyle,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
  uncrustify_vendor,
}:
let
  sources = rec {
    ament_uncrustify = substituteSource {
      src = fetchgit {
        name = "ament_uncrustify-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "f2a7ac25cbb8e38dede9bf9e12a3ba86667762a7";
        hash = "sha256-FEY879SgJOSRHNcw1tAw7IkSPAdie66htRQ1KCkMP4g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_uncrustify";
  version = "0.12.11-1";
  src = sources.ament_uncrustify;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ uncrustify_vendor ];
  buildInputs = [  ];
  propagatedBuildInputs = [ uncrustify_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
