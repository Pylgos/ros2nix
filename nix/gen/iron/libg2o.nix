{
  ament_cmake,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  libGL,
  libGLU,
  substituteSource,
  suitesparse,
}:
let
  sources = rec {
    libg2o = substituteSource {
      src = fetchgit {
        name = "libg2o-source";
        url = "https://github.com/ros2-gbp/libg2o-release.git";
        rev = "23f4c7054e324248452b5b571bd3c3ff8de6a8a4";
        hash = "sha256-z81qW9j4HCMgm/qg1AyDipqV3Kw4/t+GqOkDsRpBibw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libg2o";
  version = "2020.5.29-5";
  src = sources.libg2o;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen libGL libGLU suitesparse ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
