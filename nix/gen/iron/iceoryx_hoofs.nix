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
        rev = "407c7d2418b40b4c66d681cdfd7f05ad285d8530";
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
