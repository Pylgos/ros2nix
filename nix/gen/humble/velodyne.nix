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
        rev = "06bd9415d2179c25759af88d63450a807ca7ff14";
        hash = "sha256-sHdZBMv5A08m3n1WYfa2x5S+ufJfQlvS85uJe2m8TM8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velodyne";
  version = "2.4.0-1";
  src = sources.velodyne;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ velodyne_driver velodyne_laserscan velodyne_msgs velodyne_pointcloud ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
