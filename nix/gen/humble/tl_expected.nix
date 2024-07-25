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
    tl_expected = substituteSource {
      src = fetchgit {
        name = "tl_expected-source";
        url = "https://github.com/ros2-gbp/cpp_polyfills-release.git";
        rev = "4d64069da1a3287b5829bc2fc16b3e0e69106cd4";
        hash = "sha256-MRDjBU0WqHHPomrtLuNox0zVGvy6aMGTGO8WBV04bF8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tl_expected";
  version = "1.0.2-2";
  src = sources.tl_expected;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
