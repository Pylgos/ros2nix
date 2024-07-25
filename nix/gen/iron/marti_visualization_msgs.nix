{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    marti_visualization_msgs = substituteSource {
      src = fetchgit {
        name = "marti_visualization_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "6836fa0986cc1a549ce8717e2db0d039f2620600";
        hash = "sha256-peyK91dgzn2v2AC23GwQee/eFKooMV3SDLs06KCSnQQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_visualization_msgs";
  version = "1.5.2-1";
  src = sources.marti_visualization_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
