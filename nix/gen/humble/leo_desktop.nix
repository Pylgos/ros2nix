{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo,
  leo_viz,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    leo_desktop = substituteSource {
      src = fetchgit {
        name = "leo_desktop-source";
        url = "https://github.com/ros2-gbp/leo_desktop-release.git";
        rev = "7f8da2e52c90201797759a4d19edfc7357ccd597";
        hash = "sha256-YVpdlrpasTNSWYO4smQTr6VvaFBfuTFQn1snucaRQmw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_desktop";
  version = "1.1.0-1";
  src = sources.leo_desktop;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ leo leo_viz ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
