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
  mrpt_sensor_gnss_nmea,
  mrpt_sensor_gnss_novatel,
  mrpt_sensor_imu_taobotics,
  mrpt_sensorlib,
  substituteSource,
}:
let
  sources = rec {
    mrpt_sensors = substituteSource {
      src = fetchgit {
        name = "mrpt_sensors-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "ccc18caf98d0614b042b370d1cb073c3c1a7269b";
        hash = "sha256-7wKC0IqCPUKO2rmVoffkMThP9L58axvahvg2L3unlxY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_sensors";
  version = "0.2.1-1";
  src = sources.mrpt_sensors;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_common mrpt_generic_sensor mrpt_sensor_bumblebee_stereo mrpt_sensor_gnss_nmea mrpt_sensor_gnss_novatel mrpt_sensor_imu_taobotics mrpt_sensorlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
