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
        rev = "7b74b4eefec50ab6a568e17ca73958d28c74ec97";
        hash = "sha256-SzsjLMKb42ISN6YTe6pUsmSDS9aBoczr3ayWBkrJAgU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "micro_ros_diagnostic_msgs";
  version = "0.3.0-5";
  src = sources.micro_ros_diagnostic_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
