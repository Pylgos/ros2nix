{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    geometry_tutorials = substituteSource {
      src = fetchgit {
        name = "geometry_tutorials-source";
        url = "https://github.com/ros2-gbp/geometry_tutorials-release.git";
        rev = "51d1f94411cd87cad45c53bfedf57dea56d7b0b6";
        hash = "sha256-Cy6+rG9fkARM6Pr7xFDRN/CEObs8kkLsxj+qr4W2h0U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "geometry_tutorials";
  version = "0.3.6-4";
  src = sources.geometry_tutorials;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
