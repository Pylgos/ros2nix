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
        rev = "ea53b2010b67766e1da4c0ef037aa07e0dda1ea8";
        hash = "sha256-geYK5hMHI66LcCD6GJ3Lr8T0ocK3/ExFHKKq9kBUZRs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nao_command_msgs";
  version = "1.0.0-2";
  src = sources.nao_command_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}