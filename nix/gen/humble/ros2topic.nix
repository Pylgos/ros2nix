{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ros,
  python3Packages,
  rclpy,
  ros2cli,
  rosgraph_msgs,
  rosidl_runtime_py,
  std_msgs,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    ros2topic = substituteSource {
      src = fetchgit {
        name = "ros2topic-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "bfaf4c89b2709d7800700899fb198321ab70883d";
        hash = "sha256-tedd6M4iO3VwEuTXAIYe/hpF8GSBXmxDFLeyWBWZQ0I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2topic";
  version = "0.18.10-1";
  src = sources.ros2topic;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy ros2cli rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
