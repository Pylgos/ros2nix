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
        rev = "adad10c595a8e0dae8721169740ac3480df23496";
        hash = "sha256-o9jsHD+cly1o6EPT+4dJfJDATxJF+nGdtaPKEOT6ZXo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rc_dynamics_api";
  version = "0.10.5-2";
  src = sources.rc_dynamics_api;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ curl ];
  buildInputs = [ protobuf ];
  propagatedBuildInputs = [ protobuf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
