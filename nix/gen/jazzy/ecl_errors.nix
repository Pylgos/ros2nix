{
  ament_cmake_ros,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_errors = substituteSource {
      src = fetchgit {
        name = "ecl_errors-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "22b35c290286e16af8fc32b17a30d92f0dbc0f16";
        hash = "sha256-tMZvRB3bre8Dk+0YS+OqnkCGKff09J6PKWHytWxelmk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_errors";
  version = "1.2.0-5";
  src = sources.ecl_errors;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
