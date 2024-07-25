{
  action_tutorials_interfaces,
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  control_msgs,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch_ros,
  launch_testing,
  rclpy,
  rosidl_runtime_py,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  teleop_tools_msgs,
  test_msgs,
  trajectory_msgs,
}:
let
  sources = rec {
    joy_teleop = substituteSource {
      src = fetchgit {
        name = "joy_teleop-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "0987d1fd81906a4593ccab44be9008a33de41d17";
        hash = "sha256-VhLfbJ1z++s5bQPQospx/fGaVJbwS6BuLHFiFyn45bk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joy_teleop";
  version = "1.5.0-1";
  src = sources.joy_teleop;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs rclpy rosidl_runtime_py sensor_msgs teleop_tools_msgs trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}