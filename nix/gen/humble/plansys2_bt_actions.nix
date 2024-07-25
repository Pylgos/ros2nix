{
  action_msgs,
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  behaviortree_cpp_v3,
  buildRosPackage,
  cppzmq,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  plansys2_executor,
  plansys2_msgs,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  substituteSource,
  test_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    plansys2_bt_actions = substituteSource {
      src = fetchgit {
        name = "plansys2_bt_actions-source";
        url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release.git";
        rev = "afca1ff03afef25d31bcdf113b5559f29f8b3ed4";
        hash = "sha256-sxx9toerSZCE/jtNwb63cMJHROjAiCAKUi6N377rDdo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_bt_actions";
  version = "2.0.9-1";
  src = sources.plansys2_bt_actions;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs behaviortree_cpp_v3 cppzmq plansys2_executor rclcpp rclcpp_action rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
