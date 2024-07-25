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
  substituteSource,
}:
let
  sources = rec {
    statistics_msgs = substituteSource {
      src = fetchgit {
        name = "statistics_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "541510897e2b26b82f3e2bca65ecb566d58fb98e";
        hash = "sha256-omYUKu8ZKG9ZGC33uA3rcsYbA4ox7RyxFDTUwpqzqTM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "statistics_msgs";
  version = "1.6.0-2";
  src = sources.statistics_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
