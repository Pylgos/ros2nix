{
  ament_cmake,
  ament_cmake_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  interactive_markers,
  joint_state_publisher,
  moveit_core,
  moveit_msgs,
  moveit_ros_planning_interface,
  reach,
  robot_state_publisher,
  sensor_msgs,
  substituteSource,
  tf2_eigen,
  visualization_msgs,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    reach_ros = substituteSource {
      src = fetchgit {
        name = "reach_ros-source";
        url = "https://github.com/ros2-gbp/reach_ros2-release.git";
        rev = "2f39a8e1d313463e22dcf957b464888521c9ecbb";
        hash = "sha256-epVFA/T2c4S+kEWTcNBcTlLZP43z28ktxJgzsPgOQUY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "reach_ros";
  version = "1.4.0-1";
  src = sources.reach_ros;
  nativeBuildInputs = [ ament_cmake ament_cmake_python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ interactive_markers joint_state_publisher moveit_core moveit_msgs moveit_ros_planning_interface reach robot_state_publisher sensor_msgs tf2_eigen visualization_msgs xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
