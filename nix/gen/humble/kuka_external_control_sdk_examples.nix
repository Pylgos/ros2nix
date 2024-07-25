{
  ament_cmake,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  kuka_external_control_sdk,
  substituteSource,
}:
let
  sources = rec {
    kuka_external_control_sdk_examples = substituteSource {
      src = fetchgit {
        name = "kuka_external_control_sdk_examples-source";
        url = "https://github.com/ros2-gbp/kuka_external_control_sdk-release.git";
        rev = "c30baf86576f88717d806330bd664efb254eb7b9";
        hash = "sha256-wcBABP4/pKxRPcNxrcM9gM144I1GrPQmoGKVcNIacLw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kuka_external_control_sdk_examples";
  version = "1.3.1-1";
  src = sources.kuka_external_control_sdk_examples;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ kuka_external_control_sdk ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
