{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt_generic_sensor,
  mrpt_sensor_bumblebee_stereo,
  mrpt_sensor_gnns_nmea,
  mrpt_sensorlib,
  substituteSource,
}:
let
  sources = rec {
    mrpt_sensors = substituteSource {
      src = fetchgit {
        name = "mrpt_sensors-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "7d95272cef1b27201d324cd2b9a88a83511febcb";
        hash = "sha256-eu2Js5l2LFFtkwRx/hn78whQpKXiqQXkUOzhrwc0KK8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_sensors";
  version = "0.1.0-2";
  src = sources.mrpt_sensors;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_common mrpt_generic_sensor mrpt_sensor_bumblebee_stereo mrpt_sensor_gnns_nmea mrpt_sensorlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
