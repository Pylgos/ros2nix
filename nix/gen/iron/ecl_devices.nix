{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_containers,
  ecl_errors,
  ecl_license,
  ecl_mpl,
  ecl_threads,
  ecl_type_traits,
  ecl_utilities,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_devices = substituteSource {
      src = fetchgit {
        name = "ecl_devices-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "f6bf1a897b9bb3d77803b10d0e1b5003ea7caa42";
        hash = "sha256-fdhKBuF9q7x8XDG5ld90RQRXHhZf4I6pJGU5KK6EOeI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_devices";
  version = "1.2.1-4";
  src = sources.ecl_devices;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_containers ecl_errors ecl_license ecl_mpl ecl_threads ecl_type_traits ecl_utilities ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
