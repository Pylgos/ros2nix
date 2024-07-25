{
  ament_cmake_ros,
  buildRosPackage,
  ecl_build,
  ecl_command_line,
  ecl_config,
  ecl_console,
  ecl_converters,
  ecl_devices,
  ecl_geometry,
  ecl_mobile_robot,
  ecl_sigslots,
  ecl_threads,
  ecl_time,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    kobuki_core = substituteSource {
      src = fetchgit {
        name = "kobuki_core-source";
        url = "https://github.com/ros2-gbp/kobuki_core-release.git";
        rev = "1472e4df37392766a692c93da72ff3072f11303c";
        hash = "sha256-hdFNImUFyN9gWBu1eoANgjMWe3zFZFLry+JUJ5I0LB4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kobuki_core";
  version = "1.4.1-1";
  src = sources.kobuki_core;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_command_line ecl_config ecl_console ecl_converters ecl_devices ecl_geometry ecl_mobile_robot ecl_sigslots ecl_threads ecl_time ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
