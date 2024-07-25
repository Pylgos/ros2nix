{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    picknik_ament_copyright = substituteSource {
      src = fetchgit {
        name = "picknik_ament_copyright-source";
        url = "https://github.com/ros2-gbp/picknik_ament_copyright-release.git";
        rev = "4194ce4ed7bb413d14d86bbda024c3e05c2273cf";
        hash = "sha256-zw0URrOQbcL7fo+BgOUHgI0yqf0DDRVGnOOxbJmog48=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "picknik_ament_copyright";
  version = "0.0.2-3";
  src = sources.picknik_ament_copyright;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_copyright ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
