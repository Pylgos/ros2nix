{
  ament_cmake,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    smclib = substituteSource {
      src = fetchgit {
        name = "smclib-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "b4d41c88014e733446a0b6244159d984a2457835";
        hash = "sha256-6jstxd7gq/43o7r44ZhV7FknaUqCjiBvrckicrj2Xl8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "smclib";
  version = "3.0.2-3";
  src = sources.smclib;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
