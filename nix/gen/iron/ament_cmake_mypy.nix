{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_mypy,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_mypy = substituteSource {
      src = fetchgit {
        name = "ament_cmake_mypy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "a9fd9500b375fdbaabed4ace20515cb3068f1367";
        hash = "sha256-fK1VYMxAY5BrD/EZXtgYO/VWUGJ2/GopTi3d+XExCwI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_mypy";
  version = "0.14.3-1";
  src = sources.ament_cmake_mypy;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_mypy ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
