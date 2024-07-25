{
  ament_cmake,
  ament_cmake_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_dev,
  gazebo_model_attachment_plugin_msgs,
  gazebo_msgs,
  gazebo_ros,
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
    gazebo_model_attachment_plugin = substituteSource {
      src = fetchgit {
        name = "gazebo_model_attachment_plugin-source";
        url = "https://github.com/ros2-gbp/boeing_gazebo_model_attachement_plugin-release.git";
        rev = "4661d877b2fff492a3088b1ab762afcdc66bc0fc";
        hash = "sha256-5mZwCsp8e1Wuomx3TC5D2s4HV/Ha5sugOmdzy/Uc5YM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gazebo_model_attachment_plugin";
  version = "1.0.3-2";
  src = sources.gazebo_model_attachment_plugin;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_dev gazebo_model_attachment_plugin_msgs gazebo_msgs gazebo_ros rclcpp rclpy rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
