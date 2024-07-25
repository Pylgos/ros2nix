{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_ros_pkgs,
  geometry_msgs,
  nav_msgs,
  rclcpp,
  sensor_msgs,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    turtlebot3_gazebo = substituteSource {
      src = fetchgit {
        name = "turtlebot3_gazebo-source";
        url = "https://github.com/ros2-gbp/turtlebot3_simulations-release.git";
        rev = "f64e935c3e676faaa8e870501b8817d72139a2e9";
        hash = "sha256-v6xnRm6M8asU/HVNlinmuyhrm7cTaIuA3aSHJzPeX6c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_gazebo";
  version = "2.2.5-4";
  src = sources.turtlebot3_gazebo;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_ros_pkgs geometry_msgs nav_msgs rclcpp sensor_msgs tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
