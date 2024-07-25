{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    turtlebot3_teleop = substituteSource {
      src = fetchgit {
        name = "turtlebot3_teleop-source";
        url = "https://github.com/robotis-ros2-release/turtlebot3-release.git";
        rev = "91acf743faa3ba21d1c49c5faf1ed4b1f287d5e2";
        hash = "sha256-g2o2do3Pff546eAO8T1/8RdgBrfKXVW410BtaBoAb8s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_teleop";
  version = "2.1.5-1";
  src = sources.turtlebot3_teleop;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
