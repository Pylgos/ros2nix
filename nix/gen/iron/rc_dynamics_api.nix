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
        rev = "6d11a5f4d146a8bfab71e1545982ac47855378ab";
        hash = "sha256-Q+zKUMZzx64cpjuiKG8bJOqmaBys1FlMixU8pXCBmvM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rc_dynamics_api";
  version = "0.10.3-4";
  src = sources.rc_dynamics_api;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ curl ];
  buildInputs = [  ];
  propagatedBuildInputs = [ protobuf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
