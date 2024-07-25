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
        rev = "84ef4634b8b1457322c52c02af5357f32a6439bd";
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
