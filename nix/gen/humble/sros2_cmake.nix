{
  ament_cmake,
  ament_cmake_test,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros2cli,
  sros2,
  substituteSource,
}:
let
  sources = rec {
    sros2_cmake = substituteSource {
      src = fetchgit {
        name = "sros2_cmake-source";
        url = "https://github.com/ros2-gbp/sros2-release.git";
        rev = "5a9111c40836546a18c412aa3f600486d1378829";
        hash = "sha256-IetDq3ezvwD6lwtgsE2a8SpEAi1qK4dfi8nzWahRVPE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sros2_cmake";
  version = "0.10.5-1";
  src = sources.sros2_cmake;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_test ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2cli sros2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
