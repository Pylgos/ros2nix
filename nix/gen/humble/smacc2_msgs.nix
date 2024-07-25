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
        url = "https://github.com/robosoft-ai/SMACC2-release.git";
        rev = "47c9dcc091b4a224853e3c2a998c2684377b4f77";
        hash = "sha256-Ay+Er4XKSo/OxCG8qRNluUcZOFK51q4TyaXnkcNl0JI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "smacc2_msgs";
  version = "2.3.18-1";
  src = sources.smacc2_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
