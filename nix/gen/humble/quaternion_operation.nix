{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_lint_auto,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  ouxt_lint_common,
  rclcpp,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    quaternion_operation = substituteSource {
      src = fetchgit {
        name = "quaternion_operation-source";
        url = "https://github.com/ros2-gbp/quaternion_operation-release.git";
        rev = "49cc6236dfd05529bbfe792c9b4569999cb398a8";
        hash = "sha256-XFIOq/J1ybBjdR5TFUumOgHlYUH5o2Mcm9zh1zPijKo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "quaternion_operation";
  version = "0.0.11-1";
  src = sources.quaternion_operation;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_auto ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometry_msgs rclcpp tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
