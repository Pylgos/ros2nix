{
  action_msgs,
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
  rclpy,
  ros2cli,
  rosidl_runtime_py,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    ros2action = substituteSource {
      src = fetchgit {
        name = "ros2action-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "b42d1dbc99e8b4d65dad48da700b55b48a3c863d";
        hash = "sha256-9gtjKaWwXtjDbx1oPfF8Wvu+13LZ+aiwS7ufw4XBfQs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2action";
  version = "0.25.6-1";
  src = sources.ros2action;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rclpy ros2cli rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
