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
        rev = "42f4ac26706d5e22d0411113b022611eb2c4742b";
        hash = "sha256-ysrB1BvngMnxmA8cysTXe+p0px4EeXfrOtSogZqhY+4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_clang_format";
  version = "0.12.11-1";
  src = sources.ament_cmake_clang_format;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_clang_format ament_cmake_test ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
