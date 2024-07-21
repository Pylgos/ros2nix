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
        rev = "d6b76b771a66754d6a4b03c493decf0a0b33c207";
        hash = "sha256-ttmcSFmWhB7bERQkup3ucja+EU9tIc4Sb4cVetuSS00=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_build";
  version = "1.0.3-5";
  src = sources.ecl_build;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
