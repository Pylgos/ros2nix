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
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    marine_sensor_msgs = substituteSource {
      src = fetchgit {
        name = "marine_sensor_msgs-source";
        url = "https://github.com/ros2-gbp/marine_msgs-release.git";
        rev = "ff548224fee15495bba5569707caf792f70cfe5e";
        hash = "sha256-D0FezQ0OVWOXoPzNWC1TM9TGTcHR8hhUTXBz6uEQBnw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marine_sensor_msgs";
  version = "2.1.0-1";
  src = sources.marine_sensor_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}