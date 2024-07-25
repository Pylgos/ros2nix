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
        rev = "9e953dc9ff66aa70065325cc2c6a577df9ec94a6";
        hash = "sha256-AfTC3VY2EzfPdav7DvNaPrB+NM5laHjJRrpSaWfb2Cw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_msgs";
  version = "2.2.1-4";
  src = sources.turtlebot3_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
