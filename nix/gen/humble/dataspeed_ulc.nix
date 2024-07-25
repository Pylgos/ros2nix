{
  ament_cmake,
  buildRosPackage,
  dataspeed_ulc_can,
  dataspeed_ulc_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    dataspeed_ulc = substituteSource {
      src = fetchgit {
        name = "dataspeed_ulc-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "fac648190b4e2aeaddb7c53b9a9ca97405cc9b7d";
        hash = "sha256-5Ix/iu70/7zqy4GowfQdYKbKfbTqSQCEgkW2yvA8IFo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dataspeed_ulc";
  version = "2.1.16-1";
  src = sources.dataspeed_ulc;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dataspeed_ulc_can dataspeed_ulc_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
