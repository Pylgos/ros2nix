{
  buildRosPackage,
  cmake,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  gtsam,
  libg2o,
  libpointmatcher,
  octomap,
  pcl,
  proj,
  qt5,
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
        rev = "111ad00afb0b0af4572e77fa18a2c1df3c2e7f58";
        hash = "sha256-wSBauoo5DbAfBKc5+Vt2mbIqtsXtrIsY+3vdRUVLuiQ=";
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
  propagatedBuildInputs = [ cv_bridge gtsam libg2o libpointmatcher octomap pcl proj qt5.qtbase sqlite zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
