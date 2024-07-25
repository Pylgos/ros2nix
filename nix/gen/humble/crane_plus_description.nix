{
  ament_cmake,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_ros2_control,
  ign_ros2_control,
  joint_state_publisher_gui,
  launch,
  robot_state_publisher,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    crane_plus_description = substituteSource {
      src = fetchgit {
        name = "crane_plus_description-source";
        url = "https://github.com/ros2-gbp/crane_plus-release.git";
        rev = "685c9e569af592ba09e89181399a19581382f1f8";
        hash = "sha256-gfvOwbCgTtEl9cJ4d/h1gy7uxF7wuZLjkLssnnLRuDc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "crane_plus_description";
  version = "2.0.1-1";
  src = sources.crane_plus_description;
  nativeBuildInputs = [ ament_cmake ament_cmake_python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_ros2_control ign_ros2_control joint_state_publisher_gui robot_state_publisher rviz2 xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
