{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nao_sensor_msgs,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    nao_button_sim = substituteSource {
      src = fetchgit {
        name = "nao_button_sim-source";
        url = "https://github.com/ros2-gbp/nao_button_sim-release.git";
        rev = "f434ad48607a9b6c2f98c9e38fb5fe975af943f4";
        hash = "sha256-rImNSTTVSFL8VO9w+jMHyItFuq8VYc+IgiywuXdSi7k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nao_button_sim";
  version = "0.1.2-1";
  src = sources.nao_button_sim;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nao_sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
