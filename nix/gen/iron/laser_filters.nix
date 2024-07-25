{
  ament_cmake_auto,
  ament_cmake_gtest,
  angles,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  filters,
  laser_geometry,
  message_filters,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    laser_filters = substituteSource {
      src = fetchgit {
        name = "laser_filters-source";
        url = "https://github.com/ros2-gbp/laser_filters-release.git";
        rev = "2488552aa71e9a78c31eeeb8c9df0da5f5236cbb";
        hash = "sha256-ruSsWz10XSElakzxzN1wQp+rS0CVAcaNHQpoVnP0f3k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "laser_filters";
  version = "2.0.7-1";
  src = sources.laser_filters;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_auto ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles filters laser_geometry message_filters pluginlib rclcpp rclcpp_lifecycle sensor_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
