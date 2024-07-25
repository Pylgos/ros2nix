{
  buildRosPackage,
  cmake,
  curl,
  fetchgit,
  fetchurl,
  fetchzip,
  protobuf,
  substituteSource,
}:
let
  sources = rec {
    rc_dynamics_api = substituteSource {
      src = fetchgit {
        name = "rc_dynamics_api-source";
        url = "https://github.com/ros2-gbp/rc_dynamics_api-release.git";
        rev = "36e79e3504cca56a5078a5cb54f350ebf895868c";
        hash = "sha256-Q+zKUMZzx64cpjuiKG8bJOqmaBys1FlMixU8pXCBmvM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rc_dynamics_api";
  version = "0.10.3-3";
  src = sources.rc_dynamics_api;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ curl ];
  buildInputs = [  ];
  propagatedBuildInputs = [ protobuf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
