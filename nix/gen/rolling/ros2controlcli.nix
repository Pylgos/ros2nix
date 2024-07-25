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
        rev = "393ecd308bac249aa52cba0bc301cd8a850d9e76";
        hash = "sha256-H10WRkH7v/9QruLEbpGnY7RQOujBQIB1ODi8JWy7KF8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2controlcli";
  version = "4.12.0-1";
  src = sources.ros2controlcli;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager controller_manager_msgs python3Packages.pygraphviz rcl_interfaces rclpy ros2cli ros2node ros2param rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
