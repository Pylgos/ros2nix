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
        rev = "fb4ccff40df38bbfdd91e96c285c8f1bef01081c";
        hash = "sha256-aAQ1hS7NKWGe1HEjBQ+lKGoqaNrNjVkbpmjEsqYkBH0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gtest_vendor";
  version = "1.10.9005-2";
  src = sources.gtest_vendor;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ cmake ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
