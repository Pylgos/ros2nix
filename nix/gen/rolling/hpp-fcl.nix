{
  assimp,
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
        rev = "b48c4598136db748da3f37db47b9246dec18651f";
        hash = "sha256-4a0Cw1cMtwXrxbPK3vFuzojHRF99b1r0HYEid8ElLgg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "hpp-fcl";
  version = "2.4.4-2";
  src = sources.hpp-fcl;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ doxygen git ];
  buildInputs = [  ];
  propagatedBuildInputs = [ assimp eigen eigenpy octomap python3 python3Packages.boost python3Packages.lxml python3Packages.numpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
