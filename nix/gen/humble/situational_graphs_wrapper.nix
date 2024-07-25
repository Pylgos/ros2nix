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
        rev = "7f6b49b11d1d833c194a9e9a892f3e557a04ac1c";
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
