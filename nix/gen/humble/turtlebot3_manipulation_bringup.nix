{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_ros,
  gripper_controllers,
  robot_state_publisher,
  ros2_control,
  ros2_controllers,
  rviz2,
  substituteSource,
  turtlebot3_manipulation_description,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    turtlebot3_manipulation_bringup = substituteSource {
      src = fetchgit {
        name = "turtlebot3_manipulation_bringup-source";
        url = "https://github.com/ros2-gbp/turtlebot3_manipulation-release.git";
        rev = "6cabdf20b9a232e5885147b5c86e6ab996913798";
        hash = "sha256-8MjYCqmFibG3VEfoUvpVMZU1p+aUnP1fy93RPjrFcas=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_manipulation_bringup";
  version = "2.1.1-1";
  src = sources.turtlebot3_manipulation_bringup;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_ros gripper_controllers robot_state_publisher ros2_control ros2_controllers rviz2 turtlebot3_manipulation_description xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
