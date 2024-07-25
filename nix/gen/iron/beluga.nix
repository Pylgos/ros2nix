{
  buildRosPackage,
  clang,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  gbenchmark,
  gmock,
  gtest,
  hdf5,
  sophus,
  substituteSource,
  tbb,
}:
let
  sources = rec {
    beluga = substituteSource {
      src = fetchgit {
        name = "beluga-source";
        url = "https://github.com/ros2-gbp/beluga-release.git";
        rev = "04b1be3fc5a19d06e5446082720013780feca8f6";
        hash = "sha256-z5Drm8uEZ590QUMtDES+CD3DJd7gm0OYs542R0quhY8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "beluga";
  version = "2.0.2-1";
  src = sources.beluga;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen hdf5 sophus tbb ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
