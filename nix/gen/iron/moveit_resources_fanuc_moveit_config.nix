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
        rev = "8aadb36f500a050837bc780436159820b8ecde4a";
        hash = "sha256-qMfZB8dP9CETbcIz8BhrKPXE8hwY2DXImiThboPPM8E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_fanuc_moveit_config";
  version = "2.1.1-1";
  src = sources.moveit_resources_fanuc_moveit_config;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher moveit_resources_fanuc_description robot_state_publisher tf2_ros xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
