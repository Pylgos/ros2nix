{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  velodyne_driver,
  velodyne_laserscan,
  velodyne_msgs,
  velodyne_pointcloud,
}:
let
  sources = rec {
    velodyne = substituteSource {
      src = fetchgit {
        name = "velodyne-source";
        url = "https://github.com/ros2-gbp/velodyne-release.git";
        rev = "ac93913ed04599adccd9812eaec3ac5a990c441b";
        hash = "sha256-Wr9qH+muZay+hoPYPI7pJRs11jWr4I26LKKsmaWL/4A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velodyne";
  version = "2.3.0-3";
  src = sources.velodyne;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ velodyne_driver velodyne_laserscan velodyne_msgs velodyne_pointcloud ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
