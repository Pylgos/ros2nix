{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rclpy,
  sensor_msgs,
  substituteSource,
  turtlebot3_msgs,
}:
let
  sources = rec {
    turtlebot3_example = substituteSource {
      src = fetchgit {
        name = "turtlebot3_example-source";
        url = "https://github.com/robotis-ros2-release/turtlebot3-release.git";
        rev = "b7addb93fdbf48419769a68dd59f6be0bc5de3d6";
        hash = "sha256-MAQcSWCJsds74ow4ACPsaQKi3ui6ktaBN0VkHNOUrZY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_example";
  version = "2.1.5-1";
  src = sources.turtlebot3_example;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav_msgs rclpy sensor_msgs turtlebot3_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
