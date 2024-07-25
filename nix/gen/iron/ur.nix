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
        rev = "4dd190c52019aa94cb566aa085d9b30f296541fc";
        hash = "sha256-JaRlpJsJsEDjo2h+vLYZH1b8ItpTZ56GjKjEpv42N2o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur";
  version = "2.3.9-1";
  src = sources.ur;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ur_calibration ur_controllers ur_dashboard_msgs ur_moveit_config ur_robot_driver ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
