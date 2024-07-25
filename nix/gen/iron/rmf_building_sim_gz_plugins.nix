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
        rev = "6ccc8c4ff20f54dec8eb180e13fb63e1d09175f0";
        hash = "sha256-PQjqC2pNWy90JEI+H3vHiHpc1/SsCW+d43P2CVpY2co=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_building_sim_gz_plugins";
  version = "2.1.2-1";
  src = sources.rmf_building_sim_gz_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ menge_vendor qt5.qtbase qt5.qtdeclarative rclcpp rmf_building_sim_common rmf_fleet_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
