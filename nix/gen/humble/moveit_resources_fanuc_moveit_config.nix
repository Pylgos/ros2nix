{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  moveit_resources_fanuc_description,
  robot_state_publisher,
  substituteSource,
  tf2_ros,
  xacro,
}:
let
  sources = rec {
    moveit_resources_fanuc_moveit_config = substituteSource {
      src = fetchgit {
        name = "moveit_resources_fanuc_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "edf77cd9002406349d8846c7fa5f4147c6e2a190";
        hash = "sha256-+PG1w20lR8UBbDk6I7oZisHaDj35FiW/5sIftyu+h+U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_fanuc_moveit_config";
  version = "2.0.7-1";
  src = sources.moveit_resources_fanuc_moveit_config;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher moveit_resources_fanuc_description robot_state_publisher tf2_ros xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
