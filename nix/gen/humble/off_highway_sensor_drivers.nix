{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  off_highway_can,
  off_highway_general_purpose_radar,
  off_highway_general_purpose_radar_msgs,
  off_highway_premium_radar_sample,
  off_highway_premium_radar_sample_msgs,
  off_highway_radar,
  off_highway_radar_msgs,
  off_highway_uss,
  off_highway_uss_msgs,
  substituteSource,
}:
let
  sources = rec {
    off_highway_sensor_drivers = substituteSource {
      src = fetchgit {
        name = "off_highway_sensor_drivers-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "33ff767829aee42fd1c895e90e9430a041014b10";
        hash = "sha256-yoIRqBvPoih+6OMfWncydeoIJp1daDN9BuyJZZArndQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "off_highway_sensor_drivers";
  version = "0.6.2-1";
  src = sources.off_highway_sensor_drivers;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ off_highway_can off_highway_general_purpose_radar off_highway_general_purpose_radar_msgs off_highway_premium_radar_sample off_highway_premium_radar_sample_msgs off_highway_radar off_highway_radar_msgs off_highway_uss off_highway_uss_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
