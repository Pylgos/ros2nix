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
        rev = "a860835243d079122a73f6d013fb90846b9ea401";
        hash = "sha256-ue+HIYu96yF0zGqL5dexRs5Yj64YF4L+34P2hRuLFQQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_controller";
  version = "1.1.15-1";
  src = sources.nav2_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles nav2_common nav2_core nav2_msgs nav2_util nav_2d_msgs nav_2d_utils pluginlib rclcpp rclcpp_action std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
