{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  libyamlcpp,
  rclcpp,
  substituteSource,
  ur_client_library,
  ur_robot_driver,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    ur_calibration = substituteSource {
      src = fetchgit {
        name = "ur_calibration-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "48d9a4ee83b42e04a5553c1251f0da64eaa8de08";
        hash = "sha256-/4RAG2RZv9it3eqXbYahewDdJYgiOXWee8SRIfXm/yM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_calibration";
  version = "2.3.9-1";
  src = sources.ur_calibration;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen libyamlcpp rclcpp ur_client_library ur_robot_driver ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
