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
  std_msgs,
  substituteSource,
  vision_msgs,
}:
let
  sources = rec {
    webots_ros2_msgs = substituteSource {
      src = fetchgit {
        name = "webots_ros2_msgs-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "8780de0b927d8ea0e8b28913aeb8e7164b30efe1";
        hash = "sha256-+Axcc0d4ZWp2K1lpbqpfMqsi8dIAei6MSY3mDxG4tig=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2_msgs";
  version = "2023.1.2-1";
  src = sources.webots_ros2_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs vision_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}