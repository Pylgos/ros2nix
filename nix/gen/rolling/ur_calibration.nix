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
        rev = "412a3fd3a666636d1eec9586805e5c89a33a718f";
        hash = "sha256-l/23eLZlX4YwiekZwz5uvP78YF31aoDhDE1NNrB5NL4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_calibration";
  version = "2.4.8-1";
  src = sources.ur_calibration;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen libyamlcpp rclcpp ur_client_library ur_robot_driver ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
