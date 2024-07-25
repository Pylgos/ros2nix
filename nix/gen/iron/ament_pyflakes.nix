{
  ament_pycodestyle,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    ament_pyflakes = substituteSource {
      src = fetchgit {
        name = "ament_pyflakes-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "037217e03ed26c3e5247461a96146cbf72ee504e";
        hash = "sha256-sg8xU+wAUpNnQBASd25N9c/onaXAca3GE7Sb0y4+dec=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_pyflakes";
  version = "0.14.3-1";
  src = sources.ament_pyflakes;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pyflakes ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.pyflakes ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
