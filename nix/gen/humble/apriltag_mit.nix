{
  buildRosPackage,
  clang,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  opencv,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    apriltag_mit = substituteSource {
      src = fetchgit {
        name = "apriltag_mit-source";
        url = "https://github.com/ros2-gbp/apriltag_mit-release.git";
        rev = "e4796cb46fbd7da0c5f9235eceefb026b883720e";
        hash = "sha256-JbemhLKeQZwZrOyO+wHqRc4Q0mmU7IYkpXOdX3ynUCo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apriltag_mit";
  version = "1.1.2-1";
  src = sources.apriltag_mit;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ clang ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen opencv python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
