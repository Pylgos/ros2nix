{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  composition_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rcl_interfaces,
  rclcpp_components,
  rclpy,
  ros2cli,
  ros2node,
  ros2param,
  ros2pkg,
  substituteSource,
}:
let
  sources = rec {
    ros2component = substituteSource {
      src = fetchgit {
        name = "ros2component-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "391991cffb92da395c63dd33e052288b61be05b4";
        hash = "sha256-OzbEXOphJbwr0J6cPT+PmF/piQNPB7mmA0ebmdTBmQg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2component";
  version = "0.18.10-1";
  src = sources.ros2component;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ composition_interfaces rcl_interfaces rclcpp_components rclpy ros2cli ros2node ros2param ros2pkg ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
