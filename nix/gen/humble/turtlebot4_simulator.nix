{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  turtlebot4_ignition_bringup,
  turtlebot4_ignition_gui_plugins,
  turtlebot4_ignition_toolbox,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot4_simulator = substituteSource {
      src = fetchgit {
        name = "turtlebot4_simulator-source";
        url = "https://github.com/ros2-gbp/turtlebot4_simulator-release.git";
        rev = "85ac32d2691561e4abf7cbccf989ffbe82acffe0";
        hash = "sha256-4LYCnETjWjFf/MFrIkoHKkeWcflA3lTauehkMeBxcVo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_simulator";
  version = "1.0.2-1";
  src = sources.turtlebot4_simulator;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ turtlebot4_ignition_bringup turtlebot4_ignition_gui_plugins turtlebot4_ignition_toolbox ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
