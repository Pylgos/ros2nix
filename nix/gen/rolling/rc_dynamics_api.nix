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
        rev = "5a56399da72a6ebe28a7701f1717a0e5308c7003";
        hash = "sha256-n5kQwjsNYnAW9IavKXBAO5+XvMN9F4Ei2Vwt4YPbPWk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rc_dynamics_api";
  version = "0.10.5-1";
  src = sources.rc_dynamics_api;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ curl ];
  buildInputs = [  ];
  propagatedBuildInputs = [ protobuf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
