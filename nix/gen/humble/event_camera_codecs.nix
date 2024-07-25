{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_clang_format,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  class_loader,
  event_camera_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  ros_environment,
  rosbag2_cpp,
  substituteSource,
}:
let
  sources = rec {
    event_camera_codecs = substituteSource {
      src = fetchgit {
        name = "event_camera_codecs-source";
        url = "https://github.com/ros2-gbp/event_camera_codecs-release.git";
        rev = "2b75d1d430468ed948dbadcf0a2509c55dd2dbbb";
        hash = "sha256-sNSSf1AcftcdZ0LU5OhXc+o9GMJIsY/gbE9+usTZ64o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "event_camera_codecs";
  version = "1.1.3-1";
  src = sources.event_camera_codecs;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ class_loader event_camera_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
