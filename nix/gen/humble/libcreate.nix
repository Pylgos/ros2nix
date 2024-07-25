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
        rev = "2a01604fd598bf4c7d8e0fb20f72ee2f1856be14";
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
