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
    ecl_sigslots_lite = substituteSource {
      src = fetchgit {
        name = "ecl_sigslots_lite-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "306dae34a1cc526d763e57a0d849fac887316aa5";
        hash = "sha256-nGYQQNr6VnsCIPQoCQfLmIxpw1uEBrqSu1PjF4XPSxk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_sigslots_lite";
  version = "1.2.0-1";
  src = sources.ecl_sigslots_lite;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_errors ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
