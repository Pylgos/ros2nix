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
    pal_maps = substituteSource {
      src = fetchgit {
        name = "pal_maps-source";
        url = "https://github.com/pal-gbp/pal_maps-release.git";
        rev = "e00b85ba6f5821e088efe955139751685b52bfb5";
        hash = "sha256-NZZO3WIVIa1512UFeG7Jy9OPMuewmbSasbBjbFOskzM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pal_maps";
  version = "0.0.4-1";
  src = sources.pal_maps;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
