{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    octomap = substituteSource {
      src = fetchgit {
        name = "octomap-source";
        url = "https://github.com/ros2-gbp/octomap-release.git";
        rev = "d62906c719b0f6cfc318182247ff63087b555456";
        hash = "sha256-1C49qDf+5BFNi34JzrSFN0B0kNfv1MBTmcdT/hEjkKI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "octomap";
  version = "1.9.8-3";
  src = sources.octomap;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
