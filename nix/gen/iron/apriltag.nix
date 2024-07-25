{
  buildPackages,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  opencv,
  substituteSource,
}:
let
  sources = rec {
    apriltag = substituteSource {
      src = fetchgit {
        name = "apriltag-source";
        url = "https://github.com/ros2-gbp/apriltag-release.git";
        rev = "330a76af7924982ac4dd94562bb3af34d5cb4aba";
        hash = "sha256-6kUYVWACrNDZBeDwDanrR3mgspXi5sPGKoy4chT7IrM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apriltag";
  version = "3.2.0-5";
  src = sources.apriltag;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
