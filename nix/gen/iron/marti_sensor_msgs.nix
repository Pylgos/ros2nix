{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    marti_sensor_msgs = substituteSource {
      src = fetchgit {
        name = "marti_sensor_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "b46b36fc2aa00d1b76a15758bafe69f954165449";
        hash = "sha256-WyVlezrzQz/gG2DAcv31gIGeJ5Y6ex4TFTymyh4DDY8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_sensor_msgs";
  version = "1.5.2-1";
  src = sources.marti_sensor_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
