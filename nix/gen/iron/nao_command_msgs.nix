{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
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
    nao_command_msgs = substituteSource {
      src = fetchgit {
        name = "nao_command_msgs-source";
        url = "https://github.com/ros2-gbp/nao_interfaces-release.git";
        rev = "43b35356eaa670b4793c64ffe5b39dbcffc713f6";
        hash = "sha256-wq1UiWWwDwn8XNdM9GkjaQsqZRFF6jZR4BxPBvWRq0s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nao_command_msgs";
  version = "0.1.0-1";
  src = sources.nao_command_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
