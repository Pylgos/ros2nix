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
        rev = "3d1e4b3cc24561996f6fc37f204edd9f45b413c5";
        hash = "sha256-DrXv+qfgkpt3M1t2tgDoIzv2zft5DLLU34KgvVpiBW0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_ros";
  version = "0.24.1-1";
  src = sources.launch_ros;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python launch osrf_pycommon buildPackages.python3Packages.importlib-metadata buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ composition_interfaces lifecycle_msgs rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
