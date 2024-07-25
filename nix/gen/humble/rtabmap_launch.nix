{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rtabmap_msgs,
  rtabmap_odom,
  rtabmap_rviz_plugins,
  rtabmap_slam,
  rtabmap_util,
  rtabmap_viz,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rtabmap_launch = substituteSource {
      src = fetchgit {
        name = "rtabmap_launch-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "777dfa3149d86e89186ef7a8240ecf1b9b1d89bf";
        hash = "sha256-Z77TwsTvqp+PI9PQg6x5I4H9l7ksyJJL4lJUuR/1r5o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap_launch";
  version = "0.21.5-1";
  src = sources.rtabmap_launch;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rtabmap_msgs rtabmap_odom rtabmap_rviz_plugins rtabmap_slam rtabmap_util rtabmap_viz ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}