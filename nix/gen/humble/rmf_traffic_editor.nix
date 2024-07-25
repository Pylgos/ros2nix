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
        rev = "e5a0044b929439e7a24ac2224b325a40288eda36";
        hash = "sha256-WoNJTVXUzRe6MNKw0WoCWVqrbxgAYgZ/rEM+xbN5ajQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_traffic_editor";
  version = "1.6.2-1";
  src = sources.rmf_traffic_editor;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_cmake ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ceres-solver eigen glog libyamlcpp proj qt5.qtbase rmf_utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
