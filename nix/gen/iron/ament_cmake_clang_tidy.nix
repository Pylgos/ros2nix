{
  ament_clang_tidy,
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
    ament_cmake_clang_tidy = substituteSource {
      src = fetchgit {
        name = "ament_cmake_clang_tidy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "abdaaea2d58bb9f105206b1caab75ac73c518cbf";
        hash = "sha256-AHvz6ftcRN2IdKA+c4UFikHbR7mVJyPIZfhvcc/INmg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_clang_tidy";
  version = "0.14.3-1";
  src = sources.ament_cmake_clang_tidy;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_clang_tidy ament_cmake_test ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}