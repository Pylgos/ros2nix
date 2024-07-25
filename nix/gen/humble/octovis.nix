{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  libsForQt5,
  octomap,
  qt5,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    octovis = substituteSource {
      src = fetchgit {
        name = "octovis-source";
        url = "https://github.com/ros2-gbp/octomap-release.git";
        rev = "55c571b77872f5b0747f694dffc5d3449a70adb3";
        hash = "sha256-B3o5qIG2TXL7n4EG8EOfFE/k4yEj6kdYAtRPXbUfB6s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "octovis";
  version = "1.9.8-1";
  src = sources.octovis;
  nativeBuildInputs = [ cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libsForQt5.libqglviewer octomap qt5.qtbase ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
