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
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ros,
  python3Packages,
  rclpy,
  ros2cli,
  rosidl_runtime_py,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    ros2service = substituteSource {
      src = fetchgit {
        name = "ros2service-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "4d2b2ccb66e0bc2f44e710792cc5de6d002dffe6";
        hash = "sha256-pje17tn/+wM8KxiAJ1eWlh8JKp4/G7rLRNnZ33L7yZE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2service";
  version = "0.18.10-1";
  src = sources.ros2service;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy ros2cli rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
