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
        rev = "70413a0bf7988fb28e7691134c02858ee74f3aad";
        hash = "sha256-06hg9sNG939v302RwBNSEs/EenD0pMwvoMMJWWjDhR0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2lifecycle";
  version = "0.34.0-1";
  src = sources.ros2lifecycle;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs rclpy ros2cli ros2node ros2service ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
