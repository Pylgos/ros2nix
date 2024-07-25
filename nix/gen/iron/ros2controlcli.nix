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
        rev = "f1765fc50a86041cf986fe0ee58370cda2978e72";
        hash = "sha256-Zoux+L5Zpz7/ZjaWWi/IEihI2v4KeBLf1CzVoksWZA0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2controlcli";
  version = "3.25.0-1";
  src = sources.ros2controlcli;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager controller_manager_msgs python3Packages.pygraphviz rcl_interfaces rclpy ros2cli ros2node ros2param rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
