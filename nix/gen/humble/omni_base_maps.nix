{
  ament_cmake_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    omni_base_maps = substituteSource {
      src = fetchgit {
        name = "omni_base_maps-source";
        url = "https://github.com/pal-gbp/omni_base_navigation-release.git";
        rev = "067f81e6642efce7b36d82a44c006237370a5f87";
        hash = "sha256-HapJzczPkbPaX5P7clnmDqaYmQZ8uWGz02Ksm2MS6TA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "omni_base_maps";
  version = "2.0.7-1";
  src = sources.omni_base_maps;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
