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
    situational_graphs_wrapper = substituteSource {
      src = fetchgit {
        name = "situational_graphs_wrapper-source";
        url = "https://github.com/ros2-gbp/situational_graphs_wrapper-release.git";
        rev = "522873a20c250f01343d363877679777f937d50b";
        hash = "sha256-0Mux6SmU7ePXTtYkXJDylhVdeWnOzMzGIKc2BHlfk5E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "situational_graphs_wrapper";
  version = "0.0.0-1";
  src = sources.situational_graphs_wrapper;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
