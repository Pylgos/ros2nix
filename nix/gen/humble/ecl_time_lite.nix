{
  ament_cmake_ros,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_errors,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_time_lite = substituteSource {
      src = fetchgit {
        name = "ecl_time_lite-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "106caba2ac1084dde546f808d5b4b60389de0443";
        hash = "sha256-xUWy6QEatAillIK/EUqV549irG+mWxeknSHHCLIkMT0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_time_lite";
  version = "1.2.0-1";
  src = sources.ecl_time_lite;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_errors ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
