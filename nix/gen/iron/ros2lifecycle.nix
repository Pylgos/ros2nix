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
  lifecycle_msgs,
  python3Packages,
  rclpy,
  ros2cli,
  ros2lifecycle_test_fixtures,
  ros2node,
  ros2service,
  substituteSource,
}:
let
  sources = rec {
    ros2lifecycle = substituteSource {
      src = fetchgit {
        name = "ros2lifecycle-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "cf72209d8d4107039bd0c709f0c6c2089bacfd8e";
        hash = "sha256-G5lnm6FN8ea0xUdwTbrNNrTnIuPthBEQ4m8hSHqBnTs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2lifecycle";
  version = "0.25.6-1";
  src = sources.ros2lifecycle;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs rclpy ros2cli ros2node ros2service ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
