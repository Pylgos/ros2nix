{
  abseil-cpp,
  buildRosPackage,
  cairo,
  ceres-solver,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  gflags,
  git,
  glog,
  gtest,
  lua5,
  protobuf,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    cartographer = substituteSource {
      src = fetchgit {
        name = "cartographer-source";
        url = "https://github.com/ros2-gbp/cartographer-release.git";
        rev = "927e0d39ec39304cb217cf0e5c7c73e132b58dbf";
        hash = "sha256-++Ii26FmyqOYF3zYOPtQ+2ZqNUMomOanyu7Z5uYyu/Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "cartographer";
  version = "2.0.9003-1";
  src = sources.cartographer;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ git gtest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ abseil-cpp cairo ceres-solver eigen gflags glog lua5 protobuf python3Packages.boost python3Packages.sphinx ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
