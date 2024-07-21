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
        rev = "4171b198fc1a21628180da5964eb289b35a3d934";
        hash = "sha256-ruSsWz10XSElakzxzN1wQp+rS0CVAcaNHQpoVnP0f3k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "laser_filters";
  version = "2.0.7-3";
  src = sources.laser_filters;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles filters laser_geometry message_filters pluginlib rclcpp rclcpp_lifecycle sensor_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}