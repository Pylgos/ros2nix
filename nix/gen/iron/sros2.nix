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
        rev = "afb1d35f9b8dfd4d6fd9026dfbc346fd095c11ad";
        hash = "sha256-2eYTPgP73iGi55VPFMYKvEyA/X9X+qps8tBtGhgsSv0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sros2";
  version = "0.11.3-1";
  src = sources.sros2;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python buildPackages.python3Packages.importlib-resources ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.cryptography python3Packages.lxml rclpy ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
