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
        rev = "e03e8575e76cfa5139aa6826a7f5f72267e78745";
        hash = "sha256-cjvc4arr+Z92IcwzqZryuU4FC2MY+FNpA+6JBe0dhiE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grbl_msgs";
  version = "0.0.2-8";
  src = sources.grbl_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
