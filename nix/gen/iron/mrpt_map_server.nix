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
        rev = "191e0a5f8e5b319ddcecfe8944b68db6e4a097c5";
        hash = "sha256-lJmz9GTaZwG9nIqlqn9eJW01gjWJ4OpGzuoTyTFpodA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_map_server";
  version = "2.0.0-1";
  src = sources.mrpt_map_server;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_auto ament_lint_common mp2p_icp mrpt2 mrpt_msgs mrpt_nav_interfaces nav_msgs rclcpp rclcpp_components ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}