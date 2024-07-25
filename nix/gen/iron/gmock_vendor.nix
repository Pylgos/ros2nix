{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest_vendor,
  substituteSource,
}:
let
  sources = rec {
    gmock_vendor = substituteSource {
      src = fetchgit {
        name = "gmock_vendor-source";
        url = "https://github.com/ros2-gbp/googletest-release.git";
        rev = "9b1f31b6cede913e47df893a4b980fbdb04382f6";
        hash = "sha256-C9aCEjbMzxyf25prnhd2yCq7z8nozfVDa3ZFvURneuE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gmock_vendor";
  version = "1.10.9005-2";
  src = sources.gmock_vendor;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ gtest_vendor ];
  buildInputs = [ cmake ];
  propagatedBuildInputs = [ gtest_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
