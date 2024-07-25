{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  sensor_msgs,
  std_msgs,
  substituteSource,
  ublox_serialization,
}:
let
  sources = rec {
    ublox_msgs = substituteSource {
      src = fetchgit {
        name = "ublox_msgs-source";
        url = "https://github.com/ros2-gbp/ublox-release.git";
        rev = "5e72a5bf7f568dbc85a65328e1d7905a3f1c4553";
        hash = "sha256-y+4Wac/LAoobvoFcSIJ2PGoih6+tPbrMnRKVg6BxUgM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ublox_msgs";
  version = "2.3.0-2";
  src = sources.ublox_msgs;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ sensor_msgs std_msgs ublox_serialization ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
