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
        rev = "10d0ef86ae829f36ac0c70121d031003045a7974";
        hash = "sha256-DLEAxxbYUf+ERyK1tBJ50b8gKx/4YQbLWA3dM1/W7/g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2component";
  version = "0.25.6-1";
  src = sources.ros2component;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ composition_interfaces rcl_interfaces rclcpp_components rclpy ros2cli ros2node ros2param ros2pkg ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
