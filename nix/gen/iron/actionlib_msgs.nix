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
    actionlib_msgs = substituteSource {
      src = fetchgit {
        name = "actionlib_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "4923b0ec1a4231e5e44ba83fb26e056174ec8740";
        hash = "sha256-+atWMtFqtNfodaLkFsSZR8V/CbmtufMYH4gSV0UPuAU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "actionlib_msgs";
  version = "5.0.1-1";
  src = sources.actionlib_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
