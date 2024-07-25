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
        rev = "8efa829aa5894d85c2a1e216f794dd4c39a4115b";
        hash = "sha256-0snE2qOKW2bNFnFQhVgA/kSFw83KSxsweIMPD5zlJdQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_pyflakes";
  version = "0.12.11-1";
  src = sources.ament_cmake_pyflakes;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_pyflakes ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
