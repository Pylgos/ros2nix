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
        rev = "e676a419f238786718cf3966015a0e9682777440";
        hash = "sha256-QE6hU1HXCVU54bLQQ0XHXStpb3FWGJjupGq7NFIh43A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "azure_iot_sdk_c";
  version = "1.13.0-2";
  src = sources.azure_iot_sdk_c;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ curl ];
  buildInputs = [  ];
  propagatedBuildInputs = [ openssl util-linux ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
