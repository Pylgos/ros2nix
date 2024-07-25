{
  action_msgs,
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
    grbl_msgs = substituteSource {
      src = fetchgit {
        name = "grbl_msgs-source";
        url = "https://github.com/ros2-gbp/grbl_msgs-release.git";
        rev = "0bea5bf1f99ef5cb2d06b96332086fb970eebb6d";
        hash = "sha256-cjvc4arr+Z92IcwzqZryuU4FC2MY+FNpA+6JBe0dhiE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grbl_msgs";
  version = "0.0.2-6";
  src = sources.grbl_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
