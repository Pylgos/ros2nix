{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pmb2_gazebo,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    pmb2_simulation = substituteSource {
      src = fetchgit {
        name = "pmb2_simulation-source";
        url = "https://github.com/pal-gbp/pmb2_simulation-release.git";
        rev = "8ebd801d3f8e4ddf2b065d83bdbdc8167c73cf68";
        hash = "sha256-uXsQHXgONrUVr3pGeiu+YBnOcjgSTzKIrBx0Ce8ACi4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pmb2_simulation";
  version = "4.0.14-1";
  src = sources.pmb2_simulation;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pmb2_gazebo ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
