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
        rev = "ab62b3034dfc250f9a0fa0e6ee5d847d382a51de";
        hash = "sha256-9a2mzifX5WZ65XB00MXj/2Sx29pzlnH/SsUHvRc/n8g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gmock_vendor";
  version = "1.10.9004-4";
  src = sources.gmock_vendor;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ cmake gtest_vendor ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cmake gtest_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
