{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  controller_manager,
  crane_plus_description,
  crane_plus_moveit_config,
  fetchgit,
  fetchurl,
  fetchzip,
  gripper_controllers,
  robot_state_publisher,
  ros2_controllers,
  ros_gz,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    crane_plus_gazebo = substituteSource {
      src = fetchgit {
        name = "crane_plus_gazebo-source";
        url = "https://github.com/ros2-gbp/crane_plus-release.git";
        rev = "72c902c72ce03e1943f99e3217a6050bbb1e4350";
        hash = "sha256-bAz551exBXPDLwIPMMnL8cz8qkYxgBpgiZSw6HURCEk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "crane_plus_gazebo";
  version = "2.0.1-1";
  src = sources.crane_plus_gazebo;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager crane_plus_description crane_plus_moveit_config gripper_controllers robot_state_publisher ros2_controllers ros_gz ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
