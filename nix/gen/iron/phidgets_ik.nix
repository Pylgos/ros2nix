{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  phidgets_analog_inputs,
  phidgets_digital_inputs,
  phidgets_digital_outputs,
  substituteSource,
}:
let
  sources = rec {
    phidgets_ik = substituteSource {
      src = fetchgit {
        name = "phidgets_ik-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "150895972ff6b8e3438e99bc8e24405b14d922bc";
        hash = "sha256-8IA8dKcL9AG0xtXDPn5m0P13buJaZryijdm8U9hjXWc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_ik";
  version = "2.3.3-1";
  src = sources.phidgets_ik;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ phidgets_analog_inputs phidgets_digital_inputs phidgets_digital_outputs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
