{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    controller_manager_msgs = substituteSource {
      src = fetchgit {
        name = "controller_manager_msgs-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "b9dead4e54094de05811e0e0f77e233fae3cdcfd";
        hash = "sha256-16uHWQkP5E6AM6vLbAXdMwfM8Wl++E39T1tUQXOpjWw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "controller_manager_msgs";
  version = "2.41.0-1";
  src = sources.controller_manager_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces lifecycle_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
