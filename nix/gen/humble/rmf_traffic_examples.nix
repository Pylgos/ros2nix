{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  rmf_traffic,
  substituteSource,
}:
let
  sources = rec {
    rmf_traffic_examples = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_examples-source";
        url = "https://github.com/ros2-gbp/rmf_traffic-release.git";
        rev = "88002ef85dca14d6ff478e0320a08fe246dcbae0";
        hash = "sha256-DsNxMOpw3K1vh/fzWtVMgQK3Y+5GQgWzZR2E5FqIBA0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_traffic_examples";
  version = "3.0.3-1";
  src = sources.rmf_traffic_examples;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rmf_traffic ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
