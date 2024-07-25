{
  buildPackages,
  buildRosPackage,
  cmake,
  doxygen,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  matio,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    proxsuite = substituteSource {
      src = fetchgit {
        name = "proxsuite-source";
        url = "https://github.com/ros2-gbp/proxsuite-release.git";
        rev = "c1d0dcc011d9ece07c1d4dac720af8b59113598e";
        hash = "sha256-Qfv+vWLLcZfUtZpRYZaoL3rQ3ibCYBKQcAkpFP0YdWI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "proxsuite";
  version = "0.6.5-1";
  src = sources.proxsuite;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ doxygen git buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen python3Packages.scipy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
