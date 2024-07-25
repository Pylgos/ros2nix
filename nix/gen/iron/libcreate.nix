{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    libcreate = substituteSource {
      src = fetchgit {
        name = "libcreate-source";
        url = "https://github.com/AutonomyLab/libcreate-release.git";
        rev = "2ca9238744e62fbc488c579e04d9ce2d7474e46f";
        hash = "sha256-81YWnHfZRcIQuODpLa8HygB8zaZczdlzUGxsbZWHzlI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libcreate";
  version = "3.1.0-1";
  src = sources.libcreate;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
