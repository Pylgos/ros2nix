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
        rev = "8f507c308aa503940afa40a9be233c94ccbf274a";
        hash = "sha256-nZlGG9GnTwtF4psLWP6ge6+ChVtLCSPLuIDZyefh5x4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fastcdr";
  version = "1.0.27-3";
  src = sources.fastcdr;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
