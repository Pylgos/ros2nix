{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_bringup,
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
    rtabmap_demos = substituteSource {
      src = fetchgit {
        name = "rtabmap_demos-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "5bfb6be576bf833325134ff374a98fc05463b0db";
        hash = "sha256-Um4lSiKIa+ja+1YOBXIlzKy6a5+tUrG1C+JFjfzdh50=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap_demos";
  version = "0.21.5-1";
  src = sources.rtabmap_demos;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nav2_bringup rtabmap_odom rtabmap_rviz_plugins rtabmap_slam rtabmap_util rtabmap_viz ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
