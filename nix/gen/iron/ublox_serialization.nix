{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ublox_serialization = substituteSource {
      src = fetchgit {
        name = "ublox_serialization-source";
        url = "https://github.com/ros2-gbp/ublox-release.git";
        rev = "71ed85d085b60c33150c0b5b4e93fe48eba42049";
        hash = "sha256-b2kP01irILk8Ct0RNRYsczUU7sgdAugMNejSpNFPdGE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ublox_serialization";
  version = "2.3.0-3";
  src = sources.ublox_serialization;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
