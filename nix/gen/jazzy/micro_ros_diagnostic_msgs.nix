{
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
    micro_ros_diagnostic_msgs = substituteSource {
      src = fetchgit {
        name = "micro_ros_diagnostic_msgs-source";
        url = "https://github.com/ros2-gbp/micro_ros_diagnostics-release.git";
        rev = "76f5de2933fddaf626219a8b72351b75113974ed";
        hash = "sha256-SzsjLMKb42ISN6YTe6pUsmSDS9aBoczr3ayWBkrJAgU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "micro_ros_diagnostic_msgs";
  version = "0.3.0-6";
  src = sources.micro_ros_diagnostic_msgs;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
