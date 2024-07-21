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
        rev = "65bfbab4d05e11ac5b465259f436eed81f49bfdc";
        hash = "sha256-s2JWZ5kmUiM1N8BfSDVDJ0fVw7Cz55K9+cYZwBjG3+k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur";
  version = "2.4.5-1";
  src = sources.ur;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ur_calibration ur_controllers ur_dashboard_msgs ur_moveit_config ur_robot_driver ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
