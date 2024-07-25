{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_gtest,
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
        rev = "89b068dba136b24f0d97992f2416b07b133c77b6";
        hash = "sha256-EOoZrowJNVGtJNutD+5WlSgVWbmOGlzSJyvsALmfji8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "quaternion_operation";
  version = "0.0.7-4";
  src = sources.quaternion_operation;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_auto ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometry_msgs rclcpp tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
