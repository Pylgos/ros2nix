{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  plansys2_msgs,
  plansys2_problem_expert,
  qt5,
  qt_gui_cpp,
  rclcpp,
  rclcpp_lifecycle,
  rqt_gui,
  rqt_gui_cpp,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    plansys2_tools = substituteSource {
      src = fetchgit {
        name = "plansys2_tools-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "328ea4dc93b78cd9f46627390005bca2c16a5b38";
        hash = "sha256-RWKXCWBYooc/OOhczNlMxszC4dmWBxV6HI77iCRj3sQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_tools";
  version = "2.0.11-1";
  src = sources.plansys2_tools;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ plansys2_msgs plansys2_problem_expert qt5.qtbase qt_gui_cpp rclcpp rclcpp_lifecycle rqt_gui rqt_gui_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
