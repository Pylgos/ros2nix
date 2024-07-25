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
        rev = "68e4231b7effd7ece468e0a3fd267a7fc960de9d";
        hash = "sha256-vYig3j3DqPeSuEmGlDfvaH64IGdK8x/Yxx40R/Sv5j4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velodyne_description";
  version = "2.0.3-3";
  src = sources.velodyne_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
