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
        rev = "6415f979ff1acda170dc3c0aed0ecb604f3889d4";
        hash = "sha256-4a0Cw1cMtwXrxbPK3vFuzojHRF99b1r0HYEid8ElLgg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "hpp-fcl";
  version = "2.4.4-3";
  src = sources.hpp-fcl;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ doxygen git python3 buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ assimp eigen eigenpy octomap python3Packages.boost python3Packages.lxml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
