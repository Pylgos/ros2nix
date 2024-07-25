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
        rev = "099340e562616e5546a04993e674d62489f9b4d9";
        hash = "sha256-hA3r+e7UX7RexwhOGDiL6cZ1ikPfbQTs42OYsVb3HdY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_clang_tidy";
  version = "0.12.11-1";
  src = sources.ament_cmake_clang_tidy;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_clang_tidy ament_cmake_test ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
