{
  ament_cmake_ros,
  buildRosPackage,
  ecl_build,
  ecl_command_line,
  ecl_config,
  ecl_containers,
  ecl_converters,
  ecl_devices,
  ecl_errors,
  ecl_exceptions,
  ecl_formatters,
  ecl_geometry,
  ecl_ipc,
  ecl_license,
  ecl_linear_algebra,
  ecl_sigslots,
  ecl_streams,
  ecl_threads,
  ecl_time_lite,
  ecl_type_traits,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_core_apps = substituteSource {
      src = fetchgit {
        name = "ecl_core_apps-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "ba34ad25a3cf2830523653dfcf6428cc69b26adb";
        hash = "sha256-s2Ebyn5n1kiUIFSZ3pa4Ycrcv+Zxp6fh/XBk2xxjWbI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_core_apps";
  version = "1.2.1-5";
  src = sources.ecl_core_apps;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_command_line ecl_config ecl_containers ecl_converters ecl_devices ecl_errors ecl_exceptions ecl_formatters ecl_geometry ecl_ipc ecl_license ecl_linear_algebra ecl_sigslots ecl_streams ecl_threads ecl_time_lite ecl_type_traits ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}