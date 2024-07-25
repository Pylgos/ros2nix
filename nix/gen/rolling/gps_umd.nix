{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gps_msgs,
  gps_tools,
  gpsd_client,
  substituteSource,
}:
let
  sources = rec {
    gps_umd = substituteSource {
      src = fetchgit {
        name = "gps_umd-source";
        url = "https://github.com/ros2-gbp/gps_umd-release.git";
        rev = "027018a369f1cb324ff3cd7937456247e6b3620b";
        hash = "sha256-57CxBkAd2u2S/EZrm8p1C0JPGoFAlEsVq2jYjMWBz5U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gps_umd";
  version = "2.0.4-1";
  src = sources.gps_umd;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gps_msgs gps_tools gpsd_client ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}