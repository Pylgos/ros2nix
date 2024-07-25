{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  turtlebot4_cpp_tutorials,
  turtlebot4_python_tutorials,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot4_tutorials = substituteSource {
      src = fetchgit {
        name = "turtlebot4_tutorials-source";
        url = "https://github.com/ros2-gbp/turtlebot4_tutorials-release.git";
        rev = "7a072e871a3cfd38423ea6f07411a94271a70af1";
        hash = "sha256-aabhYsCks5EjPKEun9PcUEMwrMX0LbWzlrna1n9inRY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_tutorials";
  version = "1.0.1-1";
  src = sources.turtlebot4_tutorials;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ turtlebot4_cpp_tutorials turtlebot4_python_tutorials ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
