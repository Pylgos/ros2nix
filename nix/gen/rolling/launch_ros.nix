{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  composition_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  lifecycle_msgs,
  osrf_pycommon,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    launch_ros = substituteSource {
      src = fetchgit {
        name = "launch_ros-source";
        url = "https://github.com/ros2-gbp/launch_ros-release.git";
        rev = "80e9c859399b87303518b296d707334ec870baf4";
        hash = "sha256-uS/7x2BjMZM6FzhDDSkDvvHd3OTxVnzZPJFo2Zk1/hA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_ros";
  version = "0.27.1-1";
  src = sources.launch_ros;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python launch osrf_pycommon buildPackages.python3Packages.importlib-metadata buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ composition_interfaces lifecycle_msgs rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
