{
  buildRosPackage,
  ceres-solver,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  fmt,
  substituteSource,
}:
let
  sources = rec {
    sophus = substituteSource {
      src = fetchgit {
        name = "sophus-source";
        url = "https://github.com/ros2-gbp/sophus-release.git";
        rev = "39c729040cd2c3720879b0df85f162c4ac789877";
        hash = "sha256-xTS2ysDs9SSKpvKrxnhooJVtfpwRvYCuMpbFc4skbDM=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/pybind/pybind11.git";
          to = "URL ${sophus-vendor_source0}";
        }
      ];
    };
    sophus-vendor_source0 = substituteSource {
      src = fetchgit {
        name = "sophus-vendor_source0-source";
        url = "https://github.com/pybind/pybind11.git";
        rev = "6d4805ced1f8fc8f503d41381853f6082f3064a3";
        hash = "sha256-6D7ccD3EL2bWtR/6hV0FnofcsqU+BFlwV4TMPsO3RCM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sophus";
  version = "1.22.9102-2";
  src = sources.sophus;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ceres-solver eigen fmt ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
