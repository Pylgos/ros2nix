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
        rev = "7790e581f49c7c8f45c73a46c7df8e2ea7c03e1e";
        hash = "sha256-QdbcY85fChTitWJIYAuyieZ4hY+hXZWJP6w/k8+BOWw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nao_command_msgs";
  version = "0.0.5-1";
  src = sources.nao_command_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
