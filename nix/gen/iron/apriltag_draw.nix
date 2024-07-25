{
  ament_cmake,
  ament_cmake_clang_format,
  ament_lint_auto,
  ament_lint_common,
  apriltag_msgs,
  buildRosPackage,
  cv_bridge,
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
    apriltag_draw = substituteSource {
      src = fetchgit {
        name = "apriltag_draw-source";
        url = "https://github.com/ros2-gbp/apriltag_detector-release.git";
        rev = "bf80e156f7d5be1bf6200232bc35a0b73e7c3f0f";
        hash = "sha256-cpZB/pu/fODphiJVajRau04P1oijFVWmA8bTg6FHujU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apriltag_draw";
  version = "2.2.0-1";
  src = sources.apriltag_draw;
  nativeBuildInputs = [ ament_cmake ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ apriltag_msgs cv_bridge image_transport rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
