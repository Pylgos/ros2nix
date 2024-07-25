{
  ament_copyright,
  ament_flake8,
  ament_mypy,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  graphviz,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    caret_analyze = substituteSource {
      src = fetchgit {
        name = "caret_analyze-source";
        url = "https://github.com/ros2-gbp/caret_analyze-release.git";
        rev = "d95760aa55ae23c6958bfbfd940952c9e02b5ce1";
        hash = "sha256-5qfscOKRD6zC8BIAY31MMFt5Ca4tSlNtdSXjwMsxjtw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "caret_analyze";
  version = "0.5.0-2";
  src = sources.caret_analyze;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pyyaml buildPackages.python3Packages.setuptools ];
  buildInputs = [  ];
  propagatedBuildInputs = [ graphviz python3Packages.tqdm ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
