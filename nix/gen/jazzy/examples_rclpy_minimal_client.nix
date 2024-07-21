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
    examples_rclpy_minimal_client = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "d149821ca87d6608df40eb67fc9625e567a5d1a4";
        hash = "sha256-ArQUsjRTLQk95bcoXaFC1l3execpR74HzzFrOyYJpAk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclpy_minimal_client";
  version = "0.19.4-1";
  src = sources.examples_rclpy_minimal_client;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}