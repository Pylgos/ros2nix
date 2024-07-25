{
  ament_copyright,
  ament_flake8,
  ament_index_python,
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
        rev = "5adb60c74e2f624781bb0a24e5a109b1dd0b1949";
        hash = "sha256-Zoko31ckqlvCUy9kJ/hRHDRCyIApQi5apIEMCUQYlrQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch";
  version = "1.0.6-1";
  src = sources.launch;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python osrf_pycommon buildPackages.python3Packages.importlib-metadata buildPackages.python3Packages.lark buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python osrf_pycommon python3Packages.importlib-metadata python3Packages.lark python3Packages.pyyaml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
