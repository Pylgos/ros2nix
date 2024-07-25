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
    mola_test_datasets = substituteSource {
      src = fetchgit {
        name = "mola_test_datasets-source";
        url = "https://github.com/ros2-gbp/mola_test_datasets-release.git";
        rev = "0178b2eb1d19e0dd39abc97eae10cca13cfa3433";
        hash = "sha256-P0TT8xB70P0BO98brdl0coZ9fThbvpg4d5BJ5AMzWno=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_test_datasets";
  version = "0.3.3-1";
  src = sources.mola_test_datasets;
  nativeBuildInputs = [ ament_cmake ament_cmake_gtest cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_xmllint ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
