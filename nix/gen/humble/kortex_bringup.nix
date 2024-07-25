{
  ament_cmake,
  ament_cmake_python,
  buildRosPackage,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_ros2_control,
  gripper_controllers,
  joint_state_broadcaster,
  joint_state_publisher,
  joint_trajectory_controller,
  kortex_description,
  kortex_driver,
  launch,
  launch_ros,
  rclpy,
  robotiq_description,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    kortex_bringup = substituteSource {
      src = fetchgit {
        name = "kortex_bringup-source";
        url = "https://github.com/ros2-gbp/ros2_kortex-release.git";
        rev = "61a1aad5f0a0e3e18148dbc2fc4287a41938186d";
        hash = "sha256-IQ2mPpCxvX2VcdeA/0EEI0NE3gUueLUjdVkn5RlveZs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kortex_bringup";
  version = "0.2.2-1";
  src = sources.kortex_bringup;
  nativeBuildInputs = [ ament_cmake ament_cmake_python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager gazebo_ros2_control gripper_controllers joint_state_broadcaster joint_state_publisher joint_trajectory_controller kortex_description kortex_driver launch_ros rclpy robotiq_description rviz2 urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
