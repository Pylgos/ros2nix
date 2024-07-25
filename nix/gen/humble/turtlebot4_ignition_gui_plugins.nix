{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    turtlebot4_ignition_gui_plugins = substituteSource {
      src = fetchgit {
        name = "turtlebot4_ignition_gui_plugins-source";
        url = "https://github.com/ros2-gbp/turtlebot4_simulator-release.git";
        rev = "a5155cdfd35c5216f0dda6795a4276e15f967ce5";
        hash = "sha256-++w7VqYUDnNSz8H555vB9rc0Zd0VGSpzhyW0FEODZrI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_ignition_gui_plugins";
  version = "1.0.2-1";
  src = sources.turtlebot4_ignition_gui_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
