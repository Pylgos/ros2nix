{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_pep257 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pep257-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "40b1b4c51594bcf1c6c8f8c0f474a82c54b97f53";
        hash = "sha256-in+iqj1UTK212wYc0si77fA4eJPZD7m+y29Q5vVqGo0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_pep257";
  version = "0.18.1-1";
  src = sources.ament_cmake_pep257;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_pep257 ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [ ament_cmake_test ament_pep257 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}