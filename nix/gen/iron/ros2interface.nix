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
        rev = "bc6d7db5f9dbbe5366884cdcd23e8a3305910f58";
        hash = "sha256-hudH5vHlo3g2v/ncKtyWM/N6qrLHyEkWBRWfoQIEHAs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2interface";
  version = "0.25.6-1";
  src = sources.ros2interface;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python rosidl_adapter ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2cli rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
