{
  ament_cmake_copyright,
  ament_cmake_cpplint,
  ament_cmake_gtest,
  ament_cmake_lint_cmake,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_cmake_ros,
  ament_cmake_uncrustify,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  python_cmake_module,
  rclcpp,
  rclcpp_lifecycle,
  rclpy,
  rcutils,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    message_filters = substituteSource {
      src = fetchgit {
        name = "message_filters-source";
        url = "https://github.com/ros2-gbp/ros2_message_filters-release.git";
        rev = "4b41a59e0359dd4ef98ab971a46462ce5fc7f230";
        hash = "sha256-IJKt09GvsFBp+XCcp24RgSHUYEUy9dQm5mnR3wWEoQc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "message_filters";
  version = "6.0.0-1";
  src = sources.message_filters;
  nativeBuildInputs = [ ament_cmake_python ament_cmake_ros python_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rclcpp rclpy rcutils std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
