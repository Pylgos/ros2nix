{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  situational_graphs_datasets,
  situational_graphs_msgs,
  situational_graphs_reasoning_msgs,
  situational_graphs_wrapper,
  substituteSource,
}:
let
  sources = rec {
    situational_graphs_reasoning = substituteSource {
      src = fetchgit {
        name = "situational_graphs_reasoning-source";
        url = "https://github.com/ros2-gbp/situational_graphs_reasoning-release.git";
        rev = "81ff076ca29b0349c6097144f2b1b8a5165f83c6";
        hash = "sha256-KRvin/Xk05j3hP6daOAk4Yg7+eVSprJhmesgnRcyrLc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "situational_graphs_reasoning";
  version = "0.0.1-1";
  src = sources.situational_graphs_reasoning;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.colorama python3Packages.matplotlib python3Packages.networkx python3Packages.protobuf python3Packages.shapely situational_graphs_datasets situational_graphs_msgs situational_graphs_reasoning_msgs situational_graphs_wrapper ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
