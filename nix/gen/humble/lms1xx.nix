{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  laser_geometry,
  rclcpp,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    lms1xx = substituteSource {
      src = fetchgit {
        name = "lms1xx-source";
        url = "https://github.com/clearpath-gbp/LMS1xx-release.git";
        rev = "306e91a393ab7b794aba681d6177a0d7b4efdfb3";
        hash = "sha256-T8onkmo0MplpVRQCuUnvzjMa0pRVzlDy7Nsu8nHsuM4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lms1xx";
  version = "1.0.1-1";
  src = sources.lms1xx;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs laser_geometry rclcpp sensor_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
