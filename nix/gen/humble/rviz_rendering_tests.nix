{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_lint_cmake,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_index_cpp,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  qt5,
  resource_retriever,
  rviz_rendering,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rviz_rendering_tests = substituteSource {
      src = fetchgit {
        name = "rviz_rendering_tests-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "68253695ea9051ed767ae45c897c928345b16a21";
        hash = "sha256-1E68miDFNB8IOGF08li5LCLCCIttJkw1NwWY8k+SARE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_rendering_tests";
  version = "11.2.12-1";
  src = sources.rviz_rendering_tests;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ qt5.qtbase resource_retriever rviz_rendering ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
