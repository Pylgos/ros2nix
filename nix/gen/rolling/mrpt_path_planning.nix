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
        rev = "3b1e87a76f056d018fd010a3ae986ba1147b1925";
        hash = "sha256-XWexI9w2FPA3Rg8km5x+SQGxY5414oFxsWRAWvFVrxY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_path_planning";
  version = "0.1.3-1";
  src = sources.mrpt_path_planning;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mrpt2 mvsim ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
