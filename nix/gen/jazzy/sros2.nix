{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_mypy,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  ros2cli,
  ros_testing,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    sros2 = substituteSource {
      src = fetchgit {
        name = "sros2-source";
        url = "https://github.com/ros2-gbp/sros2-release.git";
        rev = "3a92a9b9cc2f7dcf45cb81837d02f4bd4b1025d5";
        hash = "sha256-AFBegFKnVMDaE0Y8vtfiJv+gfqwvz088nnAIG4U5u50=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sros2";
  version = "0.13.2-1";
  src = sources.sros2;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.argcomplete buildPackages.python3Packages.importlib-resources ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python python3Packages.cryptography python3Packages.lxml rclpy ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
