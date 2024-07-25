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
        rev = "02d4b8faca5ec6755f180e4d6cdb7ff889217f2d";
        hash = "sha256-GYJgWV1LF5ik1Jpn65qFr6wReh2u+12NcQcgLfqZ3DM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2service";
  version = "0.34.0-1";
  src = sources.ros2service;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy ros2cli rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
