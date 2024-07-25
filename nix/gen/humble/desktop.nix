{
  action_tutorials_cpp,
  action_tutorials_interfaces,
  action_tutorials_py,
  ament_cmake,
  angles,
  buildRosPackage,
  composition,
  demo_nodes_cpp,
  demo_nodes_cpp_native,
  demo_nodes_py,
  depthimage_to_laserscan,
  dummy_map_server,
  dummy_robot_bringup,
  dummy_sensors,
  examples_rclcpp_minimal_action_client,
  examples_rclcpp_minimal_action_server,
  examples_rclcpp_minimal_client,
  examples_rclcpp_minimal_composition,
  examples_rclcpp_minimal_publisher,
  examples_rclcpp_minimal_service,
  examples_rclcpp_minimal_subscriber,
  examples_rclcpp_minimal_timer,
  examples_rclcpp_multithreaded_executor,
  examples_rclpy_executors,
  examples_rclpy_minimal_action_client,
  examples_rclpy_minimal_action_server,
  examples_rclpy_minimal_client,
  examples_rclpy_minimal_publisher,
  examples_rclpy_minimal_service,
  examples_rclpy_minimal_subscriber,
  fetchgit,
  fetchurl,
  fetchzip,
  image_tools,
  intra_process_demo,
  joy,
  lifecycle,
  logging_demo,
  pcl_conversions,
  pendulum_control,
  pendulum_msgs,
  quality_of_service_demo_cpp,
  quality_of_service_demo_py,
  ros_base,
  rqt_common_plugins,
  rviz2,
  rviz_default_plugins,
  substituteSource,
  teleop_twist_joy,
  teleop_twist_keyboard,
  tlsf,
  tlsf_cpp,
  topic_monitor,
  turtlesim,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    desktop = substituteSource {
      src = fetchgit {
        name = "desktop-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "6459921eda853474cc15df2bdf1228479c63e7f9";
        hash = "sha256-Oe0Gi0EAbvTGmyy7KyrLQqqS5ZVrp2Tdkdx4F82uVqw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "desktop";
  version = "0.10.0-1";
  src = sources.desktop;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_tutorials_cpp action_tutorials_interfaces action_tutorials_py angles composition demo_nodes_cpp demo_nodes_cpp_native demo_nodes_py depthimage_to_laserscan dummy_map_server dummy_robot_bringup dummy_sensors examples_rclcpp_minimal_action_client examples_rclcpp_minimal_action_server examples_rclcpp_minimal_client examples_rclcpp_minimal_composition examples_rclcpp_minimal_publisher examples_rclcpp_minimal_service examples_rclcpp_minimal_subscriber examples_rclcpp_minimal_timer examples_rclcpp_multithreaded_executor examples_rclpy_executors examples_rclpy_minimal_action_client examples_rclpy_minimal_action_server examples_rclpy_minimal_client examples_rclpy_minimal_publisher examples_rclpy_minimal_service examples_rclpy_minimal_subscriber image_tools intra_process_demo joy lifecycle logging_demo pcl_conversions pendulum_control pendulum_msgs quality_of_service_demo_cpp quality_of_service_demo_py ros_base rqt_common_plugins rviz2 rviz_default_plugins teleop_twist_joy teleop_twist_keyboard tlsf tlsf_cpp topic_monitor turtlesim ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}