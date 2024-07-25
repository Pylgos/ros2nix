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
        rev = "7b7b175e50a7f53a65ca9164e57f1f8abca550a6";
        hash = "sha256-Rrjn4ICKctJGgsZ+RqXCqd9jtSBtYNSM8a2SwTrYa8A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2param";
  version = "0.25.6-1";
  src = sources.ros2param;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcl_interfaces rclpy ros2cli ros2node ros2service ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
