{
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
  substituteSource,
}:
let
  sources = rec {
    rmf_charger_msgs = substituteSource {
      src = fetchgit {
        name = "rmf_charger_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "5011f1e86fa8208b0ffa7563bcc1e1863ad105ed";
        hash = "sha256-BbXdR7yB47yfA0ou9r6oa3Ana8LdPOY6nxUeNn3Wbcc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_charger_msgs";
  version = "3.1.2-1";
  src = sources.rmf_charger_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
