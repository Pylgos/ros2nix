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
        rev = "060b0794d0fd88f9254604e252f6a729729409c7";
        hash = "sha256-6iGhNZeoJO63+6Z50d7QqpRpzqjKw+GVN0jKCKIK/Nw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ublox_dgnss";
  version = "0.5.3-2";
  src = sources.ublox_dgnss;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ntrip_client_node ublox_dgnss_node ublox_nav_sat_fix_hp_node ublox_ubx_interfaces ublox_ubx_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
