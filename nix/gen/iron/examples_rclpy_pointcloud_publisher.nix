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
        rev = "427612fdba65ac680521ed7698155da4b269ab4f";
        hash = "sha256-UDaWUIX5mVaD4fcd5K81S+q97LizJqwsGkg7HgWGBcM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclpy_pointcloud_publisher";
  version = "0.18.0-2";
  src = sources.examples_rclpy_pointcloud_publisher;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy sensor_msgs sensor_msgs_py std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
