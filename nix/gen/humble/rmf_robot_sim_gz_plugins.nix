{
  ament_cmake,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  qt5,
  rclcpp,
  rmf_building_map_msgs,
  rmf_fleet_msgs,
  rmf_robot_sim_common,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rmf_robot_sim_gz_plugins = substituteSource {
      src = fetchgit {
        name = "rmf_robot_sim_gz_plugins-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "e64818e3838ac83105242014c2b30261b7479d88";
        hash = "sha256-fPDS+NkAAagn6Vy+PkYPIEEqQR4eP47hPgH80QJyvGA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_robot_sim_gz_plugins";
  version = "2.0.2-1";
  src = sources.rmf_robot_sim_gz_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen qt5.qtbase qt5.qtdeclarative rclcpp rmf_building_map_msgs rmf_fleet_msgs rmf_robot_sim_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
