{
  buildRosPackage,
  cmake,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  grid_map_core,
  gtsam,
  libg2o,
  libpointmatcher,
  octomap,
  pcl,
  proj,
  qt_gui_cpp,
  sqlite,
  substituteSource,
  wrapRosQtAppsHook,
  zlib,
}:
let
  sources = rec {
    rtabmap = substituteSource {
      src = fetchgit {
        name = "rtabmap-source";
        url = "https://github.com/ros2-gbp/rtabmap-release.git";
        rev = "5fa47347a3c924a3c328d457e7643226628bafd8";
        hash = "sha256-RRlnsLDM72D4LNBknrJBSSR6KIcWqUAMok/zsGdptR4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap";
  version = "0.21.5-1";
  src = sources.rtabmap;
  nativeBuildInputs = [ cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge grid_map_core gtsam libg2o libpointmatcher octomap pcl proj qt_gui_cpp sqlite zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
