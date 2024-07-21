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
        rev = "1a083aac5944c3e33072b5dd99adf8d9d1c3b076";
        hash = "sha256-Lk74feQcy27POAavf9+1v/TP/9b5J0tRA/mb7qTBdH0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sros2_cmake";
  version = "0.13.2-1";
  src = sources.sros2_cmake;
  nativeBuildInputs = [ ament_cmake ament_cmake_test ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2cli sros2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}