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
        rev = "52a5a7c1a02e3c4857b83107c4433b78c3cf4785";
        hash = "sha256-9Qcqr1MuIza3LVNO7urn+CXBhMsYcijce8lXZUE1CpU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apriltag_draw";
  version = "2.1.0-1";
  src = sources.apriltag_draw;
  nativeBuildInputs = [ ament_cmake ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ apriltag_msgs cv_bridge image_transport rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
