{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libusb1,
  pkg-config,
  substituteSource,
}:
let
  sources = rec {
    lusb = substituteSource {
      src = fetchgit {
        name = "lusb-source";
        url = "https://github.com/DataspeedInc-release/lusb-release.git";
        rev = "558aa01f1c4ad3486271ad211aabe3730245ee5c";
        hash = "sha256-YBKQ/Or1xZDZ9J/UFs2hk4TFSkAP332CH1FfsuKbcXE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lusb";
  version = "2.0.1-1";
  src = sources.lusb;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libusb1 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
