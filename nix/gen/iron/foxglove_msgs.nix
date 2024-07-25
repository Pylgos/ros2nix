{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
  visualization_msgs,
}:
let
  sources = rec {
    foxglove_msgs = substituteSource {
      src = fetchgit {
        name = "foxglove_msgs-source";
        url = "https://github.com/ros2-gbp/ros_foxglove_msgs-release.git";
        rev = "6670a3404fadc12caf2712959834c471da211a80";
        hash = "sha256-Z+IX+7pPIufxtC+mXX35i+FmWrYiRe0QWeJu6wmBmBI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "foxglove_msgs";
  version = "2.3.0-1";
  src = sources.foxglove_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
