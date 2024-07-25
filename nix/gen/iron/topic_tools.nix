{
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  rclpy,
  ros2cli,
  rosidl_default_generators,
  rosidl_runtime_py,
  std_msgs,
  substituteSource,
  topic_tools_interfaces,
}:
let
  sources = rec {
    topic_tools = substituteSource {
      src = fetchgit {
        name = "topic_tools-source";
        url = "https://github.com/ros2-gbp/topic_tools-release.git";
        rev = "be27df5a2ae3e7a3d0d4cbab82c01360c712a21d";
        hash = "sha256-HV7cAPxmmGufGCd2qqwLwwa+jmmlUT/aM5FS7z39YsE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "topic_tools";
  version = "1.2.0-1";
  src = sources.topic_tools;
  nativeBuildInputs = [ ament_cmake_auto ament_cmake_python rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components rclpy ros2cli rosidl_runtime_py topic_tools_interfaces ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
