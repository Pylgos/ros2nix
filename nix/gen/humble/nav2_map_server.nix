{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  graphicsmagick,
  launch,
  launch_ros,
  launch_testing,
  nav2_common,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  rclcpp,
  rclcpp_lifecycle,
  std_msgs,
  substituteSource,
  tf2,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    nav2_map_server = substituteSource {
      src = fetchgit {
        name = "nav2_map_server-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "32d570273b059da6973cdd9b8eb1f9ad61f5c1ab";
        hash = "sha256-wCcv73dWDdl5NADwrHeAnEejsg1/YdA1fNSuO3IqNSs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_map_server";
  version = "1.1.15-1";
  src = sources.nav2_map_server;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ launch_testing ];
  buildInputs = [  ];
  propagatedBuildInputs = [ graphicsmagick launch_ros nav2_common nav2_msgs nav2_util nav_msgs rclcpp rclcpp_lifecycle std_msgs tf2 yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
