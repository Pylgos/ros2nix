{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt2,
  mvsim,
  substituteSource,
}:
let
  sources = rec {
    mrpt_path_planning = substituteSource {
      src = fetchgit {
        name = "mrpt_path_planning-source";
        url = "https://github.com/ros2-gbp/mrpt_path_planning-release.git";
        rev = "eb44ea2f3ee9d292c920052e11b5ac7931badcab";
        hash = "sha256-BbGBxE/OeijYNd0J5ZcHNFskTD0TO9BWVovFT1InzUE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_path_planning";
  version = "0.1.2-1";
  src = sources.mrpt_path_planning;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mrpt2 mvsim ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
