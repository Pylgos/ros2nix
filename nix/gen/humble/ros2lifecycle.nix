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
        rev = "dd9609d8609c1963268a46bf74ebc3989a94508c";
        hash = "sha256-7QTTbV5lj/N3W4GsOhDXW9+9eCzC9DinmJe9loTxG3w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2lifecycle";
  version = "0.18.10-1";
  src = sources.ros2lifecycle;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs rclpy ros2cli ros2node ros2service ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
