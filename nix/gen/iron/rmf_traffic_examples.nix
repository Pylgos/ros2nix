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
        rev = "78f66e45eb8c1800ed03c857c562e7b385589756";
        hash = "sha256-plN3A4EERyD8v/sYUuC/iSHLIrvLjWQPtNAPZ7IyVio=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_traffic_examples";
  version = "3.1.2-1";
  src = sources.rmf_traffic_examples;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rmf_traffic ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
