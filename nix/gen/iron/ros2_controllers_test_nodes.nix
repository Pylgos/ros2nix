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
        rev = "9ae8e8de894e0a343a5d2d3e2ceddffc099fe9f6";
        hash = "sha256-gjWN6jgxoBIfvBRn2km0hiDrZe1awSAoOXsWLvbPRWk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2_controllers_test_nodes";
  version = "3.24.0-1";
  src = sources.ros2_controllers_test_nodes;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy std_msgs trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
