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
    azure-iot-sdk-c = substituteSource {
      src = fetchgit {
        name = "azure-iot-sdk-c-source";
        url = "https://github.com/nobleo/azure-iot-sdk-c-release.git";
        rev = "95b394f2b7dcd305bdbd3f73bdd42dbe434204e8";
        hash = "sha256-0MnaTVjjvd/NKUYxplWJsqOOZZXSx/CcjAYV5xqjJgc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "azure-iot-sdk-c";
  version = "1.13.0-1";
  src = sources.azure-iot-sdk-c;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ curl ];
  buildInputs = [  ];
  propagatedBuildInputs = [ openssl util-linux ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
