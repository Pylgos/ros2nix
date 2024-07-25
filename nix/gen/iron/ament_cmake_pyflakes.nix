{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_pyflakes,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_pyflakes = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pyflakes-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "0eb4e7e7c657a0e67aa21b49fd8a04832a0e653f";
        hash = "sha256-MSw+DzaTQXBYsMornjfsb97dmgDxtsGforH+2ppnwB4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_pyflakes";
  version = "0.14.3-1";
  src = sources.ament_cmake_pyflakes;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_pyflakes ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
