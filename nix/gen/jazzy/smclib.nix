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
        rev = "1790dcfb4e6720bdaf5630dd1a47c4d73ca5f255";
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
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_cmake_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
