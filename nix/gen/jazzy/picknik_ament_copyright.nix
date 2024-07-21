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
        rev = "6cd350c41214ab5be92012ac5b0b8bdf2f35c3df";
        hash = "sha256-zw0URrOQbcL7fo+BgOUHgI0yqf0DDRVGnOOxbJmog48=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "picknik_ament_copyright";
  version = "0.0.2-5";
  src = sources.picknik_ament_copyright;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_copyright ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}