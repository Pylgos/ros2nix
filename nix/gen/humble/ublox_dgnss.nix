{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ntrip_client_node,
  substituteSource,
  ublox_dgnss_node,
  ublox_nav_sat_fix_hp_node,
  ublox_ubx_interfaces,
  ublox_ubx_msgs,
}:
let
  sources = rec {
    ublox_dgnss = substituteSource {
      src = fetchgit {
        name = "ublox_dgnss-source";
        url = "https://github.com/ros2-gbp/ublox_dgnss-release.git";
        rev = "9d2483ed6a4bfe76e6d123f95c0bc91e94a0e882";
        hash = "sha256-kYBrY8AciZrOCxDoTAZmq5VTqeaYahCg8nn53GOyj34=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ublox_dgnss";
  version = "0.5.2-1";
  src = sources.ublox_dgnss;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ntrip_client_node ublox_dgnss_node ublox_nav_sat_fix_hp_node ublox_ubx_interfaces ublox_ubx_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
