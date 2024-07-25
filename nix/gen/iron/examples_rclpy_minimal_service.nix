{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  example_interfaces,
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
    examples_rclpy_minimal_service = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_service-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "f5b20aba89a7b5e50ccb6e492334dd6ac766c1d1";
        hash = "sha256-oyeo0IW/fU+xInt+Dbe54iajFHOE7DU9B0C9A12qe3s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclpy_minimal_service";
  version = "0.18.0-2";
  src = sources.examples_rclpy_minimal_service;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
