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
    marti_dbw_msgs = substituteSource {
      src = fetchgit {
        name = "marti_dbw_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "9b35d34dbaedd432ef5e58bae972d90bb657a8e0";
        hash = "sha256-2cBEP9kN6iQjXwvxWDdZEzieO85HsbDrY9g7PbwblV0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_dbw_msgs";
  version = "1.5.2-3";
  src = sources.marti_dbw_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
