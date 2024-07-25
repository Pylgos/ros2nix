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
        rev = "dc1ca71b03d3fcffb08d6f15e6dab4c0a1dcb475";
        hash = "sha256-ZD9SsVBshIaQm0eAweJ3na2WWkYZ2q9/iJtFo6OUxE8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_calibration";
  version = "2.2.14-1";
  src = sources.ur_calibration;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen libyamlcpp rclcpp ur_client_library ur_robot_driver ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
