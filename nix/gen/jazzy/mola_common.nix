{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_xmllint,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    mola_common = substituteSource {
      src = fetchgit {
        name = "mola_common-source";
        url = "https://github.com/ros2-gbp/mola_common-release.git";
        rev = "e6799934cd94df30596c4f65be77e8ec9ef905d0";
        hash = "sha256-JetMKVWYQtfaVcAHBcrqzrTCToKE126m5lWzdjs5VAQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_common";
  version = "0.3.1-1";
  src = sources.mola_common;
  nativeBuildInputs = [ ament_cmake ament_cmake_gtest cmake ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ ament_cmake_xmllint ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
