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
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    examples_rclpy_minimal_subscriber = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_subscriber-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "2e7e4ef4c3f47a9b73c8bf4bdee62f1c58176a9f";
        hash = "sha256-O8I5S/rmfUh0KPiQa8gGWpJhSfQ20GVkZQg0f/TuGws=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclpy_minimal_subscriber";
  version = "0.18.0-2";
  src = sources.examples_rclpy_minimal_subscriber;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
