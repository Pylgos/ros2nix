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
    ament_cpplint = substituteSource {
      src = fetchgit {
        name = "ament_cpplint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "11877123f5f285c0dbdd8a5aa4ae6bea6d238cf6";
        hash = "sha256-13KjfdbDXUhNFxtNJI4LCKRBjlVB1sw/ZlnAOK4FJ9c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cpplint";
  version = "0.17.1-1";
  src = sources.ament_cpplint;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}