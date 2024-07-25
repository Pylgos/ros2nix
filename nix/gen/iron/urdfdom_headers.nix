{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    urdfdom_headers = substituteSource {
      src = fetchgit {
        name = "urdfdom_headers-source";
        url = "https://github.com/ros2-gbp/urdfdom_headers-release.git";
        rev = "5e45c81ba1fc5c7da4945295ca8b563665e30019";
        hash = "sha256-4mf3RaHsghGv697+Xb06kiguKz9LL0GGW0v7dbd7pBU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdfdom_headers";
  version = "1.1.0-3";
  src = sources.urdfdom_headers;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
