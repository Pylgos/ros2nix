{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  menge_vendor,
  qt5,
  rclcpp,
  rmf_building_sim_common,
  rmf_fleet_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rmf_building_sim_gz_plugins = substituteSource {
      src = fetchgit {
        name = "rmf_building_sim_gz_plugins-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "a3567ffe3630a1f367990359c8d0ff54be6b3383";
        hash = "sha256-VPvRQtiwx40ufdzEL/GL2pzzDfXy/qcJFJJPCSze0To=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_building_sim_gz_plugins";
  version = "2.0.2-1";
  src = sources.rmf_building_sim_gz_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ menge_vendor qt5.qtbase qt5.qtdeclarative rclcpp rmf_building_sim_common rmf_fleet_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
