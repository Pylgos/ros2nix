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
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  shape_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    derived_object_msgs = substituteSource {
      src = fetchgit {
        name = "derived_object_msgs-source";
        url = "https://github.com/ros2-gbp/astuff_sensor_msgs-release.git";
        rev = "8ade0baf923c4c057f83cb332e2ae49645c47275";
        hash = "sha256-gHKh+ix0fZzuNvAtc/i+u0v6YLY+jUfqW9BPaLgC0/U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "derived_object_msgs";
  version = "4.0.0-1";
  src = sources.derived_object_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime shape_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}