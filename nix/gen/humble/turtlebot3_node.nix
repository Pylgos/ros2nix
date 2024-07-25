{
  ament_cmake,
  buildRosPackage,
  dynamixel_sdk,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  message_filters,
  nav_msgs,
  rclcpp,
  rcutils,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_ros,
  turtlebot3_msgs,
}:
let
  sources = rec {
    turtlebot3_node = substituteSource {
      src = fetchgit {
        name = "turtlebot3_node-source";
        url = "https://github.com/robotis-ros2-release/turtlebot3-release.git";
        rev = "d0bc62b8029769402faaff9dbd011a465a40e2a7";
        hash = "sha256-PAzdvdC18y6A9MZLdbE4GlHHg/3Nq4JUyC3NdimcKEk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_node";
  version = "2.1.5-1";
  src = sources.turtlebot3_node;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dynamixel_sdk geometry_msgs message_filters nav_msgs rclcpp rcutils sensor_msgs std_msgs std_srvs tf2 tf2_ros turtlebot3_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
