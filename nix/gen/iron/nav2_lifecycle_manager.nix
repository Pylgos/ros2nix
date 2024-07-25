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
        rev = "23936fcf3bff858ab6870527d52393f8d3baec02";
        hash = "sha256-uiE5am+X1ZxS4+d6Qq3QFIwr1KMnGkK/PF8suIXwaNA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_lifecycle_manager";
  version = "1.2.9-1";
  src = sources.nav2_lifecycle_manager;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bondcpp diagnostic_updater geometry_msgs lifecycle_msgs nav2_common nav2_msgs nav2_util rclcpp_action rclcpp_lifecycle std_msgs std_srvs tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
