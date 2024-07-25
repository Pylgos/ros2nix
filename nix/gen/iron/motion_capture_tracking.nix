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
        rev = "8395de9586775f0e24088e117e1d155ccea5d0a4";
        hash = "sha256-1ZcvokNW2yx4JPALNj1v1ZHzdRRKyfc2vu+vKNzg+5A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "motion_capture_tracking";
  version = "1.0.4-1";
  src = sources.motion_capture_tracking;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen motion_capture_tracking_interfaces pcl rclcpp sensor_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
