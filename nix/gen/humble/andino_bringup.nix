{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  andino_control,
  andino_description,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joy_linux,
  laser_filters,
  rosbag2_storage_mcap,
  rplidar_ros,
  substituteSource,
  teleop_twist_joy,
  twist_mux,
  v4l2_camera,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    andino_bringup = substituteSource {
      src = fetchgit {
        name = "andino_bringup-source";
        url = "https://github.com/ros2-gbp/andino-release.git";
        rev = "c756f847fb5cfc2bd4e4d1fef205369d689af7bf";
        hash = "sha256-FeXzpenZ4NV2AlSbRVJdaBySGtg7KqDd1x4ZwFvCCU4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "andino_bringup";
  version = "0.1.0-1";
  src = sources.andino_bringup;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ andino_control andino_description joy_linux laser_filters rosbag2_storage_mcap rplidar_ros teleop_twist_joy twist_mux v4l2_camera ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
