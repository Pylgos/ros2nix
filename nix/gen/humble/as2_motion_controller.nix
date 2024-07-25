{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_gtest,
  ament_lint_auto,
  as2_core,
  as2_motion_reference_handlers,
  as2_msgs,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  gbenchmark,
  geometry_msgs,
  libyamlcpp,
  pluginlib,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    as2_motion_controller = substituteSource {
      src = fetchgit {
        name = "as2_motion_controller-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "c9dad76ba951010ddb50bd53d500a933bc9e7c42";
        hash = "sha256-x4W8F9MfYc2jkcL7Q7jVefoT9Sxj2O/GickuzKRvy2A=";
      };
      substitutions = [
        {
          path = "plugins/pid_speed_controller/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/RPS98/pid_controller.git";
          to = "URL ${as2_motion_controller-vendor_source-pid_controller-0}";
        }
      ];
    };
    as2_motion_controller-vendor_source-pid_controller-0 = substituteSource {
      src = fetchgit {
        name = "as2_motion_controller-vendor_source-pid_controller-0-source";
        url = "https://github.com/RPS98/pid_controller.git";
        rev = "bc4743307db3f18affa232c04f068896cc69b528";
        hash = "sha256-zWXbp5FD99qio8KgIsI+hturfJEeZ5s50mWK+jbi7FE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_motion_controller";
  version = "1.0.9-1";
  src = sources.as2_motion_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ gbenchmark ];
  buildInputs = [  ];
  propagatedBuildInputs = [ as2_core as2_motion_reference_handlers as2_msgs eigen geometry_msgs libyamlcpp pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
