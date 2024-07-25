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
        rev = "ebbc9ec83c719ea49f3d4e83d1d2f10cb22ee996";
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
  nativeBuildInputs = [ ament_cmake ament_cmake_gtest cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_xmllint ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}