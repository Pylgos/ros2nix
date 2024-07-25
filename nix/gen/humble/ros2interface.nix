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
        rev = "96e8544376e7c6d1ab8880644f40489820b8567b";
        hash = "sha256-QdSVn07VIU8+lGanBmXx0w22/lV8tyB5Pn836I+F0oI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2interface";
  version = "0.18.10-1";
  src = sources.ros2interface;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2cli rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
