{
  action_msgs,
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
  trajectory_msgs,
}:
let
  sources = rec {
    control_msgs = substituteSource {
      src = fetchgit {
        name = "control_msgs-source";
        url = "https://github.com/ros2-gbp/control_msgs-release.git";
        rev = "f21b7dd27c8bc205b3e787db785ee85e67838ff3";
        hash = "sha256-a/I5gLHoxC43QJW3Qf23xoJln4hZ7lRwGhkfmHfImVM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "control_msgs";
  version = "4.6.0-1";
  src = sources.control_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces geometry_msgs rosidl_default_runtime sensor_msgs std_msgs trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
