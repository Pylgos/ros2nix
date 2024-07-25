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
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "36a987c1c1b2063d6de21c8afdb3aad0308fae38";
        hash = "sha256-VhwClfPc+Lo0ci7l+W/NQbIjaYprpfcUpM41w2df6TI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_bt_actions";
  version = "2.0.11-1";
  src = sources.plansys2_bt_actions;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs behaviortree_cpp_v3 cppzmq plansys2_executor rclcpp rclcpp_action rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
