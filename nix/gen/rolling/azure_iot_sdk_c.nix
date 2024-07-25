{
  buildRosPackage,
  cmake,
  curl,
  fetchgit,
  fetchurl,
  fetchzip,
  openssl,
  substituteSource,
  util-linux,
}:
let
  sources = rec {
    azure_iot_sdk_c = substituteSource {
      src = fetchgit {
        name = "azure_iot_sdk_c-source";
        url = "https://github.com/ros2-gbp/azure_iot_sdk_c-release.git";
        rev = "17aa1397fd855709ac8c0c384c87b2f0faa10e71";
        hash = "sha256-apaSeTGTgkw2VGK405j9WEI4KrBHOJM3JoPUonqbAbg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "azure_iot_sdk_c";
  version = "1.13.0-3";
  src = sources.azure_iot_sdk_c;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ curl ];
  buildInputs = [  ];
  propagatedBuildInputs = [ openssl util-linux ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
