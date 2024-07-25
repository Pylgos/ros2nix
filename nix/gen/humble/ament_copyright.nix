{
  ament_flake8,
  ament_lint,
  ament_pep257,
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
    ament_copyright = substituteSource {
      src = fetchgit {
        name = "ament_copyright-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "115151a740234cad5c6602e927818c3948f10378";
        hash = "sha256-Wf089+ZspNTFo1zpsAbSPUgb8ajqCTbYeiEkqp7oQJc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_copyright";
  version = "0.12.11-1";
  src = sources.ament_copyright;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_lint buildPackages.python3Packages.importlib-metadata ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint python3Packages.importlib-metadata ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
