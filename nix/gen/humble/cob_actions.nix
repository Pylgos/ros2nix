{
  action_msgs,
  actionlib_msgs,
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    cob_actions = substituteSource {
      src = fetchgit {
        name = "cob_actions-source";
        url = "https://github.com/4am-robotics/cob_common-release.git";
        rev = "ed5544e3241c920e54a2b6211d08cf04c7495310";
        hash = "sha256-FremD4DqFhupeUSRVJ62Emam/K9YNNuzf1fN/da/gEg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "cob_actions";
  version = "2.7.10-1";
  src = sources.cob_actions;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs actionlib_msgs builtin_interfaces geometry_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
