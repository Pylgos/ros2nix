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
        rev = "552a2a3a7a2f2e1f454a750b31e44ca36a52bc7c";
        hash = "sha256-Vcs/9t9O5Bg0hTmg9XnOX8N8uFifiKb0zIaqJEld7rM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "topic_tools";
  version = "1.1.1-1";
  src = sources.topic_tools;
  nativeBuildInputs = [ ament_cmake_auto ament_cmake_python rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components rclpy ros2cli rosidl_runtime_py topic_tools_interfaces ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
