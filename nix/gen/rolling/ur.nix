{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  ur_calibration,
  ur_controllers,
  ur_dashboard_msgs,
  ur_moveit_config,
  ur_robot_driver,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    ur = substituteSource {
      src = fetchgit {
        name = "ur-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "6c419480b07e869fe5bb389e5c4e6c6b79314fde";
        hash = "sha256-0NEyX0W822yCqt08776hOLEb2WPobPVV/wnxuErMu4Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur";
  version = "2.4.8-1";
  src = sources.ur;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ur_calibration ur_controllers ur_dashboard_msgs ur_moveit_config ur_robot_driver ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
