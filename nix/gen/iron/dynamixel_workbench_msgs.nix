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
    dynamixel_workbench_msgs = substituteSource {
      src = fetchgit {
        name = "dynamixel_workbench_msgs-source";
        url = "https://github.com/ros2-gbp/dynamixel_workbench_msgs-release.git";
        rev = "652470d1bba8cb4605a54496ca75b77e1d702396";
        hash = "sha256-NMrVMFxbUmSDCdSRTO6gRJtKsmEeqY4Q5FqkBQCeY3I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dynamixel_workbench_msgs";
  version = "2.0.3-4";
  src = sources.dynamixel_workbench_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}