{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  motion_capture_tracking_interfaces,
  pcl,
  rclcpp,
  sensor_msgs,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    motion_capture_tracking = substituteSource {
      src = fetchgit {
        name = "motion_capture_tracking-source";
        url = "https://github.com/ros2-gbp/motion_capture_tracking-release.git";
        rev = "86c6b362827582465e9ab200835fb11a660ac394";
        hash = "sha256-geGYcuQ+C5/hPlkMOL+5FE1cWQX6XRP2rS+MBrNwTPY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "motion_capture_tracking";
  version = "1.0.5-1";
  src = sources.motion_capture_tracking;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen motion_capture_tracking_interfaces pcl rclcpp sensor_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
