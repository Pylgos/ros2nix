{
  ament_cmake,
  buildRosPackage,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_build = substituteSource {
      src = fetchgit {
        name = "ecl_build-source";
        url = "https://github.com/ros2-gbp/ecl_tools-release.git";
        rev = "245c9b25b4a085042efd400eaec7c1c751785294";
        hash = "sha256-ttmcSFmWhB7bERQkup3ucja+EU9tIc4Sb4cVetuSS00=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_build";
  version = "1.0.3-2";
  src = sources.ecl_build;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
