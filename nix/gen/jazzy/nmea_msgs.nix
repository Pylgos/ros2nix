{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    nmea_msgs = substituteSource {
      src = fetchgit {
        name = "nmea_msgs-source";
        url = "https://github.com/ros2-gbp/nmea_msgs-release.git";
        rev = "b80bfbffa9a31b97cfa2952ce66e2758c00bd0ac";
        hash = "sha256-bLkC+tkA0cqER/1WKKbOYYYpOp96t3ZNxVS5VgFVYOE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nmea_msgs";
  version = "2.1.0-3";
  src = sources.nmea_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}