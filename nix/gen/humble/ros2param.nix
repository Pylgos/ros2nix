{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ros,
  python3Packages,
  rcl_interfaces,
  rclpy,
  ros2cli,
  ros2node,
  ros2service,
  substituteSource,
}:
let
  sources = rec {
    ros2param = substituteSource {
      src = fetchgit {
        name = "ros2param-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "706e1bcb55a9e63ba844bfe802f8071f52ba8f19";
        hash = "sha256-2QwUl8LzEL1CTrnVNckr50RSAVcqMzipTl7LRthA9g8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2param";
  version = "0.18.10-1";
  src = sources.ros2param;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcl_interfaces rclpy ros2cli ros2node ros2service ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
