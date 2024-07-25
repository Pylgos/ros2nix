{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  imu_filter_madgwick,
  realsense2_camera,
  rtabmap_odom,
  rtabmap_rviz_plugins,
  rtabmap_slam,
  rtabmap_util,
  rtabmap_viz,
  substituteSource,
  tf2_ros,
  velodyne,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rtabmap_examples = substituteSource {
      src = fetchgit {
        name = "rtabmap_examples-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "686642f75fef88226d02e2fb96eb2ba61581e297";
        hash = "sha256-DIDkea1MdySgQKBT8RzGMY/1F+jqFDTLIkxtSxHOKIg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap_examples";
  version = "0.21.5-1";
  src = sources.rtabmap_examples;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ imu_filter_madgwick realsense2_camera rtabmap_odom rtabmap_rviz_plugins rtabmap_slam rtabmap_util rtabmap_viz tf2_ros velodyne ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
