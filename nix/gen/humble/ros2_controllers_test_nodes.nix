{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  std_msgs,
  substituteSource,
  trajectory_msgs,
}:
let
  sources = rec {
    ros2_controllers_test_nodes = substituteSource {
      src = fetchgit {
        name = "ros2_controllers_test_nodes-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "e9e185eea4a7cb380f4ea4fef1d2027c0391ed4f";
        hash = "sha256-b0Lb/8B6ogA8NEmbcCU9/cs1FNMQuC1i8fkihgCdpmk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2_controllers_test_nodes";
  version = "2.35.0-1";
  src = sources.ros2_controllers_test_nodes;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy std_msgs trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
