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
  rclcpp_components,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    nav2_smoother = substituteSource {
      src = fetchgit {
        name = "nav2_smoother-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "df5e4a6ce25f920a23902b01dec7224b4b496c25";
        hash = "sha256-0PwFw+UzrF+Ug3YeP6hzeokZ//l8wL0ARsz7V5h5YLI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_smoother";
  version = "1.2.9-1";
  src = sources.nav2_smoother;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles nav2_common nav2_core nav2_msgs nav2_util nav_2d_msgs nav_2d_utils pluginlib rclcpp rclcpp_action rclcpp_components std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
