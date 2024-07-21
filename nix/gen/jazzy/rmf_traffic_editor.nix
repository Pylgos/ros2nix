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
}:
let
  sources = rec {
    rmf_traffic_editor = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_editor-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "a17b109599bbc97db4b07b9f9d6a490a7475f491";
        hash = "sha256-/bCf//VJVmOLJCSaTg1j/g7qr0BfYLnLrUdf0C5cX+4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_traffic_editor";
  version = "1.9.1-1";
  src = sources.rmf_traffic_editor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ ament_index_cpp eigen libyamlcpp qt5.qtbase rmf_utils ];
  propagatedBuildInputs = [ ceres-solver glog proj ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}