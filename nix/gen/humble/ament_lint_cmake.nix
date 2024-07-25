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
    ament_lint_cmake = substituteSource {
      src = fetchgit {
        name = "ament_lint_cmake-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "d8e4416f1c4fbe547b9542aaecdfb0f6cd88b65c";
        hash = "sha256-ZM0o5wGPTVVO3Tiu4XzZG+miqyUIjrBLrjk0JL3Z4zA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_lint_cmake";
  version = "0.12.11-1";
  src = sources.ament_lint_cmake;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
