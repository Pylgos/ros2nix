{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mrpt2,
  substituteSource,
}:
let
  sources = rec {
    mp2p_icp = substituteSource {
      src = fetchgit {
        name = "mp2p_icp-source";
        url = "https://github.com/ros2-gbp/mp2p_icp-release.git";
        rev = "b2b13eb8e3084a58990ec0a11aac288f838a5ee5";
        hash = "sha256-369hzoqsWxmzRnMiRAYNgvIMbfIgoi+WN2KYX38S9wU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mp2p_icp";
  version = "1.5.1-1";
  src = sources.mp2p_icp;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
