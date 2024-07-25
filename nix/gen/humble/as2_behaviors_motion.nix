{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_lint_auto,
  as2_behavior,
  as2_core,
  as2_motion_reference_handlers,
  as2_msgs,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  rclcpp,
  rclcpp_action,
  rclcpp_components,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    as2_behaviors_motion = substituteSource {
      src = fetchgit {
        name = "as2_behaviors_motion-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "84948825db4a15afc7a373527dbe34f1380518ff";
        hash = "sha256-11PyQhopz5WNHcX4D2zUdU4CVbX38fbXxlYnsig0Lws=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_behaviors_motion";
  version = "1.0.9-1";
  src = sources.as2_behaviors_motion;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ as2_behavior as2_core as2_motion_reference_handlers as2_msgs pluginlib rclcpp rclcpp_action rclcpp_components std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
