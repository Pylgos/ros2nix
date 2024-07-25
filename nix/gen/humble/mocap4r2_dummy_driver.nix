{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mocap4r2_control,
  mocap4r2_msgs,
  rclcpp,
  rclcpp_lifecycle,
  substituteSource,
}:
let
  sources = rec {
    mocap4r2_dummy_driver = substituteSource {
      src = fetchgit {
        name = "mocap4r2_dummy_driver-source";
        url = "https://github.com/MOCAP4ROS2-Project/mocap4r2-release.git";
        rev = "c0e7cc2c85e443c4beb3cd5256392d3daf5b8b65";
        hash = "sha256-stjTDG5Pii1J7Lyro3OGXpwJFr27Ddz6+N09AgzYcZo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mocap4r2_dummy_driver";
  version = "0.0.7-1";
  src = sources.mocap4r2_dummy_driver;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mocap4r2_control mocap4r2_msgs rclcpp rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
