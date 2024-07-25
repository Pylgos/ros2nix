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
        rev = "1a5d318d6bebcb5195e6918b395b3c17499a30bc";
        hash = "sha256-6iGhNZeoJO63+6Z50d7QqpRpzqjKw+GVN0jKCKIK/Nw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ublox_dgnss";
  version = "0.5.3-1";
  src = sources.ublox_dgnss;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ntrip_client_node ublox_dgnss_node ublox_nav_sat_fix_hp_node ublox_ubx_interfaces ublox_ubx_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
