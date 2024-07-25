{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildPackages,
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
        rev = "63d1a5a41e2c79f0ea35daee01c03f1bf81cbeb1";
        hash = "sha256-yDfHzS6cjHXFaBoVDoAsdpQTnVppoDcNKZ04Jny1e20=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclpy_pointcloud_publisher";
  version = "0.15.1-1";
  src = sources.examples_rclpy_pointcloud_publisher;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy sensor_msgs sensor_msgs_py std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
