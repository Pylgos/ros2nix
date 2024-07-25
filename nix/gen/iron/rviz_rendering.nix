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
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  qt5,
  resource_retriever,
  rviz_assimp_vendor,
  rviz_ogre_vendor,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rviz_rendering = substituteSource {
      src = fetchgit {
        name = "rviz_rendering-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "afef4df879c5a533caca05be643a0d4f6194e35d";
        hash = "sha256-Yni53YFefTXACxwzAJwnV/8OvSqQp2X/s6eBAjMUW7Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_rendering";
  version = "12.4.7-1";
  src = sources.rviz_rendering;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_cpp eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen qt5.qtbase resource_retriever rviz_assimp_vendor rviz_ogre_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
