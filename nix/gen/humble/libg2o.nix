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
        rev = "116030e56f7241794c9f0a1f0c82f08cdf39b51e";
        hash = "sha256-BJM6q6oL4EdI4Kiv89+V1kr0uXZhGNKBULGxexQn/6w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libg2o";
  version = "2020.5.29-4";
  src = sources.libg2o;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen libGL libGLU suitesparse ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
