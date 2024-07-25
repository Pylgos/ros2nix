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
        rev = "76db6bd9dc2ad52c0ad45de27871f22c64ba03b1";
        hash = "sha256-bswqgESVo01rxSNhUMSl4dZwBC88WoKlS55Dn0U5CQc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nmea_msgs";
  version = "2.0.0-4";
  src = sources.nmea_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
