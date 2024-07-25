{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    open3d_conversions = substituteSource {
      src = fetchgit {
        name = "open3d_conversions-source";
        url = "https://github.com/ros2-gbp/perception_open3d-release.git";
        rev = "0353078f3c65a8652a0719cdc0b5fbb92af7ace4";
        hash = "sha256-z9q4RcTr+51vobHpQoZDeuX3uu0rAqjSDfO6rtJf1nk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "open3d_conversions";
  version = "0.1.2-3";
  src = sources.open3d_conversions;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
