{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python3Packages,
  rclpy,
  rclpy_message_converter_msgs,
  rosidl_default_generators,
  rosidl_parser,
  rosidl_runtime_py,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_msgs,
}:
let
  sources = rec {
    rclpy_message_converter = substituteSource {
      src = fetchgit {
        name = "rclpy_message_converter-source";
        url = "https://github.com/ros2-gbp/rospy_message_converter-release.git";
        rev = "0b1d62e10565ac64980182360f063c3cb15d3a44";
        hash = "sha256-DCqqMbmIIzPN9jyxeYneVEa6gg9iyDFuE/X1iv9EYPk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclpy_message_converter";
  version = "2.0.2-1";
  src = sources.rclpy_message_converter;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy rosidl_default_generators rosidl_parser ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rclpy rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
