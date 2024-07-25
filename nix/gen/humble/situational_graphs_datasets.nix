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
    situational_graphs_datasets = substituteSource {
      src = fetchgit {
        name = "situational_graphs_datasets-source";
        url = "https://github.com/ros2-gbp/situational_graphs_dataset-release.git";
        rev = "d1c6f328541c6804859d4b373d9efd0ce9342a02";
        hash = "sha256-MX0nvPaE+OW0VS6v+GToiVp7wBcZJS1z5EoEAKwsAPo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "situational_graphs_datasets";
  version = "0.0.0-1";
  src = sources.situational_graphs_datasets;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.matplotlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
