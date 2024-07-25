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
        rev = "da9b98d12a61ca44eaf91fdfc8ac2c2c26a800a9";
        hash = "sha256-el9zfmTUA2B/S9aDwRK/9vhbtxm6y2YMo3+fVCdc7tY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_smoother";
  version = "1.1.15-1";
  src = sources.nav2_smoother;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles nav2_common nav2_core nav2_msgs nav2_util nav_2d_msgs nav_2d_utils pluginlib rclcpp rclcpp_action rclcpp_components std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
