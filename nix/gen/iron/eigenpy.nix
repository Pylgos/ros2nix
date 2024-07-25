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
  python3,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    eigenpy = substituteSource {
      src = fetchgit {
        name = "eigenpy-source";
        url = "https://github.com/ros2-gbp/eigenpy-release.git";
        rev = "c790cb4b507fbc8da904861803c01b65b1210a59";
        hash = "sha256-kbs9Bzn+T10TEUg46cSUhFkac2U3PQ54Ka730p2o1jg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "eigenpy";
  version = "3.7.0-1";
  src = sources.eigenpy;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ doxygen git buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen python3 python3Packages.boost python3Packages.scipy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
