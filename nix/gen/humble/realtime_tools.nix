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
        rev = "51668a71da4d838066537885d1eba5c89d87c076";
        hash = "sha256-Q+ZmEMwbVher38kNPY7nBhoTCWhDQRs6ytN4V4cZqjM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "realtime_tools";
  version = "2.5.0-1";
  src = sources.realtime_tools;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_action ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
