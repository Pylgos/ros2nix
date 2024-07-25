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
        rev = "0b9bf9c8677105b906e8fec44dcc001da3700ef2";
        hash = "sha256-YW8YJTv9YKBZYQvk9i3kcU9ViDfEpeVfNA0G7dIDmDA=";
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
