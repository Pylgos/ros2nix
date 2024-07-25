{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  chrony,
  curl,
  fetchgit,
  fetchurl,
  fetchzip,
  networkmanager,
  rmw_cyclonedds_cpp,
  rmw_fastrtps_cpp,
  robot_upstart,
  simple_term_menu_vendor,
  substituteSource,
}:
let
  sources = rec {
    turtlebot4_setup = substituteSource {
      src = fetchgit {
        name = "turtlebot4_setup-source";
        url = "https://github.com/ros2-gbp/turtlebot4_setup-release.git";
        rev = "f0dd786ceef65011523148203cef71becdcf143e";
        hash = "sha256-YM1p/wC98J/4Z0wzf2ju7RRv14TiaVSwVwrBlHW+EM4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_setup";
  version = "1.0.4-1";
  src = sources.turtlebot4_setup;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ curl ];
  buildInputs = [  ];
  propagatedBuildInputs = [ chrony networkmanager rmw_cyclonedds_cpp rmw_fastrtps_cpp robot_upstart simple_term_menu_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
