{
  ament_cmake,
  ament_cmake_gmock,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_action,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    realtime_tools = substituteSource {
      src = fetchgit {
        name = "realtime_tools-source";
        url = "https://github.com/ros2-gbp/realtime_tools-release.git";
        rev = "c8f2f2743fe5e16187e32786e3a25df1c11fd090";
        hash = "sha256-Q+ZmEMwbVher38kNPY7nBhoTCWhDQRs6ytN4V4cZqjM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "realtime_tools";
  version = "2.5.0-4";
  src = sources.realtime_tools;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_action ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
