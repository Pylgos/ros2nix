{
  assimp,
  buildPackages,
  buildRosPackage,
  cmake,
  doxygen,
  eigen,
  eigenpy,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  octomap,
  python3,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    hpp-fcl = substituteSource {
      src = fetchgit {
        name = "hpp-fcl-source";
        url = "https://github.com/ros2-gbp/hpp_fcl-release.git";
        rev = "ff3dd2f6fa193a13a3814963f79f0a7042a1dd23";
        hash = "sha256-vRDuSnFfai+Pd7f6Ce0A4kuLyCuda1TT2nRyVwDoSKI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "hpp-fcl";
  version = "2.4.4-1";
  src = sources.hpp-fcl;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ doxygen git buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ assimp eigen eigenpy octomap python3 python3Packages.boost python3Packages.lxml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
