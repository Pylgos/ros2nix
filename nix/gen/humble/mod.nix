{
  ament_cmake,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  ompl,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    mod = substituteSource {
      src = fetchgit {
        name = "mod-source";
        url = "https://github.com/OrebroUniversity/mod-release.git";
        rev = "5d987e338ef1ab5b2f3d5a09ff90e3c19d5839e9";
        hash = "sha256-P49k8TsFrO7C5WEsf13L8xfzhcuhVHpLhHpS0zSN3eg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mod";
  version = "1.1.0-1";
  src = sources.mod;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen ompl python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
