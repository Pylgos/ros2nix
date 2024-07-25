{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg,
  ffmpeg_image_transport_msgs,
  image_transport,
  libogg,
  pkg-config,
  pluginlib,
  rclcpp,
  rcutils,
  ros_environment,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ffmpeg_image_transport = substituteSource {
      src = fetchgit {
        name = "ffmpeg_image_transport-source";
        url = "https://github.com/ros2-gbp/ffmpeg_image_transport-release.git";
        rev = "36e3dc1a7515f6b68d7a4f42112bbc633341f191";
        hash = "sha256-vlpRxk27SnVwCdRo3eOjZt6SFal8sjbloIxOQqTKayU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ffmpeg_image_transport";
  version = "1.1.2-1";
  src = sources.ffmpeg_image_transport;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros pkg-config ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge ffmpeg ffmpeg_image_transport_msgs image_transport libogg pluginlib rclcpp rcutils sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
