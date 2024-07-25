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
  substituteSource,
}:
let
  sources = rec {
    create3_examples_msgs = substituteSource {
      src = fetchgit {
        name = "create3_examples_msgs-source";
        url = "https://github.com/ros2-gbp/create3_examples-release.git";
        rev = "847ce51c87eb07d2bc1bcf42960fc7bee0e3ab3d";
        hash = "sha256-MJC3V5OWF5Q3pmhmy7oTutCNNEG/1JDyK2Ri96jEJ50=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "create3_examples_msgs";
  version = "0.0.5-1";
  src = sources.create3_examples_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
