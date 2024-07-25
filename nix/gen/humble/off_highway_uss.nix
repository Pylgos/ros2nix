{
  ament_cmake,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  can_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  off_highway_can,
  off_highway_uss_msgs,
  pcl_conversions,
  pcl_ros,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    off_highway_uss = substituteSource {
      src = fetchgit {
        name = "off_highway_uss-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "f26dc0bf1b55c87c4d24a0c3869b0fd441b9d49c";
        hash = "sha256-Ivx505cGFkoR294PBmohcsr8sFJmHj18fKYef4MhVpk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "off_highway_uss";
  version = "0.6.2-1";
  src = sources.off_highway_uss;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ can_msgs off_highway_can off_highway_uss_msgs pcl_conversions pcl_ros rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
