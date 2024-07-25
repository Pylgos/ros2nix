{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_core_generators,
  rosidl_core_runtime,
  service_msgs,
  substituteSource,
  unique_identifier_msgs,
}:
let
  sources = rec {
    action_msgs = substituteSource {
      src = fetchgit {
        name = "action_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "5fde4e7fe19e3dbd07e0a2ec8cfd884da42bde47";
        hash = "sha256-slAsC+mqNyABIFSVVn4taBDqC4IL2BQHcwkT5iu0U50=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "action_msgs";
  version = "1.6.0-2";
  src = sources.action_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_core_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_core_runtime service_msgs unique_identifier_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
