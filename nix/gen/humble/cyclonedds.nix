{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  iceoryx_binding_c,
  iceoryx_hoofs,
  iceoryx_posh,
  openssl,
  substituteSource,
}:
let
  sources = rec {
    cyclonedds = substituteSource {
      src = fetchgit {
        name = "cyclonedds-source";
        url = "https://github.com/ros2-gbp/cyclonedds-release.git";
        rev = "6c277bc4f0ff5e8052d7d587b90dfc5d5b000f15";
        hash = "sha256-Ph1jSw19OpggKCyCaijZlgp2q7Lybo2aaVEtn5KYkXw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "cyclonedds";
  version = "0.10.4-1";
  src = sources.cyclonedds;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ iceoryx_binding_c iceoryx_hoofs iceoryx_posh openssl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
