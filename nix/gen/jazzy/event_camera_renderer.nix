{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_clang_format,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  event_camera_codecs,
  event_camera_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  rclcpp,
  rclcpp_components,
  ros_environment,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    event_camera_renderer = substituteSource {
      src = fetchgit {
        name = "event_camera_renderer-source";
        url = "https://github.com/ros2-gbp/event_camera_renderer-release.git";
        rev = "224dfb7f7b9201a58a0bdba4eb8bb69deb44f3b0";
        hash = "sha256-WnRWflQ+N8Urzm077M3kQCQ5qXRvnyKtXlxE2ITfAiY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "event_camera_renderer";
  version = "1.3.4-1";
  src = sources.event_camera_renderer;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ event_camera_codecs event_camera_msgs image_transport rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}