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
        rev = "60757db80186798c04e29ac1cac24946fac99fcd";
        hash = "sha256-XEH5m7HIECNa072bvaDnDIUeMeqA7uqhQnBeDuq2/ec=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_util";
  version = "1.2.9-1";
  src = sources.nav2_util;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ launch launch_testing_ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs bond bondcpp geometry_msgs lifecycle_msgs nav2_common nav2_msgs nav_msgs python3Packages.boost rcl_interfaces rclcpp rclcpp_action rclcpp_lifecycle tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
