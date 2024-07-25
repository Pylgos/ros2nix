{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  urdf,
  xacro,
}:
let
  sources = rec {
    velodyne_description = substituteSource {
      src = fetchgit {
        name = "velodyne_description-source";
        url = "https://github.com/ros2-gbp/velodyne_simulator-release.git";
        rev = "5e8b7c9d579dc0e46a9b2bfcf6026236038fc94f";
        hash = "sha256-vYig3j3DqPeSuEmGlDfvaH64IGdK8x/Yxx40R/Sv5j4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velodyne_description";
  version = "2.0.3-1";
  src = sources.velodyne_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
