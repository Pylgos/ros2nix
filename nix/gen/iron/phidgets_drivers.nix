{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libphidget22,
  phidgets_accelerometer,
  phidgets_analog_inputs,
  phidgets_api,
  phidgets_digital_inputs,
  phidgets_digital_outputs,
  phidgets_gyroscope,
  phidgets_high_speed_encoder,
  phidgets_ik,
  phidgets_magnetometer,
  phidgets_motors,
  phidgets_msgs,
  phidgets_spatial,
  phidgets_temperature,
  substituteSource,
}:
let
  sources = rec {
    phidgets_drivers = substituteSource {
      src = fetchgit {
        name = "phidgets_drivers-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "872655c4c1ae9276ca183d1563f20df66c189a73";
        hash = "sha256-rz3bXQCzLS7qlt76ncNcmGDBSviM4KOAU8fEjNGUoXo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_drivers";
  version = "2.3.3-1";
  src = sources.phidgets_drivers;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libphidget22 phidgets_accelerometer phidgets_analog_inputs phidgets_api phidgets_digital_inputs phidgets_digital_outputs phidgets_gyroscope phidgets_high_speed_encoder phidgets_ik phidgets_magnetometer phidgets_motors phidgets_msgs phidgets_spatial phidgets_temperature ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}