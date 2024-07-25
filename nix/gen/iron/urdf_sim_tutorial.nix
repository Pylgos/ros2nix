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
        rev = "87ef86bdbf46cb81255b31510c76afa549be1a8e";
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
