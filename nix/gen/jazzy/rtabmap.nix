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
  qt_gui_cpp,
  sqlite,
  substituteSource,
  zlib,
}:
let
  sources = rec {
    rtabmap = substituteSource {
      src = fetchgit {
        name = "rtabmap-source";
        url = "https://github.com/ros2-gbp/rtabmap-release.git";
        rev = "d02bd5ff146b7361860e71257b0f5c7e160fcd67";
        hash = "sha256-ou+qifSp8gCqbYK6Uppq7AKnRmdBcP7MPXxWBXLwLgw=";
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
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ proj ];
  propagatedBuildInputs = [ cv_bridge gtsam libg2o libpointmatcher octomap pcl qt_gui_cpp sqlite zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
