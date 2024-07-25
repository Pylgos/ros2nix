{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    rmf_traffic_editor_assets = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_editor_assets-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "c59b18df776801d8b3597ee39337048e19f21f6f";
        hash = "sha256-yrQcwg/f/bwRczG7xGAMCEcipSjveH6ANr9wiy8rBlQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_traffic_editor_assets";
  version = "1.7.2-1";
  src = sources.rmf_traffic_editor_assets;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
