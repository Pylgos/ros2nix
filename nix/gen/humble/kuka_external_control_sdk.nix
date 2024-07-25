{
  ament_cmake,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  openssl,
  pkg-config,
  substituteSource,
}:
let
  sources = rec {
    kuka_external_control_sdk = substituteSource {
      src = fetchgit {
        name = "kuka_external_control_sdk-source";
        url = "https://github.com/ros2-gbp/kuka_external_control_sdk-release.git";
        rev = "b007c713967af264166189d05275bc6295d0235d";
        hash = "sha256-ArpOhTfgBJm4BaXV43Wll6/AEwbFm45MD3XuH9zzfio=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kuka_external_control_sdk";
  version = "1.3.1-1";
  src = sources.kuka_external_control_sdk;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ament_cmake pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ openssl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
