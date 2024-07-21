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
        rev = "5e7b6eadffc924bce02c147aaee115e21b564fc8";
        hash = "sha256-4HeOI1VnkkBwlxa0SlJMAGbmV5bMUIvxslRecDwZm04=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclpy_message_converter";
  version = "2.0.1-4";
  src = sources.rclpy_message_converter;
  nativeBuildInputs = [ rosidl_default_generators ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy rosidl_parser ];
  buildInputs = [ builtin_interfaces ];
  propagatedBuildInputs = [ rclpy rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}