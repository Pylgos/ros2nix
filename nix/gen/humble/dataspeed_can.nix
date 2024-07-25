{
  ament_cmake,
  buildRosPackage,
  dataspeed_can_msg_filters,
  dataspeed_can_usb,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    dataspeed_can = substituteSource {
      src = fetchgit {
        name = "dataspeed_can-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "b51d0489752c85005504eefb713a88013d51ee06";
        hash = "sha256-POBzwny/VrYoGfDkoXI7QH6BcAWKmKJgbN5omfz6JJI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dataspeed_can";
  version = "2.0.1-1";
  src = sources.dataspeed_can;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dataspeed_can_msg_filters dataspeed_can_usb ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
