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
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    launch_testing_examples = substituteSource {
      src = fetchgit {
        name = "launch_testing_examples-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "70e45c3117868b5f3aa2d09a6a4238d38346ef7b";
        hash = "sha256-Q1HX/jIOI7GLEwrrOoT1/Sa3P8q8UwNNwO3avxtvg+I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_testing_examples";
  version = "0.20.1-1";
  src = sources.launch_testing_examples;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ launch launch_testing buildPackages.python3Packages.pytest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ demo_nodes_cpp launch_ros launch_testing_ros rcl_interfaces rclpy ros2bag std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
