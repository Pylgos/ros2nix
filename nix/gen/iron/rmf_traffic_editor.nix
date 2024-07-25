{
  ament_cmake,
  ament_cmake_uncrustify,
  ament_index_cpp,
  buildRosPackage,
  ceres-solver,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  glog,
  libyamlcpp,
  proj,
  qt5,
  rmf_utils,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rmf_traffic_editor = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_editor-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "f854c9735b4b9c4c004ef3b2b0fa56ab08ee65cd";
        hash = "sha256-wagu1ubOzaRf1ri4pWPg2f2E1KwUxD+qp3mABBJRpYY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_traffic_editor";
  version = "1.7.2-1";
  src = sources.rmf_traffic_editor;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_cmake ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ceres-solver eigen glog libyamlcpp proj qt5.qtbase rmf_utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
