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
  rclpy,
  substituteSource,
  turtlebot4_navigation,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot4_python_tutorials = substituteSource {
      src = fetchgit {
        name = "turtlebot4_python_tutorials-source";
        url = "https://github.com/ros2-gbp/turtlebot4_tutorials-release.git";
        rev = "53ea006c711b24fc901f1513cb571afe6d012694";
        hash = "sha256-7D8580yyux7ctWXrIayIBor+du4XC0d3x1G7swBq1MA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_python_tutorials";
  version = "1.0.1-1";
  src = sources.turtlebot4_python_tutorials;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ irobot_create_msgs rclpy turtlebot4_navigation ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
