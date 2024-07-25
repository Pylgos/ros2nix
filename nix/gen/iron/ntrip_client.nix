{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nmea_msgs,
  rclpy,
  rtcm_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ntrip_client = substituteSource {
      src = fetchgit {
        name = "ntrip_client-source";
        url = "https://github.com/ros2-gbp/ntrip_client-release.git";
        rev = "198353864267aa41c457fac2c4ec97a4ef5c2c69";
        hash = "sha256-mjgvoEVgfLQBBMLRNOu0vuIREhBqOf96dPTY2PVPqV0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ntrip_client";
  version = "1.3.0-1";
  src = sources.ntrip_client;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nmea_msgs rclpy rtcm_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
