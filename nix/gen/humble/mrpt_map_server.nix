{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mp2p_icp,
  mrpt2,
  mrpt_msgs,
  mrpt_nav_interfaces,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  substituteSource,
}:
let
  sources = rec {
    mrpt_map_server = substituteSource {
      src = fetchgit {
        name = "mrpt_map_server-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "f1efb86ed5215eec1caa128035da28e411339289";
        hash = "sha256-0okmHX1+i21DBNc763mbA5Kabp8VnP3R9nCYBlvuLR8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_map_server";
  version = "2.0.1-1";
  src = sources.mrpt_map_server;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_common mp2p_icp mrpt2 mrpt_msgs mrpt_nav_interfaces nav_msgs rclcpp rclcpp_components ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
