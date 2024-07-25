{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_mpl = substituteSource {
      src = fetchgit {
        name = "ecl_mpl-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "64af23c45b02b10e16343dfba99e6c0929a23538";
        hash = "sha256-b7VJovFqbuLBco3qEl5r57uuO7wTyZrjQSNR6hNX00k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_mpl";
  version = "1.2.1-4";
  src = sources.ecl_mpl;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
