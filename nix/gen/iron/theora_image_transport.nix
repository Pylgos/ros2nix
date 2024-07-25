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
        rev = "1da8757f7787d4eb64a81d110ebbb4c4541e46fe";
        hash = "sha256-gaNnfI12qVsMjYu42Ba5y7XZ386ucrSZNE2eh4pVZds=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "theora_image_transport";
  version = "3.1.0-1";
  src = sources.theora_image_transport;
  nativeBuildInputs = [ ament_cmake pkg-config rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_transport libogg libtheora pluginlib rclcpp rcutils rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
