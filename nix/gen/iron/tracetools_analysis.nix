{
  ament_copyright,
  ament_flake8,
  ament_mypy,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  jupyter,
  python3Packages,
  substituteSource,
  tracetools_read,
}:
let
  sources = rec {
    tracetools_analysis = substituteSource {
      src = fetchgit {
        name = "tracetools_analysis-source";
        url = "https://github.com/ros2-gbp/tracetools_analysis-release.git";
        rev = "4b599bab5c91c9150e68cf7ce68d97608cd037db";
        hash = "sha256-DPKjLLYf07C3NN4cCJqYVc28MZaOWmDTrLO+g2oyGwA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_analysis";
  version = "3.0.0-5";
  src = sources.tracetools_analysis;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ jupyter python3Packages.pandas tracetools_read ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
