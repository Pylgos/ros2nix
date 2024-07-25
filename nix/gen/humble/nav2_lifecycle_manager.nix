{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  bondcpp,
  buildRosPackage,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  lifecycle_msgs,
  nav2_common,
  nav2_msgs,
  nav2_util,
  rclcpp_action,
  rclcpp_lifecycle,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    nav2_lifecycle_manager = substituteSource {
      src = fetchgit {
        name = "nav2_lifecycle_manager-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "abfee6588a5f0f67b58c6aca6bac019352c5a900";
        hash = "sha256-eC4BeQQcD0Q1Qf7P7O+G5jBuwvV4ke7V3P16kpHonBs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_lifecycle_manager";
  version = "1.1.15-1";
  src = sources.nav2_lifecycle_manager;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bondcpp diagnostic_updater geometry_msgs lifecycle_msgs nav2_common nav2_msgs nav2_util rclcpp_action rclcpp_lifecycle std_msgs std_srvs tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
