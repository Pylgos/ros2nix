{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot_create_msgs,
  launch_ros,
  rplidar_ros,
  slam_toolbox,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    create3_lidar_slam = substituteSource {
      src = fetchgit {
        name = "create3_lidar_slam-source";
        url = "https://github.com/ros2-gbp/create3_examples-release.git";
        rev = "8830d101bfc0dd0f9942b5f5f0ecece91b619057";
        hash = "sha256-a3EOMxOd7W5Pl7LpaL1X0X7UF8NLh4z4T4PpdpguQQE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "create3_lidar_slam";
  version = "0.0.5-1";
  src = sources.create3_lidar_slam;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ irobot_create_msgs launch_ros rplidar_ros slam_toolbox ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
