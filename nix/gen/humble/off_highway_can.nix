{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  can_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    off_highway_can = substituteSource {
      src = fetchgit {
        name = "off_highway_can-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "1b414a01b0b6bda492c0f7fe0a6d517fb0db7668";
        hash = "sha256-+/1SkOMfscczPSt0YR/ElW+P07E6JIZAy/Z1FUxvaaU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "off_highway_can";
  version = "0.6.2-1";
  src = sources.off_highway_can;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ can_msgs diagnostic_updater rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
