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
        rev = "0d3ea06e22db76f76c729c12bcf4da17905335a0";
        hash = "sha256-Ig6/EQ9N6xBgTBnjR/68+jDiqJalyHOIlwvl/lTpXzg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclpy_minimal_subscriber";
  version = "0.15.1-1";
  src = sources.examples_rclpy_minimal_subscriber;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
