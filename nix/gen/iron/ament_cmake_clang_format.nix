{
  ament_clang_format,
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_clang_format = substituteSource {
      src = fetchgit {
        name = "ament_cmake_clang_format-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "138af4bb9b53ca10ec241986cb158bcfee82b333";
        hash = "sha256-XlC+LeZepghOSXrje3D7rRHKr/vHblluHWJpu8WUSqE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_clang_format";
  version = "0.14.3-1";
  src = sources.ament_cmake_clang_format;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_clang_format ament_cmake_test ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [ ament_clang_format ament_cmake_test ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
