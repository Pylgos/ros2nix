{
  acl,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    iceoryx_hoofs = substituteSource {
      src = fetchgit {
        name = "iceoryx_hoofs-source";
        url = "https://github.com/ros2-gbp/iceoryx-release.git";
        rev = "a0edde7d68649631be7d42b81ec9ddbabf2c011a";
        hash = "sha256-C57YmMV/QQbRaySst8JrcobpnMXYdJ0EFLLY/Zi72ak=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "iceoryx_hoofs";
  version = "2.0.5-1";
  src = sources.iceoryx_hoofs;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ acl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
