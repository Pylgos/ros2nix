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
        rev = "69cad1c61a1e0c809ce49048a2c3a325135f8d6d";
        hash = "sha256-jAdzAOmjOUOmkzkRQC+PQu+IQ4KHh65ji84clRywiQQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch";
  version = "2.0.4-1";
  src = sources.launch;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python osrf_pycommon buildPackages.python3Packages.importlib-metadata buildPackages.python3Packages.lark buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python osrf_pycommon python3Packages.importlib-metadata python3Packages.lark python3Packages.pyyaml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
