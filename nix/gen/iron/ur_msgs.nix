{
  ament_cmake,
  ament_lint_auto,
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
    ur_msgs = substituteSource {
      src = fetchgit {
        name = "ur_msgs-source";
        url = "https://github.com/ros2-gbp/ur_msgs-release.git";
        rev = "d0298602addbbec8e7cf5de5fffe8a387666ea76";
        hash = "sha256-JsglE/PolObyk2tuC9viw8JYmRlBJ8Ym7pjb5k+2EyQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_msgs";
  version = "2.0.0-3";
  src = sources.ur_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}