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
        rev = "1c6072cca9792aa335f5d6256306a912ad325609";
        hash = "sha256-BB3cBZFrc8n9PVh367lTsIVaFurWdmVaFE16Dwmjf7o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "theora_image_transport";
  version = "4.0.0-1";
  src = sources.theora_image_transport;
  nativeBuildInputs = [ ament_cmake pkg-config rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_transport libogg libtheora pluginlib rclcpp rcutils rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
