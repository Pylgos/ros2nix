{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  tiago_gazebo,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    tiago_simulation = substituteSource {
      src = fetchgit {
        name = "tiago_simulation-source";
        url = "https://github.com/pal-gbp/tiago_simulation-release.git";
        rev = "03cb28f6e1daaef0b2fb73c406b0832053c13c8f";
        hash = "sha256-manfqmui1bm3yKyJuFpG9PD4AulKrF9OzbDEG/b1jsA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tiago_simulation";
  version = "4.1.7-1";
  src = sources.tiago_simulation;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ tiago_gazebo ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
