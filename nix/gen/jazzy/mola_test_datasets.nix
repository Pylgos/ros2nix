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
        rev = "06e75aac14a591b2cd4ec61adb54919b8ec9bbdf";
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
  nativeBuildInputs = [ ament_cmake ament_cmake_gtest cmake ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ ament_cmake_xmllint ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
