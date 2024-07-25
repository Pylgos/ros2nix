{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  std_msgs,
  substituteSource,
  unique_identifier_msgs,
}:
let
  sources = rec {
    radar_msgs = substituteSource {
      src = fetchgit {
        name = "radar_msgs-source";
        url = "https://github.com/ros2-gbp/radar_msgs-release.git";
        rev = "78a5d5a75c9741da280e7ab42f412774e567e4a4";
        hash = "sha256-09etKgWuUL3tN+uERho/rQvfxovMzjJUK+2J9fg5Sa4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "radar_msgs";
  version = "0.2.1-3";
  src = sources.radar_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs std_msgs unique_identifier_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
