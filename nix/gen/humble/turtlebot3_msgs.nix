{
  action_msgs,
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    turtlebot3_msgs = substituteSource {
      src = fetchgit {
        name = "turtlebot3_msgs-source";
        url = "https://github.com/ros2-gbp/turtlebot3_msgs-release.git";
        rev = "b4d93b98e92311a468685cdea75f192d65ee11f0";
        hash = "sha256-pyrS0ZJEAld/gKSXtW5IKrw3YI0fJ2/tnfGULpKNpuE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_msgs";
  version = "2.2.3-1";
  src = sources.turtlebot3_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
