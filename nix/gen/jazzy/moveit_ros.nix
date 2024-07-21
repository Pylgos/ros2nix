{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_ros_benchmarks,
  moveit_ros_move_group,
  moveit_ros_planning,
  moveit_ros_planning_interface,
  moveit_ros_robot_interaction,
  moveit_ros_visualization,
  moveit_ros_warehouse,
  substituteSource,
}:
let
  sources = rec {
    moveit_ros = substituteSource {
      src = fetchgit {
        name = "moveit_ros-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "892a548c79100fe246e5230d1a4319cc0b1222a6";
        hash = "sha256-hRBtjcp1PnATPTuIVhroUdtnXgo/Lihj0Dd+FF7Gsnk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros";
  version = "2.10.0-1";
  src = sources.moveit_ros;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_ros_benchmarks moveit_ros_move_group moveit_ros_planning moveit_ros_planning_interface moveit_ros_robot_interaction moveit_ros_visualization moveit_ros_warehouse ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}