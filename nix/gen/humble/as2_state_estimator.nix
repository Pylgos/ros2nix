{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_lint_auto,
  as2_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rclcpp,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    as2_state_estimator = substituteSource {
      src = fetchgit {
        name = "as2_state_estimator-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "7c9d7b30b2f9d216b32b0825552bf6d7c7aaaed9";
        hash = "sha256-FjwyaQ/jHlbCJHyL7ZcUHjoMpckUtZK3O8e4g89IE1I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_state_estimator";
  version = "1.0.9-1";
  src = sources.as2_state_estimator;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ as2_core geometry_msgs nav_msgs rclcpp tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
