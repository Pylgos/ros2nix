{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot_create_msgs,
  python3Packages,
  sensor_msgs,
  std_msgs,
  substituteSource,
  turtlebot4_msgs,
}:
let
  sources = rec {
    turtlebot4_tests = substituteSource {
      src = fetchgit {
        name = "turtlebot4_tests-source";
        url = "https://github.com/ros2-gbp/turtlebot4_robot-release.git";
        rev = "f2fd6e370dc7da33564b183e8a0709c13ec428f3";
        hash = "sha256-FwD7L/4XgL2f613gS4AQXG1Who9jNHPyKqCqW5Sgu3o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_tests";
  version = "1.0.3-1";
  src = sources.turtlebot4_tests;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ irobot_create_msgs python3Packages.psutil sensor_msgs std_msgs turtlebot4_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
