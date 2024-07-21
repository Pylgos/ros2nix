{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  libGL,
  libGLU,
  libsForQt5,
  octomap,
  qt5,
  substituteSource,
}:
let
  sources = rec {
    octovis = substituteSource {
      src = fetchgit {
        name = "octovis-source";
        url = "https://github.com/ros2-gbp/octomap-release.git";
        rev = "5e9de4466ea20bce487a9d3a30a5294567904faa";
        hash = "sha256-TxMKU0t80X4leyZ3fdp6/PWCKK9UQhv7DITRuosz9Xw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "octovis";
  version = "1.10.0-4";
  src = sources.octovis;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ libsForQt5.libqglviewer qt5.qtbase ];
  propagatedBuildInputs = [ libGL libGLU libsForQt5.libqglviewer octomap qt5.qtbase ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}