{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_common,
  nav2_core,
  nav2_msgs,
  nav2_util,
  nav_2d_msgs,
  nav_2d_utils,
  pluginlib,
  rclcpp,
  rclcpp_action,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    nav2_controller = substituteSource {
      src = fetchgit {
        name = "nav2_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "a2f2dd2d1eb65787bd5355b6ee0c36f3ba51f63a";
        hash = "sha256-a/6ly/a5n+C+JYQ/TBMZinxr1kMMpbdoHp1XrYgabpo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_controller";
  version = "1.2.9-1";
  src = sources.nav2_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles nav2_common nav2_core nav2_msgs nav2_util nav_2d_msgs nav_2d_utils pluginlib rclcpp rclcpp_action std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
