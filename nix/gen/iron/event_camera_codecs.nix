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
        rev = "a9af8e0f9a76a9b0e7f1702773101f667fc3d461";
        hash = "sha256-CkpIRrCqldZX8ESru10hlDsI2brlntQhJb68ujBrnds=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "event_camera_codecs";
  version = "1.2.4-1";
  src = sources.event_camera_codecs;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ class_loader event_camera_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}