{
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_cmake_ros,
  ament_lint_auto,
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
        rev = "6cfdbdd4919565d362bcd735a4b1a76b5db708b4";
        hash = "sha256-hsIeP+MSlt6hlEQOeHV9WkUpHkmLhOU8Ez7X83dyc/M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "message_filters";
  version = "4.7.0-3";
  src = sources.message_filters;
  nativeBuildInputs = [ ament_cmake_python ament_cmake_ros python_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rclcpp rclpy rcutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
