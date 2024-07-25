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
        rev = "7d942736b035d6b4d8657ecb77497151214e34b4";
        hash = "sha256-oBgClK1LmYAfJI1lsuKYk+mMM1QdLbn28u/otRBDdks=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sros2";
  version = "0.15.0-1";
  src = sources.sros2;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python buildPackages.python3Packages.argcomplete buildPackages.python3Packages.importlib-resources ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.cryptography python3Packages.lxml rclpy ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
