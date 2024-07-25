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
        rev = "db4ebbcb86280b99d28531e8ff27005754892e73";
        hash = "sha256-+InJa3871y1ykkwQgsYmvPW/Gb9ei79+U4nXdd2juk4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ffmpeg_image_transport";
  version = "1.2.1-1";
  src = sources.ffmpeg_image_transport;
  nativeBuildInputs = [ ament_cmake ament_cmake_clang_format ament_cmake_ros pkg-config ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge ffmpeg ffmpeg_image_transport_msgs image_transport libogg pluginlib rclcpp rcutils sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
