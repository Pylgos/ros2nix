{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_cppcheck,
  ament_lint_auto,
  apriltag,
  apriltag_msgs,
  buildRosPackage,
  cv_bridge,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    apriltag_ros = substituteSource {
      src = fetchgit {
        name = "apriltag_ros-source";
        url = "https://github.com/ros2-gbp/apriltag_ros-release.git";
        rev = "825eba4950ffb107339d4f0740167c8589ab034e";
        hash = "sha256-RqtO6HznMf2OumkP4Zz7aaD0HFwKa18ZRL5iHRH3TmE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apriltag_ros";
  version = "3.1.1-4";
  src = sources.apriltag_ros;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ apriltag apriltag_msgs cv_bridge eigen image_transport rclcpp rclcpp_components sensor_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
