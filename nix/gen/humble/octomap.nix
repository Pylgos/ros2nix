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
        rev = "71d3428f9ce3c55acbe624261166f6eb2f513798";
        hash = "sha256-1C49qDf+5BFNi34JzrSFN0B0kNfv1MBTmcdT/hEjkKI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "octomap";
  version = "1.9.8-1";
  src = sources.octomap;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
