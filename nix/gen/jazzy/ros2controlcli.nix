{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  controller_manager,
  controller_manager_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rcl_interfaces,
  rclpy,
  ros2cli,
  ros2node,
  ros2param,
  rosidl_runtime_py,
  substituteSource,
}:
let
  sources = rec {
    ros2controlcli = substituteSource {
      src = fetchgit {
        name = "ros2controlcli-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "bb75121b71e09348bded44ea826642c201128b60";
        hash = "sha256-woJrrpZfcqU4r3w1x777fOtXnBBCYDkN4kb+VgU01h4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2controlcli";
  version = "4.11.0-1";
  src = sources.ros2controlcli;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager controller_manager_msgs python3Packages.pygraphviz rcl_interfaces rclpy ros2cli ros2node ros2param rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
