{
  ament_cmake,
  buildRosPackage,
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
    marti_introspection_msgs = substituteSource {
      src = fetchgit {
        name = "marti_introspection_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "4354be1c08140f0c61bb8060a12ea76d0cd32b93";
        hash = "sha256-bytCDHgxW2xWVWTggl/gLqndp8+d3HaxOxh1p3yy8N4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_introspection_msgs";
  version = "1.5.2-1";
  src = sources.marti_introspection_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
