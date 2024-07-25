{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  demo_nodes_cpp,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ros,
  rcl_interfaces,
  rclpy,
  ros2bag,
  rosbag2_transport,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    launch_testing_examples = substituteSource {
      src = fetchgit {
        name = "launch_testing_examples-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "f4e7dd12ceb420112edd276cece88b0aaeaa7826";
        hash = "sha256-wzauSPtZ4nLT9O+0xopD6Bdc+SaahC18kmtEu1b/Pd4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_testing_examples";
  version = "0.18.0-2";
  src = sources.launch_testing_examples;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ launch launch_testing buildPackages.python3Packages.pytest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ demo_nodes_cpp launch_ros launch_testing_ros rcl_interfaces rclpy ros2bag rosbag2_transport std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
