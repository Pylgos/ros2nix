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
        rev = "5b34d20ee46bdcef99348d15cf6389ba7a321b5f";
        hash = "sha256-OHCqd9sBlm8Wr/FxlNu1bXjHFNtFiInyUTje1Fh5nOo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2topic";
  version = "0.34.0-1";
  src = sources.ros2topic;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.numpy rclpy ros2cli rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
