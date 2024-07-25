{
  ament_cmake_auto,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_geometry,
  image_proc,
  image_transport,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ament_cmake,
  message_filters,
  python3Packages,
  python_cmake_module,
  rclcpp,
  rclcpp_components,
  rclpy,
  ros_testing,
  sensor_msgs,
  stereo_msgs,
  substituteSource,
}:
let
  sources = rec {
    stereo_image_proc = substituteSource {
      src = fetchgit {
        name = "stereo_image_proc-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "9593d1df3e3c94b9bc9ffa943ed07949eb877886";
        hash = "sha256-bQqz1fPzl9tzYTbOqPXj9Nd0y0w9JDzkZpJH50bJHx8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "stereo_image_proc";
  version = "3.0.4-1";
  src = sources.stereo_image_proc;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_geometry image_proc image_transport message_filters rclcpp rclcpp_components sensor_msgs stereo_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
