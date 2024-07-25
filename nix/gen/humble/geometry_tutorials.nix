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
        rev = "476c451fc76e0509150e856ad85495f6f05d12f9";
        hash = "sha256-Cy6+rG9fkARM6Pr7xFDRN/CEObs8kkLsxj+qr4W2h0U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "geometry_tutorials";
  version = "0.3.6-1";
  src = sources.geometry_tutorials;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
