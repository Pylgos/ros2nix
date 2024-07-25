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
        rev = "6d990b21fb479bf94b69d7e0e702a0d446e63559";
        hash = "sha256-k8sNnQPIemkmgd6SeSgPNkEwVI6Ajk+mXQDqzxV9B8U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur";
  version = "2.2.14-1";
  src = sources.ur;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ur_calibration ur_controllers ur_dashboard_msgs ur_moveit_config ur_robot_driver ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
