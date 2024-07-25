{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  velodyne_description,
  velodyne_gazebo_plugins,
}:
let
  sources = rec {
    velodyne_simulator = substituteSource {
      src = fetchgit {
        name = "velodyne_simulator-source";
        url = "https://github.com/ros2-gbp/velodyne_simulator-release.git";
        rev = "32ea3073abbdaf480f8113426fcbb5e969c08785";
        hash = "sha256-Cu17nhMENoRv3E5+1HvQyw35oWBdZXPr9BQ3APt4Q0c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velodyne_simulator";
  version = "2.0.3-3";
  src = sources.velodyne_simulator;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ velodyne_description velodyne_gazebo_plugins ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
