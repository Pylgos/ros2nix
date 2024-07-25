{
  buildPackages,
  buildRosPackage,
  clang,
  cmake,
  doxygen,
  eigen,
  eigenpy,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  hpp-fcl,
  python3,
  python3Packages,
  substituteSource,
  urdfdom,
}:
let
  sources = rec {
    pinocchio = substituteSource {
      src = fetchgit {
        name = "pinocchio-source";
        url = "https://github.com/ros2-gbp/pinocchio-release.git";
        rev = "da61b88845f631628fb7e548a53a48cb3d4a6375";
        hash = "sha256-dDM/q7RkrEb352z1HSxeJupF6gtbjyHiBoS7LF8FvZ0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pinocchio";
  version = "2.6.21-1";
  src = sources.pinocchio;
  nativeBuildInputs = [ clang cmake ];
  propagatedNativeBuildInputs = [ doxygen git buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen eigenpy hpp-fcl python3 python3Packages.boost urdfdom ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
