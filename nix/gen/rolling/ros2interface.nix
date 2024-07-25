{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  launch_testing_ros,
  python3Packages,
  ros2cli,
  ros2cli_test_interfaces,
  rosidl_adapter,
  rosidl_runtime_py,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    ros2interface = substituteSource {
      src = fetchgit {
        name = "ros2interface-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "fdc388b73e3b86fe2457ef1e055f0cfd5e2f3077";
        hash = "sha256-b/yDi2woRBks6WBbNbjkquBH84p5VbhAnIawfI9y9hA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2interface";
  version = "0.34.0-1";
  src = sources.ros2interface;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python rosidl_adapter ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2cli rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
