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
    fastcdr = substituteSource {
      src = fetchgit {
        name = "fastcdr-source";
        url = "https://github.com/ros2-gbp/fastcdr-release.git";
        rev = "af820fd8dc61ca02e5d5a6b9abb90f2b8a4de818";
        hash = "sha256-c3xN1mu7qNZyR0MBb923pa0a69z/QGvWtYRN6aJtDq4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fastcdr";
  version = "1.0.24-2";
  src = sources.fastcdr;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
