{
  action_msgs,
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  bond,
  bondcpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch,
  launch_testing_ament_cmake,
  launch_testing_ros,
  lifecycle_msgs,
  nav2_common,
  nav2_msgs,
  nav_msgs,
  python3Packages,
  rcl_interfaces,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  std_srvs,
  substituteSource,
  test_msgs,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    nav2_util = substituteSource {
      src = fetchgit {
        name = "nav2_util-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "68be52a2f8062c0175030258a8b781e119f6fd6c";
        hash = "sha256-MNPF+G+HaarQb+u4UY5FzrczvHbdcgHAf8c0B6ne5cA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_util";
  version = "1.1.15-1";
  src = sources.nav2_util;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ launch launch_testing_ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs bond bondcpp geometry_msgs lifecycle_msgs nav2_common nav2_msgs nav_msgs python3Packages.boost rcl_interfaces rclcpp rclcpp_action rclcpp_lifecycle tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
