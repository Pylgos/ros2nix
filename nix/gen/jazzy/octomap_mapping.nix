{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  octomap_server,
  substituteSource,
}:
let
  sources = rec {
    octomap_mapping = substituteSource {
      src = fetchgit {
        name = "octomap_mapping-source";
        url = "https://github.com/ros2-gbp/octomap_mapping-release.git";
        rev = "2287aefe102a50ed8eaccfc030ecee4e542b971a";
        hash = "sha256-Xf/Pq3HfJ/6Hm+t722RHPOoTiNsBqvjgeAOre7ySUnc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "octomap_mapping";
  version = "2.2.0-1";
  src = sources.octomap_mapping;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ octomap_server ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
