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
        rev = "5ef1635c1eef70e7fa3bb94f07a43adf19806042";
        hash = "sha256-nGYQQNr6VnsCIPQoCQfLmIxpw1uEBrqSu1PjF4XPSxk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_sigslots_lite";
  version = "1.2.0-5";
  src = sources.ecl_sigslots_lite;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ ecl_build ];
  propagatedBuildInputs = [ ecl_config ecl_errors ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
