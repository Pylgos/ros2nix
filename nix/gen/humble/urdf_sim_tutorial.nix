{
  ament_cmake,
  buildRosPackage,
  controller_manager,
  diff_drive_controller,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_ros,
  position_controllers,
  robot_state_publisher,
  rqt_robot_steering,
  rviz2,
  substituteSource,
  urdf_tutorial,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    urdf_sim_tutorial = substituteSource {
      src = fetchgit {
        name = "urdf_sim_tutorial-source";
        url = "https://github.com/ros-gbp/urdf_sim_tutorial-release.git";
        rev = "2f771454c4fd6b5ac0d0da941381ea5ceb6dfb93";
        hash = "sha256-keg//XCnL5YgaahyoB1EYqKWPKbP1iigvjDOMjh4OHw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdf_sim_tutorial";
  version = "1.0.1-1";
  src = sources.urdf_sim_tutorial;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager diff_drive_controller gazebo_ros position_controllers robot_state_publisher rqt_robot_steering rviz2 urdf_tutorial xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
