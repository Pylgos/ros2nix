{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_export_dependencies,
  ament_cmake_flake8,
  ament_cmake_lint_cmake,
  ament_cmake_pep257,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_lint_common = substituteSource {
      src = fetchgit {
        name = "ament_lint_common-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "607c45944545b8bfa53eac102eaaa82108f8ea27";
        hash = "sha256-y1nInGXgD+QW8FS3gjyXLux8o14wuUPgSjxWuTYjWjk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_lint_common";
  version = "0.17.1-1";
  src = sources.ament_lint_common;
  nativeBuildInputs = [ ament_cmake_export_dependencies ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_flake8 ament_cmake_pep257 ament_cmake_uncrustify ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}