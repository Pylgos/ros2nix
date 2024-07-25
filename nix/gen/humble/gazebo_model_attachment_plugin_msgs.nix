{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing_ament_cmake,
  rclcpp,
  rclpy,
  ros2launch,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    gazebo_model_attachment_plugin_msgs = substituteSource {
      src = fetchgit {
        name = "gazebo_model_attachment_plugin_msgs-source";
        url = "https://github.com/ros2-gbp/boeing_gazebo_model_attachement_plugin-release.git";
        rev = "d6fc5995054bc293323829f89d049f788d3a64ef";
        hash = "sha256-DN4Mo35s0go4wXgqV2Nk99oA27Cjlxw+eVMmWOqcoOE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gazebo_model_attachment_plugin_msgs";
  version = "1.0.3-2";
  src = sources.gazebo_model_attachment_plugin_msgs;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [ ament_cmake_cppcheck rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_cpplint rclcpp rclpy rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
