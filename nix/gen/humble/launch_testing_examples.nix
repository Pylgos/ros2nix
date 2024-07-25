{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  demo_nodes_cpp,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ros,
  python3Packages,
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
        rev = "795d1bafa4b9d55cbb339bacf64881d1e6db7225";
        hash = "sha256-p3vlS69VFPZsIW9Vr5LxkDfjQsnNjdxp4r+C/dgpj0c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_testing_examples";
  version = "0.15.1-1";
  src = sources.launch_testing_examples;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
