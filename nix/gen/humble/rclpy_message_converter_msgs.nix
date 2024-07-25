{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  substituteSource,
}:
let
  sources = rec {
    rclpy_message_converter_msgs = substituteSource {
      src = fetchgit {
        name = "rclpy_message_converter_msgs-source";
        url = "https://github.com/ros2-gbp/rospy_message_converter-release.git";
        rev = "37028db489c48cafc8041ed91072aba483b80af2";
        hash = "sha256-p/kxXngXBBgZ4f7MVpWP3clFk+ZLssUxqLlDiRGvh40=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclpy_message_converter_msgs";
  version = "2.0.2-1";
  src = sources.rclpy_message_converter_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
