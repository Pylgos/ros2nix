{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  sensor_msgs,
  sensor_msgs_py,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    examples_rclpy_pointcloud_publisher = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_pointcloud_publisher-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "c94b85ce2fa8d7c8e0ccfa2a5c8ea029289d9ec4";
        hash = "sha256-GL7Y5c3zQT4OvXfeE+6BCseasEsdYAdxc7aIFQKlMBY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclpy_pointcloud_publisher";
  version = "0.20.1-1";
  src = sources.examples_rclpy_pointcloud_publisher;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.numpy rclpy sensor_msgs sensor_msgs_py std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
