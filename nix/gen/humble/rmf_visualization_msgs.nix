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
  substituteSource,
}:
let
  sources = rec {
    rmf_visualization_msgs = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_visualization_msgs-release.git";
        rev = "5a3b09ef035652df45f17e27911b6880f688a06a";
        hash = "sha256-z0wRMKf33JzzdA8zKzlm1kQjYZtBYu84MFEeu66xdGQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_msgs";
  version = "1.2.1-1";
  src = sources.rmf_visualization_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
