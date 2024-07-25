{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  camera_info_manager,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_dev,
  gazebo_msgs,
  gazebo_ros,
  geometry_msgs,
  image_transport,
  nav_msgs,
  rclcpp,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_geometry_msgs,
  tf2_ros,
  trajectory_msgs,
}:
let
  sources = rec {
    gazebo_plugins = substituteSource {
      src = fetchgit {
        name = "gazebo_plugins-source";
        url = "https://github.com/ros2-gbp/gazebo_ros_pkgs-release.git";
        rev = "7c45be953deaa1f8119c69f5f6ff897eda7d0333";
        hash = "sha256-WIdWb0AYx07PFWwH/o1Du5im1crwunrAhf50PZV8cZQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gazebo_plugins";
  version = "3.7.0-1";
  src = sources.gazebo_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_info_manager cv_bridge gazebo_dev gazebo_msgs gazebo_ros geometry_msgs image_transport nav_msgs rclcpp sensor_msgs std_msgs std_srvs tf2_geometry_msgs tf2_ros trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
