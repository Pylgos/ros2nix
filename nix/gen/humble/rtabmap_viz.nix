{
  ament_cmake_ros,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rclcpp,
  rtabmap_msgs,
  rtabmap_sync,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rtabmap_viz = substituteSource {
      src = fetchgit {
        name = "rtabmap_viz-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "aaa6bff441d80e99dcc169052b4d3a5cbe71a6ca";
        hash = "sha256-i/Ejwe1AqGUqr5YWHKW0QY/bMtLwiWrtUd/S6kdAw8Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap_viz";
  version = "0.21.5-1";
  src = sources.rtabmap_viz;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge geometry_msgs nav_msgs rclcpp rtabmap_msgs rtabmap_sync std_msgs std_srvs tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
