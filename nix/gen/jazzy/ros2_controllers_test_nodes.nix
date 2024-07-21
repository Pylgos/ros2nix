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
        rev = "a7b06155a4a125858257afc51dc630e2843fbd58";
        hash = "sha256-yBqay62SDlFzwLSzIkWKd4+p0vPybrGWmPAK0A6iNLY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2_controllers_test_nodes";
  version = "4.9.0-1";
  src = sources.ros2_controllers_test_nodes;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy std_msgs trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
