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
        rev = "88a98986615746976ae3b7e727f4a14b5cdb8f39";
        hash = "sha256-tmqwo+sv5Ut/fo3E8aV1QaGFLfJE3PhV/0ghTqrHQR4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_lint_common";
  version = "0.14.3-1";
  src = sources.ament_lint_common;
  nativeBuildInputs = [ ament_cmake_export_dependencies ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_cppcheck ament_cmake_flake8 ament_cmake_pep257 ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_copyright ament_cmake_cpplint ament_cmake_lint_cmake ament_cmake_uncrustify ament_cmake_xmllint ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
