{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing_ament_cmake,
  lm_sensors,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    diagnostic_common_diagnostics = substituteSource {
      src = fetchgit {
        name = "diagnostic_common_diagnostics-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "2c347f56819140891eff7e3a25181efba2946f78";
        hash = "sha256-fRiaj5oJB9uO60yA0brLsllz1+RfreJANmfgB4XQnzc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diagnostic_common_diagnostics";
  version = "4.0.0-1";
  src = sources.diagnostic_common_diagnostics;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_updater lm_sensors python3Packages.psutil ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
