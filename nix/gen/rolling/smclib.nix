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
        rev = "8623a74afcd34db200176962b2d57582002da0f8";
        hash = "sha256-0GdXtzthCDeBP6DCt4Gd6e86nzEmrdCJNLuxyDTGGK4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "smclib";
  version = "4.1.0-1";
  src = sources.smclib;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
