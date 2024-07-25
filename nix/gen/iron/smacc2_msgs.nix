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
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    smacc2_msgs = substituteSource {
      src = fetchgit {
        name = "smacc2_msgs-source";
        url = "https://github.com/ros2-gbp/SMACC2-release.git";
        rev = "71250792cf9e7fc025834cbb64008957fa6ee53a";
        hash = "sha256-tY/UoVoVSZ2FyHW7T+eKrXBqfK1KVQiZatRamEO/K6M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "smacc2_msgs";
  version = "0.4.0-3";
  src = sources.smacc2_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
