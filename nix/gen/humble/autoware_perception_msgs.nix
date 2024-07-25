{
  ament_cmake_auto,
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
  std_msgs,
  substituteSource,
  unique_identifier_msgs,
}:
let
  sources = rec {
    autoware_perception_msgs = substituteSource {
      src = fetchgit {
        name = "autoware_perception_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "0def775f18b401f24c706b4f470df09eea682ea1";
        hash = "sha256-xuyU9wSxb+THVuMVNB6e5X873sqw8K+veaG3XhEccRY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_perception_msgs";
  version = "1.1.0-1";
  src = sources.autoware_perception_msgs;
  nativeBuildInputs = [ ament_cmake_auto rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs unique_identifier_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
