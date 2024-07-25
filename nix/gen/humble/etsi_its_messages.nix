{
  ament_cmake,
  buildRosPackage,
  etsi_its_coding,
  etsi_its_conversion,
  etsi_its_msgs,
  etsi_its_msgs_utils,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    etsi_its_messages = substituteSource {
      src = fetchgit {
        name = "etsi_its_messages-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "727c2790021765b51c8d5ab02e5ec5c49f3f25be";
        hash = "sha256-JU1PzaSKN9Wox0tGPGRO8RU0nsoBKAXvboVEsQiHIBk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_messages";
  version = "2.0.2-1";
  src = sources.etsi_its_messages;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ etsi_its_coding etsi_its_conversion etsi_its_msgs etsi_its_msgs_utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
