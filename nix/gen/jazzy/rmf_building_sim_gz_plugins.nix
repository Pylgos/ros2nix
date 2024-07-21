{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_gui_vendor,
  gz_msgs_vendor,
  gz_plugin_vendor,
  gz_rendering_vendor,
  gz_sim_vendor,
  gz_transport_vendor,
  menge_vendor,
  qt5,
  rclcpp,
  rmf_door_msgs,
  rmf_fleet_msgs,
  rmf_lift_msgs,
  substituteSource,
}:
let
  sources = rec {
    rmf_building_sim_gz_plugins = substituteSource {
      src = fetchgit {
        name = "rmf_building_sim_gz_plugins-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "b4f209d394558c80991e7e17cf0e04754d58c0db";
        hash = "sha256-QVQQUL2yytg0sEDzQAdj3kKsPVD+98c7O/zrkeUB348=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_building_sim_gz_plugins";
  version = "2.3.2-1";
  src = sources.rmf_building_sim_gz_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gz_gui_vendor gz_msgs_vendor gz_plugin_vendor gz_rendering_vendor gz_sim_vendor gz_transport_vendor menge_vendor qt5.qtbase qt5.qtdeclarative rclcpp rmf_door_msgs rmf_fleet_msgs rmf_lift_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
