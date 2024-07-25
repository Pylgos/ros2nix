{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  libogg,
  libtheora,
  pkg-config,
  pluginlib,
  rclcpp,
  rcutils,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    theora_image_transport = substituteSource {
      src = fetchgit {
        name = "theora_image_transport-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "af3459ade9c423b3709ec395b329403b0d8b3a57";
        hash = "sha256-KNx6cI/0mD+oajo3bHBxP2XLjdV7QODhGF9Eb9sG9Nk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "theora_image_transport";
  version = "2.5.1-1";
  src = sources.theora_image_transport;
  nativeBuildInputs = [ ament_cmake pkg-config rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_transport libogg libtheora pluginlib rclcpp rcutils rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
