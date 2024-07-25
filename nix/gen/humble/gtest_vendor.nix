{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    gtest_vendor = substituteSource {
      src = fetchgit {
        name = "gtest_vendor-source";
        url = "https://github.com/ros2-gbp/googletest-release.git";
        rev = "20131d7c09d8ddecdce7342c7bc482da0dabca48";
        hash = "sha256-u2gx0IqMkxU6eLi5phF25OuU1T4HZuCuIhQBi48RXYM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gtest_vendor";
  version = "1.10.9004-4";
  src = sources.gtest_vendor;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cmake ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
