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
        rev = "66b0c66db9bc1aabf02c8cb22c96a19008a0e114";
        hash = "sha256-6KTjQDWAPViQZPNJ0TvIOpgM0ZK6q5bDKX6joQDuOnw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_desktop";
  version = "3.0.0-2";
  src = sources.leo_desktop;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ leo leo_viz ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}