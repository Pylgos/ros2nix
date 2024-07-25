{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_mypy,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  osrf_pycommon,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    launch = substituteSource {
      src = fetchgit {
        name = "launch-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "b022b80951817b7b1abcc551ef7ec18453298b3b";
        hash = "sha256-oqy/2ZKI+r5xJadZ2RYeDe6lMmaoSKQLKBnv/K2+4yk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch";
  version = "3.6.0-1";
  src = sources.launch;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python osrf_pycommon buildPackages.python3Packages.importlib-metadata buildPackages.python3Packages.lark buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python osrf_pycommon python3Packages.importlib-metadata python3Packages.lark python3Packages.pyyaml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
