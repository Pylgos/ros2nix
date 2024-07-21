{
  ament_cmake_ros,
  buildRosPackage,
  ecl_command_line,
  ecl_concepts,
  ecl_containers,
  ecl_converters,
  ecl_core_apps,
  ecl_devices,
  ecl_eigen,
  ecl_exceptions,
  ecl_formatters,
  ecl_geometry,
  ecl_ipc,
  ecl_linear_algebra,
  ecl_math,
  ecl_mpl,
  ecl_sigslots,
  ecl_statistics,
  ecl_streams,
  ecl_threads,
  ecl_time,
  ecl_type_traits,
  ecl_utilities,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_core = substituteSource {
      src = fetchgit {
        name = "ecl_core-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "46da871000a3a83679269de8f8c116e49f5403a0";
        hash = "sha256-/qmRsU0lb8R70sW/g5572zrbdGlRSBu3BL+GhX77UII=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_core";
  version = "1.2.1-5";
  src = sources.ecl_core;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_ros ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_command_line ecl_concepts ecl_containers ecl_converters ecl_core_apps ecl_devices ecl_eigen ecl_exceptions ecl_formatters ecl_geometry ecl_ipc ecl_linear_algebra ecl_math ecl_mpl ecl_sigslots ecl_statistics ecl_streams ecl_threads ecl_time ecl_type_traits ecl_utilities ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
