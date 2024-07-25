{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  shape_msgs,
  std_msgs,
  substituteSource,
  unique_identifier_msgs,
}:
let
  sources = rec {
    autoware_adapi_v1_msgs = substituteSource {
      src = fetchgit {
        name = "autoware_adapi_v1_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_adapi_msgs-release.git";
        rev = "c7347f5a7e28d756fc2c96abd29b57c450b4af2e";
        hash = "sha256-3qw3LKXoVJvcwO+Z0Hc9kK1I6NafABN0tFmZwgHOO+s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_adapi_v1_msgs";
  version = "1.2.1-1";
  src = sources.autoware_adapi_v1_msgs;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geographic_msgs geometry_msgs rosidl_default_runtime shape_msgs std_msgs unique_identifier_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
